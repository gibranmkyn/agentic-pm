---
name: route-the-handoff
description: Use this playbook when the problem statement has been compiled and the PM needs to name the right downstream coach. Loaded by coach-problem-framing, not invoked directly.
---

# Route-the-Handoff — From compiled problem statement to named downstream coach

## Use case

This playbook is for the PM who has a compiled problem statement and now needs to decide where the framing goes next. The job is to run three routing checks and name the downstream coach honestly, even if that name is disappointing. The routing decision is owned by the PM; this playbook surfaces the evidence that makes the right choice legible.

This is the final phase of the problem-framing arc. It is not a summary phase. It is an active test phase.

### Precondition: a compiled problem statement exists

This playbook assumes `compile-problem-statement` has produced a `.agentic-pm/framing/<feature>-problem-statement.md` artifact. If no compiled statement exists, stop here and route back. Running the routing tests without a written artifact is guesswork dressed as analysis.

---

## Locate

Before walking the playbook, ask:

1. **"Is there a compiled problem statement at `.agentic-pm/framing/<feature>-problem-statement.md`?"** — read it before proceeding. If it does not exist, route back to `compile-problem-statement.md`.
2. **"Is the supporting evidence section populated — behavioral stories, quantified gap, named crux?"** — if the evidence cells are thin, flag the fieldwork gap before running the routing tests.
3. **"Has any prior session already run these tests on this feature?"** — if yes, read `.agentic-pm/session.md` first.

---

## Spine

Three checks, one named handoff, one re-entry trigger. Checks run in order: the fieldwork-gap check is a short-circuit — if it fires, the others do not run yet.

---

## Sub-steps

### 1. Fieldwork-gap check — is the framing strong enough to act on?

Run this first. A framing built on thin evidence will route to the wrong downstream and waste the next team sprint.

Ask: **"Walk me through the supporting evidence section of the problem statement. Which cells are grounded in observation or data, and which are still hypothesis?"**

Push for: a named count. "Three behavioral stories from this quarter, one quantified gap, one confirmed crux." Not "we did some research."

Flag if missing:
- The behavioral evidence section cites survey responses or secondhand summaries only.
- The quantified gap is missing a comparison baseline — "users struggle" without a rate or delta.
- The crux was named but never tested — it is the team's assumption, not a confirmed finding.
- More than half the evidence cells are tagged as hypothesis.

If any of these surface: stop the routing tests. The handoff is back to `listen-behaviorally.md` for targeted fieldwork. Name the exact gap. Do not proceed to check 2 until this passes.

### 2. Computational-vs-learning test — is this actually an AI problem?

This is the load-bearing gate for the AI routing branch. Most "AI feature" requests fail it.

Ask: **"Can this problem be expressed as explicit logic in code? Given the same input, is the correct output always the same — deterministic and encodable?"**

Push for: a concrete answer about this specific problem, not a general answer about AI. Walk the PM through both sides:
- "Could you write a rule: IF [condition] THEN [output]? If yes — for every case, not just the easy ones — this is a computational problem."
- "Does the correct answer require judgment, taste, context, or inference from ambiguous inputs? Does the same input legitimately produce different correct outputs for different users? If yes — this is a learning problem."

Flag the named anti-pattern explicitly if it surfaces: teams take the cool technology and pursue a problem to fit it, rather than starting with the problem. If the PM arrived here with "we should add AI" and the problem turns out to be computational, name it directly. That is a valid outcome.

**If computational:** the handoff is the non-AI scoping path. The framing is complete. The PM proceeds outside this plugin. Update the problem statement's `Handoff target` section and close the session.

**If learning problem:** proceed to check 3 — a learning problem is necessary but not sufficient for `coach-ai-product`. The correct order is identify the learning problem first, then design the AI system.

### 3. Non-feature framings — is this really feature work?

Three quick judgment checks. Each is a single gate; if one fires, the handoff is named and the session closes.

- **Strategy gap:** Are multiple company-level goals fighting each other in the framing, with no resolution the PM owns? → Route to `coach-strategy` (not yet built). Document in `Handoff target`: "Resolve the company-level diagnosis before scoping a feature." PM proceeds outside the plugin.
- **Decisions gap:** Is the core of this framing an irreversible commitment — a build-vs-buy choice, an architectural bet, a market entry — rather than a reversible product decision? → Route to `coach-decisions` (not yet built). Document in `Handoff target`: "Name and make the one-way-door decision before scoping a feature." PM proceeds outside the plugin.
- **Measurement gap:** Can the PM name a specific, measurable metric with a baseline that already exists? If not — no metric, or metric exists in theory but has never been instrumented? → Route to `coach-metrics` (not yet built). Document in `Handoff target`: "Instrument the baseline metric before starting discovery." PM proceeds outside the plugin.

None of the sibling coaches are built yet; for all three, the PM proceeds outside the plugin until they ship.

If none of the three fire, proceed to step 4.

### 4. Name the handoff explicitly

All checks have cleared (or one has produced a routing outcome). Write the handoff.

Ask: **"Given the test results, which downstream does this framing point to? Say it out loud before we write it."**

Then write the `Handoff target` section into the problem statement artifact. The section must include:

1. **Named downstream** — one of: `coach-ai-product/discover-ai-feature`, non-AI scoping path, future `coach-strategy`, future `coach-decisions`, future `coach-metrics`, or back to `listen-behaviorally` (fieldwork loop).
2. **Routing rationale** — one sentence naming which check produced the result and why.
3. **Re-entry trigger** — the condition that should reopen `coach-problem-framing` on this feature.
4. **Session status** — one of: DONE / DONE_WITH_CONCERNS / BLOCKED / NEEDS_CONTEXT, with concerns or blockers named explicitly.

The handoff is named, never auto-invoked. The PM decides whether to start the next coach in a new session.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Fieldwork-gap check runs first; routing is blocked if evidence cells are majority-hypothesis | Hypothesis-Driven Problem Solving: "A dedicated diagnostic phase is an explicit period of bottom-up information gathering before committing." |
| Computational-vs-learning test applied to the specific problem, not AI in general | Computational vs. Learning Problems: "The solution cannot be expressed in code. You can only show examples and approximate the pattern — judgment, taste, nuance, inference from ambiguous inputs." |
| Anti-pattern named if the PM arrived with "we should add AI" and the problem is computational | Computational vs. Learning Problems: "Teams take the cool technology and pursue a problem to fit it, rather than starting with the problem." |
| Handoff target section names the downstream, the routing rationale, and the re-entry trigger | coach-problem-framing SKILL.md: "The handoff is named, not invoked. The PM decides whether the framing is strong enough to start solution work." |

---

## Output

This playbook does not produce a new file. It appends the `Handoff target` section to the existing artifact:

`.agentic-pm/framing/<feature>-problem-statement.md`

The appended section contains: named downstream, routing rationale, re-entry trigger, session status.

---

## Handoffs

- **`coach-ai-product/discover-ai-feature`** — when the computational-vs-learning test confirms a learning problem and the non-feature checks are clear.
- **Non-AI scoping path** — when the computational-vs-learning test confirms the problem is deterministic logic. Framing is complete; PM proceeds outside the plugin.
- **Future `coach-strategy` / `coach-decisions` / `coach-metrics`** — when one of the non-feature checks fires. None are built yet; PM proceeds outside the plugin.
- **Back to `listen-behaviorally.md`** — when the fieldwork-gap check fires. Fieldwork is the unblock, not more framework-walking.

End the session with one concrete action in the next 48 hours — either the first move in the named downstream coach, or the specific fieldwork that unblocks the routing if a gap fired.
