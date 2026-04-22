---
name: AI Prototyping
aliases: [Divergent Prototyping, Prototype-First Development]
author: Nadav Abrahami, Sachin Rekhi, Boris Cherny
source_type: article
source: "Nadav Abrahami — AI Prototyping Workflow (2026); Sachin Rekhi — Product Shaping (2026); Boris Cherny / Anthropic — Taste at Speed interview (2026)"
use_when:
  - You have a product idea and want to build something testable before committing engineering
  - You're choosing between prototyping tools and need a workflow, not a tool recommendation
  - You want to force genuine exploration instead of anchoring to the first version that works
tags: [prototyping, ai-pm, workflow, discovery]
---

# AI Prototyping

Building working software as the first step in the product process — before PRDs, before design reviews, before sprint planning. The spec moves from step 2 to step 6: you write it after you know what you're building, not before.

**Authors:** Nadav Abrahami — AI Prototyping Workflow (2026); Sachin Rekhi — Product Shaping (2026); Boris Cherny / Anthropic — Taste at Speed interview (2026). See also Teresa Torres — *Continuous Discovery Habits* (2021) for the discovery integration.

---

## The shift

**Old model:** Idea -> PRD -> Design -> Eng builds -> QA -> Ship (8-12 weeks)

**New model:** Idea -> 5 prototypes -> Evaluate -> Kill 4 -> Spec the survivor -> Ship (1-2 weeks)

PRDs existed because building was expensive and you needed sign-off before committing resources. When a prototype takes 45 minutes instead of 6 weeks, authorization documents become overhead. The spec comes *after* the prototype, not before.

---

## Divergent prototyping — the core practice

Build 3-4 variants at roughly the same cost as building 1. This forces genuine comparison rather than incremental refinement of a single direction.

**Why it works:** Working software creates its own gravity — it feels real, making it 10x harder to kill than a marked-up document. Building variants forces comparison. When stakeholders can articulate tradeoffs between approaches (not debate button placement), divergence is working.

**How to force divergence:** Specify the axis of variation, not just "different options." If building a blocker-tracking feature: how do approaches differ in proactiveness, visibility, and automation? Name the axes. Then build one variant per axis.

---

## Three reference workflows

### Abrahami's 5-step workflow
1. **Design system** — establish the visual baseline first
2. **Divergent solutions** — build multiple fundamentally different approaches
3. **Visual editing** — fine-tune the winning direction
4. **End-to-end flow** — complete the full user journey
5. **Test with real users** — validate before productizing

PRD + Prototype standard: the prototype covers 90% of core flows. The PRD covers edge cases, error states, tracking events, handoff details. Both live in the same project folder.

### Cherny / Anthropic workflow
5 parallel terminal tabs, each a separate Claude Code instance in plan mode. Round-robins between them. Engineers review every PR (Claude Code does first code review, human does second). No PRDs — "better send a PR."

Prototyping volumes before shipping: agent teams = hundreds of versions; condensed file view = ~30 + month of dogfooding; terminal spinner = 50-100 iterations with 80% kill rate.

### Torres discovery integration
Prototypes as assumption tests, not just specs. A working prototype triggers a more accurate user response than a wireframe or description. Teams can run more assumption tests per week because prototype creation is no longer the bottleneck.

The constraint that doesn't go away: prototype realism doesn't fix response bias. Customers say they'd use things they wouldn't actually use, especially when looking at a polished demo. Test design still needs to be behavioral.

---

## Sequencing — the problem most PMs have

The tool is not the problem. The sequencing is. (Abrahami)

Before opening any tool:
1. Lock the **problem** (not the solution)
2. Lock the **user story** (specific, behavioral)
3. Agree on the **rough solution shape** (what kind of thing are we building?)

AI prototyping accelerates solution-space work. It does not replace problem-space work. PMs who skip to the tool without completing the problem space work build faster — in the wrong direction.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Anchoring to the first version that works | Build 3-4 variants; specify the axis of variation |
| Treating prototypes as production code | Mark them disposable by default; ask engineering "what breaks in 6 months?" |
| Skipping user testing | Test within 24-48 hours; the prototype exists for feedback, not demos |
| Using AI to avoid thinking | The tool accelerates execution, not strategy. Lock the problem first. |
| Iterating without user feedback | Set a rule: no second iteration without at least one external reaction |
| Growing the prototype into production | Vibe coding is great until it's not; tech debt compounds when a prototype becomes non-trivial |

---

## When NOT to use it

- You haven't locked the problem yet. Prototyping a solution to an unclear problem builds the wrong thing faster.
- Regulated industries where compliance constraints need representation before building — sequence compliance review first.
- You're in pure execution on an already-validated solution — spend the time shipping, not prototyping.

---

## Connection to other frameworks

- [Taste at Speed](taste-at-speed.md) — the filtering function applied after prototyping. Without taste, speed means building the wrong thing faster.
- [Foundation Sprint](foundation-sprint.md) — pre-seed alignment sprint that includes Day 2 prototyping.
- [Vibe Coding](vibe-coding.md) — the PM-specific workflow for building prototypes with AI tools.
- [Opportunity Solution Tree](opportunity-solution-tree.md) — prototyping is a step in the discovery cycle; the OST provides the opportunity that justifies the prototype.

---

## Further reading

- Nadav Abrahami — AI Prototyping Workflow (2026)
- Sachin Rekhi — Product Shaping (2026)
- Boris Cherny / Anthropic — Taste at Speed interview with Aakash Gupta (2026)
- Teresa Torres — *Continuous Discovery Habits* (Product Talk, 2021) — assumption testing with prototypes
- Ravi Mehta — Data-Driven Prototyping (How I AI, 2025)
- Colin Matthews — Component Library Prototyping (2025)

---

*This card is an original synthesis drawing from multiple public sources. For the full treatment, read the original interviews and Torres's book.*
