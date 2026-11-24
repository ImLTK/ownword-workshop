---
title: "Week 13: Verification, presentation and handover"
date: 2026-11-13
weight: 13
chapter: false
pre: " <b>1.13.</b> "
---

**07/12–14/12/2026**

*Recorded project milestones*

## Week 13 objectives

- Rehearse the product demo and document recovery checks.
- Complete the bilingual report, cost estimate and handover.

---

## Tasks for the week

The task dates are estimates based on the earlier worklog.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| Monday to Tuesday | **Demo rehearsal.** Walked through the learner demo from sign-in and writing to saving a word, practicing, and checking progress. Reviewed how requests reach the application and database. | 07/12/2026 | 08/12/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Wednesday | **Sign-in and data access.** Reviewed sign-in through Cognito and Google and checked how access is separated between accounts. | 09/12/2026 | 09/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| Thursday | **Restore and alerts.** Worked through the backup restore and alert checks, including what to record about the backup and recovery time. | 10/12/2026 | 10/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| Friday to Monday | **Presentation and handover.** Worked on the cost estimate, presentation, bilingual report, and handover. Reviewed the architecture and its limits with the team. | 11/12/2026 | 14/12/2026 | - |

---

## Week 13 achievements

- I’d start the demo with one learner on the public site. Sign in, describe an idea, save a suggested word, and reopen WordBoard before starting practice. That gives the audience a reason to look at the architecture: Cognito handles sign-in, Bedrock handles concept search, and RDS keeps the saved word available when the learner returns. [Workshop overview](../../5-workshop/5.1-overview/)
- For the person taking over, the useful records are the release commit and image digest, the last successful backup and restore check, and the steps to take if a backup alert arrives. I’d keep the remaining checks visible too. For the two-account check, record what the second account could see. For the restore, keep the backup date, elapsed time, and a query that confirms the restored data is readable. [Verification and cost checklist](../../5-workshop/5.7-verification/)
