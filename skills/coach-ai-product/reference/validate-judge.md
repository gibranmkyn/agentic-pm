---
name: validate-judge
description: Use this playbook when a PM has labeled enough traces by hand to automate detection of a specific failure mode — building and validating an LLM judge against human-labeled ground truth. Loaded by the coach skill, not invoked directly.
---

# Validate Judge

One judge. One behavior. Binary scoring. Validated against human-labeled ground truth before it ships. This playbook builds on error analysis you've already done — the judge automates a measurement you understand, it doesn't tell you what to measure. Judges that aren't validated against humans are fake.

---

## Locate

Before walking the playbook, ask the PM:

1. What specific failure category from your error journal are you trying to automate detection of? (Not "response quality" — one specific behavior, e.g., "human handoff miss" or "incorrect policy citation.")
2. How many labeled traces do you have from error analysis? The minimum to start is 20; you need ≥100 to produce a judge you can trust at production scale.
3. Who is the domain expert whose judgment is authoritative for this failure? One person, not a committee.

If error analysis hasn't been done yet, the session cannot proceed. Walk `error-analysis.md` first — the judge automates what you already understand.

**MCP awareness:** If an eval-platform MCP is configured, use it to run candidate judge prompts against held-out labeled data and compute TPR/TNR directly. If no eval MCP is available, guide the PM through running the judge manually (Jupyter notebook, local script) on the train/dev splits and pasting metrics back. Hamel's masterclass explicitly recommends notebook-based iteration for judge construction; an MCP just makes the loop faster.

---

## Prerequisite: labeled traces from error analysis

This playbook requires that the PM has:
- Done at least one pass of error analysis (see `error-analysis.md`)
- Labeled traces with binary pass/fail — not vibes, not ratings
- Named a specific failure category narrow enough to scope a judge around

The minimum bar is 20 labeled examples to start building. A trustworthy production judge needs ≥100. With fewer than 20 you're fitting to noise.

---

## Critique Shadowing: the 5-step spine (Hamel)

The core method. Aligns the judge to one authoritative domain expert's judgment, not committee averages.

### Step 1 — Scope the judge to one behavior

Name the exact failure category from error analysis. Not "response quality." Not "multiple issues." One specific thing:
- "Human handoff miss: a handoff was required but didn't happen"
- "Incorrect policy citation: the AI stated a policy that doesn't apply to this user's situation"
- "Out-of-scope question not deflected: user asked something outside scope and received a confident wrong answer"

If the PM wants to judge multiple behaviors, create separate judges — one per behavior. A multi-behavior judge does all of them worse.

### Step 2 — Name the Principal Domain Expert

One person whose judgment is the ground truth for this failure category. Not a committee. Not "the team."

The domain expert must have product taste and user knowledge relevant to this failure. A "convenient proxy" calibrates the judge to the proxy's beliefs, not user needs. If no domain expert is named, tag `judge-unvalidated` and flag before proceeding.

### Step 3 — Build a diverse dataset (20–100+ examples)

Source real examples from the labeled traces in the error journal. Build across three dimensions:
- **Features** — specific capabilities the AI is expected to handle
- **Scenarios** — standard case, ambiguous input, edge case, out-of-scope request, multi-turn
- **Personas** — new user, expert user, frustrated user, non-native speaker

Supplement with synthetic edge cases generated from the failure category definition. Target 20 examples at minimum; 100+ for a production judge.

Split the dataset: 10–20% train / 40% dev / 40% test. The **test set is touched once** — at final validation only. Do not iterate on test set performance.

### Step 4 — Domain expert critiques each example

For each example, the domain expert:
- Makes a binary judgment: **pass or fail** (not 1–5; Hamel: binary resolves rater disagreement and business decisions are binary)
- Writes a detailed critique explaining *why* — specific enough that a new team member could apply the same standard

The written critique is the training data, not the label. A label without a critique tells you what happened. The critique tells you why — and "why" is what the judge learns.

Work through at least 5–10 examples with the domain expert before writing the judge prompt.

### Step 5 — Build the judge prompt

Structure the judge prompt in three parts:

**Part 1 — Specific failure criteria**
Exact definition of what constitutes a failure for this behavior. Draw from domain expert critiques. Be concrete. Test the criteria: would two different people apply them the same way?

**Part 2 — "NOT a failure" cases**
Explicit list of situations that look like failures but aren't. Without this, the judge over-triggers. Draw from domain expert critiques of borderline passes.

**Part 3 — Binary output instruction**
"Return only PASS or FAIL. FAIL if this is a failure. PASS otherwise."

Add 3–5 domain expert critiques as few-shot examples: input + AI response + expert critique + binary judgment.

Note: using the same model for the judge as for the main task is fine. The judge's quality comes from the labeled examples and criteria, not from using a different model.

---

## Validate TPR and TNR

Use the labeled traces as ground truth. Compute on the holdout set (not the training set):

| Metric | Definition | Target |
|---|---|---|
| **TPR (True Positive Rate)** | When there's a real failure, does the judge catch it? | >80%, target >90% |
| **TNR (True Negative Rate)** | When there's no failure, does the judge correctly pass? | >80%, target >90% |

**Do not compute accuracy.** On imbalanced classes (failures are rare), a judge that always predicts "pass" gets high accuracy while catching nothing. TPR + TNR are the signal; accuracy is noise.

### Iteration until TPR > 80% and TNR > 80%

Budget 1–2 days for the first iteration cycle:

- **Low TPR (missing real failures):** Add those cases to Part 1 criteria; add failing examples as few-shots.
- **Low TNR (false alarms):** Add those cases to Part 2 "NOT a failure" section; add passing examples as few-shots.
- Recompute TPR/TNR on the dev set after each iteration.
- Expect 2–4 iterations before reaching target — this is normal, not a sign of failure.
- Run the test set **once**, after iteration is complete. Never tune to test set performance.

---

## Ongoing maintenance

A judge is not a one-time artifact. Weekly maintenance is required:
- Pull new production traces and spot-check against judge decisions.
- Add novel failures to the dev set and revalidate when a new failure mode emerges.
- Rerun test set validation after any significant prompt change.

If maintenance cadence lapses beyond 4 weeks on a live feature, flag the judge as stale.

---

## Quality bar

Before finalizing the judge prompt:

- [ ] Judge scoped to one specific behavior — not "response quality" or multiple dimensions — *LLM Judge (Hamel): "a judge that evaluates 6 dimensions does all of them worse"*
- [ ] Binary scoring only (not 1–5) — *LLM Judge: "business decisions are binary; a score of 3 doesn't help you decide anything"*
- [ ] TPR and TNR computed on holdout set (not accuracy) — *LLM Judge: "accuracy is misleading on imbalanced classes"*
- [ ] Domain expert critiques used as few-shot examples — *Critique Shadowing: "the critique is the training data, not the label"*
- [ ] Train/dev/test splits defined; test set touched once — *Critique Shadowing (Hamel)*
- [ ] ≥20 examples in the dataset (≥100 recommended for production) — *Critique Shadowing*
- [ ] Judge built after error analysis, not before — *LLM Judge: "the judge automates what you already understand"*
- [ ] Principal Domain Expert named and involved — *Critique Shadowing: "one authoritative voice, not a committee"*

---

## Tag propagation

- Domain Expert skipped or replaced with committee → `judge-unvalidated`
- Judge covers more than one behavior → `judge-overscoped`
- Fewer than 20 labeled examples in dataset → `judge-insufficient-data`
- Built before error analysis → `judge-premature`
- Test set used for iteration tuning → `test-set-contaminated`

---

## Output

`.agentic-pm/evals/<feature>-judge-prompt.md`

Contents:
- Feature and failure category being judged
- Domain Expert named
- Judge prompt (all three parts: failure criteria, NOT failure cases, binary output instruction)
- Few-shot examples from domain expert critiques (3–5)
- Dataset summary (count, train/dev/test split, diversity across scenarios/personas)
- Validation results: TPR, TNR, holdout set size
- Iteration log: what changed each round and why
- Tags applied (if any)

---

## End every session with

- The exact TPR and TNR the judge achieved on the labeled holdout.
- The single failure mode the judge still misses most (if TPR not yet >90%) — that's where the next few-shot example should come from.
- If the judge passed validation: "This judge is ready to run on production traces. Feed results into your metric tracking and revalidate monthly."

---

## Handoffs

- **Comes from:** `error-analysis.md` — only after the PM has labeled enough traces by hand to know what "good" looks like.
- **Leads back to:** `error-analysis.md` — judge results reveal new failure categories not visible at original sample sizes.
