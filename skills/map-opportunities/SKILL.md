---
name: map-opportunities
description: "Map the opportunity space for a business outcome, surface unmet customer needs from real stories, and pick a target. Use when you have an outcome to move and need to figure out which customer problems to pursue."
allowed-tools: Read Grep Glob Write Edit
---

# Opportunity — Map and Prioritize Your Opportunity Space

Produces a populated opportunity tree with a selected target — grounded in customer stories, not brainstorming.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first** — this skill's output is useless without context.

Also read upstream artifacts when present:
- `Work/discovery/<product>-ost.md` (if updating an existing tree)

---

## Frameworks this skill loads

- `frameworks/opportunity-solution-tree.md` — primary spine
- `frameworks/okps-trees.md` — alternate spine when OKR-native teams prefer it
- `frameworks/jobs-to-be-done.md` — for switch-story inputs from research

Read these before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to challenge the PM's assumptions about the opportunity space before mapping it.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"How confident are you that [outcome metric from GOALS.md] is the right thing to map? What if it's a symptom, not the root cause?"** Challenges the root assumption. A tree rooted in the wrong outcome produces a well-structured wrong answer.

2. **"What does your team already believe the problem is? I'm asking so I know what biases we're walking in with."** Surfaces priors. If the team already has a hypothesis, the tree risks becoming a confirmation exercise instead of a discovery exercise. *(OST: "Opportunities must emerge from customer stories, not brainstorming.")*

3. **"These transcripts — how were participants recruited? Exit interviews, active users, power users, churned users?"** The recruitment lens shapes what you hear. Exit interviews oversample problems. Power user interviews oversample edge cases. A mix is ideal; a monoculture is a blind spot.

4. **"Have you already picked a solution in your head? Be honest."** Most PMs have. Naming it explicitly means the tree can include it alongside 3–4 others instead of being unconsciously shaped by it. *(OST: "Force 3–5 solutions per opportunity before picking one.")*

5. **"How many of these stories describe what people actually did vs. what people say they want?"** *(OST: evidence-type tagging — `[story]` vs `[opinion]`. Only stories anchor opportunities.)* If most input is opinion, flag it before the PM invests in a tree built on weak signal.

6. **"What customer segment are these stories from? Your best users, worst users, or a mix?"** The tree will look completely different depending on which. A tree from churned users maps exit pain. A tree from power users maps engagement depth. Both are valid; neither is complete.

7. **"Is there a stakeholder who already has a preferred solution they're pushing? If so, the tree needs to include it — but alongside alternatives."** Political reality. Ignoring the exec's pet feature means the tree gets overruled. Including it as one of four options means the tree becomes the tool for evaluating it fairly.

8. **"What would change your mind about the target opportunity? Name a specific finding that would make you pick a different one."** Tests falsifiability. If nothing could change the PM's mind, the tree is theater, not discovery.

Interview until you can answer: What's the real outcome? What biases are we carrying? How strong is the evidence? Is the PM genuinely open to being surprised?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the outcome metric, the evidence quality, the biases you surfaced, and any political constraints.
2. **"Here's the approach"** — which spine (OST / OKPS / two trees), how many transcripts to process, what the tree will and won't cover.
3. **"Here are my concerns"** — evidence gaps (too few stories, single segment, opinion-heavy), pre-existing solution bias, outcome metric questions.

Ask: **"Want to adjust before I start building the tree?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Based on the interview, determine the spine. If not already clear, ask directly:
1. What outcome metric are you trying to move? (If none, stop and clarify — the tree requires one.)
2. Is your team structured around OKRs, or do you use "opportunity" language?
3. Is this B2B with a distinct buyer vs. end-user?
4. Are you creating a new tree or updating an existing one?

Pick spine:
- **Default / opportunity language** → OST (Outcome → Opportunities → Solutions → Assumption Tests)
- **OKR-native team or `--use-okps` flag** → OKPS (Objective → Key Result → Problem → Solution)
- **B2B with buyer ≠ end user** → Two OSTs — one per persona (buyer tree + end-user tree), each rooted in its own outcome

---

## Tiered input pipeline

Before surfacing opportunities, process inputs through four tiers:

**Tier 1 — Raw transcripts:** For each transcript provided, produce a snapshot: experience map (chronological), opportunities (unmet needs), quick facts (segment), one verbatim salient quote (no paraphrase), misc insights. Save each to `Work/discovery/snapshots/YYYY-MM-DD-<participant-id>.md`.

**Tier 2 — Evidence-type tags on every opportunity:**
- `[story]` — behavioral, anchored in a specific past event → primary evidence
- `[opinion]` — stated preference, no behavioral anchor → flagged; used as weak signal only
- `[survey/top-of-mind]` — **rejected outright** with explanation; prompt for story excavation instead

**Tier 3 — AI-synthesis constraint:** Opportunities derived only from cross-transcript synthesis (no single behavioral anchor) tagged `[AI-synthesized]` and flagged for human spot-check before tree placement.

**Tier 4 — Snapshot persistence:** Save each snapshot to `Work/discovery/snapshots/`. The tree is rebuilt incrementally from snapshots, 3–4 at a time (per Torres's cadence).

---

## Situation-triggered add-on blocks

- **B2B split** — when buyer ≠ end user: produce two trees with a linking note on where the outcome hierarchies intersect.
- **OKPS overlay** — when GOALS.md is OKR-shaped or user passes `--use-okps`: restructure the tree as Objective → Key Result → Problem → Solution instead of Outcome → Opportunity → Solution.

---

## Step-by-step flow

1. **Discovery interview.** Read context files. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the spine you'd pick, evidence quality assessment, concerns. Wait for PM approval before producing anything.
3. **Detect spine and B2B signal** from the interview. Name the outcome metric anchoring the tree.
2. **Experience-moment decomposition:** break the user journey into 3–7 moments (trigger → in-task → outcome → post-task). These are the candidate opportunity areas.
3. **Process inputs through tiered pipeline.** Produce snapshot files. Surface opportunities with evidence-type tags.
4. **Populate the tree.** Map 3–7 opportunity areas at the top. Flag solutions-in-disguise (capabilities, not experiences).
5. **Select a target.** Rank opportunity areas by: frequency across stories × pain intensity × proximity to the outcome metric. Surface the top candidate and explain the ranking.
6. **Force 3–5 solutions per pursued opportunity.** Refuse to commit to one solution before three others exist.
7. **Name the handoff.** Offer to invoke `/agentic-pm:map-risks` on the target + solution set.
8. **Self-validate.** Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.
9. **Produce the artifact** at `Work/discovery/<product>-ost.md`.

---

## Quality bar

Before finalizing the artifact, verify:

- [ ] Every opportunity sourced from customer stories, not brainstorming — *OST (Torres): "Opportunities must emerge from customer stories"*
- [ ] No solution placed without a parent opportunity above it — *OST: "You cannot place a solution without first naming the opportunity above it"*
- [ ] 3–7 opportunity areas at top of tree (not 20+) — *OST: "Pick 3–7 areas; let the tree be incomplete at the edges"*
- [ ] ≥3 solutions per pursued opportunity — *OST: "Force 3–5 solutions per opportunity before picking one"*
- [ ] Each opportunity is a customer experience moment, not a capability gap — *OST: "An opportunity is a customer experience moment, not a capability gap"*
- [ ] If B2B: buyer and end-user trees are separate — *OST: "In B2B, separate product teams with separate OSTs"*
- [ ] No `[survey/top-of-mind]` data in the tree — *OST: "AI summaries lose 20–40% of important detail"*

If a check fails, name the source concept when flagging the gap.

---

## Tag propagation

- Opportunities with no behavioral story anchor → tag `opportunities-opinion-anchored` on output
- Tree built without any customer transcripts → tag `discovery-unvalidated`

Strongly recommend story-based inputs; never refuse user-provided data.

---

## Handoffs

- **Upstream:** `/agentic-pm:synthesize-research` (provides customer switch stories + JTBD insights)
- **Downstream:** `/agentic-pm:map-risks` (surface and risk-rank assumptions under selected solutions); `/agentic-pm:compile-prd` (target opportunity → PRD problem statement)
- **Discovery-theater safeguard:** skills that generate roadmaps or solution plans require a linked OST from this skill as upstream input.

---

## Output

- `Work/discovery/<product>-ost.md` — the opportunity tree
- `Work/discovery/snapshots/YYYY-MM-DD-<participant-id>.md` — durable evidence per interview

---

## End every session with

- A named next action the PM will do in the next 48 hours (e.g., "run 3 interviews anchored on the top opportunity area before next week").
- A handoff offer: "Want me to surface the riskiest assumptions under these solutions? That's `/agentic-pm:map-risks`."

---

## Completion status

Report exactly one of at close:
- **DONE** — tree written, target selected, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — artifact written but tags applied (list each: `discovery-unvalidated`, `opportunities-opinion-anchored`); state what to address before handing off to `/agentic-pm:map-risks`
- **BLOCKED** — cannot root the tree without an outcome metric; state that and stop
- **NEEDS_CONTEXT** — input insufficient to populate the tree; name the specific gap (no transcripts, no outcome, no product name)

Escalation: if the outcome metric cannot be named after two attempts, stop. The tree cannot exist without one.
