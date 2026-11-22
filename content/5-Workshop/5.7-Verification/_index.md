---
title: "Verify, estimate cost and clean up"
date: 2026-11-20
weight: 7
chapter: false
pre: " <b>5.7.</b> "
---

## 1. Run the lab acceptance checks

Open the public lab URL in two separate browser profiles and use a different test account in each. Use made-up writing for the Writing checks. As you go, record the date and what happened, and redact private details in any evidence you save.

| Check | What to do | Expected result |
| --- | --- | --- |
| Public and origin HTTPS | Open the public URL, inspect the response headers, and test HTTP redirection. Compare the CloudFront and origin hostnames and certificate names. | Public HTTPS returns 200 through CloudFront. HTTP redirects to HTTPS. The origin certificate matches the origin hostname. |
| WAF and request forwarding | Run sign-in, Google callback, vocabulary lookup and a Writing submission. In WAF, review sampled requests for enabled rules. | OAuth query parameters and session cookies reach the app. Normal writes succeed and any rule matches can be reviewed before changing enforcement. |
| Cognito accounts | Register and confirm account A, sign in with email/password, sign out, and complete password recovery. On first Google sign-in in this pool, use the same verified email. | Password recovery works and linked Google sign-in opens A's existing WordBoard. |
| WordBoard, practice and streak | Discover a word, save it, reload WordBoard, complete practice and try pronunciation. On a fresh lab account, save a second word on the same day and reopen the streak status. | The word and practice result persist across reloads. Supported browsers play the word. The second save does not award another learning day. |
| Account isolation | In a separate browser profile, sign in as account B. Open WordBoard and try A's saved word detail URL if you recorded it. | B sees only its own records and cannot read A's word details. |
| Model routes | Try a concept search and inspect Bedrock invocation metrics in N. Virginia. Submit and revise a synthetic sample under **Writing**, then reopen its saved feedback. | Bedrock handles a fresh concept search. The configured OpenRouter Writing route returns and saves feedback. |
| Private RDS and backups | Record `pg_stat_ssl` and journal counts from chapter 5.6. Check S3 and restore the uploaded dump into the temporary container. | The RDS connection uses TLS. The local and S3 copies match, and queries work after an isolated restore. |
| Backup alert | Confirm `BackupFresh=1` and an OK alarm. Run the lab test transition from chapter 5.6, then check SNS delivery and alarm history. | A forced transition sends the expected email. The alarm resumes evaluation of the real metric. |
| Automated release, if enabled | Push a lab change to `release/lightsail`. Compare the GitHub commit tag, ECR digest, and VM activation log. Open the changed public page. | GitHub Actions succeeds, the VM activates the published digest, and the change appears on the public site. |

On your workstation, replace the sample hostname with your public lab hostname and run the checks below. This measures the homepage. To see how long model requests take, time those separately while signed in.

```bash
LAB_HOST='app-lab.example.com'
curl -fsS -D - -o /dev/null -w 'HTTPS %{http_code} in %{time_total}s\n' "https://$LAB_HOST/"
curl -sS -D - -o /dev/null "http://$LAB_HOST/"
```

**Production reference.** The 20 November checks covered RDS TLS, Cognito sign-in, saved WordBoard and practice results, both model routes, and an isolated restore. The first automated release also passed its GitHub checks, published to ECR, and restored the moving word wave on the public sign-in page. Record your own observations in the lab. [First automated release](../5.6-operations/5.6.1-releases/)

[CloudFront response behavior](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorCustomOrigin.html) · [WAF sampled requests](https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-testing-view-sample.html) · [Bedrock runtime metrics](https://docs.aws.amazon.com/bedrock/latest/userguide/monitoring-runtime-metrics.html)

## 2. Build a monthly cost estimate

Open [AWS Pricing Calculator](https://calculator.aws/), create an estimate, and record the workload and date. If a service or rate is unavailable in the calculator, attach the official pricing page and your calculation. [AWS Pricing Calculator guide](https://docs.aws.amazon.com/pricing-calculator/latest/userguide/getting-started.html)

| Scope | Inputs to record |
| --- | --- |
| Singapore compute and database | Lightsail bundle and snapshots. RDS Single-AZ instance hours, encrypted gp3 storage, excess backup storage and applicable data transfer. |
| Release images | ECR private storage used by retained images. As a reference, Ownword’s first image was about 408 MB, or about US$0.04 for a full month at US$0.10 per GB-month before eligible allowances or credits. Track GitHub Actions usage separately from AWS. [Amazon ECR pricing](https://aws.amazon.com/ecr/pricing/) |
| Singapore backups and alerts | S3 backup and log storage, retention, PUT and GET requests, one custom metric and alarm, SNS notifications and the customer-managed KMS key. |
| Ohio sign-in | Cognito tier and monthly active users, Lambda invocations, and CloudWatch Logs. |
| Global edge and N. Virginia | CloudFront requests and viewer transfer, WAF web ACL and request charges, and Bedrock input and output tokens on the selected inference profile. Record domain costs separately where applicable. |
| External model provider | OpenRouter vocabulary and Writing routes, expected tokens, and spending limits. Keep the total separate from AWS. |

Run the estimate twice, once for a small pilot and once for a busier month. Change the learner count, model requests, and retention assumptions. Note where the cost rises and what controls it, such as the S3 retention period, provider call limits, or instance size. After the lab, check what AWS actually billed.

## 3. Remove the lab resources

Pull up the resource list from chapter 5.2 and confirm the account with `aws sts get-caller-identity`. Save the evidence and any final backup you need. Use the steps below on the resources you created for this lab.

1. **Jobs and alerts.** On the lab VM, remove the three lab jobs using `crontab -e`. In Singapore delete the lab CloudWatch alarm and SNS topic. Once the lab key has no other users, schedule KMS key deletion. [Delete an alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DeleteAlarms.html) · [Schedule KMS key deletion](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
   - **Automatic releases, if enabled.** Disable the lab’s GitHub workflow and remove the cron entry marked `ownword-registry-release`. Delete the lab ECR repository and its images after saving any image you need. Remove the lab publish role and VM pull policy. Delete the GitHub OIDC provider only if it was created for the lab and has no other users. [Delete an ECR repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-delete.html)
2. **Edge.** Remove the public lab record. Disable the CloudFront distribution, wait for the disabled change to reach **Deployed**, then delete the distribution. If you must detach the Web ACL first, do so once the distribution is disabled. Delete the lab Web ACL and the viewer ACM certificate when they have no associations. Remove the DNS validation record used only by that certificate. [Delete a CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html) · [Delete an ACM certificate](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-delete.html)
3. **Sign-in.** In Ohio, remove the lab Pre sign-up trigger from the pool. Delete the managed-login domain, turn off pool deletion protection if enabled, and delete the pool. Remove the lab Lambda, its CloudWatch log group and execution role with its inline policy. Remove the Google OAuth client dedicated to the lab. [Delete a Cognito domain](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPoolDomain.html) · [Delete a Cognito pool](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPool.html)
4. **Database and host.** In Singapore disable deletion protection on the lab RDS instance and wait for the modification to apply. Delete the instance with the appropriate final snapshot and retained backup choices. Check snapshots and retained automated backups for any storage you no longer need. Delete the lab DB security group and dedicated subnet group after the instance releases them. Remove the origin A record. Delete the lab Lightsail VM and unneeded snapshots, then release its static IPv4 if it remains allocated. Disable Lightsail peering only if you enabled it for this lab and no other workload uses it. [Delete an RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html) · [Lightsail cleanup](https://docs.aws.amazon.com/lightsail/latest/userguide/getting-started.html)
5. **Storage and credentials.** Disable S3 server access logging on the source bucket if enabled. Empty the lab buckets, including object versions and delete markers, then delete them. Delete the lab IAM access keys, inline policies and users for backups and Bedrock. Revoke both lab OpenRouter keys and remove private local copies no longer needed. [Empty a versioned S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/empty-bucket.html) · [Delete an IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_remove.html)

**Checkpoint.** Go down your resource list and confirm the result in each console. Note anything you kept, like a snapshot, or scheduled for deletion. Check AWS Billing once the usage figures update.
