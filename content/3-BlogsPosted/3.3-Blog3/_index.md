---
title: "What Happens When Your Website Suddenly Gets 10,000 Visitors?"
menuTitle: "Handling a traffic spike"
weight: 3
chapter: false
pre: " <b>3.3.</b> "
---

| Publication detail | Information |
| --- | --- |
| Publication date | 17 November 2026 |
| Publication link | [Original Vietnamese post on Facebook](https://www.facebook.com/share/p/1F1qCTrZ2E/) |
| Publication topic | Handling a website traffic spike with Application Load Balancer, EC2 Auto Scaling, and CloudWatch |

Picture a small online shop during an 11/11 sale. When a lot of shoppers arrive at once, pages may take longer to load and some requests may fail. How much the site slows down depends on how many people are active at the same time and what each request asks the server to do, such as signing someone in or querying the database.

An Application Load Balancer uses health checks to send requests to healthy targets. EC2 Auto Scaling adjusts the number of instances using signals like CPU utilization or requests per target. CloudWatch shows how busy or slow the site is and can send an alert when a metric crosses its threshold. New instances take time to start, and adding them won't necessarily speed up a database that's already overloaded.

{{< figure src="/images/blogs/blog3.png" alt="An Application Load Balancer routes traffic to two EC2 instances in an Auto Scaling group that use DynamoDB" caption="Figure 3.3. Traffic-spike architecture used in the Facebook post, with an Application Load Balancer, EC2 Auto Scaling, and DynamoDB." >}}
