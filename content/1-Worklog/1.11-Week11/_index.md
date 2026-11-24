---
title: "Week 11: Prepare the workshop and architecture"
date: 2026-11-13
weight: 11
chapter: false
pre: " <b>1.11.</b> "
---

**23/11–29/11/2026**

*Recorded project milestones*

## Week 11 objectives

- Turn the pilot architecture and operational work into a reproducible workshop.
- Prepare cost assumptions and agree on the presentation flow.

---

## Tasks for the week

The task dates are estimates based on the earlier worklog.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| Monday to Tuesday | **AWS inventory and presentation.** Reviewed the AWS resources Ownword uses with the team and discussed who would present each part. | 23/11/2026 | 24/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Wednesday | **Architecture diagram.** Updated the architecture diagram to show how the application, sign-in, backups, alerts, and model providers connect. | 25/11/2026 | 25/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Thursday | **Workshop instructions.** Drafted the workshop’s deployment steps, IAM explanation, and backup procedure. Worked on the screenshots for the walkthrough. | 26/11/2026 | 26/11/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| Friday | **Cost assumptions.** Worked through cost assumptions for a small pilot and for a month with more usage. | 27/11/2026 | 27/11/2026 | - |

---

## Week 11 achievements

- The architecture is easier to explain by following a learner’s request. The public hostname goes through CloudFront and WAF. CloudFront connects to Caddy on Lightsail, and Caddy forwards the request to Next.js. Saving a word takes a separate connection from Next.js to private RDS. For sign-in, the detail a lab participant needs to get right is that Cognito returns the browser to the public hostname. [Architecture and data flow](../../5-workshop/5.3-architecture/)
- For the cost comparison, the Lightsail bundle and RDS provide a starting monthly baseline. A busier month changes inputs such as model calls, request volume, and backup storage. That comparison gives the workshop a way to explain why a small hosting subtotal can miss costs that grow with usage. [Workshop cost worksheet](../../5-workshop/5.7-verification/)
