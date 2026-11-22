---
title: "Buildrathon Kickoff: Code the Future with CMC Global"
date: 2026-11-13
weight: 2
chapter: false
pre: " <b>4.2.</b> "
---

| Event detail | Information |
|---|---|
| Date | Saturday, 26 September 2026 |
| Venue | Bitexco Financial Tower, 2 Hải Triều, Ho Chi Minh City |
| My role | Attendee |

## Event program

The kickoff opened with the challenge goals and how entries would be judged. After introductions and advice about working in cloud and AI, the program moved on to an exercise on building an agent.

| Local time | Topic |
|---|---|
| 09:00–09:30 | Challenge briefing, judging criteria and an introduction to AWS and generative AI |
| 09:30–09:45 | Introductions and time to connect with other participants |
| 09:45–10:30 | Cloud and AI career talk with industry practitioners |
| 10:30–10:45 | Q&A covering AWS, generative AI, certifications and the challenge |
| 10:45–11:15 | Practical AI agent challenge covering prompts, knowledge bases and retrieval |
| 11:15–11:20 | Closing remarks and learning resources |

{{< event-photo file="cmc.jpg" alt="Group photo next to CMC Global and First Cloud AI Journey signage" caption="Group photo at the Buildrathon kickoff at Bitexco Financial Tower." >}}

## What I learned

### Define a task that can be evaluated

The judging criteria made me think about what a team could show in a short demo. I’d start with an agent that answers a common support question using a small set of documents. Show a question with a known answer and the passage that supports it. Then try a question the documents don’t cover so the reviewer can see how the agent handles it.

### Give prompts, retrieval and tools distinct jobs

The practical block covered prompt engineering, retrieval-augmented generation (RAG), knowledge bases and agents. The prompt defines the task and response format. A knowledge base gives the model a collection to retrieve relevant material from. An agent can choose a permitted tool to take a further step. A question about a policy might only need document retrieval, while a request to edit a record introduces a decision about who may authorize that action.

### Test what happens when the evidence is weak

When I test an agent, I’d check whether the source it cites actually supports the answer and what happens when the source is missing or stale. I’d ask one clear question, one that needs clarification, and one the knowledge base can’t answer. If the agent can edit records, I’d also check that asking it to read something leaves the records as they were.

### Explain design decisions in terms of the user

The career talk and Q&A gave me a way to present a project in an interview or demo. I’d describe a problem the user has and explain one decision I made. Then I’d show a result or a test the audience could reproduce.

## How this relates to Ownword (my project) {#how-this-relates-to-ownword}

For an Ownword demo, I’d look up a word, save it, and find it again in WordBoard. I’d also try a lookup with no result and try saving the same word twice. If we add questions based on curated learning material, I’d check when the app can cite a source and when it guesses before deciding whether retrieval helps.

## References

- [Organizer’s agenda](https://luma.com/8fe9vvps)
- [Event date listing](https://allai.events/event/buildrathon-kickoff-code-the-future-with-cmc-global)
- [How Amazon Bedrock Knowledge Bases works](https://docs.aws.amazon.com/bedrock/latest/userguide/kb-how-it-works.html)
