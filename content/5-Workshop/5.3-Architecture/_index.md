---
title: "Architecture and data flow"
date: 2026-11-20
weight: 3
chapter: false
pre: " <b>5.3.</b> "
---

## Production request flow

{{< ownword-architecture alt="Ownword request flow through CloudFront, Lightsail and RDS, with Cognito sign-in, model requests and backups. The release flow shows GitHub Actions publishing to private ECR in Singapore and Lightsail pulling the image." caption="Ownword production architecture and automated releases, 20 November 2026. Select the diagram to open it at full size." >}}

| Steps | Follow the path |
|---|---|
| **1–3. Public HTTPS and origin** | The browser connects to `app.ownword.co` through CloudFront, with an ACM viewer certificate and an AWS WAF web ACL. CloudFront connects over TLS to Caddy at `origin.ownword.co`. Caddy forwards requests to Next.js on port 3000 inside the private Docker Compose network. |
| **4. Database** | Next.js reads and writes to private Amazon RDS for PostgreSQL in Singapore over Lightsail VPC peering. Database connections use TLS, and port 5432 is restricted to the Lightsail host’s private address. |
| **5–8. Sign-in** | Next.js talks to Amazon Cognito in Ohio for password sign-in and OAuth code exchange. The browser follows Cognito’s OAuth flow for Google sign-in and returns through `/auth/callback`, where Next.js exchanges the code using PKCE. On the first federated sign-in, Cognito can invoke a Pre sign-up Lambda to link the verified Google identity to an eligible existing account. |
| **9–10. Model requests** | Concept search calls Amazon Bedrock through the N. Virginia endpoint using the Kimi K3.1 Pro U.S. inference profile. Writing assessment calls GPT-6.1 Terra Low through OpenRouter. Both calls originate on the server. |
| **11–14. Backup and alert** | The Lightsail backup job reads RDS under a separate database role, makes a daily PostgreSQL dump, and uploads it to private S3. An hourly check publishes `BackupFresh`. A stale or missing signal triggers CloudWatch to notify the operator through an SNS topic encrypted with a customer-managed KMS key. |

## Release flow

A push to `release/lightsail` starts GitHub Actions. The workflow checks the code, builds a Docker image, and uses short-lived AWS credentials through GitHub OIDC to publish it to private Amazon ECR in Singapore. Lightsail checks ECR every two minutes. On a new image, it pulls the exact digest, runs migrations against RDS, and checks the home and sign-in routes after restarting the app. If startup fails, it restores the previous app image. Try this in the [release extension](../5.6-operations/5.6.1-releases/).

## Deployment used in the lab

Start by setting up Lightsail and private RDS with your own lab resources. You’ll use two DNS names. Cognito sends users back to the public hostname after sign-in, and Caddy serves the origin hostname. A separate PostgreSQL role reads the data for backups. Later, you’ll try a restore in an isolated PostgreSQL container.

**Checkpoint.** Follow a user request to RDS, a stale-backup alert to the operator’s inbox, and a release image from GitHub to Lightsail.

[Next: Prepare Lightsail and private RDS](../5.4-deploy/)
