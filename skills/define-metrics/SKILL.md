---
name: define-metrics
description: "Define the metrics that measure success — NSM, metric tree, guardrails, and cycle goals. Use when you need a North Star for the product, a causal tree connecting work to outcomes, or the target goals for this cycle. Not for sizing a single feature (use size-impact) or diagnosing a moved metric (use diagnose-metric)."
allowed-tools: Read Grep Glob Write Edit
---

# Define-metrics — North Star, metric tree, and cycle goals

Produces the measurement foundation that other skills draw from. One of three output modes — NSM proposal, full metric tree, or cycle goals — autoselected from the PM's question.

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
- `Work/strategy/<product>-strategy.md` — strategy drives which metrics matter
- `Work/metrics/` — any existing NSM or metric tree work (extend, don't duplicate)
- `Work/metrics/<product>-metrics.md` — if present, check if the request is an update

Report what you found in the Plan checkpoint.

---

## Frameworks this skill loads

- `frameworks/north-star-metric.md` — NSM definition + validation
- `frameworks/hierarchy-of-engagement.md` — core action analysis for finding the right NSM
- `frameworks/metric-trees.md` — causal hierarchy
- `frameworks/guardrail-metrics.md` — counter-metrics
- `frameworks/nct-framework.md` — cycle-goal commitment-type logic
- `frameworks/sean-ellis-test.md` — pre-PMF diagnostic

Read the selected frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the metrics against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Read all 5 context files first — don't ask what you can read. The goal is to make sure this measurement serves a real decision and fits the product's stage.

Push on these (adapt, follow up on vague answers):

1. **"Are you measuring because you need to know, or because someone asked for a number?"** — Metrics without a decision attached become reporting theater. If "my VP asked," push: "What decision will your VP make with this number?"

2. **"What specific decision will this metric inform? Not 'we want to track it' — what will you do differently based on what it says?"** *(Impact Sizing: a metric without a decision is vanity by default.)*

3. **"Reading PRODUCTS.md, you're at [stage]. Are you pre-PMF? Because if so, formal metric work is premature — metrics move too fast."** *(Sean Ellis Test; Impact Sizing: "metrics move too fast at pre-PMF; focus on core user value.")*

4. **"Is the metric you want to track actually a vanity metric in disguise? What does it correlate with that you actually care about?"** *(NSM: "chasing revenue directly destroys the value that produces it.")*

5. **"Is this for the whole product (NSM), a specific outcome area (tree), or this cycle's commitment (goals)?"** — Surfaces which mode applies.

6. **"If cycle goals — what's the team's risk stage? Execution (known levers) or understanding (still figuring it out)?"** *(NCT Framework: metric targets at understanding-risk are playing with fire.)*

7. **"What's your team's current relationship with data? Do you have analytics access, or are you flying blind?"** — Teams without analytics can't validate causal claims; they need first-principles estimation and wider ranges.

Interview until you can answer: What decision does this serve? Is the stage right for formal measurement? NSM / tree / goals? Risk stage (if goals)?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — decision served, product stage, mode (NSM / tree / goals), risk stage if applicable.
2. **"Here's the approach"** — spine, what will and won't be in scope.
3. **"Here are my concerns"** — vanity-metric risk, pre-PMF trap, goals-without-strategy, missing analytics access.

Ask: **"Want to adjust before I start?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

| Signal | Mode | Spine |
|---|---|---|
| "What's our North Star?" / new product / NSM unclear | **NSM** | North Star + Hierarchy of Engagement (core action first; NSM = rate or volume of that action) |
| "How does our work trace to outcomes?" | **Tree** | Metric Trees (causal hierarchy, 3–4 levels, 3–5 branches, validate causal claims) |
| "What are we committing to this cycle?" | **Cycle goals** | NCT Framework (narrative + commitment + tasks, commitment type matched to risk stage) |
| Pre-PMF diagnostic trips | **Guard** | Sean Ellis Test; block formal metric work; focus on core user value |

---

## Situation-triggered add-on blocks

- **Guardrail metrics block** — always appended. Every primary metric gets a named counter-metric that must not break.
- **Pre-PMF guard** — when stage is pre-PMF, refuse to produce a full tree or sizing; produce a minimal NSM hypothesis + Sean Ellis Test plan; block deeper work.
- **OKRs-externally-NCTs-internally block** — cycle-goals mode, when leadership mandates OKRs but risk stage is understanding. Map each NCT commitment to an OKR key result.
- **Strategy-gap block** — if goals mode and no strategy doc exists, produce goals with explicit strategy-gap flag and capture implicit strategy in the narrative.

---

## Step-by-step flow

1. **Discovery interview** (minimum 5 questions; follow up on vague answers).
2. **Plan checkpoint** — reflect, propose approach, name concerns. Wait for PM confirmation.
3. **Detect mode** — state NSM / tree / goals in one line.
4. **NSM mode:**
   - Identify core action using retention-correlation analysis (or PM's best knowledge if no data)
   - Propose 2–3 NSM candidates
   - Validate each against the five NSM criteria (reflects value, predicts retention, actionable, singular, right lag)
   - Select the best; name what it rules out
   - Add guardrail metrics — what must not break while improving the NSM
5. **Tree mode:**
   - Start from NSM (build one first if missing)
   - Decompose into 3–5 top-level branches with named causal claims
   - Go ≤3–4 levels deep (stop when a leaf is something a team could directly influence)
   - Flag each causal claim as `validated` / `untested` / `assumed`
   - Add guardrails at key nodes
6. **Cycle goals mode:**
   - Anchor to strategy (from `Work/strategy/`) — if no strategy, flag and capture implicit strategy in the narrative
   - Determine format: OKRs (execution risk) or NCTs (understanding/dependency risk)
   - If NCTs: write narrative first (why, why now, strategy connection), then commitments (100% achievable — not stretch), then warm-start tasks
   - If OKRs: 2–3 key results per objective, measurable, time-bound
   - Name the singular most-important metric for the cycle
   - Add guardrail metrics
7. **Self-validate** against the quality bar. Fix what you can; flag what you can't with framework citations.
8. **Produce the artifact** at the path for this mode (see Output).

---

## Quality bar

- [ ] NSM reflects value delivery, not activity — *NSM: "chasing revenue directly destroys the value that produces it"*
- [ ] NSM is singular — *NSM: "having two NSMs means having none"*
- [ ] NSM tied to retention — *NSM: "if improving NSM doesn't improve retention, wrong metric"*
- [ ] Metric tree: causal claims validated or explicitly flagged — *Metric Trees: "the most important and most often skipped step"*
- [ ] Metric tree: ≤3–4 levels, 3–5 branches — *Metric Trees: "50+ nodes is unmanageable"*
- [ ] Goals tied to strategy (explicit reference in narrative) — *NCT: "the narrative ladders to strategy"*
- [ ] Goals commitment type matches risk stage — *NCT: "forcing metric targets at understanding-risk is playing with fire"*
- [ ] Goals: 100% commitment bar (NCTs), explicit pass/fail (OKRs) — *NCT: "the 70% stretch bar creates a zone of confusion"*
- [ ] Guardrail metrics named alongside primary metrics — *Guardrail Metrics*
- [ ] Vanity metrics flagged if present — *NSM + Metric Trees*
- [ ] Pre-PMF flag honored: no tree or formal sizing pre-PMF — *Impact Sizing / Sean Ellis*

---

## Tag propagation

- `guardrails-missing` — primary metric without counter-metric
- `causal-claims-unvalidated` — tree built on assumed causal claims
- `goals-strategy-gap` — goals produced without anchoring strategy doc
- `goals-premature-measurement` — metric-based goals at understanding-risk stage
- `pre-pmf-premature-measurement` — formal tree or sizing attempted pre-PMF
- `speed-mode-used` — draft-then-edit mode used; reasoning not pressure-tested

---

## Handoffs

- **Upstream:** `/agentic-pm:write-strategy` (strategy diagnosis drives which metrics matter); `/agentic-pm:map-opportunities` (target opportunity informs which sub-metrics to target)
- **Downstream (offer, not auto-chain):**
  - `/agentic-pm:size-impact` — to size a specific feature's predicted movement against these metrics
  - `/agentic-pm:compile-prd` — measurement plan is the PRD Metrics section
  - `/agentic-pm:plan-roadmap` — goals anchor the roadmap
  - `/agentic-pm:diagnose-metric` — when a metric unexpectedly moves

---

## Output

Paths by mode:
- **NSM:** `Work/metrics/<product>-nsm.md`
- **Metric tree:** `Work/metrics/<product>-metric-tree.md`
- **Cycle goals:** `Work/metrics/<team>-goals-YYYY-QN.md`

All modes also append to `Work/metrics/decisions-journal.md` — one entry per session (what was decided, what was ruled out).

---

## End every session with

- The singular metric that matters most at this altitude (NSM for product; KR for cycle).
- One action that validates or moves it in the next 2 weeks.
- The handoff offer that fits: size-impact / compile-prd / plan-roadmap.

---

## Completion status

- **DONE** — artifact written, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — artifact written but tags applied (list each)
- **BLOCKED** — pre-PMF guard tripped, or goals with no strategy and no implicit strategy surfaceable; state what signal would change that
- **NEEDS_CONTEXT** — mode unclear (NSM/tree/goals); ask directly

Escalation: if the PM cannot name what decision this measurement serves, stop. Metric without decision = vanity by default.
