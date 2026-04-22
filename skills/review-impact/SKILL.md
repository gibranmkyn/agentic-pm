---
name: review-impact
description: "Review a shipped feature's actual impact against its predicted impact. Produces a Stage-5 impact review: planned vs actual, causal explanation, and the next decision (double-down / iterate / kill). Use after a feature has been live long enough for the primary metric to stabilize. Not for diagnosing an unexpected metric move unrelated to a launch (use diagnose-metric)."
allowed-tools: Read Grep Glob Write Edit
---

# Review-impact — Did the bet pay off?

Closes the loop on a shipped feature. Compares actual impact to the sizing, explains the delta, names the next decision. Feeds PRD Stage 5 and the institutional calibration journal.

---

## Context to load

- `context/COMPANY.md`
- `context/GOALS.md`
- `context/PRODUCTS.md`

If any are template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan:**
- `Work/prds/<feature>-prd.md` — the PRD that planned this launch
- `Work/metrics/<feature>-impact-sizing.md` — the predicted model
- `Work/metrics/impact-sizing-journal.md` — for calibration context
- `Work/evals/<feature>-error-journal.md` — (AI features) for quality context
- `Work/decisions/` — any prior launch decisions worth referencing

Report what you found; if no upstream PRD or sizing exists, flag it — the review can still happen but calibration is weaker.

---

## Frameworks this skill loads

- `frameworks/impact-sizing.md` — for plan-vs-actual reasoning and journal calibration
- `frameworks/metric-trees.md` — to isolate where in the tree the delta sits
- `frameworks/guardrail-metrics.md` — to check what else moved

Read before running.

---

## Speed-mode choice

> "Coach me through the review (30–45 min — we'll pressure-test causal claims and genuinely learn) or draft-then-edit (10 min — I'll produce a plan-vs-actual summary for you to flesh out)?"

Default to coach. Draft mode applies `speed-mode-used`.

---

## Discovery interview

Read context + upstream artifacts first. Push on these:

1. **"How long has the feature been live? Is the primary metric stable yet, or still trending?"** — Reviewing too early produces noise. Most features need ≥2–4 weeks post-launch before the metric stabilizes; some need a full cycle.

2. **"What did you predict in the sizing? Bring the range — best case, expected, worst case."** — If no sizing exists, flag `no-baseline` and proceed; the review still has value but calibration suffers.

3. **"What actually happened? Give me the number and the source — dashboard, experiment readout, or gut?"** — Push on data quality. "It feels like" is not a review input.

4. **"Did the guardrail metrics hold? What else moved — expected and unexpected?"** — Impact without guardrails is half a story. A feature that moved the primary metric 2× while tanking a guardrail 5× is a net loss.

5. **"If the delta between predicted and actual is large — be honest, was the prediction wrong or is the execution wrong?"** — Two different lessons. Bad prediction means recalibrate the sizing method. Bad execution means the model was right, the launch under-delivered. Different fix.

6. **"What do you believe caused the result — and what's the evidence? Not 'we think' — what specific signal tells you the cause?"** — Separates causal claims from storytelling. Most post-launch narratives are post-hoc rationalization.

7. **"Given what actually happened: double down, iterate, or kill? Name the decision and the trigger that would flip it."** — The review is pointless without a next decision.

Interview until you can answer: Is the metric stable? Plan vs actual with source? Guardrails held? Causal evidence? Next decision named?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — time since launch, metric stability, plan-vs-actual headline, guardrails status.
2. **"Here's the approach"** — frame the review around the delta (if any); the causal hypothesis the PM holds; the next-decision options.
3. **"Here are my concerns"** — metric not yet stable, no baseline sizing, guardrails not checked, post-hoc rationalization risk.

Ask: **"Want to adjust before I start?"**

Do not produce the review until the PM confirms.

---

## Step-by-step flow

1. **Discovery interview** (minimum 5 questions).
2. **Plan checkpoint.** Wait for PM confirmation.
3. **Plan vs actual table.** Write it plainly:
   - Predicted range (from sizing) | Actual | Delta | Delta direction (beat / miss / within range)
   - Primary metric + each guardrail
4. **Delta diagnosis.** For each significant delta (>20% off predicted), name:
   - *Which* step in the cascade broke — adoption? engagement? conversion?
   - *Why* — evidence-backed causal claim, not narrative
   - *Prediction error vs execution gap* — name which one
5. **Unexpected moves.** What shifted that wasn't planned? Good surprises count too — understand them, don't just celebrate.
6. **Next-decision recommendation.** Double down / iterate / kill — with one trigger that would flip it.
7. **Calibration note.** What does this result teach about our sizing method? Append one sentence to `Work/metrics/impact-sizing-journal.md`: "We predicted X for feature Y; actual was Z; the prediction [held / was high / was low] because [cause]."
8. **Self-validate** against the quality bar.
9. **Write the review** at `Work/impact/YYYY-MM-DD-<feature>-impact.md`. Also append PRD Stage 5 section if the PRD exists.

---

## Quality bar

- [ ] Primary metric is stable (not still trending) or the instability is explicitly acknowledged — *Impact Sizing: "give the metric time to settle"*
- [ ] Plan vs actual shown with data source, not opinion — *Metric Trees: "causal claims validated with data"*
- [ ] Guardrail metrics checked alongside primary — *Guardrail Metrics*
- [ ] Delta diagnosis names which cascade step broke — *Impact Sizing: step-by-step cascade*
- [ ] Prediction-error vs execution-gap distinction made — *Impact Sizing: calibration over time*
- [ ] Causal claim has evidence, not narrative — *Metric Trees*
- [ ] Next decision named (double down / iterate / kill) with a specific flip trigger — *Impact Sizing: "institutional memory accumulates calibration"*
- [ ] Journal entry appended for future calibration — *Impact Sizing*

---

## Tag propagation

- `metric-unstable` — reviewed before the metric stabilized
- `no-baseline` — no prior sizing to compare against; calibration weakened
- `guardrails-unchecked` — primary metric reviewed without checking counter-metrics
- `post-hoc-rationalization` — causal claim has no specific evidence behind it
- `next-decision-missing` — review written without naming the next decision
- `speed-mode-used`

---

## Handoffs

- **Upstream:** `/agentic-pm:compile-prd` (Stage 5 slot); `/agentic-pm:size-impact` (the predicted model)
- **Downstream (offer, not auto-chain):**
  - `/agentic-pm:diagnose-metric` — if the delta is large and cause is not yet clear
  - `/agentic-pm:diagnose-ai` — (AI features) if quality/error issues explain the delta
  - `/agentic-pm:document-decision` — formalize the double-down / iterate / kill call
  - `/agentic-pm:map-risks` — if the next step is a follow-on feature that needs risk-ranking

---

## Output

- `Work/impact/YYYY-MM-DD-<feature>-impact.md` — the review
- `Work/metrics/impact-sizing-journal.md` — one-sentence calibration entry appended
- (If PRD exists) append Stage 5 Impact Review section to `Work/prds/<feature>-prd.md`

---

## End every session with

- The next decision named explicitly — double down, iterate, or kill — with the trigger that would flip it.
- One calibration lesson for the journal: "Next time we size a feature like this, we should [adjust X]."

---

## Completion status

- **DONE** — review written, journal appended, next decision named, all checks passed
- **DONE_WITH_CONCERNS** — tags applied (list each)
- **BLOCKED** — metric not yet stable and PM insists on reviewing; state the risk and stop
- **NEEDS_CONTEXT** — no feature identified or no way to measure actual impact; ask directly

Escalation: if the review produces no next-decision recommendation, flag `next-decision-missing` — a review without a decision is a retro nobody acts on.
