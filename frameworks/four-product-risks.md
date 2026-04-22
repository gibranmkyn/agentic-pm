---
name: Four Product Risks
aliases: [Product Risk Framework, Value Usability Feasibility Viability]
author: Marty Cagan
source_type: book
source: "Inspired (Cagan, SVPG Press, 2017)"
use_when:
  - You're about to invest in building something and want to know what could kill it
  - You need to prioritize which risk to address first
  - A feature shipped and underperformed — you need to diagnose why
tags: [risk, discovery, validation, product-management]
---

# Four Product Risks

Every feature or product bet can fail in exactly four ways. Marty Cagan's framework names them so you can address them deliberately rather than discovering them in post-launch retrospectives.

Most teams over-index on one type of risk (usually value) while assuming the others are fine. The framework pushes you to make explicit decisions about all four before committing resources.

**Author:** Marty Cagan — *Inspired* (SVPG Press, 2017); SVPG blog. See [svpg.com](https://www.svpg.com).

---

## The four risks

### A. Value risk
Will customers find this valuable enough to use or pay for it?

This is the soul of the product. If you miss this, nothing else matters. The failure mode is building something technically excellent that nobody wants — 42% of startups cite "no market need" as their primary cause of failure.

De-risk with: customer interviews, smoke tests, pre-sales, prototypes, MVPs.

### B. Usability risk
Can users actually reach the value without abandoning first?

You can have genuine product value and still fail here. If users can't discover, understand, or complete the core action, the value is inaccessible. Classic failure mode: a product that performs in demos but generates confusion in real use.

De-risk with: usability testing, prototype testing, session recordings, heatmaps.

### C. Feasibility risk
Can the team actually build what's been designed?

In deterministic software, most things are buildable — feasibility risk is usually a sequencing or scoping problem. In AI products, this risk is the governing constraint: model capability must be measured empirically before assuming the product is buildable. See [Feasibility-First Inversion](feasibility-first-inversion.md).

De-risk with: technical spikes, architecture assessments, Prompt-as-MVP (for AI features), low-fidelity technical prototypes.

### D. Business viability risk
Does this product make sense within the broader business ecosystem?

Revenue model, regulatory constraints, strategic alignment, competitive dynamics, legal exposure. Even products with real value, good usability, and solid feasibility can fail here. Kodak invented the digital camera and couldn't adapt its business model to capitalize on it.

De-risk with: business model validation, regulatory review, financial modeling, stakeholder alignment.

---

## How to apply it

1. **Before any significant investment, run all four.** Which risks are known? Which are unknown? Which unknown risks would kill the product if they're not resolved?
2. **Prioritize the riskiest unknown.** Don't default to value risk because it's comfortable and familiar. See [Riskiest Hypothesis Sequencing](riskiest-hypothesis-sequencing.md).
3. **Match the validation technique to the risk type.** A customer interview doesn't de-risk feasibility. A prototype doesn't de-risk business model viability. The technique must target the specific risk.
4. **Revisit after launch.** Risk isn't a pre-launch checklist — it's continuous. Competitive moves, regulatory changes, and new technical constraints can create new risks post-launch.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Only validating value risk | Run all four, even briefly. A one-sentence check on feasibility and viability is better than none. |
| Conflating feasibility with "can we build it technically?" | Technical buildability is necessary but not sufficient; also covers time, skill, and for AI products, model capability |
| Treating risk management as a one-time phase | Risk is a continuous activity, not a pre-launch gate |
| PM owns all four alone | Designers own usability; engineers own feasibility; PM integrates and ensures all are addressed |

---

## When NOT to use it

- As a bureaucratic checklist every sprint — use it at decision points (before investing in a new bet, before committing to a solution), not as a recurring ritual.

---

## Connection to other frameworks

- [Riskiest Hypothesis Sequencing](riskiest-hypothesis-sequencing.md) — once you've identified the risks, sequencing tells you which to address first.
- [Feasibility-First Inversion](feasibility-first-inversion.md) — for AI products, the order changes: feasibility is the first gate, not the last.
- [Opportunity Solution Tree](opportunity-solution-tree.md) — the OST's assumption tests are designed to address all four risk types under each solution.

---

## Further reading

- Marty Cagan — *Inspired: How to Create Tech Products Customers Love* (SVPG Press, 2017)
- Marty Cagan — *Empowered* (SVPG Press, 2020)
- Marty Cagan — [svpg.com](https://www.svpg.com) — essays and case studies

---

*This card is an original synthesis. For the full treatment, read Cagan's books and SVPG blog.*
