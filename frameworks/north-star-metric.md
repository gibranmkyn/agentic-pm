---
name: North Star Metric
aliases: [NSM, North Star]
author: Sarah Tavel, Itamar Gilad, Lauryn Isford
source_type: article
source: "Hierarchy of Engagement (Tavel, 2018); Evidence-Guided (Gilad, 2023); Mastering Onboarding (Isford, Reforge, 2023)"
use_when:
  - Your teams are pointed at different metrics and can't make cross-team tradeoffs
  - You're not sure whether the metric you're optimizing actually reflects user value
  - You're designing the metric structure for a new product or team
tags: [metrics, strategy, growth, product-management]
---

# North Star Metric

A single metric that captures the core value a product delivers to customers. If you improve it, long-term business health improves. If you optimize for things around it, you can make the business look healthy while destroying the value that sustains it.

The North Star Metric is not a business metric. It's not revenue, not DAU, not downloads. Those are outputs. The NSM is the value-delivery metric that drives them. When you chase revenue directly, you're often trading the customer relationships that produce revenue for short-term extraction.

**Authors:** Sarah Tavel (Benchmark) — *Hierarchy of Engagement* (2018); Itamar Gilad — *Evidence-Guided* (2023); Lauryn Isford — *Mastering Onboarding* (Reforge, 2023).

---

## What makes a good NSM

A well-chosen North Star Metric has five properties:

1. **Reflects value delivery** — it measures something customers actually care about, not just activity
2. **Predicts long-term retention** — improving it should reduce churn; if it doesn't, you've chosen the wrong metric
3. **Actionable** — teams can move it through product decisions (not just market conditions)
4. **Singular** — having two NSMs means having none; tradeoffs between them become unresolvable
5. **Right lag** — lagging enough to be real (revenue is too lagging), leading enough to be actionable (clicks are too gameable)

Classic examples: Airbnb → nights booked. Spotify → time spent listening. Slack → messages sent within a team.

---

## How to find your NSM (via the core action)

Sarah Tavel's method: start from the bottom up, not the top down.

1. **List every action users can take** in your product.
2. **For each action, ask:** what % of users complete it, and what's their probability of returning next week if they do?
3. **The action with the highest return-correlation** is your core action.
4. **The NSM is a rate or volume of the core action** — not a downstream business metric.

For Pinterest, this analysis pointed to pinning. "Weekly active pinners" became the NSM, not monthly active users or time on site.

---

## Common failure modes

| Failure | Why it breaks |
|---|---|
| Vanity metrics as NSM (MAU, downloads, signups) | These tell you nothing about value delivered; they can grow while the product dies |
| NSM divorced from retention | If improving it doesn't reduce churn, you've optimized the wrong thing |
| NSM that can be gamed | Messages sent → optimize for spam; need messages read and replied to instead |
| Two NSMs | Makes cross-team tradeoffs impossible; each team optimizes its own metric |
| Direct revenue optimization | Chasing revenue destroys the value that produces it |

---

## When NOT to use it

- Pre-PMF: you don't yet know which user behavior predicts retention. Focus on qualitative signals until you've identified the core action empirically.
- When you have no data on user behavior — the NSM must be grounded in observed behavior, not assumed value.

---

## Connection to other frameworks

- [Hierarchy of Engagement](hierarchy-of-engagement.md) — Tavel's framework for finding the core action that the NSM should measure.
- [Metric Trees](metric-trees.md) — the NSM sits at the top of the metric tree; the tree decomposes how you move it.
- [Guardrail Metrics](guardrail-metrics.md) — NSM improvement must not come at the cost of guardrail breaches.

---

## Further reading

- Sarah Tavel — *Hierarchy of Engagement* (Benchmark blog, 2018) — public essay
- Itamar Gilad — *Evidence-Guided* (2023); [itamargilad.com](https://itamargilad.com)
- Lauryn Isford — *Mastering Onboarding* (Reforge, 2023)
- Lenny Rachitsky — *North Star Metrics by Company* (Lenny's Newsletter, public) — examples across 50+ companies

---

*This card is an original synthesis drawing from multiple public sources. For the full treatment, read Tavel's essay and Gilad's book.*
