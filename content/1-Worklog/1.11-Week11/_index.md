---
title: "Week 11: Prepare the workshop and architecture"
date: 2026-11-13
weight: 11
chapter: false
pre: " <b>1.11.</b> "
---

**23/11-29/11/2026**

*Recorded project milestones*

## Week 11 objectives

- Turn the pilot architecture and operational work into a reproducible workshop.
- Compare pilot costs and verify Google account linking.

## Tasks for the week

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 2 | Documented the AWS request flow, deployment, sign-in configuration and backup procedure for the workshop. | 24/11/2026 | 24/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) · [Operations](../../5-workshop/5.6-operations/) |
| 2 | Estimated costs for 10 and 100 learners. Ran local tests confirming that saving `lantern` added a PostgreSQL row and that invalid input created no additional row. | 24/11/2026 | 24/11/2026 | [Verification and cost](../../5-workshop/5.7-verification/) |
| 3 | Tested Google account linking with the same verified email on a first Google sign-in. CloudWatch in Singapore recorded a successful link to the existing Cognito account. | 25/11/2026 | 25/11/2026 | [CloudWatch evidence](../../5-workshop/5.7-verification/) |
| 4 | Compared the AWS diagram with the running system and traced CloudFront/WAF through Caddy on Lightsail to the app and RDS. Reviewed the Singapore Cognito and Lambda setup, the model routes, and the labels, icons and arrows in the diagram. | 26/11/2026 | 26/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| 5 | Reviewed the deployment and operations instructions, including prerequisites, commands, IAM permissions, RDS TLS, S3 backups, CloudWatch and SNS alerts, and cleanup. Compared the test results with their evidence. | 27/11/2026 | 27/11/2026 | [Deployment](../../5-workshop/5.4-deploy/) · [Operations](../../5-workshop/5.6-operations/) |
| 6 | Read the English and Vietnamese report versions side by side to cross-check the architecture, cost figures, assumptions and optimizations. Reviewed the demo and deployment links and checked screenshots and logs for identifiers. | 28/11/2026 | 28/11/2026 | [Workshop](../../5-workshop/) · [Verification and cost](../../5-workshop/5.7-verification/) |
| 7 | Reviewed the worklog, self-evaluation, feedback, three AWS Study Group posts, three event reports with check-in photos, and Portal attendance history against the OJT checklist. Reviewed the demo, presentation costs and the documents required for the group submission. | 29/11/2026 | 29/11/2026 | [Blog posts](../../3-blogsposted/) · [Event reports](../../4-eventparticipated/) |

## Week 11 achievements

- The architecture is easier to explain by following a learner's request. The public hostname goes through CloudFront and WAF. CloudFront connects to Caddy on Lightsail, and Caddy forwards the request to Next.js. Saving a word takes a separate connection from Next.js to private RDS. For sign-in, the detail a lab participant needs to get right is that Cognito returns the browser to the public hostname. [Architecture and data flow](../../5-workshop/5.3-architecture/)
- For the cost comparison, the Lightsail bundle and RDS provide a starting monthly baseline. A busier month changes inputs such as model calls, request volume, and backup storage. That comparison gives the workshop a way to explain why a small hosting subtotal can miss costs that grow with usage. [Workshop cost worksheet](../../5-workshop/5.7-verification/)
