---
name: Guardrail Metrics
aliases: [Counter Metrics, Tripwire Metrics]
author: Aakash Gupta, Ronny Kohavi
source_type: article
source: "Experiment Metrics Framework (Gupta, Product Growth, 2026); Trustworthy Online Controlled Experiments (Kohavi, 2020)"
use_when:
  - You're launching a feature or running an experiment and need to define what "do not harm" looks like
  - Leadership is asking whether a positive primary metric could be masking damage elsewhere
  - You're writing a PRD and need to specify the success metrics section completely
tags: [metrics, experimentation, product-management, safety]
---

# Guardrail Metrics

Pre-agreed metrics that, if breached, signal a feature should not ship — even when the primary metric is positive. Every experiment has an objective it's trying to move. Guardrails define the constraints: what must not break in the process.

Optimizing a single metric without guardrails creates perverse incentives. More emails sent means more engagement, until it means inbox abuse and unsubscribes. Faster search indexing means better results, until it means drained battery and complaints. Guardrails make the "no second-order harms" constraint explicit before it's too late to design around it.

**Authors:** Aakash Gupta + Ronny Kohavi — *Experiment Metrics Framework* (Product Growth, 2026); *Trustworthy Online Controlled Experiments* (Kohavi, Cambridge University Press, 2020).

---

## Three types of guardrail metrics

**Business integrity guardrails** — protect the commercial engine from being exploited:
- Fraud rate
- Refund or return rate
- Revenue per user for adjacent teams (your feature's OEC might improve your metric while damaging another team's)

**User experience guardrails** — protect the product from degrading:
- Page load time / service latency
- Error rate and crash rate
- NPS or customer satisfaction scores
- Support ticket volume

**Product ecosystem guardrails** — protect other features from being cannibalized:
- Feature cannibalization (an AI writing assistant cannibalizing a template feature)
- Cross-team metric impact
- Quality degradation in adjacent flows

---

## The Microsoft case study

Ronny Kohavi: a Windows Search improvement was confirmed experimentally to improve search speed significantly. But battery life was measured as a guardrail. The search indexer drained battery life. The experiment was not shipped.

This didn't kill the feature — it created the right sequence. The team fixed the back-off algorithm for battery usage. Once fixed, the search improvement shipped with both benefits intact. The guardrail prevented a bad ship and produced a better product.

---

## How to apply it

1. **Before the experiment, not after.** Agree on guardrails with stakeholders before results are in. Post-hoc guardrail selection is confirmation bias.
2. **Name the business assumption.** For each proposed guardrail, articulate the specific harm it protects against: "if latency increases beyond X ms, users will abandon the feature."
3. **Set explicit thresholds.** "Latency must not increase by more than 50ms" is a guardrail. "Latency should be fine" is not.
4. **Make them visible in the results writeup.** Report guardrail metrics in the results document whether they moved positively or negatively — symmetrically, not selectively.

---

## Common failure modes

| Failure | Fix |
|---|---|
| No guardrails defined before experiment | Define them during PRD/experiment design, not after results |
| Guardrails selected post-hoc to rationalize a ship | Pre-register and document before running |
| Missing cross-team guardrails | Ask: does this feature compete for any resource with another team's feature? |
| Treating all breaches as hard stops | Discuss with stakeholders: is this a hard blocker or a reason to investigate and re-design? |

---

## When NOT to use it

- For exploratory qualitative research — guardrails apply to experiments with quantitative success metrics.
- When you have no baseline data to set thresholds — establish baselines before running the experiment.

---

## Connection to other frameworks

- [North Star Metric](north-star-metric.md) and [Impact Sizing](impact-sizing.md) — these define the primary metrics; guardrails define the constraints around them.
- [Modern PRD Lifecycle](modern-prd-lifecycle.md) — Stage 2 (Kickoff) requires counter/guardrail metrics specified alongside primary metrics; missing this is listed as one of the top-5 PRD mistakes.

---

## Further reading

- Ronny Kohavi, Diane Tang, Ya Xu — *Trustworthy Online Controlled Experiments* (Cambridge University Press, 2020)
- Aakash Gupta — *Experiment Metrics Framework* (Product Growth, 2026)
- Aakash Gupta — [aakashg.com](https://www.aakashg.com)

---

*This card is an original synthesis. For the full treatment, read Kohavi's book.*
