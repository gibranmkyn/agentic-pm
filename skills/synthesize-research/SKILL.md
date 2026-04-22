---
name: synthesize-research
description: "Turn raw interview transcripts into JTBD switch stories, Four Forces analysis, and testable hypotheses. Use when you have customer interviews and need insights that feed an OST, a risk map, or a PRD. If you don't have transcripts yet, use plan-research instead. If your goal is building an opportunity tree, use map-opportunities which ingests transcripts directly."
allowed-tools: Read Grep Glob Write Edit
---

# Synthesize-research — From transcripts to hypotheses

Moesta JTBD by default (narrative, switch stories, Four Forces). Ulwick ODI when quantitative prioritization is needed. Produces a Research Report and per-interview snapshots.

---

## Context to load

- `context/COMPANY.md`
- `context/GOALS.md`
- `context/PRODUCTS.md`

If any are template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan:**
- `Work/research/snapshots/` — prior switch-story snapshots (incremental synthesis)
- `Work/discovery/snapshots/` — OST snapshots (may overlap)
- `Work/research/<topic>-brief.md` — triggering research plan, if this is downstream of plan-research

---

## Frameworks this skill loads

- `frameworks/jobs-to-be-done.md` — Moesta (default) + Ulwick (quantitative) variants
- `frameworks/opportunity-solution-tree.md` — for Torres-cadence synthesis (3–4 at a time) and handoff compatibility

Read before running.

---

## Speed-mode choice

> "Coach me through the synthesis (30–60 min — we'll code Four Forces per story and distinguish causal reality from stated preference together) or draft-then-edit (10 min — I'll produce a report with the JTBD skeleton for you to fill in)?"

Default to coach. Draft mode applies `speed-mode-used`.

---

## Discovery interview

Read context + any existing snapshots first. Push on these:

1. **"How were these participants recruited? Exit interviews, active users, power users, churned users, cold outreach?"** — Recruitment shapes everything. Exit interviews oversample problems. Power-user interviews oversample edge cases. Name the bias before synthesizing.

2. **"Did these people *actually switch* from something to your product (or to a competitor)? JTBD only works with real switch stories — 'plan to' gives no behavioral signal."** *(JTBD Moesta: "only interview people who've already switched.")* If the sample is non-switchers, flag that JTBD may not apply; offer alternatives.

3. **"How many transcripts, how fresh? More than a month old is getting stale."** — Recent switches produce sharper narratives; older stories lose the causal detail.

4. **"Are you looking for the narrative story behind the switch (Moesta), or quantitative importance × satisfaction scoring to prioritize (Ulwick)? Don't mix them mid-project."** *(JTBD: "Don't mix variants.")*

5. **"What decision is this synthesis going to inform? An OST update, a PRD problem statement, a pivot debate, or something else?"** — Determines what output the synthesis prioritizes.

6. **"Before you read the transcripts yourself — what do you think the pattern will be? Name your prior."** — Surfaces confirmation bias risk. Everyone has a prior; naming it lets the synthesis challenge rather than reinforce it.

7. **"For any one story — do you know what they were doing before (push), what they expected after (pull), what worried them (anxiety), and what they were attached to in the old way (habit)?"** *(JTBD: Four Forces.)* If the transcripts don't support all four, the synthesis will be one-sided.

Interview until you can answer: Real switchers? What decision does this feed? Moesta or Ulwick? What's the PM's prior?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — sample quality, recency, real-switch count, downstream decision.
2. **"Here's the approach"** — Moesta or Ulwick; how many transcripts to code per batch (Torres's 3–4 cadence); what the output will emphasize.
3. **"Here are my concerns"** — non-switcher sample, stale transcripts, confirmation bias, mixed methods.

Ask: **"Want to adjust before I start?"**

Do not produce the report until the PM confirms.

---

## Step-by-step flow (Moesta, default)

1. **Discovery interview** (minimum 5 questions).
2. **Plan checkpoint.** Wait for PM confirmation.
3. **Transcript intake + cleanup.** For each, produce a snapshot with: experience map (chronological), opportunities surfaced, quick facts (segment), one verbatim salient quote (no paraphrase), misc insights. Save each to `Work/research/snapshots/YYYY-MM-DD-<participant-id>.md`.
4. **Extract JTBD switch story** per interview with a real switch. Skip interviews with no switch; tag them `no-switch-moment`.
5. **Code Four Forces** per story:
   - **Push** — dissatisfaction driving the switch
   - **Pull** — attraction to the new outcome
   - **Anxiety** — fear of the new solution
   - **Habit** — attachment to the current way
6. **Layer-3 causal reality filtering.** Distinguish Layer-1 (surface: what they say) and Layer-2 (fantasy/nightmare: exaggerated) from Layer-3 (causal reality: what actually drove the switch). *(JTBD: "three layers of language.")*
7. **Cluster insights in batches of 3–4** (Torres cadence). Don't synthesize 12 interviews at once.
8. **Frame testable hypotheses.** Each insight cluster generates ≥1 falsifiable hypothesis.
9. **Offer handoff** (do not auto-chain). Let the PM choose: feed `/agentic-pm:map-opportunities` (OST), `/agentic-pm:map-risks` (risk-rank), or `/agentic-pm:compile-prd` (Evidence section).
10. **Self-validate** against the quality bar.
11. **Produce the Research Report** at `Work/research/<topic>-report.md` + keep the snapshots in `Work/research/snapshots/`.

---

## Step-by-step flow (Ulwick ODI)

1. Interview + checkpoint as above.
2. Extract desired-outcome statements per interview (stable across participants).
3. Score each outcome on importance × satisfaction.
4. Identify under-served outcomes (high importance, low satisfaction) as priority signal.
5. Produce report with outcome table + priorities. Do not mix Moesta narrative language.

---

## Quality bar

- [ ] JTBD interviews only with people who already switched — *JTBD: "only interview people who've already switched"*
- [ ] Four Forces coded per switch story (Push / Pull / Anxiety / Habit) — *JTBD: Four Forces*
- [ ] Layer-3 vs. Layer-1/2 distinguished — *JTBD: "three layers of language"*
- [ ] Revealed behavior prioritized over stated preference — *JTBD: "93% said they wanted Energy Star; almost none bought for that reason"*
- [ ] Moesta and Ulwick not mixed mid-project — *JTBD: "Don't mix variants"*
- [ ] JTBD flagged unsuitable when no memorable switch moment — *JTBD: "When NOT to use JTBD"*
- [ ] Synthesis in batches of 3–4, not all at once — *OST Torres cadence*
- [ ] Verbatim quotes preserved (no paraphrase of the salient quote) — *OST snapshot template*

---

## Tag propagation

- `jtbd-invalid-sample` — synthesis done on non-switchers
- `synthesis-overfit` — 12+ interviews synthesized without intermediate clustering
- `confirmation-bias-risk` — prior not tested against data
- `stale-transcripts` — interviews >3 months old
- `speed-mode-used`

---

## Handoffs

- **Upstream:** `/agentic-pm:plan-research` (if this synthesis closes a planned gap)
- **Downstream (offer, not auto-chain):**
  - `/agentic-pm:map-opportunities` — feed switch stories into an OST
  - `/agentic-pm:map-risks` — turn hypotheses into risk-ranked assumptions
  - `/agentic-pm:compile-prd` — Evidence section content

---

## Output

- `Work/research/<topic>-report.md` — the report
- `Work/research/snapshots/YYYY-MM-DD-<participant-id>.md` — durable per-interview evidence (survives report rebuilds)

---

## End every session with

- The top 1–2 hypotheses generated + which downstream skill should consume them.
- The single strongest verbatim quote (Layer-3) that you'd lead a stakeholder conversation with.

---

## Completion status

- **DONE** — report written, snapshots saved, all checks passed, no tags
- **DONE_WITH_CONCERNS** — tags applied (list each)
- **BLOCKED** — no real switchers in the sample; offer alternative method
- **NEEDS_CONTEXT** — sample quality unclear; ask about recruitment before synthesizing

Escalation: if the sample contains no real switchers, stop Moesta JTBD. Offer a different method (ODI / generative interviews / usability) or recommend `/agentic-pm:plan-research` to recruit properly.
