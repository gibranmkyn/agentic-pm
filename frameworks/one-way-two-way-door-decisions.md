---
name: One-Way vs. Two-Way Door Decisions
aliases: [One-Way Door, Two-Way Door, Type 1 Type 2 Decisions, Reversible Decisions]
author: Jeff Bezos (Amazon)
source_type: article
source: "Amazon 2015 Shareholder Letter (Bezos, 2015)"
use_when:
  - You're about to spend a week analyzing a decision that could be undone in a day
  - The team is treating a reversible choice with the same weight as an architectural commitment
  - You need a quick filter to determine how much process a decision deserves
tags: [decision-making, product-management, speed, leadership]
---

# One-Way vs. Two-Way Door Decisions

Every decision has a reversibility cost. Most teams apply the same amount of deliberation to every decision — which means they over-analyze reversible ones and sometimes under-analyze irreversible ones. This framework provides the filter.

Jeff Bezos introduced the distinction in Amazon's 2015 shareholder letter. The metaphor is intuitive: a two-way door can be walked back through; a one-way door cannot.

**Author:** Jeff Bezos — Amazon shareholder letter (2015). Publicly available at [aboutamazon.com](https://www.aboutamazon.com). Referenced widely in PM and leadership literature.

---

## The framework

### Two-way door (reversible)
- Can be undone if wrong — low reversal cost
- Examples: feature flags, pricing experiments, UI layout changes, a new product launch that can be rolled back
- **Default behavior:** decide quickly with incomplete information; ship and correct

### One-way door (irreversible or costly to reverse)
- High cost of reversal — technical debt, user trust, legal commitment, or sunken cost
- Examples: core data architecture changes, major rebranding, deprecating a feature users depend on, a public commitment
- **Default behavior:** slow down; take the time to get it right; involve more senior decision-makers

---

## How to apply it

Before entering analysis mode on any decision, ask one question: **Is this reversible?**

If yes: make the best call you can with current information, ship it, and adjust based on what you learn. The cost of a wrong two-way-door decision is one iteration cycle, not permanent damage.

If no: the decision deserves proportional analysis. Involve the right stakeholders, document reasoning (a [SPIDER document](spider-decision-framework.md) is appropriate here), and take the time to get it right.

---

## Common failure modes

| Failure | Result |
|---|---|
| Treating two-way doors as one-way | Excessive analysis, delayed shipping, lost learning — most teams do this constantly |
| Treating one-way doors as two-way | Irreversible damage — happens less often but the cost is high |
| No one asks the reversibility question | The default is to treat everything as high-stakes; this framework's only value is in asking the question before picking the process |

---

## When NOT to use it

- When the stakes are genuinely high and the reversibility isn't clear — ask the question out loud with the team rather than deciding alone. The taxonomy is most useful when it's shared.
- When you're already too deep into analysis on a reversible decision — apply it earlier, not as a post-hoc justification to skip the work.

---

## Connection to other frameworks

- [SPIDER Decision Framework](spider-decision-framework.md) — SPIDER is appropriate for one-way door decisions and significant two-way door decisions. Mini-SPIDER (two sentences) covers most team-level reversible calls.

---

## Further reading

- Jeff Bezos — Amazon 2015 Shareholder Letter (publicly available at aboutamazon.com)
- Tatyana Mamut on Lenny's Podcast (2024) — extends the two-door taxonomy to a three-type model
- Colin Bryar & Bill Carr — *Working Backwards* (St. Martin's Press, 2021) — the full Amazon decision-making operating system

---

*This card is an original synthesis. The framework is attributed to Jeff Bezos; for context on how Amazon applies it, read Working Backwards.*
