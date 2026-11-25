# Ownword FCAJ Workshop report

This is a **separate Hugo site cloned from the official [FCAJ workshop template](https://github.com/thienluhoan/fcj-workshop-template)**. It retains the template's Hugo Learn theme, bilingual content structure, left navigation, search, breadcrumbs, and GitHub Pages workflow. The sample IoT/S3 lab and sample student data have been replaced with original Ownword content.

## Current state

- English and Vietnamese home, seven main report sections, thirteen worklog weeks with study notes, project evidence and clearly marked plans, three blog summaries with publication dates, links and images, three event reports with photos, and seven Ownword Workshop chapters.
- The reference report's original dark AWS sidebar, blue links, orange accents, typography and plain content layout, with the student's Ownword information and live application link. Its other student's text, tracking code and visitor counters are excluded.
- The bilingual Workshop follows the 24 November AWS architecture, with sign-in and account linking in Singapore. The local participant snapshot is `.tools/ownword-lab-source-c8a903e.tar.gz`. Share it through the project source-access channel. Chapter 5.2 records the checksum.
- **Before submission**, review worklog dates, personal contributions, event write-ups and screenshots. Add any remaining self-ratings and test evidence. The Workshop includes the production SVG and monthly cost estimate.

## Run locally

Install [Hugo Extended 0.134.3](https://github.com/gohugoio/hugo/releases/tag/v0.134.3). Make `hugo` available on your PATH and run this from the repository root:

```sh
hugo server --bind 127.0.0.1
```

Open the URL Hugo prints, usually `http://127.0.0.1:1313/`. To make a production-style build:

```sh
hugo --minify --baseURL https://example.github.io/ownword-workshop/
```

`content/` contains the editable report. English pages end in `.md`; Vietnamese pages end in `.vi.md`. The Hugo Learn theme is included in `themes/`.

## Publish when complete

The GitHub Actions workflow runs only by manual dispatch and requires a `REPORT_READY.md` file. After checking the report and evidence, add that file, push, configure GitHub Pages to serve from the `gh-pages` branch, and run the workflow. The build computes the GitHub Pages base path from the repository name.

The live Ownword product is a **demo link** inside the report. The FCAJ submission URL should be the hosted Hugo report site.
