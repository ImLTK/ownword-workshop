---
title: "Week 3: RDS and Lightsail workshops"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>1.3.</b> "
---

**28/09–04/10/2026**

## Week 3 objectives

- Connect a web application to a managed database.
- Practice configuring and troubleshooting packaged applications on Lightsail.

---

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1 | **Connecting the sample application to RDS.** Set up a VPC, security group, and database subnet group for the RDS lab. Created the database, connected to MySQL from EC2, and opened the sample management app in a browser. Reviewed snapshots and how to restore them. This exercise used the workshop’s sample database. | 28/09/2026 | 28/09/2026 | [Cloud Journey / workshop](https://000005.awsstudygroup.com/) · [Lab screenshots](#lab-evidence-1) |
| 4 | **Running and troubleshooting applications on Lightsail.** Tried Lightsail instances and managed MySQL, connected to Ubuntu by SSH, and worked through WordPress, PrestaShop, and Akaunting. The screenshots show `Workshop-WordPress` and `Workshop-PrestaShop`. Worked through missing permissions and a PrestaShop admin path that differed from the instructions, and installed the PHP and Apache components Akaunting needed. Looked at network exposure, manual and automatic snapshots, how to restore to a larger instance, and CPU burst capacity alarms. The PrestaShop screenshot shows a startup error. Akaunting opens, with notices still on screen. | 29/09/2026 | 01/10/2026 | [Cloud Journey / workshop](https://000045.awsstudygroup.com/1-database/) · [Lab screenshots](#lab-evidence-2) |

---

## Week 3 achievements

- Connecting to MySQL from EC2 checked the database path. Opening the app in a browser checked a different part of the setup. When the Lightsail labs differed from the instructions, checking permissions, dependencies, and application logs helped narrow down the problem.

### Connecting the sample application to RDS {#lab-evidence-1}

{{< worklog-image file="connected_ec2_rds.png" caption="SSH session to the lab EC2 instance" >}}

{{< worklog-image file="connected_ec2_to_rds.png" caption="MySQL connection from the EC2 lab instance" >}}

{{< worklog-image file="opened_my_app_rds.png" caption="Sample management application opened in the browser" >}}

### Running and troubleshooting applications on Lightsail {#lab-evidence-2}

{{< worklog-image file="ubuntu_ssh.png" caption="Lightsail browser SSH session to Ubuntu" >}}

{{< worklog-image file="wordpress_site.png" caption="WordPress dashboard in the Lightsail exercise" >}}

{{< worklog-image file="prestashop.png" caption="PrestaShop terminal showing an initialization error to troubleshoot" >}}

{{< worklog-image file="akounting.png" caption="Akaunting application screen with outstanding notices" >}}
