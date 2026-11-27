#!/usr/bin/env bash
set -euo pipefail
umask 077

# Local configuration supplies the existing Compose and environment file paths.
config="$HOME/.config/ownword-release/settings.sh"
state="$HOME/.local/state/ownword-release"
mkdir -p -m 700 "$state"
exec 9>"$state/lock"
flock -n 9 || exit 0
source "$config"

image="${OWNWORD_ECR_URI:?Set OWNWORD_ECR_URI in settings.sh}"
if [[ ! "$image" =~ ^[0-9]{12}\.dkr\.ecr\.ap-southeast-1\.amazonaws\.com/[a-z0-9][a-z0-9-]*$ ]]; then
  echo "Use a private lab ECR URI in Singapore." >&2
  exit 1
fi
registry="${image%%/*}"
repository="${image#*/}"
region="ap-southeast-1"
export AWS_PAGER=""
digest_json=$(aws ecr describe-images --region "$region" --repository-name "$repository" \
  --filter tagStatus=TAGGED --query 'sort_by(imageDetails, &imagePushedAt)[-1].imageDigest' --output json)
digest=${digest_json//\"/}
[[ "$digest" =~ ^sha256:[0-9a-f]{64}$ ]] || exit 0

compose=(docker compose "${OWNWORD_COMPOSE_ARGS[@]}")
app_container=$("${compose[@]}" ps -q app)
if [[ -z "$app_container" ]]; then
  echo "Ownword app is not running. Operator review required." >&2
  exit 1
fi
previous_id=$(docker inspect --format '{{.Image}}' "$app_container")
candidate="$image@$digest"
candidate_id=$(docker image inspect --format '{{.Id}}' "$candidate" 2>/dev/null || true)
[[ "$candidate_id" != "$previous_id" ]] || exit 0
[[ ! -e "$state/failed-${digest#sha256:}" ]] || exit 0

scratch=$(mktemp -d "$state/pull.XXXXXX")
trap 'rm -rf -- "$scratch"' EXIT
mkdir -m 700 "$scratch/docker"
aws ecr get-login-password --region "$region" |
  docker --config "$scratch/docker" login --username AWS --password-stdin "$registry" >/dev/null
docker --config "$scratch/docker" pull "$candidate"

use_image() {
  local output=$1 image_ref=$2
  printf 'services:\n  app:\n    image: "%s"\n  migrate:\n    image: "%s"\n' "$image_ref" "$image_ref" > "$output.tmp"
  mv -f -- "$output.tmp" "$output"
}
release_override="$state/image.yaml"
migration_override="$scratch/image.yaml"
release=("${compose[@]}" -f "$release_override")
migration=("${compose[@]}" -f "$migration_override")
healthy() {
  local attempt
  for attempt in {1..20}; do
    if "${release[@]}" exec -T app node -e '
      Promise.all(["/", "/account"].map(path =>
        fetch("http://127.0.0.1:3000" + path, {signal: AbortSignal.timeout(2500), redirect: "manual"})
      )).then(responses => process.exit(responses.every(r => r.ok) ? 0 : 1), () => process.exit(1))
    ' >/dev/null 2>&1; then
      return 0
    fi
    sleep 2
  done
  return 1
}

use_image "$migration_override" "$candidate"
"${migration[@]}" config --quiet
if ! "${migration[@]}" --profile tools run -T --rm --no-deps --pull never migrate; then
  touch "$state/failed-${digest#sha256:}"
  echo "Migration failed for $candidate. The running app was kept." >&2
  exit 1
fi

rollback_tag=ownword:registry-rollback
docker tag "$previous_id" "$rollback_tag"
use_image "$release_override" "$candidate"
if "${release[@]}" up -d --no-deps --no-build --pull never app && healthy; then
  printf '%s\n' "$candidate" > "$state/active-image"
  echo "Activated $candidate"
else
  touch "$state/failed-${digest#sha256:}"
  echo "Deployment failed its startup check for $candidate. Restoring the previous image." >&2
  use_image "$release_override" "$rollback_tag"
  "${release[@]}" up -d --no-deps --no-build --pull never app
  healthy || { echo "Rollback also failed its startup check." >&2; exit 1; }
  exit 1
fi
