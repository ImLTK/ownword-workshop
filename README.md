# Ownword FCAJ Internship Report

Bilingual (English and Vietnamese) Hugo internship report for **Ownword** (Gi Group, First Cloud AI Journey HCM), built on the [FCAJ workshop template](https://github.com/thienluhoan/fcj-workshop-template) with the Hugo Learn theme.

## What is inside

- **Report sections (`content/`):** Home page, thirteen weekly worklogs with AWS lab evidence, the Ownword project proposal, three AWS Study Group blog summaries, three event reports with check-in photos, self-evaluation, and feedback.
- **AWS Workshop (`content/5-Workshop/`):** Seven chapters covering the Singapore (`ap-southeast-1`) deployment (CloudFront and WAF, Amazon Lightsail, private Amazon RDS for PostgreSQL over VPC peering with TLS, Amazon Cognito with a Pre sign-up Lambda trigger, Amazon ECR, S3 backups with CloudWatch and SNS alerts, and Amazon Bedrock plus OpenRouter model routing), verification checks, and monthly cost estimates.
- **Workshop downloads (`static/downloads/`):** `ownword-lab-source-c8a903e.tar.gz` (checksum listed in Chapter 5.2) and `google-linker-cloudshell.py` (used in Chapter 5.5).

## Run locally

Install [Hugo Extended 0.134.3](https://github.com/gohugoio/hugo/releases/tag/v0.134.3) and run from the repository root:

```sh
hugo server --bind 127.0.0.1
```

Open the local address Hugo prints (usually `http://127.0.0.1:1313/`). To run a production build and verify local links:

```sh
hugo --minify --baseURL https://example.github.io/ownword-workshop/ -d public
python scripts/check_links.py public
```

English pages end in `.md` and Vietnamese pages end in `.vi.md`.

## Deploy to GitHub Pages

Deployment uses the manual GitHub Actions workflow (`.github/workflows/hugo.yml`), which checks for `REPORT_READY.md`, builds the bilingual site, and publishes to the `gh-pages` branch.

The live Ownword application (`https://app.ownword.co/`) is linked inside the report as demo evidence.
