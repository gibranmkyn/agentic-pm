---
name: plan-research
description: "Plan customer research that actually changes a decision. Produces a Research Brief with the decision named, evidence gap identified, method matched, sample framed, and timeline set. Use when a specific decision needs evidence. If you already have transcripts, use synthesize-research instead."
allowed-tools: Read Grep Glob Write Edit
---

# Plan-research — Research that changes a decision

Decision-first: scope the research to close a specific evidence gap. Not exploratory curiosity. Produces a Research Brief executable by a researcher or the PM.

---

## Context to load

- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan:**
- `Work/strategy/<product>-strategy.md` — riskiest strategic dimension may drive the research question
- `Work/discovery/<product>-ost.md` — target opportunity may frame the research scope
- `Work/decisions/` — the triggering decision may already be documented

Report what you found.

---

## Frameworks this skill loads

- `frameworks/decision-first-research.md` — primary spine: Decision-First + Three Feasibility Questions

Read before running.

---

## Speed-mode choice

> "Coach me to a sharp brief (15–30 min — we'll pressure-test the decision, the evidence gap, and the method together) or draft-then-edit (5 min — I'll produce a brief with assumptions flagged)?"

Default to coach. Draft mode applies `speed-mode-used`.

---

## Discovery interview

Read context first. Push on these:

1. **"What specific decision will this research change? Not inform — change. If results come back opposite of what you expect, what will you do differently?"** *(Decision-First: "scope research to close the gap, not the other way around.")* If the PM can't name a decision, the research will produce a report no one acts on.

2. **"Be honest — have you already decided, and you're looking for research to back it up?"** Most PMs have. Naming it means the research can be designed to genuinely test rather than confirm. If confirmation is the real goal, say so — the method changes.

3. **"Who will act on these findings? Are those people involved in designing this research?"** *(Decision-First: "wrong stakeholders" failure mode.)* Retroactive buy-in is weak. If the decision-maker isn't shaping the research questions, they'll dismiss the results.

4. **"Is your research question bounded enough to produce actionable findings? 'Why are users churning?' is too broad. 'Which of three retention interventions should we invest in first?' is bounded."** — Push to narrow until the question has a finite set of possible answers.

5. **"What would surprise you? If nothing could, why are we doing this?"** — Tests genuine openness to learning. Confirmation research wastes time and budget.

6. **"What's the cost of being wrong here? Blast radius?"** — Calibrates rigor. High-stakes → diverse samples, stronger method. Low-stakes → maybe no formal research at all.

7. **"Three Feasibility check: Is this research feasible given your constraints? Is the cost proportional to the stakes? Will the findings actually move the decision forward?"** *(Decision-First: "feasible / reasonable / worthwhile.")* All three must be yes.

Interview until you can answer: What decision? Bounded enough? Right stakeholders involved? Genuinely open to learning?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — the decision, the evidence gap, the stakeholders, the stakes.
2. **"Here's the approach"** — research question as I'd bound it; method that fits the decision; sample size and recruiting lens.
3. **"Here are my concerns"** — decision not specific, wrong stakeholders, confirmation bias risk, cost disproportionate to stakes.

Ask: **"Want to adjust before I start?"**

Do not produce the brief until the PM confirms.

---

## Step-by-step flow

1. **Discovery interview** (minimum 5 questions).
2. **Plan checkpoint.** Wait for PM confirmation.
3. **Clarify the specific decision.** Bound it. Move from open questions to bounded decisions with finite answer sets.
4. **Identify the evidence gap.** What's missing that would change how you'd decide? Only research that closes this gap is worth scoping.
5. **Three Feasibility Questions** — feasible / reasonable / worthwhile. All three yes or stop.
6. **Scope research to close the gap** — method, sample, timeline. The decision determines the method; the gap determines the sample; the stakes determine the rigor.
7. **Involve the right stakeholders.** The people who will act on findings must be involved in designing the questions and method. Retroactive buy-in is weak.
8. **Self-validate** against the quality bar.
9. **Produce the Research Brief** at `Work/research/<topic>-brief.md`.

---

## Quality bar

- [ ] Decision clarified before method chosen — *Decision-First: "scope research to close the gap, not the other way around"*
- [ ] Three Feasibility Questions asked (feasible / reasonable / worthwhile) — *Decision-First*
- [ ] Stakeholders who will act on findings involved in design — *Decision-First: "wrong stakeholders" failure mode*
- [ ] Research question has a finite answer set, not open-ended — *Decision-First*
- [ ] Sample recruiting lens named with bias flagged — *Decision-First: "every sample has a lens"*
- [ ] Timeline realistic vs. decision deadline — *Decision-First: "research that arrives after the decision is curiosity"*
- [ ] Genuine openness to findings — "what would surprise you" has a real answer — *Decision-First*

---

## Tag propagation

- `decision-unclear` — PM could not name a specific decision this research serves
- `wrong-stakeholders` — decision-maker not involved in designing the research
- `confirmation-bias-risk` — PM's prior is strong and research design doesn't actively test it
- `speed-mode-used`

---

## Handoffs

- **Upstream:** `/agentic-pm:write-strategy` (riskiest strategic dimension); `/agentic-pm:document-decision` (a decision that needs evidence)
- **Downstream:** `/agentic-pm:synthesize-research` (when findings arrive); `/agentic-pm:compile-prd` (if the decision was a feature commitment)

---

## Output

`Work/research/<topic>-brief.md`

---

## End every session with

- The specific decision this research will help make, and the date by which it needs an answer.
- The singular riskiest-bias note: "Our biggest risk in this research is [X] — we'll mitigate by [Y]."

---

## Completion status

- **DONE** — brief written, all checks passed, no tags
- **DONE_WITH_CONCERNS** — brief written but tags applied (list each)
- **BLOCKED** — no decision to anchor on, and the PM can't surface one; state that and stop
- **NEEDS_CONTEXT** — decision or stakeholders unclear; ask directly

Escalation: if no decision can be named, stop. Research without a decision is curiosity — it produces outputs no one will act on.
