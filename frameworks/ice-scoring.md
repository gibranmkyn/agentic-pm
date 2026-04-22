---
name: ICE Scoring
aliases: [ICE Score, ICE Prioritization, Impact Confidence Ease]
author: Itamar Gilad
source_type: article
source: "Evidence-Guided Development (Gilad, Lenny's Podcast, 2023)"
use_when:
  - You need a quick directional sort of ideas without a financial model
  - You're early-stage or data-sparse and DRICE would be fabrication
  - You want to make confidence and evidence quality explicit in the ranking
  - You have a long list of experiments and need to pick which to run first
tags: [prioritization, experimentation, evidence, frameworks]
---

# ICE Scoring

A rapid idea prioritization method that scores candidates on three dimensions — Impact, Confidence, and Ease — and multiplies them to produce a ranking. Part of Itamar Gilad's GIST Framework, used to sequence experiments before committing resources. Its distinguishing feature: Confidence is scored explicitly, forcing teams to name what evidence actually supports each idea rather than treating all ideas as equally believable.

**Author:** Itamar Gilad — *Evidence-Guided Development* (Lenny's Podcast, 2023). See [itamargilad.com](https://itamargilad.com).

---

## The formula

**ICE = Impact × Confidence × Ease**

Score each dimension 0–10 independently. Then multiply.

| Dimension | What to score | Low (1–3) | High (8–10) |
|---|---|---|---|
| **Impact** | How much will this move the goal metric if it works? | Marginal; rounding error | Order-of-magnitude shift |
| **Confidence** | How certain are you that it will work? | Wild guess; zero evidence | Strong evidence from research or prior experiments |
| **Ease** | How little effort does this require? | Months of engineering and design | Hours of work |

Score range: 0–1,000 (in practice, scores cluster 20–200).

---

## Why multiply, not add

Adding I + C + E rewards ideas that are high on any single dimension. You end up running high-confidence, low-impact busywork alongside high-impact, zero-confidence long shots. Multiplication penalizes ideas that score near zero on any dimension:

- High Impact + High Ease + Confidence near zero = you're gambling on a big bet with no evidence behind it
- High Confidence + High Ease + Impact near zero = you're doing work that won't matter

Multiplication enforces that all three must be meaningfully present. An idea that falls apart on any one dimension falls out of the ranking.

---

## Confidence is the key differentiator

Most prioritization methods (RICE, Value/Effort matrices) treat all ideas as if confidence is equal — the assumption is that if you thought of it, it's worth testing. ICE makes epistemic state explicit and numerical.

What counts as high confidence (7–10):
- User research showing this is a genuine pain point for many people
- Analytics data proving the problem exists at scale
- Prior experiments with this approach that worked
- Strong analogies from similar products with validated results

What counts as low confidence (1–3):
- "I think this will work"
- A stakeholder requested it
- It feels logical given the product vision
- A competitor has something like it

The Confidence score is where most teams lie to themselves. Gilad's emphasis: score Confidence against actual evidence, not enthusiasm or seniority of the person proposing the idea.

---

## Where ICE sits in GIST

ICE is the **Steps-layer tool** in Gilad's GIST Framework (Goals → Indicators → Steps → Tasks). It ranks which experiments (Steps) to run next in service of a given Indicator.

This placement matters: ICE does not help you pick which Goal to pursue or which Indicator to move. It assumes you've already decided those things. ICE prioritizes the experiments, not the strategy.

---

## Running an ICE session

1. List all candidate experiments for your current Goal-Indicator pair. Everything goes on the list — no pre-filtering.
2. Score each idea independently on Impact, Confidence, and Ease (1–10).
3. Multiply to get the ICE score.
4. Sort descending.
5. Run highest-scoring experiments first.
6. As experiments complete, update Confidence scores on related ideas based on what you learned.

The ongoing update in step 6 is what makes the list a living document rather than a one-time exercise. Confidence earned from past experiments should inform the ranking of future ones.

---

## Limitations

**Gaming risk.** Teams inflate Confidence for ideas they already want to build. The fix: require that each Confidence score cites a specific piece of evidence. "8/10 because we saw this frustration in 6 of our last 8 user interviews" is honest. "8/10 because I'm pretty sure this will work" is not.

**Not a substitute for strategy.** ICE tells you which experiments to run first given a goal. It cannot help you choose the right goal. High ICE scores on the wrong goal are still wrong.

**Ease is seductive.** Teams chronically overweight Ease, ranking quick wins over high-impact bets. Watch for a list that's all easy-medium items — it may indicate the team is optimizing for velocity over outcomes.

---

## ICE vs. DRICE

| | ICE | DRICE |
|---|---|---|
| Best for | Quick sort; early-stage; sparse data | Financial modeling; mature funnel; defensible to leadership |
| Data required | Low — evidence quality assessment | High — real analytics for bottom-up models |
| Output | Ranked list with scores | Ranked list with dollar estimates |
| Time to run | 30–60 minutes for a set of ideas | 30 minutes *per shortlisted idea* |
| When to use | You need direction, not precision | You need to commit engineering resources with accountability |

Use ICE early. Graduate to DRICE when your funnel has real analytics and your experiment win rate starts declining.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Confidence scored by gut feel | Require evidence citations for any score above 5 |
| All items scored similarly (gaming) | Run calibration: compare two extreme items (obvious hit vs. obvious flop) to anchor the scale |
| Pre-filtering before scoring | Everything goes on the list; let ICE do the filtering |
| Impact and Ease dominate; Confidence ignored | Discuss Confidence scores explicitly; don't just multiply silently |

---

## When NOT to use it

- When you have real funnel analytics and need a defensible financial model. Use DRICE.
- When you're choosing a strategy or OKR target. ICE ranks experiments within a goal, not goals themselves.
- When the ideas are fundamentally incomparable (comparing a feature vs. a pricing change vs. a partnership). Score those in separate buckets.

---

## Further reading

- Itamar Gilad — *Evidence-Guided Development* (Lenny's Podcast, 2023) — primary source
- Itamar Gilad — [itamargilad.com](https://itamargilad.com) — full GIST Framework articles and templates
- DRICE (this repo) — the financial modeling alternative; use when you have real analytics

---

*This card is an original synthesis of Itamar Gilad's ICE method from his GIST Framework. For the full context, read the primary source.*
