---
name: map-risks
description: "Surface and risk-rank the assumptions behind an idea, feature, or strategy — then plan the cheapest fastest validations for the riskiest ones. Use when you have a solution or bet and need to know what could kill it."
allowed-tools: Read Grep Glob Write Edit
---

# Map-risks — Surface and Rank Risks, Plan Validations

Produces an assumption map and validation plan — the artifact that tells you which unknowns to attack first and with which technique. Absorbs the former `prototype` skill's execution detail — when the validation plan calls for a prototype, the how-to-build lives in this skill's prototype-execution block (see Situation-triggered add-on blocks).

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
- `Work/strategy/*-strategy.md` — if found, load the strategy's diagnosis and riskiest dimension
- `Work/discovery/<product>-ost.md` — if found, load the target opportunity and solution set

Report what you found and what's missing in the Plan checkpoint. Don't ask the PM to point you to files that already exist in Work/. If found, state in the plan checkpoint: "I found your strategy doc / OST — I'll use it as input. The riskiest dimension appears to be [X]."

---

## Frameworks this skill loads

- `frameworks/four-product-risks.md` — default spine: Value / Usability / Feasibility / Business Viability
- `frameworks/riskiest-hypothesis-sequencing.md` — sequencing and validation technique selection
- `frameworks/feasibility-first-inversion.md` — AI feature spine: feasibility is the first gate
- `frameworks/business-hypothesis-canvas.md` — early-stage / new product bet spine
- `frameworks/six-dimensions-of-product-strategy.md` — PMF-level spine for new products

Read the relevant frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to stress-test the PM's assumptions about their assumptions before mapping them.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"You've listed [N] assumptions. Which one, if wrong, would kill the entire idea? Not just hurt it — kill it."** Surfaces whether the PM has actually rank-ordered by lethality or is treating all assumptions as equally important. Most PMs list assumptions without differentiating — the riskiest one is the only one that matters right now. *(Riskiest Hypothesis Sequencing: "sequence by conviction × impact-if-wrong, not by ease of testing.")*

2. **"Are you trying to validate this idea, or are you trying to find out if it's wrong? Because those produce different experiments."** Catches confirmation bias. If every proposed validation is designed to confirm what the PM already believes, the assumption map is theater. The best validations are designed to falsify. *(Riskiest Hypothesis Sequencing: "validating what you already believe is the most common failure mode.")*

3. **"This feature uses AI — why do you think feasibility isn't the riskiest risk? Have you seen it work on real inputs, or are you assuming it will?"** *(Feasibility-First Inversion: "For AI features, feasibility is the first gate — not value, not usability.")* If the PM hasn't run a Prompt-as-MVP with 20–50 real inputs, feasibility is still the riskiest assumption regardless of what they believe.

4. **"You have [N] solutions from the OST. Are these genuinely different approaches, or are they variations of the same idea with different labels?"** If three of four solutions are "add a dashboard with slightly different charts," the compare discipline is illusory. Real comparison requires solutions that would fail for different reasons. *(Four Product Risks: each solution should have a different risk profile across the four types.)*

5. **"What would make you abandon this idea entirely? Name a specific finding."** Tests whether the PM has a kill criterion. If nothing could make them walk away, the assumption map is a compliance exercise, not a decision tool.

6. **"Who disagrees with this bet? What's their strongest argument?"** Surfaces the assumptions the PM is least likely to test — the ones held by the opposition. The strongest counterargument often points directly to the riskiest assumption.

7. **"What's the cheapest thing you could do in the next 48 hours to learn something about the riskiest assumption?"** Grounds the conversation in action. If the cheapest validation is a 3-month build, the PM hasn't thought creatively enough about validation techniques. *(Riskiest Hypothesis Sequencing: "different hypothesis types require different validation techniques.")*

Interview until you can answer: What's the actual riskiest assumption? Is the PM open to being wrong? Are the solutions genuinely different? Is there a kill criterion?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2–3 sentences. Name the riskiest assumption, the evidence quality, and any confirmation bias you detected.
2. **"Here's the approach"** — which spine you'd pick and why, whether a cross-solution comparison applies, whether Prompt-as-MVP is needed first.
3. **"Here are my concerns"** — anything unresolved from the interview. Assumptions the PM seems unwilling to test. Solutions that aren't genuinely different. Missing kill criteria.

Ask: **"Want to adjust before I start mapping?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Ask the PM:
1. What is the input? (Single feature / multiple solutions from OST / strategy / early-stage product bet)
2. Does this feature use AI or ML? (Check PRODUCTS.md AI surfaces)
3. Is this an early-stage new product (pre-PMF), or an existing product?
4. Are you coming from an OST handoff? (If yes: bring all 3–5 solutions under the target opportunity, not just one)

Pick spine:
- **Default / feature-level** → Four Product Risks (Value / Usability / Feasibility / Business Viability) + Riskiest Hypothesis Sequencing
- **AI feature / ML system** → Feasibility-First Inversion → Prompt-as-MVP check → then full Four Product Risks
- **Early-stage / new product bet** → Business Hypothesis Canvas (8 dimensions, now/future/not-at-all)
- **PMF-level new product** → Six Dimensions of Product Strategy → riskiest dimension first

---

## Situation-triggered add-on blocks

- **Cross-solution comparison view** — always appended when input comes from OST (3–5 solutions per opportunity). Produce a ranked matrix: solutions × riskiest assumptions × cheapest validation cost. Helps the PM choose which solution to pursue first based on validation economics, not intuition.
- **AI Prompt-as-MVP recommendation** — always included when AI flag is present. Strongly recommend before full assumption map. If declined, output tagged `feasibility-unverified`.
- **Prototype-execution block** — triggered when the validation plan calls for a prototype. Loads frameworks: `ai-prototyping.md`, `foundation-sprint.md`, `vibe-coding.md`, `taste-at-speed.md`, `wireframing.md`. Covers:
  - **Fidelity matched to audience** — internal 30% / customer 70% / production 90% *(Wireframing: fidelity spectrum)*
  - **Cheapest-test-first ladder** — fake-door → smoke test → Wizard-of-Oz → functional prototype; start at the lowest fidelity that tests the assumption
  - **Divergent prototyping** — when only 1 prototype exists, require 2–4 variants with named axes of variation before evaluating
  - **Taste at Speed 5-lens filter** (Cherny) — problem-solution fit, interaction cost, edge-case exposure, technical-debt signal, business-model alignment; kill 60–80% of variants
  - **Prototype Trap awareness** (AI features) — distribution mismatch, cultural context blindness, aggregate-vs-segment accuracy; required when AI
  - **Kill criterion before build** — what result means "stop, this idea is wrong"
  - **Foundation Sprint spine** (Knapp + Zeratsky) — when idea is pre-seed and the 2-day structured process applies
  Output appends a Prototype Brief to the validation plan: assumption tested, build approach, fidelity level, audience, kill criterion, results observed, Taste-at-Speed scores, kill/continue decision.

---

## Step-by-step flow

1. **Discovery interview.** Read context files. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the spine you'd pick, riskiest assumption, concerns. Wait for PM approval before producing anything.
3. **Ingest input.** If from OST, collect all 3–5 solutions under the target opportunity (preserve compare discipline — don't collapse to one solution prematurely).
4. **Enumerate assumptions** grouped by risk type. For Four Product Risks spine: at least 1–2 assumptions per type (Value, Usability, Feasibility, Business Viability).
5. **Risk-rank** each assumption: conviction (how confident are we?) × impact-if-wrong (how much would it hurt?). Generate top-N per solution.
6. **If AI feature:** recommend Prompt-as-MVP as first validation step (20–50 real inputs, binary pass/fail). Strongly recommend; if declined, tag `feasibility-unverified` and proceed with full map.
7. **Match validation technique to risk type.** Do not default to MVP for all risk types — see the validation technique matrix below.
8. **Write a falsifiable success signal** per top-N assumption (quantitative or qualitative — both acceptable if falsifiable).
9. **Produce cross-solution comparison** if coming from OST: solutions × riskiest assumptions × cheapest validation per solution.
10. **Self-validate.** Before presenting the artifacts, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifacts.
11. **Produce artifacts** at `Work/validation/<feature>-assumption-map.md` + `Work/validation/<feature>-validation-plan.md`.

---

## Validation technique matrix

| Risk type | Techniques |
|---|---|
| Value | Customer interviews, smoke test, pre-sales, concierge MVP |
| Usability | Prototype tests, usability testing, heatmaps, session recordings |
| Feasibility — AI | Prompt-as-MVP (20–50 real inputs, binary pass/fail) |
| Feasibility — deterministic | Technical spike, architecture assessment |
| Business model / pricing | Pre-sales, paid pilots, pricing experiments |
| Growth / acquisition | Paid channel tests, viral coefficient measurement |
| Market size | Analog analysis, anti-log analysis |
| Cross-cutting | Pre-mortem, smoke test, Wizard-of-Oz, war-gaming |

---

## Quality bar

Before finalizing the artifacts:

- [ ] Validation technique matched to risk type, not default MVP for everything — *Riskiest Hypothesis Sequencing: "different hypothesis types require different validation techniques"*
- [ ] AI features: Prompt-as-MVP strongly recommended before full map (one explicit ask; if declined, tag `feasibility-unverified`) — *Feasibility-First Inversion*
- [ ] Each top-N assumption has a falsifiable success signal (quant or qual both acceptable) — *Riskiest Hypothesis Sequencing*
- [ ] Flag if any assumption is one you already believe — *Riskiest Hypothesis Sequencing: "validating what you already believe"*
- [ ] BHC spine: "not at all" bucket populated — *Business Hypothesis Canvas: explicit exclusions are strategy*
- [ ] Four Risks spine: ≥1 assumption per risk type present — *Four Product Risks*

---

## Tag propagation

- Feasibility-first recommendation declined (AI feature) → tag `feasibility-unverified`
- Validation plan skipped for top-risk assumptions → tag `validation-deferred`
- No cross-solution comparison when OST input present → tag `compare-discipline-skipped`
- Prototype built without a named kill criterion → tag `kill-criteria-absent`
- AI prototype built without Prompt-as-MVP on 20–50 real inputs first → tag `feasibility-untested`
- Prototype Trap (AI): aggregate accuracy reported without segment analysis → tag `prototype-trap-risk`
- Speed mode used (draft-then-edit, not Socratic) → tag `speed-mode-used`

---

## Handoffs

- **Upstream:** `/agentic-pm:map-opportunities` (provides solutions to map); `/agentic-pm:write-strategy` (provides riskiest dimension)
- **Downstream:** `/agentic-pm:plan-research` (top assumptions drive research brief); `/agentic-pm:compile-prd` (riskiest assumptions → PRD risks section); `/agentic-pm:write-rubric` (AI feasibility traces → eval plan seed)

---

## Output

- `Work/validation/<feature>-assumption-map.md`
- `Work/validation/<feature>-validation-plan.md`

---

## End every session with

- The single riskiest assumption and the specific validation that will resolve it in the next 2 weeks.
- If AI feature: "Run the Prompt-as-MVP before you write any more PRD — 20 inputs, 30 minutes, could save months."

---

## Completion status

Report exactly one of at close:
- **DONE** — assumption map and validation plan written, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — artifacts written but tags applied (list each: `feasibility-unverified`, `validation-deferred`, `compare-discipline-skipped`)
- **BLOCKED** — no input to map (no feature, no solutions, no OST); state what to produce first
- **NEEDS_CONTEXT** — cannot determine spine without knowing the feature type and whether an OST exists

Escalation: if Prompt-as-MVP was declined for an AI feature, tag `feasibility-unverified` and surface this prominently — it is the most expensive assumption to validate late.
