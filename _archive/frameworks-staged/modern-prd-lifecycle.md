---
name: Modern PRD Lifecycle
aliases: [PRD Lifecycle, 5-Stage PRD, PRD as Living Document]
author: Aakash Gupta
source_type: article
source: "PRDs: A Modern Guide (Gupta, Product Growth, 2023)"
use_when:
  - You're writing a PRD and aren't sure how much detail is appropriate for your stage
  - A PRD became stale or oversized and the team stopped using it
  - You want to set the right quality expectation — not "complete" but "right for stage"
tags: [prd, pm-craft, planning, product-management]
---

# Modern PRD Lifecycle

A PRD is not a document you write once before kickoff and file away. It's a living artifact that evolves across five stages of the product development cycle. At each stage, it should contain exactly what's useful — no more, no less. Templates that require 40 sections at Stage 1 create false completeness; skeletal documents at Stage 4 leave engineering questions unanswered.

The goal at each stage is clarity, not completeness.

**Author:** Aakash Gupta — *PRDs: A Modern Guide* (Product Growth, 2023). See [aakashg.com](https://www.aakashg.com).

---

## Five stages

### Stage 1 — Planning
Written during the planning cycle, when the team is exploring a new problem area.

Minimum contents:
- **Problem** — what's being considered; why it matters
- **Metrics** — relevant data, current-state failure signals
- **Qualitative evidence** — customer quotes, behaviors, competitive signals — embedded, not linked out
- **Next steps** — gaps in understanding, owners, timelines

Not a full PRD — a speclet that will grow. The point is to make the decision to invest (or not invest) against this problem concrete and reviewable.

### Stage 2 — Kickoff
Once the team has committed to the problem and is moving into solution space.

Add:
- **Potential solution** — rough wireframe or napkin mock; PM creates one, but designers should be free to blow it up
- **Metrics to measure** — North Star, secondary, and guardrail (counter) metrics
- **Impact sizing** — model of expected movement in input (OKR) and output (company) metrics

Missing counter-metrics at kickoff is one of the top-5 PRD mistakes. Features almost always have side effects; naming them upfront turns surprises into decisions.

### Stage 3 — Solution review
After the design team has explored the solution space.

Add:
- **Edge cases** — all known edge cases for the narrowed solution
- **Rollout plan** — experiment design, gradual rollout, GA timeline
- **XFN requirements** — what cross-functional partners (legal, sales, support, security) need to deliver
- **Tracking and analytics requirements** — event specifications for engineering
- **GTM strategy** — how marketing and sales will enable the feature
- **Risks and mitigation** — named risks and their mitigants

### Stage 4 — Launch readiness
Engineering review and final checks before shipping.

Verify:
- All engineering concerns addressed
- Design (Figma) complete
- Tasks created and estimated
- GTM enabled
- Financials reviewed
- QA plan in place

### Stage 5 — Impact review
After launch: update the PRD with a link to the results document. Most PMs skip this. The best ones don't — future engineers, PMs, and leaders digging into why a feature was built will thank you.

---

## The 8/10 quality target

The right quality target for most features is 8/10, not 10/10.

A 10/10 PRD requires 7+ years of PM experience, 2+ weeks of work, and executive review. It's appropriate for one feature per quarter — the one that gets CEO review.

An 8/10 PRD takes 1–2 days in collaboration with the team. That's the default target.

The difference between 8 and 10: proprietary internal data, a complete impact sizing model with financial projections, a working prototype that users can react to, and usability testing before alpha. For most features, this investment is not proportional to the risk.

---

## Use a rolling checklist, not a template

Templates enforce all sections regardless of relevance. A checklist grows with the document.

| Stage | Checklist items |
|---|---|
| Planning | Problem defined? Current-state failure documented? Business metrics identified? Qualitative evidence included? Next steps clear? |
| Kickoff | Solution mock added? NSM + guardrail metrics specified? Impact sizing modeled? |
| Solution Review | Edge cases enumerated? Rollout plan specified? XFN requirements listed? Tracking events specified? GTM outlined? Risks named? |
| Launch Readiness | Eng concerns addressed? Design complete? Tasks created? GTM enabled? Financials cleared? |
| Impact Review | Results doc linked? Monitoring plan in place? |

---

## Common failure modes

| Failure | Fix |
|---|---|
| PM never writes the PRD | Speed is real, but anything you want to measure needs a PRD |
| No impact sizing | Name an expected metric movement at Stage 2 or hand off to `/agentic-pm:measure` |
| User evidence linked-out, not embedded | Copy the salient quote or finding directly into the document |
| Missing counter-metrics | Specify guardrail metrics at Stage 2 alongside primary metrics |
| Skipping Stage 5 | Impact review is not optional — link the results doc post-launch |

---

## Connection to other frameworks

- [Impact Sizing](impact-sizing.md) — the Stage 2 artifact for modeling expected metric movement.
- [Guardrail Metrics](guardrail-metrics.md) — the counter-metrics required at Stage 2.
- [Opportunity Solution Tree](opportunity-solution-tree.md) — Stage 1 problem section should reference the OST target opportunity if discovery has been run.

---

## Further reading

- Aakash Gupta — *PRDs: A Modern Guide* (Product Growth, 2023) — public article
- Aakash Gupta — [aakashg.com](https://www.aakashg.com)

---

*This card is an original synthesis. For the full treatment, read Gupta's article.*
