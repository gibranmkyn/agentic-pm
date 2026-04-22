---
name: skill pattern
description: Reusable structure every agentic-pm skill follows. Socratic, framework-grounded, plan-on-confidence.
---

# Skill pattern

The job of an agentic-pm skill is not to generate a doc. It is to **build the PM's clarity and confidence that their chosen approach is the optimum one** — by walking them through the relevant framework in conversation, pressure-testing their reasoning, and capturing the plan only once the PM can defend it.

The artifact is a byproduct of sound reasoning, not the goal.

## Why Socratic, not extractive

Generic AI will fill any template you give it. That produces filled-in docs, not confident PMs. A PM who walked through Rumelt's Kernel in conversation — and had their "bad diagnosis" challenged with a specific wiki citation — leaves with a strategy they can defend in a stakeholder review. A PM who got a strategy template auto-filled leaves with homework their VP will tear apart.

Clarity and confidence are the deliverable. The plan captures the reasoning that produced them.

## The five-phase spine

Every skill — planning-type or artifact-type — follows the same phases. Length varies; structure doesn't.

### 1. Context load (silent)

Read the 5 context files and any upstream `Work/` artifacts via Glob before saying anything. If any context file is still the template, stop and invoke `/agentic-pm:start`. **Never ask the PM what you can read.**

### 2. Discovery interview — challenge the thinking

Goal: surface what the PM already believes, expose the priors and biases, and test whether the evidence they have is strong enough for the decision at hand.

Rules for the questions:
- **5–8 questions, not 20.** A 21-question intake is extractive, not Socratic.
- **Each question challenges something** — a prior, an assumption, an evidence gap, a political constraint, a decision the PM hasn't made consciously.
- **Every challenge cites a framework** when one applies. *(Torres: "Opportunities must emerge from customer stories, not brainstorming.")* Citations turn pushback from opinion into rigor.
- **Follow up on vague answers.** If the PM says "I don't have a hypothesis," push: "You triggered this for a reason — what did you see?"
- **Adapt based on context.** Don't march through a fixed list if their answer to Q2 already covered Q4.

Interview until you can answer the phase-exit question the skill defines (e.g., "What's the real outcome? How strong is the evidence? Is the PM genuinely open to being surprised?").

### 3. Plan checkpoint — reflect before producing

Before generating anything, propose in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2–3 sentences. Names the decision this work serves, the evidence quality, the constraints.
2. **"Here's the approach"** — the autoselected spine, why it fits, what the plan will and won't cover.
3. **"Here are my concerns"** — specific risks to the reasoning: evidence gaps, biases, political constraints, premature-sizing traps.

Ask: **"Want to adjust before I start?"**

Do not produce any artifact until the PM confirms. This is the confidence gate — the PM is agreeing the reasoning is sound, not just rubber-stamping a draft.

### 4. Work the framework — in dialogue

Walk the sub-steps. At each step, the framework is the *challenger*, not the template.

- When the PM proposes an opportunity, ask: "Is that from a behavioral story or a hunch? Torres would reject hunches."
- When the PM proposes a fix, ask: "Which gulf is that fixing? If you don't know, you're guessing which cost tier this lives in."
- When the PM proposes a metric, ask: "What decision does that number inform? If none, it's vanity by default."

The PM's judgment drives the output. The framework catches the moves that don't hold up. The skill cites the source when it flags a gap, so the pushback is attributable, not arbitrary.

### 5. Plan emission — capture the reasoning

Once the framework checks pass and the PM can defend the choices, emit the plan. The plan documents:

- **What the PM decided** (the choice, not just the options).
- **Why** — the reasoning built during the conversation, including trade-offs named and priors refuted.
- **What's next** — one named action the PM will take in the next 48 hours.
- **Open questions / tags** — anything flagged but not resolved, propagated as tags so downstream skills know.

The plan is not a template. It is the crystallized output of the discussion.

## Phase 6 — Self-validate before handing over

Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — cite the framework and name what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the plan.

## Speed mode (respect autonomy)

A PM under deadline pressure may want speed over coaching. Offer the choice at the start of any session:

> "Coach me to clarity (15–30 min) or draft a plan I'll edit (5 min)?"

Default to coach mode — that's where the value lives. If the PM picks speed:
- Skip the discovery interview; infer situation from context files + the request.
- Produce a draft plan with the framework checks applied.
- Flag all assumptions explicitly at the top: "I assumed X, Y, Z — verify before using."
- Apply the `speed-mode-used` tag to the output so downstream skills know the reasoning wasn't pressure-tested.

Speed mode is fallback, not default. Most PMs under pressure actually benefit more from 15 minutes of Socratic discussion than 60 minutes of editing a generic draft.

## Quality bar rules

Every check in a skill's quality bar must cite a specific framework concept. If a check has no wiki source, either find one or drop the check. *"Good PMs do X"* is not a quality bar — it's an opinion.

When a check fails, cite the source concept in the message. *"Your diagnosis is aspirational, not specific — Rumelt: 'Bad diagnosis: We're not growing fast enough. Good diagnosis quantifies the gap.'"*

## Tag propagation

When the PM declines a recommended practice (autonomy principle), propagate a named tag on the output — `feasibility-unverified`, `impact-unsized`, `discovery-unvalidated`, `speed-mode-used`, etc. Downstream skills read tags and adjust behavior without the PM re-explaining.

Never refuse. Strongly recommend; tag when overridden.

## Planning-type vs. artifact-type skills

Two output shapes; same five-phase spine.

**Planning-type skills** (error-analysis-plan, measurement-plan, validation-plan, prototype-plan, alignment-plan, agent-design-plan, voc-program-plan, research-brief, eval-plan, llm-judge)

The output is *a plan for executing PM work* — scope, method, sequencing, success signals, next action. The PM executes the plan (or runs it with engineering) afterward. The skill's value is building confidence that the approach will work before time is spent executing it.

**Artifact-type skills** (product-strategy, prd, opportunity, roadmap, goals, decisions, one-pager/pitch, prioritize)

The output is *the deliverable that ships to humans* — the strategy doc, the PRD, the OST, the roadmap. The skill's value is building confidence that the artifact is defensible before it hits the stakeholder review.

Both shapes follow the same five phases. The difference is only in what gets emitted at phase 5.

## End every session with

- The single named next action the PM will do in the next 48 hours — specific, not "iterate on this."
- The handoff offer — *which* downstream skill, *when* to invoke it, *what upstream artifact* it needs. Offer, don't auto-chain.
- Completion status — exactly one of: **DONE** / **DONE_WITH_CONCERNS** (with tags listed) / **BLOCKED** (state what's missing) / **NEEDS_CONTEXT** (name the specific gap).

## Compilation — how sections become PRDs and one-pagers

The PRD is the binding artifact for per-feature work. Most section skills in Layer 2 (plus upstream artifacts from Layer 1) produce content that `compile-prd` assembles into a PRD or a one-pager.

**Core insight:** the one-pager and the full PRD are *the same content at different fidelities*. Modern PRD Lifecycle already treats them this way — Stage 1 is a one-pager; Stage 3 is the full spec. Same sections, longer forms.

### Section → output mapping

| PRD section | Source skill / artifact | One-pager form | Full PRD form |
|---|---|---|---|
| Problem | `map-opportunities` target opportunity | 1–2 sentences | Narrative + evidence block |
| Evidence | `synthesize-research` / OST snapshots | One quote + one stat | Full story set + data |
| Metrics | `define-metrics` (filtered to feature) | Headline NSM + delta target | NSM + secondary + guardrails |
| Predicted impact | `size-impact` | Single range estimate | Full cascade + sensitivities |
| Solution | chosen approach from `map-risks` | Sketch / 3 bullets | Full design + edge cases |
| Risks | `map-risks` validation plan | Top-3 risks | Full map + validation plan |
| AI evals | `write-rubric` | Vibe check threshold line | Full rubric + judge link |
| Stakeholders / GTM | `align-stakeholders` | Key blocker + ask | Full map + pre-align sequence |
| Decisions | linked `document-decision` docs | Key trade-off named | Embedded SPIDER docs |
| Impact review | `review-impact` (Stage 5) | Goal vs result | Full retro |

### `compile-prd` is a composer, not an author

The Socratic thinking happens in the section skills. `compile-prd` is mostly mechanical:

1. Scans `Work/` for existing section artifacts.
2. Reports sharp vs. thin: *"Problem sharp (map-opportunities, 2 days old). Metrics sharp. Impact thin — no sizing artifact. Risks sharp. Evals missing (AI feature)."*
3. Asks: *"Compile at Stage 1 (one-pager for exec ask), Stage 2 (kickoff with mocks), or Stage 3 (full spec for eng)?"*
4. For thin sections, offers to invoke the sharpener skill *or* compile with the section tagged (`impact-unsized`, `evals-unplanned`).
5. Emits the PRD at the requested fidelity.

This is why section skills are valuable: the thinking invested in one `size-impact` session pays off across the one-pager (for VP), the kickoff PRD (for eng), and the retro one-pager (for review). Think once, emit many.

### Implication for section skills

Every Layer 2 section skill must emit its artifact in a form that `compile-prd` can slot into both a one-pager *and* a full PRD. Practically this means:

- Lead with the one-sentence version (used for one-pager)
- Follow with the full explanation (used for full PRD)
- End with the data/table/sketch (used for both at different depths)

If a section artifact can't compress to one sentence without losing meaning, the section skill hasn't finished its Socratic work.

---

## Meta-skill pattern (setup, routing, utility)

Not every skill fits the five-phase Socratic spine. Three kinds don't:

- **Setup skills** (`setup-context`) — interview-driven but produce context *about the PM*, not a PM deliverable. No quality bar in the traditional sense; no framework as challenger.
- **Routing skills** (deprecated `brainstorm`) — match an ambiguous user situation to the right skill. Claude Code's description-based autoselect handles this; a dedicated router is redundant.
- **Utility skills** (deprecated `daily`) — scan-and-report tools. These are better as shell hooks or slash micro-commands, not as full skills.

**For setup skills, the pattern is:**
1. Context load (if any) — usually nothing to load on first run
2. Interview — structured, covers the required fields; does not need to challenge
3. Artifact emission — write the context files directly, show diffs as you go
4. Verification — read-back to the PM, offer edits before exit

No plan checkpoint. No quality bar with framework citations. No handoff offer beyond "you're ready — try `/agentic-pm:write-strategy` or `/agentic-pm:map-opportunities` next."

**Do not create new routing or utility skills.** If a new skill is neither Socratic nor setup, it probably shouldn't exist — it's a hook or a micro-command.

---

## Anti-patterns — do not do these

- **Fill-the-template opening.** "Let's start with the problem statement. What's the problem?" — this is a form, not a discussion.
- **20-question intake.** If it takes 20 questions to understand the situation, the questions aren't doing Socratic work; they're extracting inputs.
- **Framework as scaffold, not challenger.** "Now let's apply OST. The outcome is ___. The opportunities are ___." — this uses the framework as a fill-in-the-blank instead of a pressure test.
- **Emit on "OK, looks good."** The PM's confirmation of a draft is not the same as the PM's confidence in the reasoning. The plan checkpoint (phase 3) is where confidence is built; the plan emission (phase 5) is the capture.
- **Quality bar without citations.** Checks like "Is the strategy clear?" are opinions. Replace with the wiki-cited version or drop them.
- **Auto-chain to downstream skills.** Offer the handoff; never invoke it without the PM's say-so.

## Retrofit checklist for existing skills

For each skill, audit against the pattern:

- [ ] Has a discovery interview section with 5–8 challenge-style questions, each citing a framework when one applies
- [ ] Has a plan checkpoint that reflects, proposes an approach, names concerns, and waits for PM confirmation
- [ ] Sub-steps position the framework as challenger, not template — each step has a "push back if" moment
- [ ] Every quality-bar check cites a specific framework concept verbatim
- [ ] Tag propagation named for every recommended-but-declined practice
- [ ] Ends with named next action + explicit handoff offer + completion status
- [ ] Offers speed mode as an explicit fallback at session start

Skills passing all seven are pattern-conformant. Skills failing two or more need a rewrite before adding new capabilities.
