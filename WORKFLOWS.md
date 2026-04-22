# agentic-pm workflow specs

> **v0.3 restructure (2026-04-22):** the skill set was refactored from 22 → 18 (+ 1 meta) using a layered model with compilation. **The current source of truth is each skill's `SKILL.md` file** (under `skills/<name>/SKILL.md`); the design narrative below this header is the v0.3 overview, and the legacy specs further down are kept for historical context.

## v0.3 — 18 skills, layered, with compilation

Skills group by *when* a PM invokes them and *what altitude* they work at.

### Layer 1 — Product context (periodic; feeds many PRDs)

| Skill | Use case | Spine |
|---|---|---|
| `write-strategy` | "I need a multi-quarter strategy I can defend" | Rumelt Kernel / Six Dimensions / Strategic Narrative |
| `map-opportunities` | "I have an outcome — which customer problems to pursue?" | Opportunity Solution Tree (OST) |
| `define-metrics` | "What's our NSM / metric tree / cycle goal?" | NSM + Hierarchy of Engagement / Metric Trees / NCT |
| `setup-voc` | "Build a continuous voice-of-customer program" | VoC program design |
| `plan-roadmap` | "What are we committing to this quarter, in what order?" | Roadmap Planning |

### Layer 2 — PRD + its deep-framework sections (per feature)

| Skill | Use case | Spine |
|---|---|---|
| `compile-prd` | "Compose a PRD or one-pager from the section artifacts" | Modern PRD Lifecycle (composer) |
| `size-impact` | "Is this feature worth building?" | Impact Sizing 4-step cascade |
| `map-risks` | "What could kill this and how do I cheaply test it?" | Four Product Risks + Riskiest Hypothesis Sequencing (absorbs prototype) |
| `write-rubric` | "Pre-launch AI feature — define what 'good' looks like" | Evaluation Rubric (Shukla) |
| `align-stakeholders` | "Who blocks this, what's their objection, how do I pre-align?" | Stakeholder Management |

### Layer 3 — Research (ad-hoc)

| Skill | Use case | Spine |
|---|---|---|
| `plan-research` | "I need research that changes a decision" | Decision-First Research |
| `synthesize-research` | "I have transcripts — what did we learn?" | JTBD Moesta / Ulwick ODI |

### Layer 4 — Post-launch

| Skill | Use case | Spine |
|---|---|---|
| `diagnose-ai` | "AI feature is failing — what's broken, what to fix first?" | Error Analysis + Three Gulfs |
| `diagnose-metric` | "Metric moved unexpectedly — why?" | Metric Trees decomposition |
| `build-judge` | "Scale judgment into an LLM judge" | Critique Shadowing + LLM Judge |
| `review-impact` | "We shipped X N weeks ago — did it work?" | Impact Sizing journal calibration |

### Standalone

| Skill | Use case | Spine |
|---|---|---|
| `document-decision` | "Document a decision so it doesn't get relitigated" | SPIDER + One/Two-Way Door + 5-Cause Diagnostic |
| `prioritize-backlog` | "Rank N items defensibly" | DRICE / ICE / LNO |

### Meta

| Skill | Use case |
|---|---|
| `setup-context` | "First run — populate COMPANY/GOALS/TEAM/PRODUCTS/CONSTRAINTS" |

## The compilation model

`compile-prd` is a composer, not an author. It scans `Work/` for the latest section artifacts produced by Layer 1 + Layer 2 skills, reports which are sharp vs. thin, and assembles at the requested fidelity.

The same content compiles at different depths:
- **Stage 1 (one-pager):** problem + metrics + evidence + next steps — ≤1 page
- **Stage 2 (kickoff):** + solution mock + impact sizing + guardrails
- **Stage 3 (full spec):** + edge cases + rollout + tracking + GTM + risks
- **Stage 4 (launch-ready):** verify all gates closed
- **Stage 5 (impact review):** link `review-impact` artifact

A pitch and a full PRD are the same artifact at different stages. Section skills are the source of truth; compile-prd just assembles. See [SKILL-PATTERN.md](SKILL-PATTERN.md) for the full Socratic + compilation pattern every skill follows.

## Renames from v0.2

| v0.2 | v0.3 |
|---|---|
| `product-strategy` | `write-strategy` |
| `opportunity` | `map-opportunities` |
| `assumptions` | `map-risks` (absorbs `prototype`) |
| `prd` | `compile-prd` (absorbs `one-pager`, `pitch`, `design-agent-system`) |
| `roadmap` | `plan-roadmap` |
| `stakeholder` | `align-stakeholders` |
| `decisions` | `document-decision` |
| `eval-plan` | `write-rubric` (post-launch mode moved to `diagnose-ai`) |
| `llm-judge` | `build-judge` |
| `voc-setup` | `setup-voc` |
| `start` | `setup-context` |
| `prioritize` | `prioritize-backlog` |
| `measure` | **split** → `define-metrics` (NSM + tree + goals) + `size-impact` (feature sizing) |
| `research` | **split** → `plan-research` + `synthesize-research` |
| `goals` | folded into `define-metrics` |
| `prototype` | folded into `map-risks` |
| `one-pager`, `pitch`, `design-agent-system` | folded into `compile-prd` |
| `daily`, `brainstorm` | dropped (utility / routing handled by Claude Code autoselect) |
| — (new) | `review-impact` (Stage 5 closure) |

---

## Legacy specs (v0.2 — historical)

Kept below for design history. Each individual `skills/<name>/SKILL.md` is the current source of truth. Cross-references and skill names below are pre-rename.

---

## 1. `/agentic-pm:product-strategy` — validated (2026-04-15)

**Use case (flexible scope):**
> "I need to write a strategy for [my product / my area / my company] and get buy-in on it."

Skill asks up-front: **scope** (area PM / product lead / CPO / founder), **audience** (team / leadership / board / external), **time horizon** (quarter / year / multi-year).

### Artifact: Strategy Doc with autoselected spine

| Scope signal | Spine | Wiki source |
|---|---|---|
| Founder / CPO / new product bet | Six Dimensions | `Six Dimensions of Product Strategy` (Sachin Rekhi / Deliberate Startup) |
| Product lead / area lead with existing traction | Rumelt Kernel | `Strategy Kernel` (Richard Rumelt) |
| Company-level / narrative-heavy / GTM-coupled | Strategic Narrative | `Strategic Narrative` (Andy Raskin) |

### Situation-triggered add-on blocks

- **Positioning block** (Dunford's 5 steps) — appended when audience is external or GTM-coupled
- **Portfolio block** (Feature Portfolio / TARS) — appended when scope is "existing mature product with many features"

Not always included. Skill decides per-request. Rationale: positioning is wasted effort on purely internal strategy; portfolio is nonsensical for brand-new products.

### Quality bar (wiki-grounded checks)

| Check | Source concept | Citation |
|---|---|---|
| Diagnosis is specific, not aspirational | `Strategy Kernel` | "Bad diagnosis: 'We're not growing fast enough.' Good diagnosis quantifies the gap" |
| Guiding policy has ≤3 bets / has focus | `Strategy Kernel` | "A list of 17 priorities is not a guiding policy — it has no focus" |
| Actions are verbs, not adjectives | `Strategy Kernel` | "Coherent actions… must be concrete — verbs, not adjectives" |
| Explicit trade-off named | `Strategy Kernel` | "'Grow and increase margins' — coherent actions force the resolution" |
| (Six Dimensions variant) All 6 dimensions present | `Six Dimensions of Product Strategy` | "Startups most often fail because they skip one or more dimensions — particularly growth and business model" |
| (Narrative variant) Paradigm shift before solution | `Strategic Narrative` | "The product arrives as the answer to the obstacles, not as the starting point" |

Skill cites the source concept when flagging a gap.

### Inputs from context system

- `COMPANY.md` → market, position, competitors
- `PRODUCTS.md` → stage (discovery / validation / growth), constraints
- `GOALS.md` → OKRs the strategy must serve
- `CONSTRAINTS.md` → tech/org/capital limits

### Output

`Work/strategy/YYYY-MM-DD-<product>-strategy.md`

### Open questions

- None for v0.1.

---

## 2. `/agentic-pm:opportunity` — validated (2026-04-15)

**Use case:**
> "I have a business outcome to move. I need to map the opportunity space, figure out which unmet needs to pursue, and pick a target."

Skill asks up-front: outcome metric (pulls from `GOALS.md`), context (B2C / B2B where buyer ≠ end user), interview input, existing tree (update vs. create).

### Artifact: Populated Opportunity Tree with a selected target

| Signal | Spine | Wiki source |
|---|---|---|
| Default / team uses "opportunity" language | **OST** (Outcome → Opportunities → Solutions → Assumption Tests) | `Opportunity Solution Tree` (Teresa Torres) |
| `GOALS.md` is OKR-shaped, or user passes `--use-okps` | **OKPS** (Objective → Key Result → Problem → Solution) | `OKPS Trees` (Aakash Gupta) |
| B2B with buyer ≠ end user | **Two trees** — one per persona | OST wiki entry |

### Sub-steps

1. Outcome anchoring (from `GOALS.md`)
2. Experience-moment decomposition (3–7 moments: trigger → in-task → outcome → post-task)
3. Opportunity surfacing from input (see tiered input pipeline below)
4. Tree population (flag solutions-in-disguise)
5. Target selection (rank by frequency × pain × proximity to outcome)
6. Handoff to `/agentic-pm:assumptions` or `/agentic-pm:prd`

### Tiered input pipeline (sharpness design — key decision)

Wiki constraints forcing this design:
- "AI summaries lose 20–40% of important detail" (`Continuous Discovery Habits`)
- "Opportunities must emerge from customer stories, not brainstorming" (`Opportunity Solution Tree`)

**Tier 1 — Raw transcripts accepted; skill processes into Torres's snapshot template first:**
For each transcript, produce: experience map (chronological), opportunities (unmet needs), quick facts (segment), **one verbatim salient quote (no paraphrase)**, misc insights.

**Tier 2 — Evidence-type tags on every opportunity:**
- `[story]` — behavioral, anchored in specific past event → primary
- `[opinion]` — stated preference, no behavioral anchor → flagged, used as signal only
- `[survey/top-of-mind]` — **rejected outright** with pointer to Torres's story excavation technique

**Tier 3 — AI-synthesis constraint:**
- Opportunities derived only from cross-transcript synthesis (no single behavioral anchor) tagged `[AI-synthesized]` and surfaced for human spot-check before tree placement.
- Tree with >X% `[AI-synthesized]` nodes gets "spot-check needed" banner.

**Tier 4 — Snapshots persist as durable artifacts:**
`Work/discovery/snapshots/YYYY-MM-DD-<participant-id>.md` — OST rebuilds incrementally from snapshots, 3–4 at a time (Torres's cadence rule). Other skills (`/agentic-pm:research`, `/agentic-pm:prd`) can consume these.

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Opportunities sourced from customer stories, not brainstorming | OST: "must emerge from customer stories" |
| No solutions placed without a parent opportunity | OST: "cannot place a solution… without first naming the opportunity above it" |
| 3–7 opportunity areas at top, not 20+ | OST: "Pick 3–7 areas; let the tree be incomplete at the edges" |
| ≥3 solutions per pursued opportunity | OST: "Force 3–5 solutions per opportunity before picking one" (one-idea funnel) |
| Each opportunity = customer experience moment, not capability gap | OST: "An opportunity is a customer experience moment, not a capability gap" |
| B2B: split buyer + end-user trees | OST: "separate product teams with separate OSTs" |

### Discovery-theater safeguard

`/agentic-pm:roadmap` requires a linked OST (from this skill) before generating. Enforces Torres's "discovery outputs must appear at decision points."

### Inputs from context system

- `GOALS.md` → outcome metric + OKR-shape detection (triggers OKPS)
- `PRODUCTS.md` → B2B/B2C flag, product stage
- `COMPANY.md` → ICP/segment context
- User-supplied: transcripts, VoC data, existing OST

### Output

`Work/discovery/<product>-ost.md` (tree) + `Work/discovery/snapshots/*.md` (durable evidence)

## 3. `/agentic-pm:assumptions` — validated (2026-04-15)

**Use case:**
> "I have an idea / solution / strategy. What assumptions does it depend on, which are riskiest, and what's the cheapest fastest validation for the top ones?"

Skill asks up-front: input scope (single solution / feature / strategy / early-stage product), handoff from upstream skill, AI feature flag.

### Artifact: Assumption Map with risk-ranked hypotheses + validation plan

| Signal | Spine | Wiki source |
|---|---|---|
| Default / feature-level | **Four Product Risks** + riskiest-first | `Four Product Risks` (Cagan) + `Riskiest Hypothesis Sequencing` (Rekhi) |
| AI feature / ML system | **Feasibility-First Inversion** → Prompt-as-MVP | `Feasibility-First Inversion` |
| Early-stage / new product bet | **Business Hypothesis Canvas** (8 dims, now/future/not-at-all) | `Business Hypothesis Canvas` (Balfour) |
| PMF-level new product | **Six Dimensions** → riskiest dimension | `Six Dimensions of Product Strategy` |

### Sub-steps

1. Ingest input (handoff from `/agentic-pm:opportunity` → **all 3–5 solutions per target opportunity**, to preserve OST compare-discipline)
2. Assumption enumeration grouped by risk type
3. Risk-rank (conviction × impact-if-wrong) → top-N per solution
4. Validation technique matched to risk type (not default MVP)
5. Falsifiable success signal per top-N (quantitative OR qualitative — both acceptable if falsifiable)
6. **Cross-solution comparison view** — ranked matrix of solutions × riskiest assumptions × cheapest validation cost — to help user choose which solution to pursue first

### Validation technique matrix

| Risk type | Techniques | Source |
|---|---|---|
| Value | Interviews, smoke test, pre-sales, MVP | Four Risks |
| Usability | Usability tests, prototype, heatmaps | Four Risks |
| Feasibility (AI) | **Prompt-as-MVP on 20–50 real inputs w/ binary pass/fail** | Feasibility-First Inversion |
| Feasibility (deterministic) | Tech assessment, low-fi prototype | Four Risks |
| Business model / pricing | Pre-sales, paid pilots, pricing experiments | Riskiest Hypothesis |
| Growth / acquisition | Paid channel tests, viral coefficient | Riskiest Hypothesis |
| Market size | Analog / anti-log analysis | Riskiest Hypothesis |
| Cross-cutting | Pre-mortem, smoke test, Wizard-of-Oz, war-gaming | Four Risks unconventional |

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Validation technique matched to risk type, not default MVP | Riskiest Hypothesis |
| AI features: Prompt-as-MVP **strongly recommended** before full map (respect user autonomy; flag + one explicit ask; if declined, output tagged `feasibility-unverified`) | Feasibility-First Inversion |
| Each top-N assumption has falsifiable success signal (quant or qual acceptable) | Riskiest Hypothesis |
| Flag: validating what you already believe | Riskiest Hypothesis |
| BHC spine: "not at all" bucket populated | Business Hypothesis Canvas |
| Four Risks spine: ≥1 assumption per risk type | Four Product Risks |

### Autonomy design (decided 2026-04-15)

User autonomy is a cross-cutting design principle for agentic-pm. Skills strongly recommend wiki-backed practices but do not refuse. Declined recommendations carry forward as tags on output artifacts (e.g., `feasibility-unverified`, `positioning-skipped`) so downstream skills can adjust behavior.

### Inputs

- Handoff from `/agentic-pm:opportunity` or `/agentic-pm:product-strategy`
- Or user-provided idea
- `PRODUCTS.md` → AI flag, stage
- `CONSTRAINTS.md` → validation feasibility

### Output

`Work/validation/<feature>-assumption-map.md` + `Work/validation/<feature>-validation-plan.md` (feeds downstream skills)

## 4. `/agentic-pm:research` — validated (2026-04-15)

**Use case (two modes, autoselected):**
> "I need to do research that actually changes a decision" (plan mode — no data yet)
> "I have transcripts / notes — turn into insights + hypotheses" (synthesis mode)

### Artifact

- **Plan mode:** Research Brief (decision → evidence gap → method → sample → timeline)
- **Synthesis mode:** Research Report (JTBD switch stories, insight clusters, Four-Forces breakdown, hypotheses, experiment pointers)

### Spine autoselect

| Mode / signal | Spine | Wiki source |
|---|---|---|
| **Plan** | Decision-First Research + Three Feasibility Questions | `Decision-First Research` (Behzod Sirjani) |
| **Synthesis** — default / product discovery | Moesta JTBD (narrative, switch stories, Four Forces) | `Jobs To Be Done` (Moesta flavor) |
| **Synthesis** — quantitative prioritization | Ulwick ODI (importance × satisfaction) | `Jobs To Be Done` (Ulwick flavor) |

**Note:** VoC (company-wide aggregation) carved into separate skill `/agentic-pm:voc-setup` — it's a program, not a research project.

### Sub-steps (synthesis mode)

1. Transcript intake + cleanup (reuse `/agentic-pm:opportunity` snapshot template)
2. JTBD switch-story extraction per interview with recent switch
3. Four Forces coding per story (Push / Pull / Anxiety / Habit)
4. Layer-3 causal reality filtering (flag Layer-1 fantasy / Layer-2 surface)
5. Insight clustering (3–4 at a time per Torres cadence)
6. Hypothesis framing (testable)
7. Handoff offer (not auto-chain): user chooses to feed `/agentic-pm:opportunity` (OST) or `/agentic-pm:assumptions` (risk-rank)

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Plan: decision clarified before method | Decision-First |
| Plan: Three Feasibility Questions (feasible / reasonable / worthwhile) | Decision-First |
| Plan: stakeholders who act on findings involved in design | Decision-First: "wrong stakeholders" failure mode |
| Synthesis: JTBD only for people who already switched | JTBD Moesta |
| Synthesis: Four Forces captured per switch story | JTBD |
| Synthesis: Layer-3 vs Layer-1/2 distinguished | JTBD: "three layers of language" |
| Synthesis: revealed behavior > stated preference | JTBD: "93% said they wanted Energy Star; almost none bought for that reason" |
| Synthesis: don't mix Moesta and Ulwick mid-project | JTBD |
| Synthesis: JTBD skipped when no memorable switch moment | JTBD: "When NOT to use JTBD" |

### Inputs

- User-supplied: research question, transcripts
- `GOALS.md` → decision context
- `COMPANY.md` → segment, ICP
- Handoff from `/agentic-pm:product-strategy` (riskiest dimension)

### Output

- Plan: `Work/research/<topic>-brief.md`
- Synthesis: `Work/research/<topic>-report.md` + switch-story snapshots in `Work/research/snapshots/`

---

## 5. `/agentic-pm:decisions` — validated (2026-04-15, high wiki confidence, no walkthrough)

**Use case:**
> "I have a decision to make (or already made) that needs structure so it doesn't get relitigated. Name the options, document reasoning, make the call visible."

### Artifact: Decision doc (full or mini SPIDER) + optional management diagnostic

### Spine autoselect

| Signal | Spine | Wiki source |
|---|---|---|
| Any decision that matters | **Reversibility filter first** (one-way vs two-way door) | `One-Way vs. Two-Way Door Decisions` |
| One-way OR significant two-way door | **Full SPIDER** (Situation / People / Ideas / Decision / Explanation / Rollout) | `SPIDER Decision Framework` (Tatyana Mamut) |
| Team-level / day-to-day | **Mini-SPIDER** (2–3 sentences) | SPIDER: "team-level" tier |
| "Why isn't X getting done?" (behavior, not decision) | **5-Cause Management Diagnostic** (communication → training → deadline → motivation → blockers) | `5-Cause Management Diagnostic` (Hormozi) |
| Upstream: "what research could change this decision?" | **Decision-First Research** handoff to `/agentic-pm:research` | `Decision-First Research` |

### Sub-steps

1. Reversibility classification — determines process depth (two-way doors stay cheap)
2. If full SPIDER: walk Situation → People (explicit roles) → Ideas (ALL options, neutral) → Decision → Explanation → Rollout
3. Stakeholder gap check — advocate / approver / input-givers / aligned; prompt if any blank
4. Decision date stamped
5. If 5-cause diagnostic: walk list in order, stop at first "no"
6. Output lives in shareable, linkable location (`Work/decisions/`)

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Reversibility classified before process depth | One-Way vs Two-Way: "most teams treat two-way door as if one-way" |
| Ideas section includes ALL options, including infeasible ones | SPIDER: "if their idea is absent, they will relitigate regardless" |
| Ideas section neutral (pros/cons, no advocacy) | SPIDER: "Stay completely neutral... Do not advocate" |
| Approver explicitly named | SPIDER: "approver cannot be skipped" |
| Decision date captured | SPIDER: "the most overlooked field — constant reopener" |
| Input-givers consulted *before* decision finalized | SPIDER: "pause and consult first" |
| Lives in shareable doc, not just a meeting | SPIDER: "meetings have no memory" |
| 5-Cause: work list in order, stop at first "no" | 5-Cause: "Don't jump to motivation if the cause is communication" |

### Inputs

- User-provided: decision question, options, context
- `TEAM.md` → who plays SPIDER roles
- `CONSTRAINTS.md` → what's off the table

### Output

`Work/decisions/YYYY-MM-DD-<decision-slug>.md` — accumulates into a decision journal over time

---

## 6. `/agentic-pm:stakeholder` — parked (wiki coverage medium; design not yet walked)

## 7. `/agentic-pm:meeting` — parked (thin wiki coverage; may collapse into #6)

## 8. `/agentic-pm:review` — parked (commercial "7 perspectives" not in wiki; design TBD)

## 9. `/agentic-pm:coaching` — parked (commercial moves not wiki-backed; most uncertain)

---

## 10. `/agentic-pm:measure` — validated (2026-04-15, reframed from commercial)

### Reframe decision (2026-04-15)

Commercial workflow spec was: "Clarification chain → Fermi decomposition → calibrated confidence intervals → value-of-information → small-sample measurement plan." This is Douglas Hubbard's *How to Measure Anything* territory. **Wiki has no dedicated Hubbard / Fermi / calibrated-CI / VOI concept pages.**

Design principle (from MEMORY): when wiki doesn't support a commercial workflow's moves, **swap the spine to what the wiki supports**. Product measurement is a real PM job regardless of Hubbard. Reframed as: "define and size product metrics rigorously."

**Wiki-gap flag:** Hubbard-style calibrated estimation is a future wiki-expansion candidate if users ask for it.

**Use case:**
> "I need to figure out what to measure for this product / feature / goal — and how to size impact before I commit."

### Artifact

- **Strategic path:** NSM proposal + core-action definition + guardrail metrics
- **Tactical path:** Impact-sizing model + metric tree location + prioritization recommendation
- **Planning path:** Appetite-based time-box + scope-as-variable framing

### Spine autoselect

| Signal | Spine | Wiki source |
|---|---|---|
| "What's our North Star?" / new product | **North Star + Hierarchy of Engagement** (core action → rate → retention → self-perpetuation) | `North Star Metric`, `Hierarchy of Engagement` |
| "How does our work trace to outcomes?" | **Metric Trees** (causal hierarchy, 3–4 levels, 3–5 branches) | `Metric Trees` (Gilad) |
| "Is this feature worth building?" | **Impact Sizing** (4-step: usage → cascade → de-risk → takeaways) | `Impact Sizing` (Aakash/Vellotti) |
| "How long should we spend?" | **Appetite vs. Estimate** (time-box, scope-as-variable) | `Appetite vs. Estimate` (Fried/Shape Up) |
| Pre-PMF diagnostic | **Sean Ellis Test** + "don't size pre-PMF" | `Sean Ellis Test`, Impact Sizing |

### Sub-steps

1. Situate: strategic (NSM) / tactical (feature impact) / planning (appetite)
2. **Strategic path:** identify core action → propose NSM candidates → validate against "good NSM" criteria (value, retention-predictive, actionable, singular, right lag)
3. **Tactical path:** locate feature in metric tree → estimate cascade (usage → engagement → top-line → bottom-line) → identify weakest assumptions → de-risk iteratively
4. Add guardrail metrics (per `Guardrail Metrics`) to catch gaming
5. Output with sensitivities / ranges, not point estimates
6. File to institutional memory spreadsheet (accumulates calibration over 12+ months)

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| NSM is value metric, not activity | North Star: "chasing revenue directly destroys the value that produces it" |
| Singular NSM | North Star: "having two NSMs means having none" |
| NSM tied to retention | North Star: "if improving NSM doesn't improve retention, wrong metric" |
| Metric tree: causal claims validated with data | Metric Trees: "the most important and most often skipped step" |
| Metric tree: ≤3–4 levels, 3–5 branches | Metric Trees: "50+ nodes is unmanageable" |
| Vanity metrics flagged | North Star + Metric Trees |
| Impact sizing: first-principles preferred, historical correlation fallback | Impact Sizing |
| De-risk weakest assumption, don't refine whole model | Impact Sizing |
| Sensitivities / ranges, not point estimates | Impact Sizing |
| Don't size pre-PMF | Impact Sizing: "metrics move too fast; focus on core user value" |
| Planning: appetite (time-box) not estimate (scope-box) | Appetite vs Estimate: "scope is the variable, not time" |

### Inputs

- `GOALS.md` → current OKRs
- `PRODUCTS.md` → stage (pre/post PMF determines whether sizing is appropriate)
- `COMPANY.md` → business outcome to cascade from
- User: feature candidate, analytics access

### Output

`Work/metrics/<topic>-measurement-plan.md` + cumulative `Work/metrics/impact-sizing-journal.md` (one entry per feature sized)

<!-- workflows 5-10 moved above -->  

---

## Cross-cutting decisions

### Naming
- Workflows take the `/agentic-pm:<artifact-or-situation>` namespace, not `/workflow:<name>`.
- Names describe the PM's situation or the artifact produced, not the framework applied. (See `feedback_pm_os_artifact_first.md` in user memory.)

### Design flow
- PM-job → skill spec → wiki-for-rigor, in that order. Wiki is an optimizer, never the driver. Orphan framework cards are not built.

### Spine selection
- When multiple wiki frameworks could apply to the same artifact, the skill **autoselects** based on up-front situation questions (scope, audience, stage). No single one-size-fits-all template.

### Add-on blocks
- Optional blocks are **situation-triggered** — skill includes them only when conditions are met. Default to leaner artifacts over everything-and-the-kitchen-sink.

### Quality bars
- Every quality check must cite a wiki concept. If a check has no wiki source, either find one or drop the check.

### User autonomy
- Skills strongly recommend wiki-backed practices but do not refuse when user overrides. Declined recommendations propagate as tags on output artifacts (e.g., `feasibility-unverified`, `positioning-skipped`) so downstream skills can adjust behavior without the user re-explaining.

### Wiki-gap handling
- When a commercial workflow's moves are not wiki-backed, **swap the spine to what the wiki supports** (if the underlying PM job is real). Flag the original move as a wiki-expansion candidate for later. Don't build skills on ungrounded framework material.
- Example: `/agentic-pm:measure` reframed from Hubbard-style (Fermi / calibrated CI / VOI) to wiki-backed product-measurement spines (North Star / Metric Trees / Impact Sizing / Appetite vs Estimate).

---

# Tier 2 — specialized skills pulled forward to v0.1

These are not part of the commercial 10 workflows but are essential PM jobs the wiki strongly supports. Pulled forward because the 10-workflow set under-covers AI-specific PM work and artifact production.

---

## `/agentic-pm:eval-plan` — validated (2026-04-16)

**Use case (two modes, autoselected):**
> Pre-launch: "I'm about to ship an AI feature. How do I know if it works before users see it?"
> Post-launch: "Users are hitting my AI feature. What's failing, and what should I measure?"

Skill asks up-front: launch stage (pre / post), feature type (open-ended generation / classification / retrieval / agent), traces available (yes / no), domain expert access (named person / none).

### Artifact: Evaluation Plan with autoselected spine

| Signal | Spine | Wiki source |
|---|---|---|
| Pre-launch (no traces yet) | **Rubric-first** — 5-step rubric (scenarios → criteria → 4–6 categories → reference examples → inter-rater validation) | `Evaluation Rubric` (Ankit Shukla) |
| Post-launch (real traces) | **Traces-first** — 4-step error analysis (review 100 → axial coding → label → pivot table) | `Error Analysis` (Hamel/Shreya) |
| Scaling judgment beyond what humans can review | **Critique Shadowing** → handoff to `/agentic-pm:llm-judge` (binary, TPR/TNR validated) | `Critique Shadowing` (Hamel), `LLM Judge` |
| Diagnosing *where* failures come from | **Three Gulfs diagnostic** (Comprehension / Specification / Generalization / Model Capability) | `Three Gulfs Framework` (Eugene Yan) |
| Production infrastructure | **AI Evaluation Pipeline** add-on | `AI Evaluation Pipeline` |

### Situation-triggered add-on blocks

- **Three Gulfs diagnostic** — included when errors cluster; maps failure to fix type (Comprehension → better data review; Specification → prompt/rubric; Generalization → pipeline/RAG; Model Capability → fine-tune/switch).
- **LLM Judge handoff** — only after ≥100 human-labeled traces exist (wiki: judge needs ground truth to validate TPR/TNR). LLM Judge construction lives in separate `/agentic-pm:llm-judge` skill (per Critique Shadowing's standalone 5-step process).

### Sub-steps (post-launch / traces-first)

1. Sample 100 diverse traces (segments, input types, edge cases)
2. Axial coding → emergent failure categories (not pre-set)
3. Label full sample; pivot-table frequency
4. Three Gulfs diagnosis per top category
5. Fix sequencing (cheapest gulf first: Specification > Comprehension > Generalization > Capability)
6. Decide eval automation scope → optional `/agentic-pm:llm-judge` handoff

### Sub-steps (pre-launch / rubric-first)

1. Define representative scenarios (wiki: breadth > depth)
2. Criteria per scenario (pass/fail binary preferred)
3. 4–6 categories max
4. Reference examples (good + bad) per criterion
5. Inter-rater validation with ≥2 reviewers (wiki: ≥80% agreement before trusting)
6. Handoff to `/agentic-pm:llm-judge` if scaling

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| PM (not engineer) owns error analysis loop | Error Analysis: "PMs own this, not engineers" |
| Sample ≥100 traces for axial coding | Error Analysis |
| Categories emerge from data, not pre-set | Error Analysis: axial coding |
| Binary pass/fail scoring for judges | LLM Judge: "binary resolves rater disagreement" |
| LLM judge validated against human labels (TPR/TNR) | LLM Judge |
| Principal Domain Expert named (strongly recommended, not required; if declined, output tagged `judge-unvalidated`) | Critique Shadowing |
| Rubric: ≥80% inter-rater agreement before trust | Evaluation Rubric |
| Rubric: 4–6 categories max | Evaluation Rubric |
| Three Gulfs: failure mapped to gulf before fix chosen | Three Gulfs |
| Monthly error-analysis cadence for live features | Error Analysis |

### Inputs from context system

- `PRODUCTS.md` → AI feature stage, launch status
- `TEAM.md` → domain expert identification (Principal Domain Expert candidate)
- `GOALS.md` → what success means for this feature
- User-supplied: traces (post-launch) or spec (pre-launch)

### Handoffs

- Upstream: `/agentic-pm:assumptions` (feasibility risks for AI features → Prompt-as-MVP traces feed this skill)
- Downstream: `/agentic-pm:llm-judge` (judge construction), `/agentic-pm:measure` (eval results feed metric tree / impact sizing)

### Output

- `Work/evals/<feature>-eval-plan.md` (rubric or error-analysis pivot table)
- `Work/evals/<feature>-error-journal.md` (accumulates monthly, per wiki cadence)

---

## `/agentic-pm:prd` — validated (2026-04-16)

**Use case:**
> "I need to write a PRD for [feature / bet / AI capability]. Help me draft the right shape for the stage I'm in and the type of work it is."

Skill auto-detects **stage** (planning / kickoff / solution-review / launch-ready / impact-review) from input + existing file (one-line inferred stage, user can override). Asks **work type** (feature / time-boxed bet / AI feature) and **upstream context** (linked OST? assumption map? eval plan?).

### Artifact: PRD with autoselected spine

| Signal | Spine | Wiki source |
|---|---|---|
| Default — big-rock feature, multi-week | **Modern PRD Lifecycle** (5 stages, rolling checklist, 8/10 quality target) | `Modern PRD Lifecycle` (Aakash Gupta) |
| AI / LLM-powered feature | **Modern PRD + AI PRD layer** (layered, not separate — wiki: "start with Modern PRD, then add AI PRD") | `AI PRD` |
| Time-boxed bet, scope-as-variable, ≤6 wk appetite | **Shape Up Pitch** (problem → appetite → solution sketch → rabbit holes → no-gos) | `Shape Up`, `Appetite vs. Estimate` |

### Situation-triggered add-on blocks

- **AI PRD layer** — appended only when work type = AI feature. Adds 7 AI metrics categories, Vibe Check threshold, HiTL pattern, Risks (Cost / Content / Prompt Hacking / Moderation), prompt-spec gap awareness.
- **Counter-metric block** — appended at Stage 2 always (wiki: "missing counter-metrics" is top-5 mistake).
- **Impact sizing handoff** to `/agentic-pm:measure` at Stage 2. PRD embeds link to measurement-plan artifact. If declined, output tagged `impact-unsized`.
- **Eval plan handoff** to `/agentic-pm:eval-plan` when AI feature reaches Stage 3 (Solution Review).

### Sub-steps (Modern PRD spine, stage-aware)

1. Detect stage from user input + existing PRD file; show inferred stage in one line, allow override
2. Apply rolling checklist for that stage only — don't enforce later-stage sections early (wiki: "false completeness" trap)
3. **Stage 1 (Planning):** problem + metrics + qualitative evidence (embedded, not linked-out) + next steps
4. **Stage 2 (Kickoff):** + solution mock + NSM/secondary/guardrail metrics + impact-sizing handoff
5. **Stage 3 (Solution Review):** + edge cases + rollout plan + XFN reqs + tracking spec + GTM + risks/mitigation
6. **Stage 4 (Launch Readiness):** verify eng concerns addressed, design done, GTM enabled, financials cleared
7. **Stage 5 (Impact Review):** link results doc; flag if user skips (wiki: "best PMs don't skip this")
8. Recommend 8/10 quality target unless user is in the "one CEO-review feature this quarter" case

### Sub-steps (Shape Up Pitch spine)

1. Problem (with raw appeal — why this matters now)
2. Appetite (small batch / big batch — 2 wk vs 6 wk)
3. Solution sketch (rough wireframes / fat marker, not pixel mocks)
4. Rabbit holes (what we know will trap us; how we'll avoid)
5. No-gos (explicit out-of-scope)
6. Appetite enforced as constraint — if scope grows beyond appetite, cut scope, not extend time

### Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Stage-appropriate sections only (rolling checklist, not full template) | Modern PRD: "templates create false completeness" |
| User evidence embedded, not linked-out | Modern PRD: top-5 mistake |
| Impact sizing present by Stage 2 (or handoff invoked) | Modern PRD: "most common quality gap" |
| Counter / guardrail metrics specified by Stage 2 | Modern PRD: "missing counter-metrics" mistake |
| Stage 5 (Impact Review) recommended on every PRD | Modern PRD: "best PMs don't skip this" |
| 8/10 quality target unless explicitly the quarterly CEO-review feature | Modern PRD |
| AI PRD: Vibe Check threshold defined before formal AI metrics | AI PRD: "don't jump into detailed metrics if vibe check is enough" |
| AI PRD: at least Accuracy + Speed + Cost + 1 Ethics metric | AI PRD: 7-category framework |
| AI PRD: HiTL pattern named (when human reviews/approves) | AI PRD |
| AI PRD: prompt-hacking + moderation risks named | AI PRD |
| Shape Up Pitch: appetite is the constraint, scope is the variable | Shape Up + Appetite vs Estimate |
| Shape Up Pitch: rabbit holes + no-gos both populated | Shape Up |

### Inputs from context system

- `PRODUCTS.md` → AI flag (triggers AI layer), stage
- `GOALS.md` → metrics this PRD ladders to
- `TEAM.md` → XFN partners (Stage 3), Privacy/Security/Legal flag for AI
- `CONSTRAINTS.md` → scope ceilings, what's off-table
- Upstream artifacts: linked OST (`/agentic-pm:opportunity`), assumption map (`/agentic-pm:assumptions`), eval plan (`/agentic-pm:eval-plan`), measurement plan (`/agentic-pm:measure`)

### Handoffs

- Upstream: `/agentic-pm:opportunity` (target opportunity → PRD problem), `/agentic-pm:assumptions` (riskiest hypotheses → PRD risks)
- Downstream: `/agentic-pm:measure` (impact sizing), `/agentic-pm:eval-plan` (AI features at Stage 3)
- **Tag propagation:** `discovery-unverified` if no upstream OST; `impact-unsized` if measurement handoff declined; `evals-unplanned` if AI feature with no eval-plan link

### Output

`Work/prds/<feature>-prd.md` — living doc, updated in place across stages (not duplicated per stage)

### NCT note

`NCT Framework` (Ravi Mehta) is goal-setting, not PRD authoring — parked for future `/agentic-pm:goals` skill.
