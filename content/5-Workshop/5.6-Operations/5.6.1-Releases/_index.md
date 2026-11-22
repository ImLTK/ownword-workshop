---
title: "Automate releases with GitHub Actions and ECR"
date: 2026-11-20
weight: 1
chapter: false
pre: " <b>5.6.1.</b> "
---

## Follow one release

**Push to GitHub → check and build → publish to private ECR → deploy on Lightsail.**

Amazon Elastic Container Registry (ECR) stores ready-to-run Docker images. GitHub Actions builds the image and gives it an immutable tag based on the commit. The Lightsail VM checks ECR every two minutes and pulls the exact image by digest. It applies any RDS migrations, replaces the app container, and checks the home and sign-in routes. Caddy continues serving the site through CloudFront.

The first production run deployed the sign-in footer wave from commit `4034749` on 20 November 2026. GitHub passed TypeScript and all 21 learning tests. The scheduled VM job applied migrations and started the app, and a browser check verified that the wave moved on the public sign-in page. The following steps use your own lab resources. [Production workflow run (project access required)](https://github.com/ImLTK/ownword/actions/runs/44740794986)

## 1. Prepare a lab registry and two sets of permissions

Finish [the first deployment](../../5.5-auth/#launch-app) and [configure the VM’s AWS CLI profile](../#2-create-s3-storage-and-a-dedicated-backup-identity). In Singapore, create a **private** ECR repository named `ownword-lab` with **immutable** tags. In IAM, create or reuse the OIDC provider at `https://token.actions.githubusercontent.com` with audience `sts.amazonaws.com`. [Create a private ECR repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html) · [GitHub OIDC in AWS](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-aws)

| Identity | Grant |
| --- | --- |
| GitHub publish role | Allow `sts:AssumeRoleWithWebIdentity` from that OIDC provider. Match `aud` to `sts.amazonaws.com` and `sub` to the exact private repo and `refs/heads/release/lightsail`. Use the GitHub guide’s subject format for your repository, including owner and repository IDs if it uses immutable subjects. On the lab ECR repository ARN, allow `ecr:BatchCheckLayerAvailability`, `ecr:InitiateLayerUpload`, `ecr:UploadLayerPart`, `ecr:CompleteLayerUpload`, `ecr:PutImage` and `ecr:BatchGetImage`. |
| Lightsail AWS CLI identity | Add a separate read-only policy to the existing lab backup identity. On the lab ECR repository ARN, allow `ecr:DescribeImages`, `ecr:BatchCheckLayerAvailability`, `ecr:GetDownloadUrlForLayer` and `ecr:BatchGetImage`. |

For both identities, also allow `ecr:GetAuthorizationToken` with resource `*`. Scope the other ECR actions to `arn:aws:ecr:ap-southeast-1:YOUR_ACCOUNT_ID:repository/ownword-lab`. GitHub receives short-lived publish credentials through OIDC. Keep the app’s database and provider settings on Lightsail. [ECR push permissions](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-push-iam.html) · [ECR authentication](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html)

## 2. Publish the lab image from GitHub

1. Create an empty **private** GitHub repository. On your workstation, start with a clean extraction of the lab source archive and create the `release/lightsail` branch. Review staged files before committing. Keep environment files, SSH keys, AWS credentials and backups out of Git.
2. Download {{< workshop-download "downloads/ownword-release/lightsail-release.yml" "the GitHub Actions workflow" >}} to `.github/workflows/lightsail-release.yml` in the lab repo. Download {{< workshop-download "downloads/ownword-release/registry-release.sh" "the Lightsail rollout script" >}} to `deploy/lightsail/registry-release.sh`. The lab workflow checks types and builds the archive. The production repo also includes the learning tests.
3. In **Settings → Secrets and variables → Actions → Variables**, set `OWNWORD_AWS_ACCOUNT_ID` to your account ID, `OWNWORD_ECR_REPOSITORY` to `ownword-lab`, and `OWNWORD_ECR_PUBLISH_ROLE_ARN` to the lab role ARN. Push the release branch and watch **Actions → Lightsail release**. [GitHub Actions variables](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-variables)

**Checkpoint.** The workflow passed and ECR shows an image tagged `sha-<commit>` with a digest. Keep the commit and digest for comparison with the VM log.

## 3. Let Lightsail deploy that image

Copy the downloaded rollout script to `~/registry-release.sh` on your lab VM using your existing SSH access. Use the same Compose files and project name as the first deployment. Replace `YOUR_ACCOUNT_ID` before enabling the job.

```bash
umask 077
install -d -m 700 "$HOME/.config/ownword-release" "$HOME/.local/bin"
install -m 700 "$HOME/registry-release.sh" "$HOME/.local/bin/ownword-deploy-release"
cat > "$HOME/.config/ownword-release/settings.sh" <<'EOF'
export AWS_PROFILE=ownword-lab-backup
OWNWORD_ECR_URI='YOUR_ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/ownword-lab'
app_root="$HOME/ownword-lab"
OWNWORD_COMPOSE_ARGS=(
  --project-name ownword
  --env-file "$app_root/deploy/lightsail/.env"
  --env-file "$app_root/deploy/lightsail/.secrets/app-rds.env"
  -f "$app_root/deploy/lightsail/compose.yaml"
  -f "$app_root/deploy/lightsail/compose.rds.yaml"
)
EOF
aws ecr describe-images --profile ownword-lab-backup --region ap-southeast-1 \
  --repository-name ownword-lab --query 'imageDetails[].imageDigest'
```

As `ubuntu`, add the following line with `crontab -e` after the first image appears in ECR. Keep your existing backup and enrichment jobs.

```cron
*/2 * * * * PATH=/usr/local/bin:/usr/bin:/bin /usr/bin/timeout 20m "$HOME/.local/bin/ownword-deploy-release" 2>&1 | /usr/bin/logger -t ownword-registry-release # ownword-registry-release
```

Check `journalctl -t ownword-registry-release -n 30 --no-pager` and read `~/.local/state/ownword-release/active-image`. Match its digest to ECR and open the public home and sign-in pages. For another test, change a line of lab sign-in copy and push again. Record the new commit, workflow result, active digest, and visible change.

**If a release fails.** A failed build publishes no image. A failed migration leaves the previous app running. If the new container fails to start or misses its route checks, the script returns to the previous app image. Completed database migrations stay applied, so schema changes must also work with the previous app. Check the VM log before retrying a failed digest.

[Next: Verify the lab, estimate cost, and clean up](../../5.7-verification/)
