---
title: "Prepare your lab environment"
date: 2026-11-20
weight: 2
chapter: false
pre: " <b>5.2.</b> "
---

## 1. Check AWS access and prerequisites

Start in AWS CloudShell and check that you’re in the account you intend to use. You’ll need a role that can create and remove the resources listed below. Set aside test email accounts, a Google Cloud project where you can create an OAuth client, and two OpenRouter keys with spend limits, one for vocabulary and one for Writing. Chapter 5.5 shows you how to check Bedrock access.

```bash
aws sts get-caller-identity
```

| Location | Services and dependencies |
| --- | --- |
| Singapore `ap-southeast-1` | Lightsail, the default VPC for Lightsail peering, RDS for PostgreSQL, private S3 buckets, CloudWatch, SNS, the KMS key, and private ECR for the release extension |
| Ohio `us-east-2` | Cognito user pool, public app client, and account-linking Lambda |
| N. Virginia `us-east-1` | ACM viewer certificate, CloudFront-scoped WAF setup, and the source Region for the Bedrock U.S. inference profile |
| Global | IAM, CloudFront distribution and authoritative DNS for your two lab hostnames |

Use an AWS plan and account that support the listed services. Review the [cost worksheet](../5.7-verification/) before provisioning. [CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/welcome.html) · [STS identity check](https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html) · [Lightsail default VPC prerequisite](https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-how-to-set-up-vpc-peering-with-aws-resources.html)

## 2. Get the source and workstation tools

Ask the workshop owner for `ownword-lab-source-2026-11-20.tar.gz` through the project’s source-access channel. The archive contains the RDS Compose override, six PostgreSQL migrations through the streak feature, the Bedrock concept adapter, the Writing route, and the scripts for deployment and backups. On your workstation, use Bash or Git Bash with `ssh`, `scp`, `tar`, `sha256sum` and `curl`. Keep the Lightsail SSH private key on that machine.

Open a shell in the directory that contains the archive.

```bash
printf '%s  %s\n' '1ce1ecdb25b48e489831c631e611f05f23f1ae449d78f209120066d1946d9357' \
  'ownword-lab-source-2026-11-20.tar.gz' | sha256sum -c -
tar -tzf ownword-lab-source-2026-11-20.tar.gz | head -30
```

## 3. Record your lab inputs

Keep the resource names and IDs handy so you can find the same resources during cleanup. Store credentials separately.

| Record | Example or value |
| --- | --- |
| Public app hostname | `app-lab.example.com` in a DNS zone you can edit |
| Origin hostname | `origin-lab.example.com` in the same DNS zone |
| Lightsail host and static IP | `ownword-lab` and `ownword-lab-ip`. Record both public and private IPv4 addresses. |
| RDS | DB identifier, endpoint, DB subnet group, RDS security group and peering connection |
| Cognito and Google | Pool ID, public client ID, prefix domain, Lambda name, execution role and Google OAuth client |
| Edge and inference | CloudFront distribution ID and hostname, WAF web ACL, ACM ARN, Bedrock inference profile ARN and dedicated IAM identity |
| Backup and alert | S3 bucket names, backup IAM identity, custom metric dimension, CloudWatch alarm, SNS topic and KMS alias |
| Automatic releases | Private GitHub repository and release branch, ECR repository URI, GitHub OIDC role, and Lightsail AWS profile used for image pulls |

**Checkpoint.** Check that you can edit the DNS zone, that you’re in the right AWS account, and that the archive passed the checksum check. With your resource list started, open the [architecture walkthrough](../5.3-architecture/).
