---
title: "Week 9: Account experience and pronunciation"
date: 2026-11-13
weight: 9
chapter: false
pre: " <b>1.9.</b> "
---

**09/11–15/11/2026**

*Recorded project milestones*

## Week 9 objectives

- Release the account and pronunciation changes on the pilot.
- Verify the migration and account navigation after deployment.

---

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| Monday to Thursday | **Pilot release.** Prepared the release by verifying a PostgreSQL backup copy in S3, then deployed the custom account screens, Google sign-in action and pronunciation controls to ownword-pilot. | 09/11/2026 | 12/11/2026 | [Ownword pilot](https://ownword.3.1.163.210.sslip.io/) |
| Thursday | **Registration fix.** Checked the migration and container health. In the browser, the registration button didn’t go where it should. Deployed the navigation fix and checked the form again. | 12/11/2026 | 12/11/2026 | [Account screen](https://ownword.3.1.163.210.sslip.io/account) |
| Thursday | **Google sign-in.** Checked the Google sign-in and linking flow. The next device checks are speaker playback on desktop and phone and a two-account isolation test. | 12/11/2026 | 12/11/2026 | [Ownword pilot](https://ownword.3.1.163.210.sslip.io/) |

---

## Week 9 achievements

- The account and pronunciation changes were live on the pilot. The registration fix passed a browser check, and the previous release and verified backup were ready if a rollback was needed.
- The registration bug made the difference between a healthy container and a working feature easy to see. The app had started, but clicking Register still took me to the wrong place. That gave me a simple browser check for later account changes: start on the sign-in page, follow the registration link, and confirm the form opens.
- For Google sign-in, I checked that an eligible returning learner could still open their existing WordBoard. That was the point of linking the accounts in Cognito. Creating a new account would have made the learner’s saved words appear to be gone. [Cognito and Google sign-in](../../5-workshop/5.5-auth/)
