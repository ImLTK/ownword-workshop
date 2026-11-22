---
title: "Week 12: Deployment review and infrastructure verification"
date: 2026-11-13
weight: 12
chapter: false
pre: " <b>1.12.</b> "
---

**30/11–06/12/2026**

*Planned work*

## Week 12 objectives

- Verify the existing pilot inventory and the role of each service.
- Prepare a deployment walkthrough with evidence for each major step.

---

## Tasks for the week

| Day | Task | Planned start | Planned completion | References and evidence |
| --- | --- | --- | --- | --- |
| 1–2 | Write down the static address, Ubuntu setup, and Docker Compose services on ownword-pilot in Singapore. Include Caddy, Next.js, and PostgreSQL. Check the instance and snapshot names in the console. | 30/11/2026 | 01/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| 3 | Review Cognito and its Google identity provider in Ohio, the Pre Sign-up account-linking Lambda, and application callback URLs; capture redacted evidence. | 02/12/2026 | 02/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| 4 | Check the private S3 backup destination, CloudWatch metric BackupFresh, alarm ownword-pilot-backup-stale and SNS operator notifications. | 03/12/2026 | 03/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| 5 | If the walkthrough needs to show how to create a fresh deployment, try it in a disposable environment. Record the actual instance name, dates, and results. | 04/12/2026 | 04/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |

---

## Expected outcomes

- Check the inventory for ownword-pilot and write down how requests, sign-in, data, backups, and alerts move through the setup.
