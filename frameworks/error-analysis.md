---
name: Error Analysis
aliases: [Trace Review, Error Review, Error Categorization]
author: Hamel Husain, Shreya Shankar
source_type: article
source: "Evaluating LLMs is a minefield (Husain + Shankar, 2026); The PM's Role in AI Evals (2026)"
use_when:
  - You have a live AI feature and users are complaining but you can't characterize what's failing
  - You're about to build an LLM judge and need to know what to measure
  - Your team is debating whether a feature works without any data on what's actually going wrong
tags: [evals, ai-pm, methodology, quality]
---

# Error Analysis

The most important step in any eval practice — and the one most teams skip. Most teams jump directly to building automated judges. That's backward. Without error analysis, you don't know what to measure, and your judge ends up scoring generic "helpfulness" while real product failures slip through untouched.

Error analysis answers: what is actually breaking? A labeled spreadsheet of real failures, organized by category and frequency, is the foundation on which every other eval practice is built.

**Authors:** Hamel Husain (Parlance Labs) + Shreya Shankar — publicly available writing on AI evaluation (2026). See [parlance-labs.com](https://parlance-labs.com) and Hamel's blog.

---

## Four-step process

### Step 1 — Review 100 traces and take rough notes
Open your trace viewer. For each trace, quickly read:
- What did the user ask?
- What did the AI respond?
- What's wrong, if anything? (one-line note)

Speed matters: 30–45 seconds per trace. You're looking for patterns, not perfecting any single judgment. In an hour you can cover 100 traces and surface 40–50 error signals.

Rules: don't get stuck on any single trace; let yourself build a flow state.

### Step 2 — Categorize errors with axial coding
Take your scattered notes and organize them into categories. Export to a spreadsheet, paste into an LLM, and ask it to propose 5–6 categories from the open codes.

Then **refine for specificity.** "Quality issues" is too vague; "conversational flow — repeated messages" is specific. "Temporal issues" is too vague; "date formatting errors" is specific. Categories need to be specific enough that someone else could label errors using them without asking you questions.

### Step 3 — Label each error
Assign every note to a category. Do this manually in the spreadsheet, or have an LLM auto-label and then review for accuracy.

### Step 4 — Count and prioritize with a pivot table
Tally occurrences per category. You've gone from "we have some bugs" to "conversational flow issues are our biggest problem with 15 occurrences, followed by human handoff failures with 8." That's what makes prioritization possible.

---

## Who should own this

PMs — not engineers, not delegated to interns.

Engineers can tell you if code works. They can't tell you whether the bathroom being connected vs. disconnected matters to the tenant. Error analysis requires domain expertise in user needs. The teams shipping the best AI products have PMs who've personally reviewed hundreds or thousands of traces. That experience shows in the product.

---

## What you get from it

1. **A prioritized error category list** — the basis for deciding what to fix first
2. **Labeled trace examples** — the ground truth for validating LLM judges
3. **Easy wins** — some issues don't need evals, just prompt fixes (e.g., "never use markdown in SMS responses" eliminates a whole category)
4. **Product intuition** — not a document, but the understanding that comes from looking directly at failure

---

## Monthly cadence

Run error analysis monthly on new traces, even after you have a mature eval suite. New edge cases emerge as the product evolves. The categories that mattered at launch are rarely the categories that matter a year later.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Building a judge before doing error analysis | Error analysis first, always. The judge automates what you already understand. |
| Delegating error analysis to an intern | PM must own this — it requires product taste and user knowledge. |
| Categories too broad ("quality issues") | Refine until categories are specific enough for independent labeling |
| One-time review | Set a monthly cadence; run on fresh traces, not the same ones |

---

## When NOT to use it

- Pre-launch, before any traces exist — use [Evaluation Rubric](evaluation-rubric.md) to define success criteria upfront, then run error analysis once the product ships.
- When you have fewer than ~20 traces — too small a sample to find reliable patterns. Collect more traces first.

---

## Connection to other frameworks

- [LLM Judge](llm-judge.md) — error analysis is the prerequisite; the judge automates measurement of the categories you found.
- [Evaluation Rubric](evaluation-rubric.md) — the pre-launch complement; together they cover the full eval lifecycle.
- [Three Gulfs Framework](three-gulfs-framework.md) — once error categories are found, the three gulfs map each category to the type of fix needed.

---

## Further reading

- Hamel Husain + Shreya Shankar — *Evaluating LLMs is a minefield* (2026) — public article
- Hamel Husain — *The PM's Role in AI Evals* (2026) — public article
- Hamel Husain — [hamel.dev](https://hamel.dev) — blog on AI engineering and evals

---

*This card is an original synthesis. For the full treatment, read Husain and Shankar's articles.*
