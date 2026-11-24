---
title: "Self-evaluation"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>6.</b> "
---

During my First Cloud AI Journey internship, my team and I built Ownword for English learners who recognize words they rarely use. Learners can search for a word by describing an idea, save it to WordBoard, and practice recalling it later. I helped decide how vocabulary and practice should work and helped set up the pilot on AWS.

The [Ownword workshop](../5-workshop/) walks through the setup we used, with Lightsail running the app and a private RDS database storing learner data. My work included setting up Google sign-in through Cognito and checking that the backup alert reached the operator. When a lab instruction didn’t match what we saw, my teammates and I checked how the service behaved and worked through the problem together.

## My ratings

| No. | Criterion | What I assessed | Good | Fair | Average |
| ---: | --- | --- | :---: | :---: | :---: |
| 1 | Share of the work | How much of the team’s work I took on and completed | ✅ | ⬜ | ⬜ |
| 2 | Impact of my work | What improved for Ownword or the team because of my work | ✅ | ⬜ | ⬜ |
| 3 | Initiative | Whether I spotted gaps, suggested changes, or volunteered to help | ⬜ | ✅ | ⬜ |
| 4 | Teamwork | How well I kept teammates informed, listened, and helped when needed | ✅ | ⬜ | ⬜ |
| 5 | Learning efficiency | How I used my time when I got stuck and when I asked for help | ⬜ | ✅ | ⬜ |
| 6 | Responding to feedback | How I used feedback to improve my work | ✅ | ⬜ | ⬜ |
| 7 | Understanding AWS basics | Whether I can explain what the AWS services I studied do and when to use them | ✅ | ⬜ | ⬜ |
| 8 | Applying AWS to Ownword | How well the services I helped set up fit the project’s needs | ⬜ | ✅ | ⬜ |
| 9 | Meeting deadlines | Whether I delivered when promised and flagged delays early | ✅ | ⬜ | ⬜ |
| 10 | Prioritizing work | Whether I focused on what the team needed most | ✅ | ⬜ | ⬜ |
| 11 | Consistency | How steadily I made progress and kept my worklog up to date | ✅ | ⬜ | ⬜ |
| 12 | Quality of work | How well I checked my work and how much rework it left for teammates | ⬜ | ✅ | ⬜ |

## My contribution to Ownword

My teammates and I discussed what learners needed from Ownword. I worked out how the vocabulary and practice features should behave and used Codex to help build and revise them. I also helped set up and test the AWS pilot.

- **Vocabulary and WordBoard.** I found that words added by hand had blank definitions on WordBoard and in flashcards. I asked for the app to save the word right away and fill in the definition in the background. I also proposed showing Vietnamese meanings in the first set of suggestions and asked for a smaller pronunciation button on WordBoard cards.
- **Practice and flashcards.** I specified keyboard and touch controls for Quick Review and reported a first-letter hint that appeared before the learner asked for it. I also clarified that sentence practice should let learners choose any topic where the word fits. That requirement led to removing the preset topic from the information sent to the grader.
- **AWS configuration and verification.** I configured Google as a sign-in provider in Amazon Cognito, ran the account-linking deployment in AWS CloudShell, and verified that Google sign-in opened the learner’s existing WordBoard. I also ran the S3 backup setup and applied the KMS fix for the operator alert topic. I confirmed that the test notification reached my inbox after the fix.

## Needs improvement

- I overlooked some major ways to cut AWS costs. My teammates caught most of them, and their feedback helped us avoid a more expensive setup. I want to compare costs earlier, while we can still change the design easily.
- I was slow to troubleshoot AWS infrastructure at the start of the internship. Working through problems like missing IAM permissions has helped me narrow down the cause faster. I still want to get better at recording what I tried so I can rule things out without repeating the same checks.
- I tried new AWS services on Ownword as I learned about them. Some of my early choices turned out to be a poor fit, and I replaced them as I understood the project and the alternatives better. Next time, I want to compare the options against what the app needs before adding a service.
- I tried to keep our Git history tidy and write readable code. Some of my changes still caused problems that left my teammates with extra work. I want to review my changes more carefully and explain anything that affects how they run or test the app before handing it over.
