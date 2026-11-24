---
title: "Verify, estimate cost and clean up"
date: 2026-11-20
weight: 7
chapter: false
pre: " <b>5.7.</b> "
---

## 1. Test and validate the lab {#1-run-the-lab-acceptance-checks}

Use the public URL of your own lab deployment and a fresh test account. Record what you sent, the result you observed, and the evidence for each check.

### Send a valid request and verify the database

1. Sign in to the lab in the browser. In **WordBoard**, use the manual add form to save a test word such as `lantern`. Choose a word the test account has never saved. Reload WordBoard and confirm the word is still there.
2. From the Lightsail SSH session, connect to the lab RDS database with the [TLS-protected psql command in chapter 5.6](../5.6-operations/#1-give-the-backup-role-read-access-to-rds). Run this read-only query with the word you saved. The `user_word` row shows that the word was saved to a WordBoard.

```sql
SELECT w.word, uw.stage, uw.added_at
FROM public.user_word AS uw
JOIN public.word AS w ON w.id = uw.word_id
WHERE lower(w.word) = 'lantern'
ORDER BY uw.added_at DESC
LIMIT 5;
```

3. Record whether the word is visible after reload and whether RDS returns a row with the expected add time.

### Check CloudWatch Logs

With the same fresh account, sign out and use Google to sign in for the first time with the same verified email. Confirm WordBoard opens with the saved word. In Singapore CloudShell, run the following with the function name from [chapter 5.5](../5.5-auth/).

```bash
LINKER_FUNCTION='YOUR_LAB_LINKER_FUNCTION'
aws logs tail "/aws/lambda/$LINKER_FUNCTION" --since 15m --region ap-southeast-1
```

Look for `Linked verified Google identity to existing Cognito account` in the invocation around the time of your sign-in. Allow a few minutes for the log to appear. If the account was already linked, use a fresh verified account to exercise the trigger.

### Send an invalid request and verify it is rejected

Stay signed in on the public lab URL. Open the browser’s developer console and send one request where `word` is a number. Ownword expects text for that field.

```js
const invalidWord = await fetch('/api/words/manual', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ word: 42 }),
});
console.log(invalidWord.status, await invalidWord.json());
```

Expect **HTTP 400** with a validation message. Reload WordBoard and confirm it is unchanged. To confirm persistence was unaffected, compare the result of `SELECT count(*) FROM public.user_word;` immediately before and after the request, with no other writes in the lab during that check.

Save the response status, the CloudWatch log line, and the relevant database row as evidence. Redact account identifiers and private data before sharing. The [backup, restore, and alarm exercises](../5.6-operations/) are additional checks for the operations chapter.

**Local validation.** On the workshop source with PostgreSQL 16, a synthetic test account and a mock model provider, saving `lantern` returned HTTP 200. The WordBoard state included the word, and PostgreSQL showed one new `user_word` row at stage `new`. Sending `{"word":42}` returned HTTP 400 with a type validation error. The test account still had exactly one saved row.

{{< figure src="/images/workshop/wordboard-lantern.png" alt="WordBoard: lantern" caption="Local WordBoard after testing. Lantern is the only saved entry. The definition was added after testing." >}}

**CloudWatch evidence.** The Singapore Lambda logs showed two invocations. A log entry confirming a successful new Google link is still pending.

**Recorded production result.** Password sign-in produced a session from the Singapore Cognito pool, and a returning Google user could still see all five saved WordBoard entries. Earlier checks also verified RDS TLS, both model routes, and an isolated backup restore.

## 2. Monthly cost estimate and optimization {#2-build-a-monthly-cost-estimate}

**Budget on 24 November 2026, in USD.** A month with 10 active learners is estimated at **$43.24 on AWS** and **$0.32 on OpenRouter**, or **$43.56 combined**. At 100 active learners, the estimate is **$57.74 on AWS** and **$3.24 on OpenRouter**, or **$60.98 combined**. Counts and token sizes are planning assumptions. The busier scenario holds infrastructure sizes constant so it shows the cost of higher usage.

### AWS Pricing Calculator inputs

The public [AWS Pricing Calculator](https://calculator.aws/) returned **$32.78/month** for the two Singapore hosting items at 730 hours. It showed **$11.77** for the Linux Lightsail Virtual Servers 2 GB public IPv4 bundle and **$21.01** for PostgreSQL, one on-demand Single-AZ `db.t4g.micro` with 20 GiB gp3, no RDS Proxy and no paid Database Insights or Extended Support. For a continuously provisioned VM, the budget below uses the **$12.00 published monthly Lightsail cap**. The remaining lines use the published service rates shown in the table.

| Cost driver | Monthly basis and rate | Pilot | Busier month |
| --- | --- | ---: | ---: |
| Amazon Lightsail | Singapore Linux VM, 2 vCPU, 2 GB RAM, 60 GB SSD, attached public IPv4. Budget the published full-month cap. [Lightsail pricing](https://aws.amazon.com/lightsail/pricing/) | $12.00 | $12.00 |
| Amazon RDS for PostgreSQL | Singapore Single-AZ `db.t4g.micro`, 730 h × $0.025 plus 20 GiB gp3 × $0.138. Automated backups stay within the included storage allowance. [RDS pricing](https://aws.amazon.com/rds/postgresql/pricing/) | $21.01 | $21.01 |
| AWS WAF | One CloudFront web ACL at $5, two AWS managed rule groups at $1 each, and $0.60 per million requests. Pricing in effect on 24 November 2026. [WAF pricing](https://aws.amazon.com/waf/pricing/) | $7.06 | $7.60 |
| Amazon CloudFront and ACM | 100,000 / 1,000,000 requests and 10 / 100 GB of viewer transfer within the account’s pay-as-you-go allowances. ACM provides a non-exportable public certificate for CloudFront. [CloudFront pricing](https://aws.amazon.com/cloudfront/pricing/) · [ACM pricing](https://aws.amazon.com/certificate-manager/pricing/) | $0.00 | $0.00 |
| Amazon Cognito and AWS Lambda | Singapore Essentials pool with 10 / 100 direct or social MAUs, up to 10 / 100 linker invocations at 256 MB and 1 second each, and up to 0.1 GB of Lambda logs. These fit within the applicable shared monthly allowances. [Cognito pricing](https://aws.amazon.com/cognito/pricing/) · [Lambda pricing](https://aws.amazon.com/lambda/pricing/) | $0.00 | $0.00 |
| Amazon S3 | Singapore Standard storage for dumps and access logs. 1 / 5 GB at $0.025 per GB-month, 100 / 500 write or list requests at $0.005 per 1,000, and 150 / 750 read requests at $0.004 per 10,000. [S3 pricing](https://aws.amazon.com/s3/pricing/) | $0.03 | $0.13 |
| Amazon ECR | 2 GB of retained Singapore release images at $0.10 per GB-month. Pulls are budgeted within the Region. [ECR pricing](https://aws.amazon.com/ecr/pricing/) | $0.20 | $0.20 |
| Amazon CloudWatch and SNS | Reserve $0.30 for one custom metric and $0.10 for one standard alarm before CloudWatch allowances. Up to 10 / 100 SNS emails fit in the monthly allowance. [CloudWatch pricing](https://aws.amazon.com/cloudwatch/pricing/) · [SNS pricing](https://aws.amazon.com/sns/pricing/) | $0.40 | $0.40 |
| AWS KMS | One customer-managed SNS key at $1/month. Key requests are assumed to fit within the shared allowance. RDS uses an AWS-managed key. [KMS pricing](https://aws.amazon.com/kms/pricing/) | $1.00 | $1.00 |
| Amazon Bedrock | 100 / 1,000 fresh Kimi K3.1 Pro concept searches. Allow 1,000 input and 500 output tokens per request. U.S. cross-Region Standard rates are $4.40 and $22.00 per million input and output tokens. [Model pricing](https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-moonshot-ai-kimi-k3-1-highspeed.html#model-card-moonshot-ai-kimi-k3-1-highspeed-pricing) | $1.54 | $15.40 |
| **AWS subtotal** | **Monthly AWS budget before account credits and tax** | **$43.24** | **$57.74** |
| OpenRouter Writing | 20 / 200 GPT-6.1 Terra Low requests, each budgeted at 4,000 input and 1,500 output tokens, using the published standard model rates of $1 and $5 per million. [Terra pricing](https://openrouter.ai/openai/gpt-6.1-terra) | $0.23 | $2.30 |
| OpenRouter vocabulary and practice | 50 / 500 calls modeled with the lab default Gemini 3.6 Flash, each at 1,000 input and 300 output tokens, at $0.75 and $3.75 per million. [Flash pricing](https://openrouter.ai/google/gemini-3.6-flash) | $0.09 | $0.94 |
| **OpenRouter subtotal** | **Inference at published rates before credit-purchase fees** | **$0.32** | **$3.24** |
| **Total modeled cost** | **AWS plus OpenRouter production inference** | **$43.56** | **$60.98** |

This estimate assumes the stated monthly allowances are available across the account, private transfer in the same Availability Zone for the VM-to-RDS path, and no extra Lightsail snapshots, excess RDS backup storage or surplus CPU credits. Confirm these against Billing for the actual month. Domain registration, GitHub Actions charges beyond plan allowances, taxes, and research-only GPT-6 Luna calls are outside this operating estimate. OpenRouter's credit-purchase fee depends on the top-up amount. Line items are displayed to two decimals and totals are rounded after summing. [OpenRouter fees](https://openrouter.ai/docs/faq#pricing-and-fees)

### Cost controls

- Reuse saved concept results for repeat searches, cap output tokens, and set provider spend limits. Review input and output tokens before raising usage limits.
- Expire old S3 backups and access logs according to the retention policy. Keep only the release images needed for deployment and rollback. Review retained snapshots after testing.
- Check CPU, memory, RDS CPU credits and response latency before resizing. Compare CloudFront and WAF pricing with actual request traffic before changing the edge plan.
- After the lab, use the cleanup steps below and check the bill for resources that continue to incur charges. AWS also publishes [a new WAF rate schedule effective 1 February 2027](https://aws.amazon.com/waf/pricing/). Refresh that line when estimating later months.

## 3. Remove the lab resources

Pull up the resource list from chapter 5.2 and confirm the account with `aws sts get-caller-identity`. Save the evidence and any final backup you need. Use the steps below on the resources you created for this lab.

1. **Jobs and alerts.** On the lab VM, remove the three lab jobs using `crontab -e`. In Singapore delete the lab CloudWatch alarm and SNS topic. Once the lab key has no other users, schedule KMS key deletion. [Delete an alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DeleteAlarms.html) · [Schedule KMS key deletion](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
   - **Automatic releases, if enabled.** Disable the lab’s GitHub workflow and remove the cron entry marked `ownword-registry-release`. Delete the lab ECR repository and its images after saving any image you need. Remove the lab publish role and VM pull policy. Delete the GitHub OIDC provider only if it was created for the lab and has no other users. [Delete an ECR repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-delete.html)
2. **Edge.** Remove the public lab record. Disable the CloudFront distribution, wait for the disabled change to reach **Deployed**, then delete the distribution. If you must detach the Web ACL first, do so once the distribution is disabled. Delete the lab Web ACL and the viewer ACM certificate when they have no associations. Remove the DNS validation record used only by that certificate. [Delete a CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html) · [Delete an ACM certificate](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-delete.html)
3. **Sign-in.** In Singapore, remove the lab Pre sign-up trigger from the pool. Delete the managed-login domain, turn off pool deletion protection if enabled, and delete the pool. Remove the lab Lambda, its CloudWatch log group and execution role with its inline policy. Remove the Google OAuth client dedicated to the lab. [Delete a Cognito domain](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPoolDomain.html) · [Delete a Cognito pool](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPool.html)
4. **Database and host.** In Singapore disable deletion protection on the lab RDS instance and wait for the modification to apply. Delete the instance with the appropriate final snapshot and retained backup choices. Check snapshots and retained automated backups for any storage you no longer need. Delete the lab DB security group and dedicated subnet group after the instance releases them. Remove the origin A record. Delete the lab Lightsail VM and unneeded snapshots, then release its static IPv4 if it remains allocated. Disable Lightsail peering only if you enabled it for this lab and no other workload uses it. [Delete an RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html) · [Lightsail cleanup](https://docs.aws.amazon.com/lightsail/latest/userguide/getting-started.html)
5. **Storage and credentials.** Disable S3 server access logging on the source bucket if enabled. Empty the lab buckets, including object versions and delete markers, then delete them. Delete the lab IAM access keys, inline policies and users for backups and Bedrock. Revoke both lab OpenRouter keys and remove private local copies no longer needed. [Empty a versioned S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/empty-bucket.html) · [Delete an IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_remove.html)

**Checkpoint.** Go down your resource list and confirm the result in each console. Note anything you kept, like a snapshot, or scheduled for deletion. Check AWS Billing once the usage figures update.
