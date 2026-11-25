# Ownword FCAJ Workshop Report (Gi Group Team Template)

This folder contains everything needed to host your own bilingual (English + Vietnamese) FCAJ internship report on GitHub Pages.

## What is already shared (keep intact)

- `content/2-Proposal/` (Proposal, EN & VI)
- `content/3-BlogsPosted/` (3 shared AWS Study Group posts, EN & VI)
- `content/5-Workshop/` (Ownword AWS Workshop 5.1-5.7, architecture diagram, cost estimate, verification, EN & VI)

## What YOU MUST replace before submitting

1. `config.toml`: replace `[YOUR FULL NAME]` in `description` and `author`.
2. `content/_index.md` and `content/_index.vi.md`: fill in your student details and replace `static/images/profile-placeholder.svg` if you want to include a profile photo.
3. `content/1-Worklog/` (Weeks 1-12, EN & VI): replace all placeholders with your own weekly/daily tasks, evidence, and screenshots (put your own screenshots in `static/images/worklog/`).
4. `content/4-EventParticipated/` (EN & VI): **REWRITE THE ENTIRE EVENTS SECTION** with your own 3 events and your own check-in photos with your face clearly visible (replace the sample files in `static/images/events/`).
5. `content/6-Self-evaluation/` (EN & VI): mark your own ratings (`✅`) and write your own contributions and areas to improve.
6. `content/7-Feedback/` (EN & VI): write your own internship reflection and feedback.

## Preview locally

Install [Hugo Extended 0.134.3](https://github.com/gohugoio/hugo/releases/tag/v0.134.3) and run from this folder:

```sh
hugo server --bind 127.0.0.1
```

## Publish to your own GitHub Pages

1. Push this folder to your own GitHub repository.
2. When all personal sections are filled in and verified, create an empty `REPORT_READY.md` file in the repository root and push it.
3. In GitHub **Settings -> Pages**, set the source branch to `gh-pages`.
4. Run **Actions -> Deploy Hugo site to GitHub Pages** manually.
5. Submit your hosted GitHub Pages report URL in **FCAJ Portal -> Workshop Submission** (keep `https://app.ownword.co/` inside the report as demo evidence).
