---
title: "Week 3: RDS and Lightsail workshops"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>1.3.</b> "
---

28/09-04/10/2026

## Week 3 objectives

- Connect a web application to a managed database.
- Practice configuring and troubleshooting packaged applications on Lightsail.
- Practice connecting two VPCs privately with VPC peering and review operational takeaways from the week's AWS community events.
- Research the gap between passive and active vocabulary to define the learning problem Ownword will address.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1 | Set up a VPC, security group, and database subnet group for the RDS lab. Created the database, connected to MySQL from EC2, and opened the sample management app in a browser. Reviewed snapshots and how to restore them. This exercise used the workshop's sample database. | 28/09/2026 | 28/09/2026 | [Cloud Journey / workshop](https://000005.awsstudygroup.com/) · [Lab screenshots](#lab-evidence-1) |
| 2 | Attended the Ho Chi Minh City watch party for AWS Cloud and AI Day Hanoi 2026. Took notes on tracing a login outage across services (GoTymeX), verifying the IAM identity a workload actually uses, and planning operations beyond an initial demo. | 29/09/2026 | 29/09/2026 | [Event report](../../4-eventparticipated/4.1-event1/) |
| 2-4 | Tried Lightsail instances and managed MySQL, connected to Ubuntu by SSH, and worked through WordPress, PrestaShop, and Akaunting. The screenshots show `Workshop-WordPress` and `Workshop-PrestaShop`. Worked through missing permissions and a PrestaShop admin path that differed from the instructions, and installed the PHP and Apache components Akaunting needed. Looked at network exposure, manual and automatic snapshots, how to restore to a larger instance, and CPU burst capacity alarms. The PrestaShop screenshot shows a startup error. Akaunting opens, with notices still on screen. | 29/09/2026 | 01/10/2026 | [Cloud Journey / workshop](https://000045.awsstudygroup.com/1-database/) · [Lab screenshots](#lab-evidence-2) |
| 5 | Attended the First Cloud AI Journey Fireside Chat with Dr. Werner Vogels in Ho Chi Minh City. Noted lessons on starting database design from common read and write patterns, checking tail latency, rehearsing failure recovery, and budgeting for what a small pilot actually needs. | 02/10/2026 | 02/10/2026 | [Event report](../../4-eventparticipated/4.3-event3/) |
| 6 | Completed the Cloud Journey VPC peering lab: configured security groups and network ACLs, created and accepted a VPC peering connection, updated route tables in both VPCs, enabled cross-peer DNS resolution, verified private connectivity, and cleaned up the lab resources. | 03/10/2026 | 03/10/2026 | [Cloud Journey / workshop](https://000019.awsfcaj.com/) |
| 6-7 | Researched why learners recognize words when reading yet struggle to reuse them when writing. Compared existing language and writing tools (Duolingo, Anki, Quizlet, Grammarly) to frame Ownword's idea of connecting a word found during drafting directly to later recall practice. | 03/10/2026 | 04/10/2026 | [Project proposal](../../2-proposal/) |

## Week 3 achievements

- Connecting to MySQL from EC2 tested the database connection, while opening the app in a browser checked the web application layer. When the Lightsail labs differed from the instructions, checking permissions, dependencies, and application logs helped narrow down the problem.
- In the VPC peering lab, traffic only moved once both route tables, the security groups, and DNS matched up. That saved time later when we connected Ownword's Lightsail host to private RDS.
- Comparing Duolingo, Anki, Quizlet, and Grammarly alongside notes from the two events helped us narrow Ownword down to starting from a learner's own draft and building our data model and checks around those main flows.

### Connecting the sample application to RDS {#lab-evidence-1}

{{< worklog-image file="connected_ec2_rds.png" caption="SSH session to the lab EC2 instance" >}}

{{< worklog-image file="connected_ec2_to_rds.png" caption="MySQL connection from the EC2 lab instance" >}}

{{< worklog-image file="opened_my_app_rds.png" caption="Sample management application opened in the browser" >}}

### Running and troubleshooting applications on Lightsail {#lab-evidence-2}

{{< worklog-image file="ubuntu_ssh.png" caption="Lightsail browser SSH session to Ubuntu" >}}

{{< worklog-image file="wordpress_site.png" caption="WordPress dashboard in the Lightsail exercise" >}}

{{< worklog-image file="prestashop.png" caption="PrestaShop terminal showing an initialization error to troubleshoot" >}}

{{< worklog-image file="akounting.png" caption="Akaunting application screen with outstanding notices" >}}
