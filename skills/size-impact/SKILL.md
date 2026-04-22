---
name: size-impact
description: "Predict the impact of a specific feature before committing to build it. Produces a 4-step cascade (usage → engagement → top-line → bottom-line) with sensitivities, weakest-assumption flagged, and a de-risk plan. Not for defining metrics (use define-metrics) or diagnosing what already happened (use diagnose-metric / review-impact)."
allowed-tools: Read Grep Glob Write Edit
---

# Size-impact — Predict feature impact before building

Produces an impact-sizing model with ranges (not point estimates), the weakest assumption surfaced, and one cheap test to de-risk it. Feeds the Impact section of a PRD.

---

## Context to load

- `context/COMPANY.md`
- `context/GOALS.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan:**
- `Work/metrics/<product>-metric-tree.md` — locate the feature in the tree
- `Work/metrics/impact-sizing-journal.md` — prior sizings calibrate this one
- `Work/discovery/<product>-ost.md` — target opportunity informs eligible-user estimates
- `Work/validation/<feature>-assumption-map.md` — if present, riskiest assumptions are known

Report what you found.

---

## Frameworks this skill loads

- `frameworks/impact-sizing.md` — primary spine (4-step cascade)
- `frameworks/guardrail-metrics.md` — counter-metrics to include
- `frameworks/sean-ellis-test.md` — pre-PMF guard

Read before running.

---

## Speed-mode choice

> "Coach me through the sizing (15–30 min — we'll pressure-test each assumption) or draft-then-edit (5 min — I'll produce a cascade with assumptions flagged for you to replace)?"

Default to coach. Draft mode applies `speed-mode-used` tag.

---

## Discovery interview

Read context + upstream artifacts first. Push on these:

1. **"What decision does this sizing serve? Go/no-go, prioritization against another feature, or validating a leadership ask?"** — Changes the rigor needed. Go/no-go demands tight ranges; prioritization demands comparability; validating a leadership ask may already have the decision baked in.

2. **"What would you do differently if the number came back 2× higher or 2× lower than you expect?"** — If nothing changes, the sizing is theater. *(Impact Sizing: "if the answer doesn't change the decision, don't build the model.")*

3. **"Reading PRODUCTS.md, you're at [stage]. Are you pre-PMF? Formal sizing is premature — metrics move too fast."** *(Sean Ellis Test + Impact Sizing.)*

4. **"What's your first-principles estimate — eligible users × adoption × frequency × effect-size? Walk me through the chain before I help refine it."** — Forces the PM to own the reasoning; surfaces which step they're least confident about.

5. **"Historical correlation or first-principles? If historical — what analog feature are you benchmarking against, and how similar is it really?"** *(Impact Sizing: "first-principles preferred, historical correlation fallback.")*

6. **"What metric does this feed? Show me the path from this feature's engagement to the NSM or cycle goal — any break in the chain, the impact is imaginary."**

7. **"What could make the impact zero? Name the kill-shot assumption."** — The weakest assumption is where the sizing will die first; name it up front.

Interview until you can answer: What decision does this serve? Where is the weakest assumption? Is the metric chain real?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — decision served, feature in the tree, the PM's first-principles chain.
2. **"Here's the approach"** — Impact Sizing 4-step cascade; what data pulls (if any) would tighten the weakest step; scope of de-risk.
3. **"Here are my concerns"** — vanity metric target, pre-PMF trap, broken causal chain, overconfident point estimates.

Ask: **"Want to adjust before I start?"**

Do not produce any artifact until the PM confirms.

---

## Situation-triggered add-on blocks

- **Pre-PMF guard** — refuse to produce a sizing model; output a one-paragraph "why sizing is premature" note + recommendation to run Sean Ellis Test.
- **Analog comparison block** — when the PM cites a historical benchmark, add an explicit similarity analysis (segment / mechanism / distribution — are they actually comparable?).
- **Journal cross-reference block** — cite at least one prior entry from `impact-sizing-journal.md` for calibration; "we predicted X for feature Y; actual was Z."

---

## Step-by-step flow

1. **Discovery interview** (minimum 5 questions).
2. **Plan checkpoint.** Wait for PM confirmation.
3. **Locate the feature in the metric tree** — name the NSM or cycle goal it ladders to. No ladder → block.
4. **Estimate usage:** eligible users → exposed users → engaged users. Each with a range and the source (data pull, analog, or guess).
5. **Cascade impact:** engagement → top-line metric → bottom-line metric. Show each step's range and the assumption it carries.
6. **Identify the weakest assumption.** One assumption, not five. It's the one where a 2× error in your estimate breaks the case.
7. **Propose one de-risk test** — data pull, small experiment, or customer conversation — that would move the weakest assumption from "guess" to "evidence" in under a week.
8. **Append guardrail metrics** — what must not break while moving this feature's metric.
9. **Produce the model as a range, not a point estimate.** Best case / expected / worst case, with the assumption that drives each.
10. **Self-validate** against the quality bar. Fix / flag.
11. **Write the artifact** at `Work/metrics/<feature>-impact-sizing.md` AND append a one-paragraph entry to `Work/metrics/impact-sizing-journal.md` (so future sizings calibrate against this one).

---

## Quality bar

- [ ] Feature located in the metric tree with unbroken causal chain — *Metric Trees*
- [ ] First-principles model preferred; historical correlation only as fallback with explicit analog — *Impact Sizing*
- [ ] Output is a range, not a point estimate — *Impact Sizing: "sensitivities / ranges, not point estimates"*
- [ ] Weakest assumption named explicitly — *Impact Sizing: "de-risk weakest assumption, don't refine whole model"*
- [ ] One specific de-risk test proposed (data pull / experiment / conversation) with a timeline — *Impact Sizing*
- [ ] Guardrail metrics named — *Guardrail Metrics*
- [ ] Pre-PMF guard honored: no sizing at pre-PMF — *Impact Sizing*
- [ ] Journal entry appended for future calibration — *Impact Sizing: "institutional memory over 12+ months"*

---

## Tag propagation

- `impact-unsized` — PM declined the sizing when PRD Stage 2 demands it
- `causal-chain-broken` — feature doesn't ladder to any NSM / cycle goal
- `weakest-assumption-unflagged` — PM unwilling to name a single weakest assumption
- `pre-pmf-premature-measurement` — sizing attempted pre-PMF despite guard
- `speed-mode-used`

---

## Handoffs

- **Upstream:** `/agentic-pm:define-metrics` (the tree and NSM this sizes against); `/agentic-pm:map-risks` (already-identified assumptions)
- **Downstream:** `/agentic-pm:compile-prd` (sizing goes into PRD Impact section); `/agentic-pm:map-risks` (weakest assumption becomes a validation candidate); `/agentic-pm:review-impact` (post-launch: compare actual to this sizing)

---

## Output

- `Work/metrics/<feature>-impact-sizing.md` — the model
- `Work/metrics/impact-sizing-journal.md` — one-paragraph entry appended (cumulative calibration)

---

## End every session with

- The single weakest assumption and the one-week de-risk test.
- The reminder: "File this to your institutional memory — after 12 months of entries, the journal becomes your calibration baseline."

---

## Completion status

- **DONE** — model written, journal entry appended, all checks passed, no tags
- **DONE_WITH_CONCERNS** — tags applied (list each)
- **BLOCKED** — pre-PMF guard tripped, or no metric tree to ladder against; name what's needed
- **NEEDS_CONTEXT** — feature description too vague to size; ask for the specific mechanism that will move users

Escalation: if the PM cannot name what decision this sizing serves, stop. A sizing that doesn't change a decision is arithmetic without a destination.
