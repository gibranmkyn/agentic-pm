---
name: compile-problem-statement
description: Terminal playbook for coach-problem-framing. Compiles all upstream phase outputs into a PR-FAQ-style problem statement artifact at .agentic-pm/framing/<feature>-problem-statement.md. Writing is the thinking discipline — if the framing cannot be written as one paragraph a stakeholder could disagree with on the merits, the framing is not done. Loaded by the coach, not invoked directly.
---

# Compile Problem Statement — Writing as Thinking

## Use case

This playbook is for the PM who has completed upstream framing phases and is ready to crystallize the work into a canonical, written artifact. The discipline: writing forces clarity that whiteboarding and conversation do not. A framing that cannot survive the writing is a framing that is not done.

The artifact is a PR-FAQ-style problem statement — not a press release for a solution, but a press release for the problem itself. A skeptical stakeholder should be able to read it and disagree with it on the merits.

---

## Locate

Read `./CLAUDE.md`, `./.agentic-pm/session.md`, and all prior framing artifacts for this feature. Confirm these five upstream artifacts exist: `<feature>-signal-triage.md`, `<feature>-interview-snapshots.md`, `<feature>-diagnosis.md`, `<feature>-sharpness.md`, `<feature>-three-framings.md`. If any is missing, name the specific phase to revisit and stop — the problem statement will inherit the gap and obscure it. If all five are present, confirm the feature slug and proceed.

---

## Sub-steps

### 1. Lock the one-sentence claim

Before drafting, name the discipline: "We are applying the PR FAQ approach — writing is a thinking discipline. You cannot hide in prose the way you can in bullets."

Ask: **"What is the core claim of your framing in one sentence? Named user role, named behavior or gap, named cost."**

Push for: specificity sufficient to be wrong. Not "users have trouble with X" — "Users who do X in context Y are doing Z-workaround at a cost of W, and no adequate substitute exists."

Flag if the PM's answer names a solution ("users need a better X") — walk it back. This claim is the spine of the opening paragraph. Do not move forward until it is specific enough to disagree with.

### 2. Draft the opening paragraph

The opening paragraph is the core of the artifact. It must name: the affected user (role + context), the problem in plain language, the cost of the problem today, and what becomes possible if it is solved. **No solution named — not even a category.**

Ask: **"Read me the opening paragraph you would show to a skeptical VP. One paragraph. Plain language."**

Push for the writing itself, not a description of what it will say. Five sentences or fewer — if it cannot be stated in five sentences, the framing is not resolved.

Flag if: the paragraph names a solution or mechanism; the cost is stated as an emotion rather than a behavior; the change-if-solved sentence names a feature rather than an outcome.

**Probabilistic outcomes:** if the outcome is probabilistic rather than deterministic (the benefit is a better-than-chance improvement, not a guaranteed result), the opening paragraph must name the baseline and the directional claim — not assert certainty. Tag the artifact `probabilistic-outcome` if this applies.

### 3. Compile the artifact body from upstream artifacts

Pull sections directly from the upstream artifacts. For each section, ask the PM to confirm the content holds — do not re-interview.

**Evidence section:** Ask for the two or three most powerful behavioral quotes. Push for Layer-3 causal-reality quotes — a user describing a specific past behavior and its consequence, not a preference or hypothetical. Flag any evidence that is Layer 1 (stated want) or Layer 2 (general frustration); name missing volume data as an open assumption.

**Diagnosis section:** Pull from `<feature>-diagnosis.md`. Confirm the crux — the single pivotal difficulty, not a list of symptoms. Flag if the diagnosis section restates the problem rather than explaining the structural condition that causes it.

**Sharpness section:** Pull the three test results from `<feature>-sharpness.md`. Confirm each result has supporting evidence behind it, not just an assertion. If all three tests fail, name this directly before continuing.

### 4. Document the three framings considered

Pull from `<feature>-three-framings.md`. Confirm the chosen framing and both alternatives are named with a one-sentence statement each.

Ask: **"What evidence or reasoning tilted toward the winning framing over the other two?"**

Push for honest rationale: if tractability drove the choice rather than evidence strength, flag it as an open assumption. The losing framings must be specific enough that a future team could revisit them — dismissive summaries are not enough.

Flag if fewer than three framings are present — send the PM back to `frame-three-ways.md`.

### 5. Name open assumptions

Ask: **"What does the framing depend on being true? What evidence would break it?"**

Pull forward any gaps flagged in prior sub-steps — thin volume data, Layer 1/2 evidence, sharpness tests without behavioral backing. Each becomes a named open assumption with: what the assumption is, what would falsify it, and whether it is testable.

Flag if the PM claims no open assumptions — every framing rests on assumptions; naming none signals absence of scrutiny, not rigor.

### 6. Self-validate, then run the adversarial review

**Self-validate first.** Run every quality bar check against the draft. Fix what you can; flag what you cannot with the framework concept.

**Then dispatch a reviewer subagent in fresh context.** The reviewer receives only the draft artifact — no prior conversation, no coaching context. Score on five dimensions: Completeness (all sections present), Evidence-grounding (opening claims traceable to behavioral evidence), Clarity (a reader with no prior context could disagree on the merits), Scope (no solution named anywhere), Actionability (a stakeholder could act on this).

The reviewer returns binary pass/fail per dimension with a one-sentence rationale for any fail. Cap at three iterations. After three, persist unresolved concerns in the `Reviewer Concerns` section and mark them explicitly — the PM decides whether to resolve or accept.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Opening paragraph passes the disagree-on-merits test: named user, named cost, named outcome, no solution | PR FAQ: "describe customer benefits in plain language, not internal goals or technical capabilities" |
| All evidence is Layer-3 causal-reality evidence from behavioral interviews | Continuous Discovery Habits: "Layer 3 (causal reality)" — the layer that follows the causal thread past stated preference |
| Probabilistic-outcome flag applied and baseline named if the outcome is non-deterministic | PR FAQ for probabilistic outcomes: name the baseline and directional claim, not a certainty |
| No solution, mechanism, or technical category appears anywhere in the artifact | Working Backwards: the artifact is a problem statement, not a product brief |
| Adversarial review completed; unresolved concerns persisted as Reviewer Concerns | Builder-Validator Protocol: "don't hand over unchecked work" |

---

## Tag propagation

- Evidence is Layer 1 or Layer 2 only → `evidence-shallow`
- Opening paragraph contains a solution or mechanism → `solution-contaminated`
- Fewer than three framings present → `framing-divergence-skipped`
- Any sharpness test asserted without behavioral evidence → `sharpness-ungrounded`
- Open assumptions section is empty → `assumptions-unexamined`
- Outcome is probabilistic, not flagged → `probabilistic-outcome-unmarked`
- Upstream artifact missing at compile time → `upstream-gap`
- Reviewer concerns unresolved after three iterations → `reviewer-concerns-open`

---

## Output

`.agentic-pm/framing/<feature>-problem-statement.md`

If a prior version exists for the same feature, add a `Supersedes:` field in the frontmatter referencing the prior file.

---

## Artifact template

```markdown
---
feature: <feature-slug>
status: draft | validated | framing-unvalidated
supersedes: (prior version filename, if applicable)
date: YYYY-MM-DD
tags: (propagated from quality bar failures, if any)
---

# Problem Statement: <Feature Name>

## Opening paragraph

<One paragraph, five sentences or fewer. Named user + named problem + named cost + named outcome.
No solution named. Written in plain language a skeptical stakeholder could disagree with on the merits.
If the outcome is probabilistic, name the baseline and the directional claim — do not assert certainty.>

## Affected user

- **Role:** <specific role — not "user" or "customer" but a named role with context>
- **Context:** <when and where they encounter this problem>
- **Frequency:** <how often this occurs for this user>

## Evidence

<Behavioral evidence only. Layer-3 causal-reality quotes from interviews — quotes where the user
described a specific past behavior and its consequence. No stated preferences.>

### Interview quotes

> "<Quote from user describing specific past behavior and consequence — dated, role noted>"

> "<Quote from user describing specific past behavior and consequence — dated, role noted>"

### Volume and frequency

<Numbers if available. Approximate count if not. If volume is unknown, state that explicitly
— it will appear in open assumptions.>

## Diagnosis

**What is going on:**
<Structural explanation of why the problem exists. Not a restatement of the symptom.>

**What makes it hard:**
<Why the existing workaround or alternative has not fixed it. What structural condition creates the constraint.>

**The crux:**
<The single pivotal difficulty — the thing that, if solved, makes the rest tractable.>

## Sharpness

| Test | Result | Evidence |
|---|---|---|
| Workflow compression | Pass / Fail | <Observation or quote that backs the result> |
| Recession test | Pass / Fail | <Observation or quote that backs the result> |
| Status quo inadequacy | Pass / Fail | <Observation or quote that backs the result> |

## Three framings considered

### Chosen framing: <name>

<One-sentence statement of the chosen framing.>

Rationale for choosing: <What evidence or reasoning tilted toward this framing over the alternatives.>

### Alternative 1: <name>

<One-sentence statement.>

Why it lost: <What evidence or reasoning tilted against it. Specific enough to revisit if the chosen framing proves wrong.>

### Alternative 2: <name>

<One-sentence statement.>

Why it lost: <What evidence or reasoning tilted against it. Specific enough to revisit if the chosen framing proves wrong.>

## Open assumptions

| Assumption | What would falsify it | Testable? |
|---|---|---|
| <Specific claim the framing depends on being true> | <Evidence that would break it> | Yes / No — <how> |
| <Specific claim the framing depends on being true> | <Evidence that would break it> | Yes / No — <how> |

## Handoff target

TBD — pending `route-the-handoff.md`

## Reviewer concerns

<Populated only if adversarial review loop produced unresolved findings after three iterations.
Each concern: dimension name + one-sentence description + why it was not resolved.>
```

---

## Handoffs

- **Comes from:** `frame-three-ways.md` — after three framings have been evaluated and a winning framing selected.
- **Routes to (offer, not auto-chain):** `route-the-handoff.md` — immediately after the artifact is validated.

End every compile session with:
1. The artifact path and the tags applied.
2. Any Reviewer Concerns that remain unresolved and what it would take to resolve them.
3. A single concrete next action: run `route-the-handoff.md`, or — if upstream gaps were found — the specific phase to revisit and why.
