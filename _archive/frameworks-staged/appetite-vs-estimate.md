---
name: Appetite vs. Estimate
aliases: [Appetite, Time-boxing, Shape Up time model]
author: Jason Fried
source_type: book
source: "Shape Up (Fried, Basecamp / 37signals, 2019)"
use_when:
  - A project keeps growing and the deadline keeps slipping
  - You need to communicate to engineering how much time is available, not how much time is needed
  - You want to prevent scope creep before it starts, not manage it after it appears
tags: [planning, product-development, scope, time-management]
---

# Appetite vs. Estimate

Two ways to begin a project. Estimate says: "Given this full scope, how long will it take?" Appetite says: "Given this time box, what's the best version we can ship?" These are not interchangeable. One fixes scope and asks for time; the other fixes time and makes scope the variable.

Most teams default to estimate, then blame Parkinson's Law when scope expands to fill the time. Appetite inverts the dynamic: the time box is the constraint, and the team's job is to find the highest-value version of the idea that fits.

**Author:** Jason Fried — *Shape Up* (Basecamp / 37signals, 2019). Free at [basecamp.com/shapeup](https://basecamp.com/shapeup).

---

## The distinction

**Estimate model:**
- Scope is fixed; time is variable
- "How long will it take to build the full feature?"
- Result: scope creep, delayed deadlines, Parkinson's Law
- Teams optimize to add to scope, not to deliver value within time

**Appetite model:**
- Time is fixed; scope is variable
- "How long are we willing to spend on this, given everything else we could be doing?"
- Result: creative constraint forces simplification; teams optimize for the highest-value subset that ships on time
- Scope is the safety valve, not the deadline

---

## In Shape Up practice

Shape Up uses two appetite sizes:
- **Small batch** — 1–2 week cycles: small improvements, minor additions
- **Big batch** — up to 6-week cycles: substantial new features or significant redesigns

The appetite is declared at the start of shaping, before any solution work happens. This prevents the common failure where an exciting solution gets scoped first and then the time estimate "surprises" everyone.

When scope grows beyond the appetite during a cycle, the right response is to **cut scope**, not extend time. The 6-week cycle is a hard constraint, not a suggestion.

---

## How to apply it

1. **Set the appetite first, before shaping.** Ask: given everything else on the roadmap, how much are we willing to invest here? 2 weeks? 6 weeks?
2. **Shape to fit the appetite.** Define the rough solution and explicitly identify rabbit holes — parts of the idea that could expand scope. Shape around them.
3. **Write the appetite into the pitch.** Every pitch starts with the appetite declared. Engineers see it from day one.
4. **When scope grows, cut, don't extend.** What can we defer to v2? What can we do simpler? Extending time is almost never the right answer.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Estimating instead of setting appetite | Ask "how long are we willing to spend?" before "how long will it take?" |
| Appetite treated as a suggestion | The time box is a constraint. Ship at the deadline with reduced scope if necessary. |
| Not naming rabbit holes during shaping | Problems that expand scope should be identified and explicitly parked before the cycle starts |
| Appetite set post-hoc to match the estimate | This is just estimation with extra steps. The appetite must be set based on opportunity cost, not scope. |

---

## When NOT to use it

- Maintenance work, bug fixes, and compliance work: these have a defined scope that can't be easily traded — use estimates.
- When you genuinely don't know enough about the problem to set an appetite responsibly — do discovery first.

---

## Connection to other frameworks

- [Impact Sizing](impact-sizing.md) — sizing a feature's expected impact helps set a proportional appetite; a $500K opportunity doesn't warrant a 6-week cycle.
- [Shape Up](shape-up.md) — appetite is a core concept within Shape Up; this card isolates it for use outside the full methodology.

---

## Further reading

- Jason Fried — *Shape Up* (Basecamp, 2019) — free book at basecamp.com/shapeup
- Jason Fried on Lenny's Podcast (2023) — appetite vs. estimate and how 37signals runs cycles

---

*This card is an original synthesis. For the full treatment, read Shape Up — it's free.*
