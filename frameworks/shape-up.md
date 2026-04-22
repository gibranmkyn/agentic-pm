---
name: Shape Up
aliases: [ShapeUp, Shape Up Methodology]
author: Jason Fried
source_type: book
source: "Shape Up (Fried, 37signals / Basecamp, 2019)"
use_when:
  - You're tired of sprints that don't produce finished features
  - Projects keep expanding and deadlines keep slipping
  - You want to give teams full ownership without losing product direction
tags: [product-development, planning, methodology, scope]
---

# Shape Up

A product development methodology from 37signals (Basecamp). The core departure from Agile/Scrum: six-week fixed cycles with appetite-based scoping, no product backlog, and teams that own their own work breakdown. The goal is to ship finished, meaningful work rather than sprint after sprint of partial progress.

Free book at [basecamp.com/shapeup](https://basecamp.com/shapeup).

**Author:** Jason Fried — *Shape Up* (37signals, 2019). See [37signals.com](https://37signals.com).

---

## Core principles

### 6-week maximum cycles
Work happens in cycles of up to 6 weeks. Most projects are shorter. No project extends beyond 6 weeks without being re-shaped from scratch. 6 weeks is long enough for meaningful work; short enough to prevent open-ended drift.

### Appetite, not estimates
The critical distinction: an estimate asks "how long will this take?" An appetite asks "how long are we willing to spend?"

- **Estimate model:** scope is fixed, time is variable → scope creep, Parkinson's Law
- **Appetite model:** time is fixed, scope is variable → teams find the highest-value version that fits

See [Appetite vs. Estimate](appetite-vs-estimate.md) for the standalone concept.

Two appetite sizes:
- **Small batch** — 1–2 weeks (minor improvements, small additions)
- **Big batch** — up to 6 weeks (substantial features or significant redesigns)

### Shaping
Before a cycle, senior people do the shaping work: define the rough scope, make key design decisions, identify risky rabbit holes, and name explicit out-of-scope items. Shaping is done in rough wireframes and prose — not detailed specs.

The shaped pitch communicates: what problem is being solved, why now, what the rough solution is, and what known risks exist. Engineers receive the pitch; they create their own work breakdown.

### Two-person teams
One designer + one or two engineers per project. Small teams stay agile, communicate cheaply, and own their work. No PM assigning tickets.

### Two-week cooldown
After every 6-week cycle: two weeks of unstructured time. Teams use this to fix things that bothered them, explore speculative ideas, or simply rest. Nothing from the current cooldown can become a commitment in the next cycle without shaping.

---

## What Shape Up does NOT include

- No sprints, no daily standups
- No product backlog (treated as a source of debt and organizational weight)
- No story points, velocity tracking, or burn-down charts
- No requirement to finish — if a bet doesn't pay off in 6 weeks, it can be cut without ceremony

---

## How to apply it

1. **Set the appetite before shaping.** What's this worth — small batch or big batch? This decision is made before any solution work begins.
2. **Shape the pitch.** Senior designer/PM works rough scope, key decisions, rabbit holes, no-gos. Rough wireframes and prose, not specs.
3. **Pitch to betting table.** Leadership reviews shaped pitches and decides which to fund in the next cycle.
4. **Assign to team.** Team receives the shaped pitch — no backlog items, no task list. They build their own breakdown.
5. **6-week cycle runs.** If scope grows beyond appetite, cut scope — don't extend time.
6. **Cooldown.** Two weeks of unstructured time before the next cycle.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Shaping by one person without design input | Shaping requires both product and design thinking; over-specified pitches remove the team's autonomy |
| Treating appetite as a suggestion | When scope grows, cut scope — the time box is a constraint, not a guideline |
| Maintaining a product backlog "just in case" | Shape Up requires abandoning the backlog; old ideas can be re-pitched if still relevant |
| Applying it to teams that need daily coordination | Shape Up requires high trust and autonomy; it's not appropriate for teams that need close management |

---

## When NOT to use it

- Operations or infrastructure teams with unpredictable, interrupt-driven work — the 6-week cycle structure requires predictability.
- Organizations with external commitments to specific features on specific dates — appetite-based scoping conflicts with contract-driven delivery.
- Teams without senior people who can do shaping — if no one can shape the work before the cycle, teams will use the cycle to figure out the problem, which the methodology explicitly doesn't intend.

---

## Connection to other frameworks

- [Appetite vs. Estimate](appetite-vs-estimate.md) — the core Shape Up concept, isolated for use outside the full methodology.
- [Impact Sizing](impact-sizing.md) — sizing a feature's expected impact helps set a proportional appetite.

---

## Further reading

- Jason Fried — *Shape Up* (37signals, 2019) — free at [basecamp.com/shapeup](https://basecamp.com/shapeup)
- Jason Fried on Lenny's Podcast (2023) — cycles, appetite, and how 37signals runs product development

---

*This card is an original synthesis. For the full treatment, read Shape Up — it's free.*
