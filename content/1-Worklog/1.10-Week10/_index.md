---
title: "Week 10: Improve learning methods and application quality"
date: 2026-11-13
weight: 10
chapter: false
pre: " <b>1.10.</b> "
---

**16/11–22/11/2026**

*Recorded project milestones*

## Week 10 objectives

- Evaluate the full learning journey and record usability issues.
- Verify account isolation and decide which issues to fix before the workshop.

---

## Tasks for the week

The task dates are estimates based on the earlier worklog.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| Monday to Tuesday | **Learning flow.** Reviewed Ownword’s learning flow with the team, from writing and finding a word to practicing and recalling it later. | 16/11/2026 | 17/11/2026 | - |
| Wednesday | **Practice review.** Tried examples to review spaced retrieval, feedback, hint penalties, and how words move between practice stages. | 18/11/2026 | 18/11/2026 | - |
| Thursday | **Account isolation.** Used two test accounts to check data separation and tried WordBoard and practice in each account. | 19/11/2026 | 19/11/2026 | - |
| Friday | **Model calls.** Reviewed how the app calls OpenRouter, validates responses, and limits spending. Considered what is sent to the provider and what that means for user privacy. | 20/11/2026 | 20/11/2026 | - |

---

## Week 10 achievements

- On 20 November, Ownword released the daily learning streak and moved PostgreSQL from the Lightsail host to private RDS. The release checks covered the database’s TLS connection, Cognito sign-in, and whether saved words and practice results persisted. A useful follow-up for the streak is to save two words on the same day and check that it counts as one day of activity. [Proposal milestones](../../2-proposal/#timeline-and-milestones) · [Verification checks](../../5-workshop/5.7-verification/)
- The production checks also covered two model routes. A fresh concept search goes to Bedrock, while Writing assessment goes to OpenRouter. Repeating a search can reuse a saved result, so a fresh query is the better check when verifying that the Bedrock route is working. [Model request flow](../../5-workshop/5.3-architecture/)
- The first automated release shipped a small change to the sign-in page. GitHub Actions passed all 21 learning tests and published the image to ECR. Lightsail pulled it, and the team checked that the footer animation moved on the public page. That gave us a visible way to tell that the new version had reached users. [First automated release](../../5-workshop/5.6-operations/5.6.1-releases/)
