---
name: Impact Sizing
aliases: [Feature Impact Sizing, Quantitative Sizing, Impact Estimation]
author: Aakash Gupta, Carl Vellotti
source_type: article
source: "Advanced Guide to Impact Sizing (Gupta + Vellotti, Product Growth, 2026)"
use_when:
  - You need to choose between roadmap options and gut-feel RICE scores aren't convincing leadership
  - You're designing an experiment and need to know what effect size to power for
  - You want to understand which design levers in a feature actually move the number
tags: [metrics, prioritization, modeling, product-management]
---

# Impact Sizing

An honest engagement-to-revenue model for a feature before you build it. Not a point estimate — a cascade of assumptions that exposes where your uncertainty lives and forces you to de-risk the weakest links before committing resources.

The gold standard for established products with sufficient data. Not appropriate before PMF, when metrics move too fast to model reliably.

**Authors:** Aakash Gupta + Carl Vellotti — *Advanced Guide to Impact Sizing* (Product Growth newsletter, 2026). See [aakashg.com](https://www.aakashg.com).

---

## Four-step process

### Step 1 — Estimate usage

Build a funnel from total product users down to users who will engage with this specific feature:

- How many users are **eligible** (not just in the product — actually in the part of the product where this feature lives)?
- How often will eligible users be **exposed** to the feature per period?
- Of those exposed, what fraction will **engage**?

Multiply each layer to get engaged users per period.

### Step 2 — Calculate impact via cascade

Work top-down through three layers:

1. **Engagement impact** — change in DAU/MAU, retention rate, feature adoption
2. **Top-line impact** — revenue from engagement (engaged users × conversion rate × average order value × take rate)
3. **Bottom-line impact** — profit from revenue (revenue × product-specific margin)

For each layer, prefer first-principles modeling from feature mechanics over historical correlation multipliers — correlations break at feature boundaries.

### Step 3 — De-risk the weakest assumptions

After the first draft, identify the riskiest assumptions:

- Stale data point → request a fresh pull from analytics
- Uncertain adoption rate → run a prototype test
- Unknown benchmark → check industry data or competitor disclosures
- Questionable mechanism → validate the causal claim before modeling it

Don't refine the whole model. Spend time only on the assumptions that would change the priority decision if they moved.

### Step 4 — Identify takeaways

The model drives three things:
1. **Prioritization** — which features to build first (compare models across candidates)
2. **Experiment design** — what effect size to power for; how long to run
3. **Feature design** — which levers (exposure rate, conversion rate, retention delta) move the number most — design toward those

---

## How to present it

Express output as a range, not a point estimate. "This feature is likely to increase revenue by $2M–$4M per year, with the central estimate at $3M, and the primary uncertainty being whether 30-day retention improves." Leadership trusts ranges more than false precision.

Build an institutional memory spreadsheet — one tab per feature sized. After 12 months, you have 25+ calibration data points that make future estimates faster and more credible.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Sizing everything — including tech debt | Don't size tech or design debt; use Kano or effort-based frameworks instead |
| Point estimates presented with false confidence | Always show ranges; name the single riskiest assumption |
| Delegating entirely to analytics | PM owns the first draft; analyst enhances it. The PM's context about user behavior and feature mechanics is essential for identifying the right funnel |
| Modeling pre-PMF | Metrics are too volatile; focus on qualitative signals instead |

---

## When NOT to use it

- Pre-PMF products — the metrics aren't stable enough to model.
- Tech debt or design debt — the business case for these is operational, not feature-economics.
- When you don't have enough data to estimate the key funnel stages within an order of magnitude — rough analogs are fine, fabricated funnels are not.

---

## Connection to other frameworks

- [Metric Trees](metric-trees.md) — identify where in the metric tree this feature sits before building the cascade. The tree shows you which parent metrics the feature should move.
- [North Star Metric](north-star-metric.md) — the top-line impact in the cascade should connect to the NSM.
- [Appetite vs. Estimate](appetite-vs-estimate.md) — when planning cycles, sizing informs appetite decisions; the two work together.

---

## Further reading

- Aakash Gupta + Carl Vellotti — *Advanced Guide to Impact Sizing* (Product Growth, 2026)
- Aakash Gupta — [aakashg.com](https://www.aakashg.com) — PM strategy and prioritization content

---

*This card is an original synthesis. For the full treatment with worked examples, read the source article.*
