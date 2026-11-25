---
title: "Fireside Chat with Dr. Werner Vogels"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>4.3.</b> "
---

| Event detail | Information |
|---|---|
| Event theme | Navigating the Future of Cloud & AI in Vietnam |
| Date | Friday, 2 October 2026 |
| Location | Ho Chi Minh City |
| Guest | Dr. Werner Vogels, Chief Technology Officer at Amazon |
| My role | Attendee |

## Event overview

At the First Cloud AI Journey fireside chat, Dr. Vogels talked about database outages at Amazon, keeping services available, and paying for cloud resources as you use them. He also discussed what engineers are responsible for when they use AI. What stuck with me was how often he started with a problem that users or operators had before getting into the technology.

{{< event-photo file="fireside_1.jpg" alt="First Cloud AI Journey opening slide showing the event title and 2 October 2026" caption="The opening slide for the 2 October fireside chat." >}}

## What I learned

### Start with the way the application reads and writes data

After a peak shopping-season outage, Amazon examined what its applications were asking the database to do. A large share of requests were key lookups, such as finding a shopping cart by its ID. That observation helped motivate Dynamo, Amazon's distributed key-value system and an influence on DynamoDB. Dynamo's design prioritized availability for those operations and used object versions to help resolve conflicting writes when needed. My takeaway was to list the common reads and writes before choosing a database, then decide how the application should behave when a read is stale or a write is retried.

### Measure the slow requests and rehearse recovery

The discussion on operational excellence gave me two ways to check that an application behaves as intended. The first is to look at tail latency. If P99.9 is two seconds, roughly 99.9% of observed requests completed within two seconds, while the slowest fraction took longer. A median can look healthy while those users are still waiting. The second is to run a GameDay, a planned exercise that introduces a failure and checks that detection, failover and recovery work together. A useful exercise records when an alert fired, who acted on it and which user operations recovered.

### Budget for the reliability a workload needs

Vogels also talked about how paying for cloud resources by usage changes what teams invest in. I'd ask what a proposed change actually buys us. Extra capacity or redundancy can be worth it if it protects a user workflow we care about. For a small pilot, I'd start by working out the monthly cost and trying the recovery steps.

{{< event-photo file="fireside_2.jpg" alt="Dr. Werner Vogels speaking with the host during the fireside chat" caption="Dr. Werner Vogels in conversation during the fireside chat." >}}

### Keep ownership when using AI

Vogels's "Renaissance developer" combines technical depth with curiosity, systems thinking and clear communication. I understood this as knowing enough about the neighboring parts of a system to see where a change might cause trouble. If AI helps draft a change to a sign-in flow, the engineer still has to understand the session behavior, review the permissions and test both successful and failed attempts.

## How this relates to Ownword

A slow sign-in, word lookup, or WordBoard reload is easy to notice in Ownword. I'd time each one so a good overall average can't hide a single slow step. For a recovery exercise, I'd test whether a failed lookup gives a clear message, lets me retry, and leaves the words I'd already saved accessible.

{{< event-photo file="fireside_3.jpg" alt="Group photo with other attendees at the First Cloud AI Journey event" caption="With my teammates at the event." >}}

## References

- [AWS Builder Center event recap](https://builder.aws.com/content/3KBSLeKsdkk6uMUPq7d9Xxa5jbS/the-invariable-lessons-of-tech-and-humanity-key-takeaways-from-amazon-cto-werner-vogels)
- [Amazon's Dynamo paper](https://www.amazon.science/publications/dynamo-amazons-highly-available-key-value-store)
- [Werner Vogels on the Renaissance developer](https://www.allthingsdistributed.com/2025/11/tech-predictions-for-2026-and-beyond.html)
