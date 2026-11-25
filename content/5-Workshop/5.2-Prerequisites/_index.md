---
title: "Prepare your lab environment"
date: 2026-11-20
weight: 2
chapter: false
pre: " <b>5.2.</b> "
---

## 1. Check AWS access and prerequisites

Start in AWS CloudShell and check that you're in the account you intend to use. You'll need a role that can create and remove the resources listed below. Set aside test email accounts, a Google Cloud project where you can create an OAuth client, and two OpenRouter keys with spend limits, one for vocabulary and one for Writing. Chapter 5.5 shows you how to check Bedrock access.

```bash
aws sts get-caller-identity
```

| Location | Services and dependencies |
| --- | --- |
| Singapore `ap-southeast-1` | Lightsail and its default-VPC peering, private RDS for PostgreSQL, Cognito and its account-linking Lambda, private S3 buckets, CloudWatch, SNS, and KMS |
| N. Virginia `us-east-1` | ACM viewer certificate (for a custom public domain), CloudFront-scoped WAF setup, and the source Region for the Bedrock U.S. inference profile |
| Global | IAM, CloudFront distribution and authoritative DNS for your lab hostnames (or `sslip.io` origin with CloudFront's default HTTPS domain for a quick disposable lab) |

Use an AWS plan and account that support the listed services. Review the [monthly cost estimate](../5.7-verification/#2-build-a-monthly-cost-estimate) before provisioning. [CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/welcome.html) · [STS identity check](https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html) · [Lightsail default VPC prerequisite](https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-how-to-set-up-vpc-peering-with-aws-resources.html)

Before creating Lightsail or RDS, verify the checksum in section 2, DNS access for your hostnames (if using a custom domain), permission to create the Google OAuth client, two spend-limited OpenRouter keys, and an inbox that can confirm the SNS subscription. In Singapore, record the default VPC and current Lightsail peering status so you can distinguish shared infrastructure from lab resources during cleanup.

## 2. Get the source and workstation tools

Download {{< workshop-download "downloads/ownword-lab-source-c8a903e.tar.gz" "ownword-lab-source-c8a903e.tar.gz" >}} directly from this workshop (or from `static/downloads/` in the repository). This lab bundle is based on Ownword commit `c8a903e` from `release/lightsail`. It contains the RDS Compose override, seven PostgreSQL migrations through Writing Focus, the Bedrock concept adapter, the Writing route, and the deployment and RDS backup scripts. On your workstation, use Bash or Git Bash with `ssh`, `scp`, `tar`, `sha256sum` and `curl`. Keep the Lightsail SSH private key on that machine.

Open a shell in the directory that contains the archive.

```bash
printf '%s  %s\n' 'cedab64087823fb158e4deb9873a1923fb0e4bed32af83be900d2a33930fa9cd' \
  'ownword-lab-source-c8a903e.tar.gz' | sha256sum -c -
tar -tzf ownword-lab-source-c8a903e.tar.gz | head -30
```

## 3. Record your lab inputs

Keep the resource names and IDs handy so you can find the same resources during cleanup. Store credentials separately.

| Record | Example or value |
| --- | --- |
| Public app hostname | `app-lab.example.com` in a DNS zone you control, or CloudFront's default `*.cloudfront.net` domain if you do not have a custom domain |
| Origin hostname | `origin-lab.example.com` in your DNS zone, or `origin-lab.<A-B-C-D>.sslip.io` using your Lightsail static IPv4 with hyphens |
| Lightsail host and static IP | `ownword-lab` and `ownword-lab-ip`. Record both public and private IPv4 addresses. |
| RDS | DB identifier, endpoint, DB subnet group, RDS security group and peering connection, plus `DbiResourceId` |
| Cognito and Google | Pool ID, public client ID, prefix domain, Lambda name, execution role and Google OAuth client |
| Edge and inference | CloudFront distribution ID and hostname, WAF web ACL, ACM ARN, Bedrock inference profile ARN and dedicated IAM identity |
| Backup and alert | S3 bucket names, backup IAM identity, custom metric dimension, CloudWatch alarm, SNS topic and KMS alias |

**Checkpoint.** Check that you are in the right AWS account, that the archive passed the checksum check, and (if using a custom domain) that you can edit its DNS zone. You do not need to rent a domain to complete this lab: you can pair an `sslip.io` origin hostname with CloudFront's default `*.cloudfront.net` HTTPS domain. With your resource list started, open the [architecture walkthrough](../5.3-architecture/).
