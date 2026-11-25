---
title: "AWS Free Tier Doesn't Make Everything Free"
menuTitle: "AWS Free Tier and costs"
weight: 1
chapter: false
pre: " <b>3.1.</b> "
---

| Publication detail | Information |
| --- | --- |
| Publication date | 15 November 2026 |
| Publication link | [Original Vietnamese post on Facebook](https://www.facebook.com/share/p/1FHWbwiHG8/) |
| Publication topic | AWS Free Tier credits, EC2-related charges, and cost monitoring |

Say you stop your EC2 instance after a lab. What can still show up on the bill? I explain how Free Tier credits and plan limits work, then look at two resources you might leave behind. On a paid plan, an EBS volume you keep or an Elastic IP you forget to release can still cost money.

Before setting anything up, check the price. Afterward, look in the Billing Dashboard and Cost Explorer to see where the charges came from, set an alert in AWS Budgets, and clean up the resources you no longer need. If the alert comes in, you still have to check what's running and decide what to do.

{{< figure src="/images/blogs/blog1.png" alt="AWS Free Tier cover asking how much you can use for free" caption="Figure 3.1. AWS Free Tier cover image used in the Facebook post." >}}
