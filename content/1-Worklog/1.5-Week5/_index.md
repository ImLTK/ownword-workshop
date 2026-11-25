---
title: "Week 5: CloudWatch and hybrid DNS"
date: 2026-11-13
weight: 5
chapter: false
pre: " <b>1.5.</b> "
---

12/10-18/10/2026

## Week 5 objectives

- Use metrics, logs and alarms to understand what a deployment is doing.
- Trace how DNS queries pass between a VPC and another environment.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1-3 | Used CloudWatch to look at EC2 CPU, EBS write bytes, search and math expressions, and log messages. Tried metric filters, an error alarm, and a dashboard. The alarm still showed insufficient data in the screenshot, and the dashboard showed changes that hadn't been saved. | 12/10/2026 | 14/10/2026 | [Cloud Journey / workshop](https://000008.awsstudygroup.com/1-introduction/) · [Lab screenshots](#lab-evidence-1) |
| 4 | Studied a hybrid DNS design with Route 53 Resolver inbound and outbound endpoints and forwarding rules. Reviewed how DNS requests can resolve between an on-premises environment and resources in AWS. | 15/10/2026 | 15/10/2026 | [Cloud Journey / workshop](https://000010.awsstudygroup.com/) · [Lab screenshots](#lab-evidence-2) |

## Week 5 achievements

- The CloudWatch alarm showed insufficient data. When we set up Ownword's backup monitoring later, we treated a missing signal or an old backup as a reason to investigate. The hybrid DNS lab also helped me trace name resolution on its own before looking at how the app routes requests.

### Reading metrics, logs and alarms {#lab-evidence-1}

{{< worklog-image file="cloudwatch_stack.png" caption="CloudFormation stack events for the CloudWatch lab" >}}

{{< worklog-image file="cloud_watch_metrics_ebs_write_bytes.png" caption="EC2 and EBS metrics in CloudWatch" >}}

{{< worklog-image file="search_expression_cloud_watch.png" caption="CloudWatch metric search expression" >}}

{{< worklog-image file="cloud_watch_math_expression.png" caption="CloudWatch metric math expression" >}}

{{< worklog-image file="cloudwatch_ec2_log_messages.png" caption="EC2 log messages in CloudWatch" >}}

{{< worklog-image file="cloudwatch_alarm.png" caption="CloudWatch alarm showing its state at the time" >}}

{{< worklog-image file="cloudwatch_dashboard.png" caption="CloudWatch dashboard with unsaved changes indicated" >}}

### Tracing DNS across two environments {#lab-evidence-2}

{{< worklog-image file="on_premise_dns.png" caption="CloudFormation stack outputs from the hybrid DNS lab" >}}
