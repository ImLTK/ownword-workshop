---
title: "Week 10: Improve learning methods and application quality"
date: 2026-11-13
weight: 10
chapter: false
pre: " <b>1.10.</b> "
---

**16/11-22/11/2026**

*Recorded project milestones*

## Week 10 objectives

- Evaluate the full learning journey and record usability issues.

## Tasks for the week

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 5 | Moved PostgreSQL to private RDS, checked the TLS connection, and used GitHub Actions to publish the Ownword app image through ECR. All 21 learning tests passed. | 20/11/2026 | 20/11/2026 | [Release architecture](../../5-workshop/5.3-architecture/#release-flow) · [Project milestones](../../2-proposal/) |
| 7 | Saved the English and Vietnamese Ownword report for continuation. | 22/11/2026 | 22/11/2026 | [Report commit](https://github.com/ImLTK/ownword-workshop/commit/7b2e2bb) |

## Week 10 achievements

- On 20 November, Ownword released the daily learning streak and moved PostgreSQL from the Lightsail host to private RDS. The release checks covered the database's TLS connection, Cognito sign-in, and whether saved words and practice results persisted. [Proposal milestones](../../2-proposal/#timeline-and-milestones) · [Verification checks](../../5-workshop/5.7-verification/)
- The production checks also covered two model routes. A fresh concept search goes to Bedrock, while Writing assessment goes to OpenRouter. Repeating a search can reuse a saved result, so a fresh query is the better check when verifying that the Bedrock route is working. [Model request flow](../../5-workshop/5.3-architecture/)
- The first automated release shipped a small change to the sign-in page. GitHub Actions passed all 21 learning tests and published the image to ECR. Lightsail pulled it, and the team checked that the footer animation moved on the public page. That gave us a visible way to tell that the new version had reached users. [Release flow](../../5-workshop/5.3-architecture/#release-flow)
