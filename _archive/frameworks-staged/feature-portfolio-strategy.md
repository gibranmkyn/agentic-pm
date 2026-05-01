---
name: Feature Portfolio Strategy
aliases: [Feature Portfolio Management, TARS Feature Framework, Feature Evaluation Portfolio]
author: Michael (Reforge, ex-Twitter/X, ex-Descript)
source_type: course
source: "Dud Feature Strategy (Reforge, 2024)"
use_when:
  - You have many existing features and aren't sure which deserve continued investment
  - A feature launched and underperformed, and you need to diagnose whether to fix or kill it
  - You're building a quarterly roadmap and need a structured way to evaluate the portfolio alongside new bets
tags: [product-strategy, feature-evaluation, portfolio, roadmap]
---

# Feature Portfolio Strategy

Product strategy isn't only about what to build next. It's also about what to do with what you've already built. Most product teams over-index on roadmap planning — new features — and under-invest in portfolio management — evaluating the health of existing features. Dud features accumulate; the cost is the engineering, design, and PM bandwidth required to maintain them.

**Attribution note:** This framework is attributed to "Michael" — a Reforge instructor, former VP Product at Twitter/X and Descript. Full surname not available in the public record. Attribution to Reforge course (2024).

---

## Portfolio view (adoption × satisfaction matrix)

Map existing features across adoption and satisfaction dimensions to surface investment priorities:

| | High satisfaction | Low satisfaction |
|---|---|---|
| **High adoption** | Move on — no more incremental investment | Hidden detractor — urgent fix needed |
| **Low adoption** | Discovery problem — marketing/surface work | Redesign or kill |

The most dangerous quadrant is high adoption + low satisfaction. These users are trapped by switching costs, not value. They're churn risks when an alternative appears and they're damaging NPS and word-of-mouth today.

---

## TARS: the evaluation tool for individual features

TARS (Target → Adoption → Retention → Satisfaction) diagnoses a single feature at each stage:

**T — Target:** Define the baseline — which active users are most likely to get value from this feature? Express as a % of total active users to set a realistic ceiling for what "great adoption" looks like.

**A — Adoption:** What % of target users have actively used the feature post-launch? Low adoption typically traces to one of four causes: lack of awareness, poor discoverability, high friction, or wrong target definition.

**R — Retention:** Of adopted users, who returns at the natural periodicity of the use case? The critical rule: measure retention at the *natural cadence* of the feature — not daily if the natural use is monthly. Wrong periodicity produces wrong conclusions.

**S — Satisfaction:** Of retained users, how easy and valuable do they find it? Measure with Customer Effort Score (CES), triggered immediately after task completion. High retention + low satisfaction = hidden detractor.

---

## Five portfolio decisions

For any feature at the portfolio level:

1. **Improve** — adoption and retention are present; friction and CES issues can be addressed with targeted UX work
2. **Redesign** — low retention and satisfaction; the fundamental feature concept needs rethinking
3. **Move on** — hitting all targets; stop incremental investment; reallocate to higher-priority work
4. **Kill** — not solving the problem, causing bad UX, hurting downstream metrics; stop investing
5. **Roll back** — actively harmful; publicly remove the feature

---

## How to apply it

1. **Set TARS goals upfront, before launch.** For strategically important features, agree on what "good" looks like for each stage before the feature ships. This removes sunk cost from the later evaluation.
2. **Run a quarterly portfolio review.** Rank all existing features. Apply the matrix. Surface the hidden detractors — they're the ones worth fixing most urgently.
3. **Use time as a constraint.** For new features, set explicit timelines for each TARS stage. Forces the conversation about how you'll drive awareness and discovery, not just whether the feature is good.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Measuring daily retention on a monthly-use feature | Identify the natural cadence first; measure against it |
| Keeping dud features out of sunk cost | Ask: given what we know now, what's the expected future return on continued investment? |
| No TARS goals set before launch | Pre-register goals so post-launch evaluation is objective |
| Treating "high adoption" as success without checking satisfaction | The hidden detractor quadrant kills long-term retention |

---

## When NOT to use it

- For brand-new, never-shipped features — TARS requires real usage data to be meaningful.
- For features with insufficient time in market — run TARS at 4, 8, and 12 weeks, not the week after launch.

---

## Further reading

- Reforge — *Dud Feature Strategy* (2024) — primary source
- Ronny Kohavi — *Trustworthy Online Controlled Experiments* (Cambridge University Press, 2020) — broader experimentation context

---

*This card is an original synthesis. Attribution to Reforge instructor "Michael"; full surname not available. For the full treatment, consult the Reforge course.*
