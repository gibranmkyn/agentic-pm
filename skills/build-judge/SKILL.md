---
name: build-judge
description: "Build an LLM judge to automate evaluation of a specific AI feature behavior — scoped to one failure category, validated against labeled traces with TPR and TNR."
allowed-tools: Read Grep Glob Write Edit
---

# LLM Judge — Build an Automated AI Evaluator

One judge. One behavior. Binary scoring. Validated against human-labeled ground truth. This skill builds on error analysis you've already done — the judge automates a measurement you understand, it doesn't tell you what to measure.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Also read upstream artifacts when present:
- `Work/evals/<feature>-error-journal.md` (error analysis and failure categories — required)
- `Work/evals/<feature>-eval-plan.md` (rubric or evaluation framework for context)

---

## Frameworks this skill loads

- `frameworks/critique-shadowing.md` — spine: 5-step process for building a judge aligned to domain expert judgment
- `frameworks/llm-judge.md` — binary scoring architecture, code vs. LLM judge decision rule, TPR/TNR validation
- `frameworks/error-analysis.md` — prerequisite context: the failure categories this judge will measure

Read all frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to make sure the PM has done the prerequisite thinking before building automation on top of it.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Have you done error analysis on this feature first? A judge automates what you already understand — it doesn't tell you what to measure."** *(LLM Judge: "the judge automates what you already understand; it doesn't tell you what to measure.")* If no error analysis exists, stop and route to `/agentic-pm:diagnose-ai` or `/agentic-pm:write-rubric`. Building a judge without understanding the failure modes is building a test for a disease you can't describe.

2. **"What specific behavior are you judging? Not 'response quality' — name one failure category from your error analysis."** *(LLM Judge: "a judge that evaluates 6 dimensions does all of them worse.")* If the PM says "overall quality" or lists three behaviors, the judge needs to be scoped down. One judge, one behavior, binary scoring. Follow up: "If you had to pick the single failure mode that matters most to users right now, which one?"

3. **"Who is the domain expert whose judgment is ground truth — and have they actually reviewed traces, or are you planning to use yourself as proxy?"** *(Critique Shadowing: "one authoritative voice, not a committee.")* The domain expert must have product taste and user knowledge specific to this failure. A PM proxying for a clinical expert or a legal expert calibrates the judge to the proxy's beliefs, not reality.

4. **"Do you have at least 20 labeled examples? Not 'we could label some' — do they exist right now, with binary pass/fail labels and written critiques?"** *(Critique Shadowing: step 2 requires labeled examples before building the judge.)* If the answer is "we have traces but haven't labeled them," that's the first job — not building the judge. Below 20, you're fitting to noise.

5. **"What will you do if the judge's TPR is below 80% after two iterations — iterate more, or ship it anyway?"** Surfaces the PM's real commitment. A judge that ships at 60% TPR catches 6 out of 10 real failures. If the PM will ship it regardless, the validation step is theater — name that explicitly so the team knows what they're getting.

6. **"Is this judge replacing a human review process, augmenting one, or creating measurement where none exists?"** Changes the stakes. Replacing human review means the judge is the last line of defense. Augmenting means it's a filter. Creating new measurement means there's no baseline to compare against — the PM needs to define "good enough" before building.

Interview until you can answer: Is there real error analysis upstream? Is the behavior scoped to one thing? Does labeled data actually exist? Is the PM committed to iterating on validation, or is this a checkbox?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the specific failure category, the domain expert (or gap), the labeled data situation, what the judge will replace or augment.
2. **"Here's the approach"** — Critique Shadowing spine, how many labeled examples to start with, what the judge prompt structure will look like, expected iteration count.
3. **"Here are my concerns"** — missing error analysis, insufficient labeled data, domain expert gap, PM planning to skip validation.

Ask: **"Want to adjust before I start building the judge?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

This skill has one spine: Critique Shadowing → LLM Judge validation.

If not already established in the interview, ask directly:

1. **What specific behavior or failure category are you judging?** Not "response quality" — something specific, like "human handoff miss" or "incorrect policy citation."
2. **Who is the Principal Domain Expert** — the one person whose judgment is authoritative for quality on this feature?
3. **How many labeled traces do you have from error analysis?** (Must be ≥20 to start; ≥100 to produce a trustworthy judge.)
4. **Do you have the error analysis from `/agentic-pm:write-rubric` or `/agentic-pm:diagnose-ai`?** If not, stop and run one of those first.

If the PM cannot answer question 1 with a single specific behavior, the session cannot proceed. A judge that covers multiple behaviors does all of them worse.

---

## Sub-steps

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Do not proceed if error analysis has not been done.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine, the labeled data situation, concerns. Wait for PM approval before producing anything.

### Step 3 — Scope the judge to one behavior

Name the exact failure category from error analysis. Not "response quality." Not "multiple issues." One specific thing:
- "Human handoff miss: a handoff was required but didn't happen"
- "Incorrect policy citation: the AI stated a policy that doesn't apply to this user's situation"
- "Out-of-scope question not deflected: user asked something outside the product's scope and received a confident wrong answer"

If the PM wants to judge multiple behaviors, create separate judges — one per behavior. A multi-behavior judge is a signal the scope needs to be split.

### Step 4 — Confirm the Principal Domain Expert

Name the one person whose judgment is the ground truth for this failure category. Not a committee. Not "the team." One person.

The domain expert must have product taste and user knowledge relevant to this failure — a lead nurse for a clinical product, the PM for a customer support tool, a senior engineer for a code generation feature. A "convenient proxy" calibrates the judge to the proxy's beliefs, not user needs.

If the PM skips this step, tag `judge-unvalidated` and note it in the output.

### Step 5 — Create a diverse dataset (20–50 examples)

Build test cases across three dimensions:
- **Features** — specific capabilities the AI is expected to handle
- **Scenarios** — standard case, ambiguous input, edge case, out-of-scope request, multi-turn
- **Personas** — new user, expert user, frustrated user, non-native speaker

Source real examples from the labeled traces in the error journal. Supplement with synthetic edge cases generated from the failure category definition. Target 20 examples at minimum; 50 for a production judge.

### Step 6 — Domain expert critiques each example

For each example, the domain expert:
- Makes a binary judgment: pass or fail
- Writes a detailed critique explaining *why* — specific enough that a new team member could apply the same standard

The written critique is the training data, not the label. A label without a critique tells you what happened. The critique tells you why — and "why" is what the judge learns.

Prompt the PM to work through at least 5–10 examples with their domain expert before building the judge prompt.

### Step 7 — Build the judge prompt

Structure the judge prompt in three parts:

**Part 1 — Specific failure criteria**
Exact definition of what constitutes a failure for this behavior. Draw from the domain expert critiques. Be concrete. Test the criteria: would two different people apply them the same way?

**Part 2 — "NOT a failure" cases**
Explicit list of situations that look like failures but aren't. Without this, the judge over-triggers. Draw from domain expert critiques of borderline passes.

**Part 3 — Binary output instruction**
"Return only true or false. True if failure. False otherwise."

Add 3–5 domain expert critiques as few-shot examples in the prompt: input + AI response + expert critique + binary judgment.

### Step 8 — Validate TPR and TNR on labeled holdout

Use the labeled traces from error analysis as ground truth. Compute:

| Metric | Definition | Target |
|---|---|---|
| **TPR (True Positive Rate)** | When there's a real failure, does the judge catch it? | >80%, target >90% |
| **TNR (True Negative Rate)** | When there's no failure, does the judge correctly pass? | >80%, target >90% |

Do not compute accuracy. On imbalanced classes (failures are rare), a judge that always predicts "pass" gets high accuracy while catching nothing.

### Step 9 — Iterate until TPR > 80% and TNR > 80%

Budget 1–2 days for the first iteration cycle:

- **Low TPR (missing real failures):** Add those failure cases to Part 1 criteria; add failing examples as few-shots
- **Low TNR (false alarms):** Add those cases to Part 2 "NOT a failure" section; add passing examples as few-shots
- Recompute TPR/TNR on the holdout after each iteration
- Expect 2–4 iterations before reaching target; this is normal, not a sign of failure

### Step 10 — Self-validate

Before presenting the judge prompt, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the judge prompt.

### Step 11 — Produce the artifact

Write the final judge prompt to `Work/evals/<feature>-judge-prompt.md`.

---

## Quality bar

Before finalizing the judge prompt:

- [ ] Judge scoped to **one specific behavior** — not "response quality" or multiple dimensions — *LLM Judge: "a judge that evaluates 6 dimensions does all of them worse"*
- [ ] Binary scoring only (not 1–5) — *LLM Judge: "business decisions are binary; a score of 3 doesn't help you decide anything"*
- [ ] TPR and TNR computed (not accuracy) — *LLM Judge: "accuracy is misleading on imbalanced classes"*
- [ ] Domain expert critiques used as few-shot examples — *Critique Shadowing: "the critique is the training data, not the label"*
- [ ] ≥20 examples in the dataset (≥50 recommended for production) — *Critique Shadowing: step 2*
- [ ] Judge built **after** error analysis — *LLM Judge: "the judge automates what you already understand; it doesn't tell you what to measure"*
- [ ] Principal Domain Expert named and involved — *Critique Shadowing: "one authoritative voice, not a committee"*

---

## Tag propagation

- Domain Expert skipped or replaced with committee → tag `judge-unvalidated`
- Judge covers more than one behavior → tag `judge-overscoped`
- Fewer than 20 labeled examples in dataset → tag `judge-insufficient-data`
- Built before error analysis → tag `judge-premature`

---

## Handoffs

**Upstream:**
- `/agentic-pm:write-rubric` — provides labeled traces and error taxonomy (required before this skill)
- `/agentic-pm:diagnose-ai` — alternative source of labeled traces and failure categories

**Downstream (offer, not auto-chain):**
- `/agentic-pm:define-metrics` — judge results feed the metric tree as automated quality measurement

---

## Output

`Work/evals/<feature>-judge-prompt.md`

Contents:
- Feature and failure category being judged
- Domain Expert named
- Judge prompt (all three parts: failure criteria, NOT failure cases, binary output instruction)
- Few-shot examples from domain expert critiques (3–5)
- Dataset summary (count, diversity across scenarios/personas)
- Validation results: TPR, TNR, holdout set size
- Iteration log: what changed each round and why
- Tags applied (if any)

---

## End every session with

- The exact TPR and TNR the judge achieved on the labeled holdout
- The single failure mode the judge still misses most (if TPR is not yet >90%) — that's where the next few-shot example should come from
- If the judge passed validation: "This judge is ready to run on production traces. Feed results into `/agentic-pm:define-metrics` to track quality over time."

---

## Completion status

Report exactly one of at close:
- **DONE** — judge built, TPR and TNR both >80%, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — judge built but tags applied or validation not yet at target (list each tag); state what iteration work remains
- **BLOCKED** — cannot build judge; state what is missing (no error analysis, no domain expert, fewer than 20 labeled examples)
- **NEEDS_CONTEXT** — failure category not scoped to one behavior; ask for the specific behavior before proceeding
