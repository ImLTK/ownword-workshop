---
title: "Week 2: AWS foundations, EC2, IAM and S3"
date: 2026-11-13
weight: 2
chapter: false
pre: " <b>1.2.</b> "
---

21/09-27/09/2026

## Week 2 objectives

- Understand how budgets, permissions and network rules affect a deployment.
- Launch EC2 instances, deploy a simple application and work with objects in S3.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1-7 | Compared AWS Budgets types, then set up budgets in the console. Looked at AWS Support plans and how to open a support request. Worked through IAM users, groups, roles, and role switching, plus VPCs, subnets, Availability Zones, network ACLs, and security groups. My notes for this week also cover the first EC2 instances, SSH connections, and a NAT Gateway. | 21/09/2026 | 21-27/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 2 | Studied how AWS Site-to-Site VPN connects a VPC to an on-premises network with IPsec, including the roles of the Virtual Private Gateway, Customer Gateway and routing. | 22/09/2026 | 22/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 3 | Reviewed the compute, memory, storage and networking characteristics of EC2 instance types. Practiced launching and connecting to Windows Server 2025 and Linux instances. | 23/09/2026 | 23/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 3-4 | Practiced changing an EC2 instance type, studied instance and volume snapshots, and launched an instance from an AMI. Connected to Ubuntu, deployed a first Node.js application on Windows EC2, and reviewed how IAM users and groups receive scoped policies. | 23/09/2026 | 24/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 5 | Compared application access using access keys and IAM roles, then practiced creating an S3 bucket and uploading files from a Linux EC2 instance. Used CloudShell and basic shell commands, and listed EC2 instances and S3 buckets with the AWS CLI. | 25/09/2026 | 25/09/2026 | [Cloud Journey / workshop](https://000048.awsstudygroup.com/) |
| 6-7 | Created an S3 static website and explored CloudFront, object versioning, moves between buckets, and cross-region replication. The screenshots show the object move before and after it finished. | 26/09/2026 | 27/09/2026 | [Cloud Journey / workshop](https://000057.awsstudygroup.com/) · [Lab screenshots](#lab-evidence-6) |

## Week 2 achievements

- The Node.js lab helped me tell whether I was dealing with the server, the app, or the network rules. I came back to S3 object storage and versioning when Ownword needed backups in Week 8.

### Hosting, versioning and moving objects {#lab-evidence-6}

{{< worklog-image file="moving_objects.png" caption="S3 object move in progress" >}}

{{< worklog-image file="moved.png" caption="S3 reports the object move completed" >}}
