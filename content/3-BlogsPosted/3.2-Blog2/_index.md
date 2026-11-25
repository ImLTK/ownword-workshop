---
title: "EC2, Lightsail, or Lambda? Which Is Right for a Small Project?"
menuTitle: "Choosing EC2, Lightsail, or Lambda"
weight: 2
chapter: false
pre: " <b>3.2.</b> "
---

| Publication detail | Information |
| --- | --- |
| Publication date | 16 November 2026 |
| Publication link | [Original Vietnamese post on Facebook](https://www.facebook.com/share/p/1AyGgM759M/) |
| Publication topic | Choosing between Amazon EC2, Amazon Lightsail, and AWS Lambda for small projects |

A portfolio site and a job that sends order confirmations have different needs. I use examples like these to compare the three services. EC2 gives you more control over the server and network, and you handle updates, security, and monitoring. Lightsail has a bundle that's easier to set up for a portfolio or a small storefront. Lambda can send a confirmation when an order comes in.

As traffic grows, you can put a load balancer in front of EC2 and add Auto Scaling. Lambda has a limit on how long each call can run. If you use it to serve an API, include anything else you'll need, such as API Gateway or a database, when you work out the cost. I'd also factor in how much time you want to spend running it.

{{< figure src="/images/blogs/blog2.png" alt="Service icons for Amazon EC2, Amazon Lightsail, and AWS Lambda" caption="Figure 3.2. Cover image comparing EC2, Lightsail, and Lambda, as used in the Facebook post." >}}
