---
name: Metric Trees
aliases: [Metric Tree, KPI Tree, Metric Hierarchy]
author: Itamar Gilad
source_type: book
source: "Evidence-Guided (Gilad, 2023)"
use_when:
  - You're prioritizing ideas and need a rigorous Impact score
  - Your team can't explain how their work connects to business outcomes
  - You're defending a roadmap to leadership and need a traceable chain from feature → metric → outcome
tags: [metrics, prioritization, strategy]
---

# Metric Trees

A hierarchy that maps the causal relationship between **low-level product metrics you can move** and **high-level business outcomes that matter**. Each branch in the tree is a causal claim: *"if we improve this sub-driver, it will increase its parent metric."*

**Author:** Itamar Gilad — *Evidence-Guided* (2023). See [itamargilad.com](https://itamargilad.com).

---

## Structure

```
Business outcome (revenue, growth, margin)
 └─ North Star metric (a measure of user value delivered)
     ├─ Driver metric A
     │   ├─ Sub-driver A1
     │   └─ Sub-driver A2
     └─ Driver metric B
         ├─ Sub-driver B1
         └─ Sub-driver B2
```

Each edge represents a causal claim. The tree captures your team's **theory** of how daily work rolls up into outcomes. It is a hypothesis, not a fact.

---

## Why it matters for prioritization

Without a metric tree, teams rank ideas by intuition and politics. With a metric tree:

1. **Each idea maps to a specific node** it's intended to move.
2. **Leverage is visible.** Improving a node by X% implies a specific (estimable) effect on the parent, grandparent, and root outcome.
3. **Impact scoring becomes rigorous.** The "I" in ICE/RICE is no longer a guess — it's an expected delta traced through the tree.

---

## How to build one

1. **Start with the business outcome.** What does the company have to deliver to investors/stakeholders?
2. **Identify the North Star metric.** One metric that represents user value delivered. User value is what drives the business outcome — skip this layer and you'll optimize for vanity.
3. **Decompose the North Star into 3–5 driver metrics.** What, when improved, causally moves the North Star?
4. **Decompose each driver into sub-drivers** that product teams can directly influence.
5. **Validate the causal claims with data.** Does improving the sub-driver actually move the driver? Correlation is easy; causation is what you need.

Aim for **3–4 levels deep, 3–5 branches per level**. Beyond that, the tree becomes unmanageable.

---

## The causal validation requirement (the most-skipped step)

Many metric trees are drawn with assumed causality that doesn't hold.

Example of a tree that looks reasonable but may be broken:
> "If we increase feature adoption → retention goes up → revenue goes up."

This chain often fails when the adopted feature is shallow engagement that doesn't reflect genuine value. Adopters churn at the same rate as non-adopters. The causal link is broken.

**Validation methods:**
- Natural experiments in historical data (segments who used the feature vs. segments who didn't, matched on other traits)
- A/B tests on the sub-driver
- Correlation + plausible mechanism + no confounders

Gilad's rule: **metric trees are hypotheses, not facts.** Treat them as testable claims.

---

## Common mistakes

| Mistake | Why it breaks | Fix |
|---|---|---|
| Too many nodes (50+) | Unmanageable; no one uses it | 3–4 levels, 3–5 branches per level |
| Vanity metrics as nodes | Page views, raw signups — feels good to move, doesn't connect to value | Require a causal link to the North Star |
| Missing North Star | Direct product-action → business-outcome chain creates misaligned incentives | Insert a user-value metric between product action and business outcome |
| Built once, treated as fixed | Business changes, tree rots | Revisit at least annually; more often in early-stage |

---

## Connection to other frameworks

- **ICE / RICE scoring** — the "Impact" dimension becomes rigorous only when you can trace the affected node to the root outcome.
- **Opportunity Solution Tree** — the OST's business outcome sits at the top of the metric tree. They are complementary: metric tree tells you *where* leverage lives; OST tells you *why* customers would let you pull that lever.
- **North Star Metric** — the metric tree is how you operationalize the North Star below the top line.

---

## When NOT to use it

- Pre-product-market-fit — you don't yet know which metrics matter. Focus on qualitative signals and one or two leading indicators.
- Crisis mode — if the company is on fire, fix the fire first.
- As a political document — if leadership is using the tree to defend existing work rather than test it, the tree is theater.

---

## Further reading

- Itamar Gilad — *Evidence-Guided* (2023)
- Itamar Gilad on Lenny's Podcast (Sept 2023) — metric trees walkthrough
- Itamar Gilad's blog — [itamargilad.com](https://itamargilad.com) for templates and case studies

---

*This card is an original synthesis. For the full treatment, read Gilad's book.*
