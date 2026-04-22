---
name: Evaluation Rubric
aliases: [Eval Rubric, Scoring Rubric, Quality Rubric]
author: Ankit Shukla
source_type: article
source: "AI Evals, Simply (Shukla, 2026)"
use_when:
  - You're about to launch an AI feature and need to define what "good output" means before shipping
  - Human reviewers are evaluating inconsistently because the criteria are implicit
  - You're building an LLM judge and need reference examples for its prompt
tags: [evals, ai-pm, methodology, quality]
---

# Evaluation Rubric

A rubric makes "good" concrete. Without one, evaluation is subjective — every reviewer applies different standards, calibration is impossible, and LLM judges have nothing to anchor to. A rubric defines success criteria, a scoring scale, and reference examples that both humans and automated judges use to assess AI outputs.

The rubric-first approach is specifically suited to pre-launch evaluation, before you have production traces. Once you have real traces, complement the rubric with error analysis on actual failures.

**Author:** Ankit Shukla — *AI Evals, Simply* (2026). See his public writing on AI evaluation.

---

## Five-step process

### Step 1 — Define user scenarios
List the top 10 situations users will encounter. These become test cases. Be concrete about what the user is trying to accomplish, not just what they might type.

Examples for a customer support chatbot: user asks about return policy; user submits a complaint about a defective item; user asks an ambiguous question that could mean two different things; user asks something outside the product's scope.

### Step 2 — Define success criteria per scenario
Make each criterion specific and measurable. Vague criteria produce inconsistent scoring.

| Vague | Specific |
|---|---|
| "The response is helpful" | "The response contains the correct return window and includes the return portal link" |
| "The code works" | "The code passes all test cases, follows the style guide, and includes error handling" |

### Step 3 — Build 4–6 rubric categories
Common categories: Correctness, Completeness, Clarity, Tone, Safety, Efficiency. Cap at six — more categories dilute focus and slow down review.

Each category gets clear anchors. If you're using a 1–5 scale for human review, every score level needs a definition, not just 1 and 5. An undifferentiated 1–5 produces variance; defined anchors produce calibration.

**Note on scoring for automated judges:** for LLM judges built from this rubric, convert each category to binary pass/fail — it's faster to validate and forces explicit failure criteria.

### Step 4 — Create reference examples
For each category and score level, write a concrete example showing what that score looks like. These examples become:
- Ground truth for human reviewers
- Few-shot examples in LLM judge prompts (see [LLM Judge](llm-judge.md) and [Critique Shadowing](critique-shadowing.md))

### Step 5 — Validate with inter-rater reliability
Have 2–3 people independently grade the same 10 outputs. Calculate agreement. If reviewers disagree frequently, the rubric criteria are too ambiguous. Refine until independent reviewers converge. Target: 80%+ agreement before trusting the rubric as ground truth.

---

## How it feeds into LLM judges

The rubric — criteria, score definitions, reference examples — becomes the core of the LLM judge prompt. The judge doesn't invent what "good" means; it applies the rubric you built. This is why the rubric must be built by domain experts, not delegated to ML engineers.

---

## Rubric-first vs. traces-first

| | Rubric-first (pre-launch) | Error analysis (post-launch) |
|---|---|---|
| When | Before shipping, when you only have scenarios | After shipping, with real production traces |
| Input | Hypothetical user scenarios | Real failures from production |
| Output | Defined success criteria + reference examples | Error category taxonomy, prioritized by frequency |
| Best for | Defining "good" before users see it | Understanding what's actually breaking in production |

Build a rubric pre-launch; use error analysis to refine categories as real failures emerge.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Criteria that are too vague | Test them: can two different reviewers score the same output and agree? If not, rewrite. |
| More than 6 categories | Cut the weakest. Coverage beats exhaustiveness. |
| No inter-rater validation | Run 10 examples through 2+ reviewers before calling the rubric final |
| Rubric written without looking at real output samples | Criteria drift is inevitable until you've seen actual outputs — review samples first |

---

## When NOT to use it

- When you already have production traces and real failures — start with [Error Analysis](error-analysis.md) to understand what's actually breaking, then update or replace the rubric with empirical categories.
- For deterministic outputs (structured data extraction, format validation) — use code-based evals instead.

---

## Connection to other frameworks

- [LLM Judge](llm-judge.md) — the rubric feeds directly into the judge prompt; the reference examples become few-shot training data.
- [Critique Shadowing](critique-shadowing.md) — Hamel's technique for building judges using domain expert critiques as few-shot examples; the rubric provides the starting criteria.
- [Error Analysis](error-analysis.md) — the complementary post-launch process; together, rubric-first and traces-first cover the full eval lifecycle.

---

## Further reading

- Ankit Shukla — *AI Evals, Simply* (2026) — primary source
- Hamel Husain + Shreya Shankar — *Evaluating LLMs is a minefield* (2026) — the complementary traces-first perspective

---

*This card is an original synthesis. For the full treatment, read Shukla's article.*
