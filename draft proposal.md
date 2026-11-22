# Draft Proposal — Ownword

17 November 2026

## The problem

Many advanced English learners recognize words while reading but fall back on simpler, familiar wording when writing. They can also find it hard to decide what to revise and why. Ownword starts with the learner’s own draft. Vocabulary helps learners find useful words and build recall through independent use. Writing helps learners look closely at a submitted response and decide how to revise it. The goal is to express what they know more precisely and naturally.

## Audience and learning loop

The initial audience is individual advanced English learners. In **Vocabulary**, the learning loop is **write → discover → choose → practice → retrieve → activate**. Learners collect selected words on WordBoard and move them through **New**, **Practicing**, and **Active** as they demonstrate recall in varied contexts over time. The system does not treat recognition alone as mastery.

**Writing** has a separate loop: **choose a prompt → draft → read feedback → revise independently**. Learners can revisit what they wrote and see the changes they made.

## Pilot scope

The deployed pilot includes vocabulary discovery from learner writing, a personal WordBoard, practice sessions, progress tracking, email/password accounts, and Google sign-in. A speaker control offers browser-based pronunciation. The pilot runs on a single host for a small group. Vocabulary inference uses OpenRouter, a service separate from AWS.

### Writing diagnostic and revision

The separate **Writing** module is implemented and available in a local mock-only preview. A learner can select interests or choose a general prompt, then write a response to a curated everyday decision. The editor suggests 130–160 words and asks the learner to make a recommendation, explain two reasons, and acknowledge one drawback.

Feedback can highlight exact passages and explain what works, what could improve, or where the response provides too little evidence. The diagnostic covers argument support, logical progression, lexical precision, and grammatical accuracy. Observations are provisional and describe the submitted response. The learner can use a revision cue, revise independently, and save the new version alongside the original. Writing Profile lets the learner return to the saved versions. A saved revision is marked as unassessed.

Automated desktop and mobile browser tests covered prompt selection, submission, evidence highlights, independent revision, and returning to the saved work. The local walkthrough uses a scripted sample so a learner can try those interactions with predictable feedback. The next step is a private walkthrough to see whether the prompt, feedback, and revision flow feel useful and intuitive. Live Writing inference and automatic Writing Profile weakness updates are outside the current pilot.

## Deployed architecture

- **Application (steps 1–3 and 8).** Caddy accepts HTTPS on the Singapore Lightsail VM and forwards requests to Next.js. Next.js reads and writes learner data in PostgreSQL over the private Docker network and calls OpenRouter for vocabulary features.
- **Sign-in (steps 4–7).** Next.js sends email and password sign-ins directly to Amazon Cognito in Ohio. Google sign-in goes through Cognito’s OAuth flow. On a first Google sign-in, a Pre sign-up Lambda can link the verified identity to an eligible existing account so the learner keeps their WordBoard.
- **Backups and alerts (steps 9–12).** The VM sends daily PostgreSQL backups to private Amazon S3 storage and reports backup freshness to CloudWatch. A stale or missing signal triggers an operator email through an SNS topic encrypted with AWS KMS. IAM limits permissions for the backup job and the account-linking Lambda.

See [Architecture and data flow](content/5-Workshop/5.3-Architecture/_index.md) for the diagram and numbered walkthrough.

## Challenges in adopting Amazon Bedrock for AI inference

We evaluated Amazon Bedrock for Ownword’s English Writing diagnostic to see whether we could keep inference within our AWS infrastructure and use available AWS Free Tier credits. We compared candidate models by estimated cost and their suitability for structured feedback grounded in the learner’s writing.

AWS accepted the GPT-6 Luna Marketplace agreement, and our account showed sufficient inference quotas. Both synthetic requests to Bedrock Runtime returned `AccessDeniedException`. The second response confirmed that Luna was unavailable to our account and directed us to AWS Sales. A catalog listing, an active agreement, and sufficient quota can coexist with a runtime access restriction. [AWS guidance on account-level model access](https://docs.aws.amazon.com/bedrock/latest/userguide/model-access.html)

We selected **OpenRouter for synthetic Writing evaluator experiments** and kept AWS as the application host. This separation lets us compare inference providers without moving the application or changing the assessment rubric. The experiments surfaced a gap in how models classify some organization problems, so the Writing module continues to use mock feedback for local testing. Future provider decisions will consider runtime access, feedback quality, cost, data handling, and integration effort.

## Design choices and limits

- A single Lightsail instance makes the pilot simpler and cheaper to operate. The app and database share one failure domain, so backup and restore procedures are essential.
- Cognito handles user identity. Application records remain scoped to the signed-in user. Separate-account isolation needs a dated evidence capture for this report.
- The language model API key stays on the server. Deployed Vocabulary requests use OpenRouter. The local Writing diagnostic uses a mock, and the Writing model experiments used fictional submissions.
- Database backups are copied to private S3 storage. The report still needs a measured restore drill and recovery targets.

## Delivery and measurement

The existing [live demo](https://ownword.3.1.163.210.sslip.io/) shows the deployed pilot. The final report should include a dated end-to-end learning test, a two-account isolation test, a backup restore result, monitoring evidence, a small load test, and an AWS Pricing Calculator estimate.

For the separate Writing module, private testing should check whether learners understand the brief, can connect the feedback to their own words, and know what to change before saving an independent revision.

## Cost and risks to finish

| Cost or risk | What to document before submission |
| --- | --- |
| AWS monthly estimate | Lightsail tier, snapshot, S3 backups, Cognito, Lambda, CloudWatch, SNS, and transfer assumptions. |
| Non-AWS cost | OpenRouter model, token usage, and monthly cap, shown separately. |
| Single-host outage | Measured recovery procedure and target recovery time. |
| Identity and privacy | IAM scope, TLS, session boundaries, account isolation, and data handling. |
| Growth | CPU, memory, latency, error rate, and a trigger for resizing or redesigning the pilot. |
