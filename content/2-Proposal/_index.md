---
title: "Proposal"
date: 2026-11-13
weight: 2
chapter: false
pre: " <b>2.</b> "
---

## Executive summary

Ownword is an English learning app for people who recognize more words than they can use when they write. It gives learners a way to find the word they’re reaching for, save it, and practice until they can recall it on their own. A separate Writing module helps them decide what to change in a draft and check how well a revision addresses that feedback.

The pilot runs on AWS. Amazon Bedrock handles concept search with Kimi K3.1 Pro, and OpenRouter gives the Writing module access to a frontier model for draft assessment and revision feedback. The [live demo](https://app.ownword.co/) and the [bilingual workshop](../5-workshop/) let readers try the learning flow and build their own deployment.

## The problem

You can recognize a word in a book and still reach for a simpler one when you write. Looking up a better word helps you finish the sentence. The next time you need that word, you may have to look it up again. Revising can be just as frustrating when a sentence feels off and you can’t pinpoint what to change.

Ownword starts from a learner’s own draft or an idea they want to express. It connects that moment of discovery to later practice and keeps writing feedback tied to the passages the learner actually wrote.

## Audience and learning loop

The pilot is designed for advanced English learners working on their own. The vocabulary loop is **write → discover → choose → practice → retrieve → activate**. On WordBoard, a saved word progresses through **New**, **Practicing**, and **Active** as the learner recalls and uses it in different contexts over time.

Imagine wanting a word for an experience that feels happy and sad at the same time. You can describe that feeling in English or Vietnamese, consider a suggestion like *bittersweet*, and save it to WordBoard. In Quick Review you can flag the word if you forget it. In Full Practice you can try recalling it and using it in a sentence on a topic of your choice.

Writing follows a separate loop. The learner picks a prompt, writes a response, reads feedback on specific passages, and revises in their own words. Keeping the original in view lets the learner see what changed and check which earlier suggestions the revision addresses.

## Pilot scope

| Feature | What the pilot supports |
| --- | --- |
| Vocabulary discovery | Find suggestions in your own writing or describe a concept in English or Vietnamese. Save useful suggestions or add a word by hand. |
| WordBoard and practice | Track saved words, listen to browser-based pronunciation, review words you forgot, and practice recall and sentence use. The learning streak tracks days of activity. |
| Writing | Draft from a prompt, review feedback on exact passages, and revisit the original and its revision in Writing history. |
| Accounts | Sign in with email and password or Google. An eligible existing account can link to a verified Google identity and keep its WordBoard. |

The pilot uses one application VM and a private Single-AZ database. Its purpose is to test the complete learning and recovery flows with a small group.

## Deployed architecture

{{< ownword-architecture alt="Ownword production request and backup paths, with GitHub Actions publishing release images through private ECR in Singapore for Lightsail to pull." caption="Ownword production architecture and automated releases, 20 November 2026. Select the diagram to open it at full size." >}}

### AWS services used

- **Amazon CloudFront.** Serves the public HTTPS entry point for Ownword and forwards web and API requests to the Caddy origin on Lightsail. Cognito callbacks use the public app hostname.
- **AWS WAF.** Applies a web ACL to requests that reach the CloudFront distribution. It operates at the public edge before those requests go to the origin.
- **AWS Certificate Manager (ACM).** Supplies the viewer certificate for the public hostname on CloudFront. Caddy handles the certificate for the separate origin connection.
- **Amazon Lightsail.** Runs the Singapore VM. Caddy accepts origin HTTPS and forwards traffic to Next.js over the private Docker network. The VM also runs the database backup and backup health jobs.
- **Amazon RDS for PostgreSQL.** Stores application records such as learner profiles, WordBoard entries, practice results, and Writing history. The Single-AZ database in Singapore accepts connections from the Lightsail host over VPC peering. The app verifies the database certificate and hostname.
- **Amazon Cognito.** Manages passwords, verified email, and the Google sign-in flow through a user pool in Ohio. Next.js uses the verified Cognito identity to decide which learner records a session can access.
- **AWS Lambda.** Runs the Pre sign-up trigger for Google federation. When the first Google sign-in matches an eligible existing account, the trigger can link the verified identity so the learner keeps their WordBoard.
- **Amazon Bedrock.** Runs Kimi K3.1 Pro for concept search through a U.S. inference profile. The application calls the Bedrock endpoint in N. Virginia and validates the suggestions before returning them.
- **Amazon S3.** Holds daily PostgreSQL exports in private storage. A copy outside the app VM and database gives the team an archive it can restore into a separate test database.
- **Amazon ECR.** Stores private release images built by GitHub Actions. Lightsail pulls the published image by digest and checks the app after rollout. [Workshop release flow](../5-workshop/5.6-operations/5.6.1-releases/)
- **Amazon CloudWatch.** Receives the hourly `BackupFresh` metric. The backup alarm evaluates whether the latest export is fresh and its S3 copy is present.
- **Amazon SNS.** Sends an email to the operator when the CloudWatch alarm changes to the alarm state.
- **AWS Key Management Service (KMS).** Provides the customer-managed key that encrypts the SNS topic used by the backup alarm.
- **AWS Identity and Access Management (IAM).** Scopes AWS permissions for Bedrock calls, S3 backup access, CloudWatch metric writes, and the account-linking Lambda. PostgreSQL has separate roles for the app and backup job.

## Technical implementation

### Request and data flow

1. **Open the app (steps 1–4).** The browser connects to CloudFront over HTTPS. CloudFront then connects over TLS to Caddy at the origin hostname. Caddy sends the request to Next.js, which reads or writes learner data in private RDS using a separate TLS connection.
2. **Sign in (steps 5–8).** A password sign-in goes to Cognito. For Google sign-in, Cognito handles federation and returns the browser to Ownword’s callback. Next.js exchanges the authorization code using PKCE. The Lambda trigger can link the Google identity during the first eligible sign-in.
3. **Ask a model (steps 9–10).** Next.js sends concept-search requests to Kimi on Bedrock. Writing assessment and revision checks use a separate OpenRouter route. Provider credentials stay on the server.
4. **Back up and alert (steps 11–14).** The VM reads RDS with a read-only backup role, exports the database to private S3, and checks the latest backup each hour. A stale or missing signal triggers an email through the encrypted SNS topic.

The workshop walks through [the diagram and request flow](../5-workshop/5.3-architecture/), [sign-in and public HTTPS](../5-workshop/5.5-auth/), and [backup, restore, and alarm testing](../5-workshop/5.6-operations/).

### How we use Amazon Bedrock and OpenRouter {#writing-inference-provider}

**Kimi K3.1 Pro on Amazon Bedrock powers concept search**, a core part of Ownword’s vocabulary discovery. Learners can describe an idea in English or Vietnamese and get suggestions for words and phrases that express it. The app can reuse a saved result for a repeat lookup, which avoids another model call.

We also tested GPT-6 Luna on Bedrock for Writing. We wanted to see if we could use our AWS Free Tier credits to get structured feedback that points to specific passages in a draft. AWS accepted the Marketplace agreement, and our account had enough inference quota. Both test requests with synthetic inputs returned `AccessDeniedException`. The second response confirmed that our account could not use Luna and referred us to AWS Sales. [AWS guidance on account-level model access](https://docs.aws.amazon.com/bedrock/latest/userguide/model-access.html)

For the more demanding Writing tasks, **we use OpenRouter for access to frontier models**. Our deployed model, GPT-6.1 Terra Low, reviews an original draft and checks whether a revision addresses the earlier feedback.

## Timeline and milestones

| Milestone | What happened or what we plan to do |
| --- | --- |
| 14 September to 18 October | Worked through the AWS labs on accounts, IAM, networking, databases, and monitoring. [Worklog](../1-worklog/) |
| 25 October | Recorded the first Ownword prototype with draft-based vocabulary discovery, WordBoard, and sentence practice. [Week 6](../1-worklog/1.6-week6/) |
| 28 October | Added Quick Review and Full Practice so learners could focus on words they had forgotten. [Week 7](../1-worklog/1.7-week7/) |
| 5 November | Verified the backup path by restoring an S3 dump and testing the CloudWatch and SNS alert flow on the Lightsail pilot. [Week 8](../1-worklog/1.8-week8/) |
| 12 November | Deployed the custom account screens, Google sign-in, and pronunciation controls. [Week 9](../1-worklog/1.9-week9/) |
| 20 November | Moved the application database to private RDS and released the daily learning streak. |
| Through 14 December, planned | Rehearse the demo, capture a two-account check and a timed restore, and finish the cost estimate and handover. [Week 13](../1-worklog/1.13-week13/) |

## Budget estimate

The hosting subtotal is **about US$33.01 per month before credits**. It covers the application VM and RDS compute and storage. It excludes model calls, edge and monitoring charges, backups, and other usage-based costs.

| Item | Monthly basis |
| --- | --- |
| Lightsail in Singapore | US$12 for the 2 GB Linux bundle with public IPv4. [Lightsail pricing](https://aws.amazon.com/lightsail/pricing/) |
| RDS in Singapore | About US$21.01 for 730 hours on Single-AZ `db.t4g.micro` and 20 GiB of gp3 storage, using the rate recorded at the 20 November migration. [RDS for PostgreSQL pricing](https://aws.amazon.com/rds/postgresql/pricing/) |
| Edge and sign-in | Add CloudFront requests and transfer, the WAF charges for the chosen plan, Cognito monthly active users, and Lambda invocations. |
| Backups and monitoring | Add Lightsail snapshots, S3 storage and requests, the CloudWatch metric and alarm, SNS deliveries, and the customer-managed KMS key. |
| Model usage | Estimate Bedrock input and output tokens for fresh concept searches. Track OpenRouter vocabulary and Writing usage separately from the AWS subtotal. |

For a trial estimate, assume 10 active learners each make 10 fresh concept searches and request two Writing assessments or revision checks in a month. That gives 100 Bedrock searches and 20 Writing calls for the model budget. These are planning assumptions. Use measured input and output tokens and the actual rates to price them. Compare with the [workshop cost worksheet](../5-workshop/5.7-verification/#2-build-a-monthly-cost-estimate).

## Design choices and risks

| Risk | What the design does and what to check |
| --- | --- |
| The app VM goes down | RDS keeps the database separate from the app host. Use the workshop to rehearse redeployment and time how long it takes for sign-in and WordBoard to return. |
| Database failure or stale backup | The pilot uses Single-AZ RDS. Keep a private S3 copy of each daily dump and check `BackupFresh`. Time a restore into an isolated database and record which backup it used. |
| Access to another learner’s data | Cognito establishes identity. Next.js limits access to the signed-in owner’s records. Check that a second account cannot open a saved-word detail URL from the first account. |
| Model failure or unsuitable feedback | Validate response structure before using it. Test a fresh concept lookup and a revision with synthetic text so a provider error or unhelpful result is visible. |
| Higher usage or costs | Use the saved result for repeat lookups and cap model calls. Compare CPU, memory, latency, and errors under a small test load before deciding whether the VM needs more capacity. |

## Delivery and measurement

The report includes the architecture diagram, the live app, and a bilingual deployment and cleanup guide. Earlier release checks recorded Cognito sign-in, persistence of saved words and practice results, live model calls, and a restore of an RDS backup into a temporary database.

The demo is successful if a learner can find an unfamiliar word, save and recall it later, and work through feedback on a draft. The AWS side is successful if the team can repeat the lab with its own resources, restore the data, and receive an alert when the backup is stale. The remaining evidence includes a dated two-account check, a small load test, a timed restore, and a full AWS Pricing Calculator estimate. [Workshop acceptance checks](../5-workshop/5.7-verification/)
