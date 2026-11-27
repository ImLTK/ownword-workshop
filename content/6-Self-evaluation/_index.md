---
title: "Self-evaluation"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>6.</b> "
---

During my First Cloud AI Journey internship, my team and I built Ownword for English learners who recognize words they rarely use. Learners can search for a word by describing an idea, save it to WordBoard, and practice recalling it later. I helped decide how vocabulary and practice should work and helped set up the pilot on AWS.

The [Ownword workshop](../5-workshop/) walks through the setup we used, with Lightsail running the app and a private RDS database storing learner data. My work included setting up Google sign-in through Cognito and checking that the backup alert reached the operator. When a lab instruction didn't match what we saw, my teammates and I checked how the service behaved and worked through the problem together.

## My ratings

| No. | Criterion | What I assessed | Good | Fair | Average |
| ---: | --- | --- | :---: | :---: | :---: |
| 1 | Share of the work | How much of the team's work I took on and completed | ✅ | ⬜ | ⬜ |
| 2 | Impact of my work | What improved for Ownword or the team because of my work | ✅ | ⬜ | ⬜ |
| 3 | Initiative | Whether I spotted gaps, suggested changes, or volunteered to help | ⬜ | ✅ | ⬜ |
| 4 | Teamwork | How well I kept teammates informed, listened, and helped when needed | ✅ | ⬜ | ⬜ |
| 5 | Learning efficiency | How I used my time when I got stuck and when I asked for help | ⬜ | ✅ | ⬜ |
| 6 | Responding to feedback | How I used feedback to improve my work | ✅ | ⬜ | ⬜ |
| 7 | Understanding AWS basics | Whether I can explain what the AWS services I studied do and when to use them | ✅ | ⬜ | ⬜ |
| 8 | Applying AWS to Ownword | How well the services I helped set up fit the project's needs | ⬜ | ✅ | ⬜ |
| 9 | Meeting deadlines | Whether I delivered when promised and flagged delays early | ✅ | ⬜ | ⬜ |
| 10 | Prioritizing work | Whether I focused on what the team needed most | ✅ | ⬜ | ⬜ |
| 11 | Consistency | How steadily I made progress and kept my worklog up to date | ✅ | ⬜ | ⬜ |
| 12 | Quality of work | How well I checked my work and how much rework it left for teammates | ⬜ | ✅ | ⬜ |

## My contribution to Ownword

My teammates and I discussed what learners needed from Ownword. I worked out how the vocabulary and practice features should behave, built and revised them, and helped set up and test the AWS pilot.

On the vocabulary side, I noticed that words added by hand had blank definitions on WordBoard and in flashcards, so I asked for the app to save the word right away and fill in the definition in the background. I also proposed showing Vietnamese meanings in the first set of suggestions and making the pronunciation button smaller on WordBoard cards.

For practice and flashcards, I specified keyboard and touch controls for Quick Review and reported a first-letter hint that appeared before the learner asked for it. In sentence practice, learners needed to be free to choose any topic where the word fits, which led to removing the preset topic from the information sent to the grader.

On AWS, I configured Google as a sign-in provider in Amazon Cognito, ran the account-linking deployment in AWS CloudShell, and verified that Google sign-in opened the learner's existing WordBoard. I also ran the S3 backup setup, applied the KMS fix for the operator alert topic, and confirmed that the test notification reached my inbox after the fix.

## Needs improvement

- I missed several major ways to cut AWS costs. My teammates caught most of them and helped us avoid a more expensive setup, so going forward I need to compare costs earlier while the design is still easy to change.
- Early in the internship, troubleshooting AWS infrastructure took me too long. Working through problems like missing IAM permissions helped me narrow down causes faster, though I still want to record what I tried more carefully so I do not repeat the same checks.
- Whenever I learned a new AWS service, I tended to try it on Ownword right away. Some early choices turned out to be a poor fit and had to be replaced once I understood the project and the alternatives better. Next time, I should compare options against what the app needs before adding a service.
- Even when I tried to keep our Git history tidy and write readable code, some of my changes still caused issues that left my teammates with extra work. Before handing off changes, I need to review them more carefully and explain anything that affects how the team runs or tests the app.
