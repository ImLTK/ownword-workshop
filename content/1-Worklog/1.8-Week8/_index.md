---
title: "Week 8: Build and deploy the first Ownword pilot"
date: 2026-11-13
weight: 8
chapter: false
pre: " <b>1.8.</b> "
---

**02/11-08/11/2026**

*Recorded project milestones*

## Week 8 objectives

- Move Ownword to a small AWS pilot and document the operating setup.
- Prove that the backup path works and improve the flow for words added manually.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1-2 | Prepared the source handoff. The release notes record faster progress from a correct recall to sentence practice, Vietnamese glosses in discovery and smaller payloads for model grading. | 02/11/2026 | 03/11/2026 | |
| 3-4 | Deployed the small Lightsail pilot, ownword-pilot. Caddy handled HTTPS, with Next.js and PostgreSQL running on a private Docker network. Cognito handled sign-in and OpenRouter supported the vocabulary features. | 04/11/2026 | 05/11/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) · [Lightsail screenshot](#pilot-lightsail) |
| 4 | Restored a dump from S3 into a disposable PostgreSQL database and ran queries against it. Tested the CloudWatch alarm and SNS email for old or missing backups. | 05/11/2026 | 05/11/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) · [CloudWatch screenshot](#pilot-cloudwatch) |
| 5-7 | Improved manual word entry so words save right away while enrichment runs in the background. Adjusted grading so learners can use the word in a sentence on a topic of their choice. | 06/11/2026 | 08/11/2026 | |

## Week 8 achievements

- By the end of the week, the AWS pilot was running, we'd restored a backup from S3, and we'd tested the alert. This was the first chance to use the storage and monitoring labs on Ownword itself.

### Lightsail pilot {#pilot-lightsail}

{{< worklog-image file="ownword_lightsail.png" caption="The ownword-pilot Ubuntu instance running in Singapore with both Lightsail status checks passed on 13 November 2026." >}}

### CloudWatch backup monitoring {#pilot-cloudwatch}

{{< worklog-image file="ownword_cloudwatch.png" caption="Singapore CloudWatch showing ownword-pilot-backup-stale in OK state and the BackupFresh graph on 13 November 2026." >}}
