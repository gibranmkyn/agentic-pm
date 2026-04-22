---
name: diagnose-ai
description: "Diagnose what's actually failing in a live AI feature — characterize failures from production traces, map them to root causes, and sequence fixes cheapest-first before touching the model."
allowed-tools: Read Grep Glob Write Edit
---

# Diagnose AI — Find and Fix What's Actually Failing

Users are complaining, quality is off, or something feels wrong but you can't name it. This skill runs a structured diagnosis: sample real traces, find failure patterns through axial coding, map each pattern to a root cause type, then sequence fixes cheapest-first. No guessing. No jumping to model changes before you understand the problem.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan for upstream artifacts:**

Scan `Work/` for relevant upstream artifacts using Glob:
- `Work/evals/<feature>-eval-plan.md` — if found, auto-load the existing rubric or error categories to refine rather than starting from scratch
- `Work/evals/<feature>-error-journal.md` — if found, auto-detect prior error analysis passes and continue from the latest entry

Report what you found and what's missing in the Plan checkpoint. Don't ask the PM to point you to files that already exist in Work/.

---

## Frameworks this skill loads

- `frameworks/error-analysis.md` — spine: 4-step trace review → axial coding → labeling → pivot table
- `frameworks/three-gulfs-framework.md` — diagnostic add-on: maps each failure category to its gulf type and fix sequence
- `frameworks/llm-judge.md` — handoff framework: when to automate detection of the top failure category

Read all frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to understand what triggered this investigation and whether the PM is ready to own the analysis personally.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"What specifically triggered this investigation — user complaints, a metric drop, an exec escalation, or gut feel?"** Distinguishes data-driven urgency from anxiety. A metric drop with a date and a magnitude is a different investigation than "something feels off." *(Error Analysis: the investigation must start from observed failures, not theoretical ones.)*

2. **"Are you — the PM, not an engineer — going to personally review these traces?"** *(Error Analysis: "PMs own this — it requires product taste and user knowledge.")* If the PM is planning to delegate the trace review to engineering, flag it now. Engineers optimize for technical correctness. PMs catch product-level failures — wrong tone, missing empathy, policy misapplication. Delegating this is the most common way AI quality practices fail.

3. **"How many traces do you have, and how diverse is the sample? Are they all from one user type, one time period, one failure mode — or a real cross-section?"** *(Error Analysis: sample size prerequisite — ≥100 for meaningful analysis.)* A hundred traces from the same power user segment tells you one story. A hundred traces across segments, time zones, and use cases tells you the actual story. Follow up: "Did you deliberately oversample failure-adjacent conversations, or is this a random pull?"

4. **"Before looking at data — what do you think is failing? Name your prior so we can test it."** Surfaces the hypothesis the PM is already carrying. Everyone has one. Naming it means the analysis can confirm or refute it instead of unconsciously confirming it. If the PM says "I don't have a hypothesis," push back: "You triggered this investigation for a reason. What did you see that made you think something was wrong?"

5. **"When this analysis is done, will fixes actually ship — or is this a report that gets shared and forgotten?"** Surfaces whether the PM has the authority and intent to act on findings. If the analysis will produce a deck that goes to a committee that might discuss it next quarter, the PM should know that upfront. *(Three Gulfs: the entire framework exists to sequence fixes, not to categorize problems for categorization's sake.)*

6. **"Has error analysis been done on this feature before? If so, what happened — did the fixes land, or did the categories go stale?"** Checks for prior art. If a previous pass exists, the goal is to update categories, not start from scratch. If fixes from the last pass never shipped, that's the real problem to address before producing another analysis.

Interview until you can answer: What triggered this? Will the PM personally review traces? Is the sample diverse enough? What's the prior? Will fixes actually ship?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — what triggered the investigation, the PM's prior hypothesis, the trace sample quality, whether fixes will ship.
2. **"Here's the approach"** — Error Analysis spine, how many traces to sample, whether to start fresh or update a prior pass, which gulf types to watch for based on the PM's description.
3. **"Here are my concerns"** — insufficient traces, PM not owning the review, no path to shipping fixes, sample bias.

Ask: **"Want to adjust before I start the trace review?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

One spine: Error Analysis (Hamel Husain + Shreya Shankar) → Three Gulfs diagnosis → fix sequencing.

If not already established in the interview, ask directly:

1. **Do you have production traces?** (Yes / some / no) — If no traces, stop. You cannot run error analysis on theoretical failures.
2. **How many traces do you have access to?** (Must be ≥100 for the session to be meaningful; <100 = `insufficient-traces` tag)
3. **Is this a new quality concern or an ongoing issue?** — If ongoing, check the error journal for previous passes; the goal is to update categories, not start from scratch.
4. **Who will own this analysis?** — Error analysis must be PM-led, not delegated to engineering. If the PM is not doing the review, flag this before proceeding.

---

## Sub-steps

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Establish PM ownership of the trace review before proceeding.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine, trace sample quality, concerns. Wait for PM approval before producing anything.

### Step 3 — Sample 100 diverse traces

Do not sample randomly and call it done. Randomness misses rare failures. Deliberately oversample:
- Edge cases and unusual inputs
- Failure-adjacent conversations (user expressed frustration, repeated themselves, gave up)
- High-stakes user types (high-value accounts, churned users, power users)
- The specific situations that triggered the quality complaint

100 traces is the minimum. 200 is better. Below 100, you're generating guesses, not data.

### Step 4 — Quick-review each trace

30–45 seconds per trace. Build flow state — don't optimize any single judgment. For each:
- What did the user ask?
- What did the AI respond?
- What's wrong? (one-line note, no categories yet)

Speed matters in this step. You're generating raw notes, not conclusions. Don't slow down to analyze; just describe what you see.

### Step 5 — Axial coding: emergent categories

Export the one-line notes. Do not start with pre-set categories — the categories must emerge from the data.

Run this process:
1. Ask an LLM to read all notes and propose 5–6 candidate categories
2. Review the categories for specificity: "quality issues" → not specific enough; "conversational flow: repeated questions not handled" → specific enough for independent labeling
3. Refine until every category is specific enough that two different people could apply it to the same note and agree

This step typically requires 1–2 iterations. Categories that require judgment calls to apply need refinement.

### Step 6 — Label all traces

Assign each trace note to one category from step 3. Fastest approach: manual first pass on the first 20–30 to calibrate, then LLM auto-label the rest + spot-check 20%.

Produce a pivot table:
```
Category                         | Count | % of total
Human handoff miss               |  15   | 15%
Incorrect policy citation        |  12   | 12%
Out-of-scope not deflected       |   8   |  8%
Conversational flow breakdown    |   7   |  7%
...
```

The pivot table is the deliverable that makes prioritization real. "Handoff misses: 15 occurrences" is a decision input. "There are some handoff issues" is not.

### Step 7 — Three Gulfs diagnosis on the top 2–3 categories

For each of the top failure categories, map it to the appropriate gulf type:

| Gulf | What it means | Fix type |
|---|---|---|
| **Comprehension** | You still don't understand what's failing or why | Do more error analysis; talk to users |
| **Specification** | The prompt or instructions are ambiguous | Rewrite the prompt; update rubric |
| **Generalization** | The model works in known cases but fails on edge cases | Expand eval set; add RAG; add examples |
| **Capability** | The model has hit a ceiling — cannot do this task reliably | Switch model; fine-tune |

One failure category maps to one gulf type. If a category could map to multiple gulfs, split the category.

### Step 8 — Fix sequencing: cheapest gulf first

Order fixes by cost, not by severity:

1. **Specification** — prompt rewrite; cheapest; often fixes 30–50% of failures
2. **Comprehension** — more analysis; not cheap in time, but no engineering cost
3. **Generalization** — data expansion, RAG, more examples; moderate cost
4. **Capability** — model switch or fine-tune; most expensive; only after the others

Do not jump to Capability before working the list. The most common mistake in AI diagnosis is treating everything as a model problem. Most production failures are Specification or Comprehension problems.

### Step 9 — LLM Judge handoff (conditional)

Offer the handoff to `/agentic-pm:build-judge` only when:
- ≥100 labeled traces exist (now true, given step 4)
- The top error category is well-defined enough to scope a judge around one behavior
- The PM has the time and a domain expert available

If the PM declines, note it in the error journal and move on. Do not auto-chain.

### Step 10 — Self-validate

Before presenting the diagnosis, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the error journal entry.

### Step 11 — Produce the artifact

Write the error journal entry to `Work/evals/<feature>-error-journal.md`.

---

## Quality bar

Before finalizing the error journal entry:

- [ ] PM (not engineer) owns the trace review loop — *Error Analysis: "PMs own this — it requires product taste and user knowledge"*
- [ ] ≥100 traces sampled before axial coding — *Error Analysis: sample size prerequisite*
- [ ] Categories emerged from data via axial coding — *Error Analysis: "emergent categories, not predetermined taxonomy"*
- [ ] Each category specific enough for independent labeling (no judgment calls required) — *Error Analysis*
- [ ] Failure mapped to gulf type before fix type chosen — *Three Gulfs: "don't skip to model capability without working the list"*
- [ ] Fix sequence follows gulf priority (cheapest first) — *Three Gulfs*
- [ ] Monthly cadence set for the next error analysis pass — *Error Analysis: "new edge cases emerge as the product evolves"*

---

## Tag propagation

- Fewer than 100 traces sampled → tag `insufficient-traces`
- PM not owning the trace review (delegated to engineer) → tag `pm-eval-ownership-gap`
- Three Gulfs diagnosis skipped → tag `gulfs-skipped`
- Fix sequencing skipped (jumped straight to model change) → tag `capability-jump`

---

## Handoffs

**Upstream:**
- `/agentic-pm:write-rubric` — may already have error categories to refine; check before starting fresh

**Downstream (offer, not auto-chain):**
- `/agentic-pm:build-judge` — offer after ≥100 labeled traces; builds automated detection for the top category
- `/agentic-pm:define-metrics` — diagnosis results feed the metric tree; error categories become tracked quality metrics

---

## Output

`Work/evals/<feature>-error-journal.md`

One dated entry per session, accumulating over time. Each entry contains:
- Date and trace sample size
- Axial coding: categories proposed and refined
- Pivot table: count and percentage per category
- Three Gulfs diagnosis: gulf type for each top category
- Fix sequence: ordered list with cost tier and expected impact
- Next error analysis date
- Tags applied (if any)

---

## End every session with

- The single highest-frequency error category and the gulf type it maps to — that's the first fix
- The fix that will have the most impact before the next review (usually a prompt rewrite for a Specification gulf)
- If ≥100 labeled traces exist and judge not built: "You have enough labeled data to build an LLM judge. Run `/agentic-pm:build-judge`: one domain expert, one behavior, binary scoring — budget 1–2 days."
- The date for the next error analysis pass

---

## Completion status

Report exactly one of at close:
- **DONE** — error journal entry written, all quality checks passed, no tags propagated, next cadence date set
- **DONE_WITH_CONCERNS** — entry written but tags applied (list each); state what must be addressed before the next pass
- **BLOCKED** — cannot run error analysis; state what is missing (no traces, or fewer than 20 available)
- **NEEDS_CONTEXT** — PM ownership not established or feature not identified; ask directly before proceeding

Escalation: if the PM is not going to personally own the trace review, flag before producing artifacts. Delegating this to an engineer is the most common way AI quality practices fail.
