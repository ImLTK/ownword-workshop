---
title: "AWS Cloud and AI Day Hanoi 2026"
date: 2026-11-13
weight: 1
chapter: false
pre: " <b>4.1.</b> "
---

| Event detail | Information |
|---|---|
| Date | Tuesday, 29 September 2026 |
| Main conference | JW Marriott Hotel Hanoi |
| My role | Attendee at the Ho Chi Minh City watch party |

## Event overview

AWS brought together engineers, customers and community builders for more than 30 sessions, alongside an expo, startup showcases and a community area. The Hanoi program opened at 07:30, with a 09:00 keynote, technical sessions from 11:00 and a 17:00 close. The keynote lineup included Amazon CTO Werner Vogels, Katalon's Mai Le and Techcombank CEO Jens Lottner. The agenda also identified a Ho Chi Minh City watch-party session and listed talks on topics such as VPBank's internal developer platform on EKS and taking agentic AI from a demo to deployment.

{{< event-photo file="cloud_day_1.jpg" alt="Group photo in the watch-party room with conference video on the screens" caption="At the Ho Chi Minh City watch party with fellow attendees." >}}

## What I learned

### Follow an incident across services

In a demo I photographed, GoTymeX investigated a login outage that first showed up as a spike in HTTP 5xx errors at the gateway. The team checked metrics, logs, traces, and recent changes, then followed requests through the downstream services. They found a query waiting on a metadata lock on an Aurora MySQL reader. That explained why requests were piling up and why a service further up the chain was timing out.

I noticed that AWS DevOps Agent had read-only access for the investigation. An engineer still had to approve a change like stopping a query. GoTymeX looked at six months of incidents and reported that the median time from an alert to the first likely cause fell from 34.5 to 10 minutes. That tells me how quickly the team had something to investigate.

{{< event-photo file="cloud_day_2.jpg" alt="GoTyme incident investigation slide shown on the watch-party screens" caption="The GoTyme demonstration connected gateway errors to a database lock several services downstream." >}}

### Verify the identity a workload actually uses

Kha Van's conference recap described pairing a Kubernetes service account with an IAM role using Amazon EKS Pod Identity. The application can obtain temporary AWS credentials through the SDK. An environment variable or another credential source earlier in the SDK's chain can change which identity the application uses. If a permission error occurs, checking the caller identity inside the workload helps distinguish a missing permission from a workload using the wrong role.

### Design for the work that follows the demo

Kha Van's recap described how internal developer platforms let teams repeat the same deployment steps. It also raised a question about AI agents in production. Who owns the agent, what can it do, and where can the team see what it did? The infrastructure examples solved different problems. Direct Connect in Hanoi gives organizations a private path to AWS, and Hanoi Local Zone can put resources closer to users. The choice depends on the latency users see, where the data has to live, and what the team can operate.

## How this relates to Ownword

I'd use the same approach if Ownword users couldn't sign in or save a word. I'd log the step that failed, the time, and the component that returned the error. That would give the team enough to trace whether the problem started at sign-in, in the API, or in storage without recording credentials or user content.

{{< event-photo file="cloud_day_3.jpg" alt="Conference badge showing Lê Tuấn Kiệt and FPT University" caption="My attendance badge for AWS Cloud and AI Day Hanoi 2026." >}}

## References

- [Conference overview](https://aws.amazon.com/events/cloud-day-hanoi/)
- [Official agenda](https://aws.amazon.com/events/cloud-day-hanoi/agenda/)
- [GoTymeX engineering write-up](https://www.linkedin.com/pulse/gotymexs-aiops-agent-diagnoses-incidents-35x-faster-aws-drkkc)
- [Conference recap](https://builder.aws.com/content/3KMpKxUhRFeSlclpmwu5ZxBQBYL/aws-cloud-and-ai-day-hanoi-2026-building-for-the-next-phase-of-cloud-and-ai)
- [Amazon EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html)
