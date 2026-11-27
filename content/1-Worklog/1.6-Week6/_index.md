---
title: "Week 6: From AWS labs to the Ownword prototype"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>1.6.</b> "
---

19/10-25/10/2026

*Recorded project milestones*

## Week 6 objectives

- Connect the AWS exercises to a practical application design.
- Establish the first recorded Ownword prototype and map its learning flow.
- Practice user authentication with Amazon Cognito before defining Ownword's server-side validation, repository layer, and demo-mode workflow.

## Tasks for the week

Where the notes only give a completion or record date, the start date is estimated.

| Day | Task | Start date | Completion / record date | References and evidence |
| --- | --- | --- | --- | --- |
| 1 | Completed the Cloud Journey serverless authentication lab with Amazon Cognito: created a User Pool, integrated it with the API and Lambda backend, tested sign-in from the front end, and cleaned up the lab resources. Used this to map how Ownword's prototype API boundary could later sit behind managed authentication. | 19/10/2026 | 19/10/2026 | [Cloud Journey / workshop](https://000081.awsfcaj.com/) |
| 2-3 | Defined server-side prompt and response validation for draft vocabulary suggestions, and prepared sample writing drafts with built-in demo responses so teammates could test the flow without live model keys. | 20/10/2026 | 21/10/2026 | [Vocabulary suggestion](#vocabulary-suggestion) |
| 4-5 | Worked out how recall and sentence completions move saved words across New, Practicing, and Active on WordBoard, and kept D1 queries behind repository functions so storage could change later without rewriting the screens. | 22/10/2026 | 23/10/2026 | [WordBoard stages](#wordboard-stages) |
| 2-7 | The prototype suggested vocabulary from a draft. Learners could save a word to WordBoard, then try to recall it and use it in a sentence. | 20/10/2026 | 25/10/2026 | [Vocabulary suggestion](#vocabulary-suggestion) |
| 5-7 | WordBoard organized saved words into New, Practicing and Active, so learners could see where each word sat in the practice cycle. | 23/10/2026 | 25/10/2026 | [WordBoard stages](#wordboard-stages) |
| 1-7 | The first recorded snapshot included the Next.js interface, a server API and a D1-backed repository. A built-in demo let learners try sample writing and feedback without a model key. | 19/10/2026 | 25/10/2026 | |
| 6-7 | Walked through the end-to-end prototype flow with teammates (draft, suggestion, save to WordBoard, recall, and sentence practice) and noted early friction to address in Week 7, including quicker flagging of forgotten words and clearer Vietnamese meanings during practice. | 24/10/2026 | 25/10/2026 | [Week 7](../1.7-week7/) |

## Week 6 achievements

- By the end of the week, the Ownword prototype could take learners from writing to saving and practicing a word. That was the starting point for the practice changes in Week 7.
- Doing the Cognito lab on Day 1 and keeping D1 queries inside repository functions let us build the prototype quickly and still swap out the database or sign-in layer later.
- Built-in demo fixtures let teammates test the draft-to-practice loop without live model keys. That walkthrough showed us where forgotten words and Vietnamese meanings still needed work in [Week 7](../1.7-week7/).

## Screenshots from the current app

### Vocabulary suggestion {#vocabulary-suggestion}

{{< worklog-image file="ownword-vocabulary-suggestion.png" caption="Ownword suggests meticulous in place of careful, shows it in the learner's sentence, and offers to add it for practice." >}}

### WordBoard stages {#wordboard-stages}

{{< worklog-image file="ownword-wordboard-stages.png" caption="WordBoard shows five saved words and filters for New, Practicing and Active." >}}
