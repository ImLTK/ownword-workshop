---
title: "Week 4: Containers and EC2 Auto Scaling"
date: 2026-11-13
weight: 4
chapter: false
pre: " <b>1.4.</b> "
---

05/10-11/10/2026

## Week 4 objectives

- Compare managed container hosting with an application spread across multiple instances.
- Read scaling signals and load test results together.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1 | Studied Amazon Lightsail Containers and deployed an NGINX container service in Singapore. This exercise introduced a managed container deployment option before comparing it with the later Ownword host. | 05/10/2026 | 05/10/2026 | [Cloud Journey / workshop](https://000046.awsstudygroup.com/) |
| 2-4 | Ran the FCAJ sample management app with EC2 Auto Scaling, a load balancer, and a database. Tried scheduled and dynamic scaling, instance replacement, and load testing. The screenshots show the launch template, the database connection, a CloudWatch graph, and a load-test summary with errors. Those errors have to be read alongside the test conditions. | 06/10/2026 | 08/10/2026 | [Cloud Journey / workshop](https://000006.awsstudygroup.com/) · [Lab screenshots](#lab-evidence-2) |

## Week 4 achievements

- The scaling lab helped me see which problems extra capacity could help with and which still needed investigation. I'd use the load-test errors alongside CloudWatch metrics to work out what happened. Ownword started on one Lightsail VM for a small pilot, so the scaling lab gave us another setup to compare it with.

### Scaling and load-testing a multi-instance application {#lab-evidence-2}

{{< worklog-image file="launch_template_auto_scaling.png" caption="EC2 launch template created for the scaling exercise" >}}

{{< worklog-image file="auto-scale_db.png" caption="Database connection in the Auto Scaling exercise" >}}

{{< worklog-image file="cloud_watch_auto_scaling.png" caption="CloudWatch metrics for the scaling exercise" >}}

{{< worklog-image file="load_test.png" caption="Load-test summary, including observed errors" >}}
