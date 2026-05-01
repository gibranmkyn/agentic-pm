---
name: review-impact
description: Use this playbook for a periodic (quarterly) check on a shipped AI feature's actual impact against predicted impact — not a milestone, a recurring calibration loop. Loaded by the coach skill, not invoked directly.
---

# Review Impact

Closes the loop on a shipped AI feature. Compares actual impact to the sizing, explains the delta, names the next decision. Feeds the calibration journal and informs the invest / maintain / kill call.

**This is a quarterly check, not a milestone.** Per Justin Farris / GitLab: iteration is the permanent state for AI features. There is no "done" phase where impact review replaces iteration. Review impact runs on a cadence while the iterate-feature loop runs continuously.

---

## Locate

Before walking the playbook, ask the PM:

1. What feature are you reviewing, and how long has it been live? (Metrics typically need 2–4 weeks post-launch to stabilize; some need a full cycle.)
2. What did you predict in the sizing? Bring the range — best case, expected, worst case. If no sizing exists, flag `no-baseline` — the review can still happen but calibration is weaker.
3. What happened in the Capability Funnel? Which stages are passing cleanly and where are failures concentrating?

Also check `.agentic-pm/` for upstream artifacts: the feature PRD (`.agentic-pm/prds/<feature>-prd.md`), impact sizing (`.agentic-pm/metrics/<feature>-impact-sizing.md`), and error journal (`.agentic-pm/evals/<feature>-error-journal.md`).

**MCP awareness:** If an eval-platform MCP and a production data MCP are configured, use them to pull the predicted-vs-actual comparison directly: eval scores from the eval platform, business metrics from production. If neither is available, guide the PM through manual data pull — paste the eval distribution at predicted-impact-time vs. now, paste the business metric trend over the period. The calibration journal entry is the same artifact either way; the MCP path makes this a 5-minute query, not a 30-minute scavenger hunt.

---

## Framing: Capability Funnel, not feature count

**Count experiments, not features.** (Bryan Bischof / Capability Funnel)

The right unit of AI product progress is the experiment, not the shipped feature. A team that shipped 3 features but ran 12 experiments against the capability funnel is learning faster than a team that shipped 8 features without structured eval. Review impact through the funnel lens:

1. Map the capability funnel for this feature — the ordered stages the AI must pass to deliver user value.
2. Identify which funnel stage is the current bottleneck.
3. Count experiments against that bottleneck, not feature releases.

This reframe matters for stakeholder conversations: "At the end of this quarter, if we reach funnel level 4, we double down. If not, we pivot." Clear decision point; honest framing about AI uncertainty.

---

## Step-by-step

### Step 1 — Verify metric stability

Is the primary metric stable or still trending? Reviewing too early produces noise. Acknowledge instability explicitly if the PM insists on reviewing before stabilization — tag `metric-unstable` and proceed with caveats.

### Step 2 — Plan vs actual table

Write it plainly:

| Metric | Predicted range | Actual | Delta | Direction |
|---|---|---|---|---|
| Primary metric | | | | beat / miss / within range |
| Guardrail 1 | | | | |
| Guardrail 2 | | | | |

Require data sources, not opinion. "It feels like" is not a review input. Push: "What dashboard, experiment readout, or query confirms this?"

### Step 3 — Check guardrail metrics

Primary metric without guardrails is half a story. A feature that moved the primary metric 2× while tanking a guardrail 5× is a net loss. Check what else moved — expected and unexpected.

### Step 4 — Delta diagnosis

For each significant delta (>20% off predicted), name:
- Which step in the cascade broke — adoption? engagement? conversion? Which funnel stage?
- Why — evidence-backed causal claim, not narrative
- Whether this is a **prediction error** (the model was wrong) or an **execution gap** (the model was right, the launch under-delivered) — different fix, different lesson

### Step 5 — Unexpected moves

What shifted that wasn't planned? Good surprises count too — understand them, don't just celebrate. Unplanned upside that can't be explained won't replicate.

### Step 6 — Next-decision recommendation

Name exactly one of:
- **Invest** — double down; evidence supports accelerated iteration
- **Maintain** — continue current iteration pace; feature is stable, not breakthrough
- **Kill** — evidence doesn't support continued investment; redirect capacity

Name the specific flip trigger — the finding that would change the decision. A review without a decision is a retro nobody acts on.

### Step 7 — Calibration note

Append one sentence to `.agentic-pm/metrics/impact-sizing-journal.md`:

> "We predicted X for feature Y; actual was Z; the prediction [held / was high / was low] because [cause]."

This is institutional memory. It makes the next sizing better.

---

## Quality bar

- [ ] Primary metric is stable, or instability explicitly acknowledged — *Impact Sizing: "give the metric time to settle"*
- [ ] Plan vs actual shown with data source, not opinion — *Metric Trees: "causal claims validated with data"*
- [ ] Guardrail metrics checked alongside primary — *Guardrail Metrics*
- [ ] Delta diagnosis names which funnel stage broke — *Capability Funnel (Bischof)*
- [ ] Prediction-error vs execution-gap distinction made — *Impact Sizing: calibration over time*
- [ ] Causal claim has evidence, not narrative — *Metric Trees*
- [ ] Next decision named (invest / maintain / kill) with a specific flip trigger — *Impact Sizing*
- [ ] Journal entry appended for future calibration — *Impact Sizing: "institutional memory accumulates calibration"*

---

## Tag propagation

- `metric-unstable` — reviewed before the metric stabilized
- `no-baseline` — no prior sizing to compare against; calibration weakened
- `guardrails-unchecked` — primary metric reviewed without checking counter-metrics
- `post-hoc-rationalization` — causal claim has no specific evidence behind it
- `next-decision-missing` — review written without naming the next decision

---

## Output

- `.agentic-pm/impact/YYYY-MM-DD-<feature>-impact.md` — the review
- `.agentic-pm/metrics/impact-sizing-journal.md` — one-sentence calibration entry appended
- (If PRD exists) append Stage 5 Impact Review section to `.agentic-pm/prds/<feature>-prd.md`

---

## End every session with

- The next decision named explicitly — invest, maintain, or kill — with the trigger that would flip it.
- One calibration lesson for the journal: "Next time we size a feature like this, we should [adjust X]."

---

## Handoffs

- **Comes from:** `compile-ai-prd.md` (Stage 5 slot in the PRD lifecycle); iteration cadence (reviewed quarterly, not at a milestone).
- **Leads to (offer, not auto-chain):** `error-analysis.md` — if quality or error issues explain the delta; `validate-feasibility.md` — if the next step is a follow-on feature that needs risk-ranking.
