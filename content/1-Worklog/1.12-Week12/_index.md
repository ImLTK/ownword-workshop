---
title: "Week 12: Deployment review and infrastructure verification"
date: 2026-11-13
weight: 12
chapter: false
pre: " <b>1.12.</b> "
---

**30/11–06/12/2026**

*Recorded project milestones*

## Week 12 objectives

- Verify the existing pilot inventory and the role of each service.
- Prepare a deployment walkthrough with evidence for each major step.

---

## Tasks for the week

The task dates are estimates based on the earlier worklog.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| Monday to Tuesday | **Lightsail and PostgreSQL.** Reviewed the Singapore Lightsail setup, including the static address, Ubuntu, snapshots, and which services run on the host. Checked how the application connects to PostgreSQL. | 30/11/2026 | 01/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| Wednesday | **Sign-in configuration.** Reviewed the Singapore Cognito setup, including Google sign-in, the Lambda that links accounts, and the callback URLs. | 02/12/2026 | 02/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| Thursday | **Backup alerts.** Checked the private S3 backup destination, the CloudWatch backup metric and alarm, and the SNS notification path. | 03/12/2026 | 03/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| Friday | **Lab deployment.** Reviewed how someone could repeat the deployment in a separate lab environment. | 04/12/2026 | 04/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |

---

## Week 12 achievements

- The workshop’s release steps show how to trace a version from the GitHub commit to its ECR image and then to the image running on Lightsail. Once the image appears in ECR, the VM log shows which version Lightsail activated. Opening the public home and sign-in pages checks what learners can reach. The release script can restore the previous app image if startup fails, though database migrations that already ran stay applied. [Release walkthrough](../../5-workshop/5.6-operations/5.6.1-releases/)
- A database problem calls for a different check. The backup job sends a copy to private S3, CloudWatch tracks whether that copy is fresh, and SNS emails the operator if the alarm fires. The workshop restores a copy into a temporary database so the team can check that it opens and can be queried without affecting learner data. [Backups and monitoring](../../5-workshop/5.6-operations/)
