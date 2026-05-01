---
name: DRICE
aliases: [Detailed RICE, DRICE Framework, DRICE Prioritization]
author: Darius Contractor, Alexey Komissarouk
source_type: article
source: "DRICE Prioritization Framework (Contractor + Komissarouk, 2023)"
use_when:
  - You have a shortlist of initiatives and need a defensible financial model to rank them
  - Your experiment win rate has dropped below 70% and easy wins are gone
  - You need to tell leadership "give us X engineers and we'll generate $Y next quarter"
  - Standard RICE scoring is producing rankings that feel wrong but you can't explain why
tags: [prioritization, growth, financial-modeling, experimentation]
---

# DRICE

A two-stage prioritization process that extends classic RICE with a 30-minute deep estimation step. The output isn't a score — it's a specific expected annual revenue number per initiative, allowing direct ROI comparison. Created at Dropbox by Darius Contractor and Alexey Komissarouk after observing that standard RICE produced misleading rankings and buried the highest-actual-ROI bets.

**Authors:** Darius Contractor + Alexey Komissarouk — *DRICE Prioritization Framework* (2023). Darius Contractor was Head of Growth at Dropbox and later Facebook.

---

## The problem with standard RICE

Classic RICE scoring produces a number that feels rigorous but isn't. Every dimension is a T-shirt size estimate — a qualitative guess converted to a multiplier. Two ideas with the same RICE score might have wildly different actual ROI depending on what the fuzzy estimates actually represent. And ideas that are genuinely complex but high-value often get penalized by the Effort denominator before anyone bothers to understand why they're worth it.

DRICE's answer: use RICE to screen, not to decide. Then invest 30 minutes per shortlisted idea to produce a real number.

---

## Stage 1 — RICE fast screening

Score every candidate idea on four dimensions using T-shirt sizes (S/M/L):

| Dimension | What to estimate |
|---|---|
| **Reach** | What percentage of users would experience this change? |
| **Impact** | If it works, how much would it shift conversion or the target metric? |
| **Confidence** | How likely is it to work? What's your prior? |
| **Effort** | How many weeks of engineering? |

Formula: `Score = (Reach% × Impact% × Confidence%) / Weeks of effort`

Sort all ideas descending by score. Take **2× as many ideas as you can build this quarter** — this is the shortlist. Validate suspicious scores with the team before locking it in. Someone always has information that changes a dimension.

The goal here is to get from "all ideas" to a manageable shortlist fast, not to produce a final ranking.

---

## Stage 2 — DRICE deep estimation

For each shortlisted idea, invest ~30 minutes to produce four things:

**1. Hypothesis**
A clear statement of what will change and why, plus a quantified expected impact. Not "improve conversion" but "improve conversion on the free trial → paid upgrade screen by 2.7%, generating $540k/year." The quantification forces specificity. Vague hypotheses hide weak ideas.

**2. Impact estimate (PM-owned)**
Bottom-up financial model built from real analytics data. Pull the actual numbers: how many users hit this step? What's current conversion? What does a 1% improvement mean in dollars? The model doesn't need to be precise — it needs to be honest. PM owns this.

**3. Engineering estimate (engineer-owned)**
An engineer reviews the PM's hypothesis and kicks the tires on the technical assumptions. This step regularly reveals ideas that are far simpler — or far harder — than the RICE estimate suggested. Engineers also often spot opportunities the PM missed.

**4. Non-engineering effort**
Design, legal, marketing, support overhead. Usually secondary unless unusually large. Worth noting; often ignored until late.

Result: every shortlisted idea now has a specific expected annual revenue number. You can compare them directly.

---

## Why this changes what you build

The Dropbox Migration Tool example: this idea scored poorly on standard RICE (moderate reach, complex engineering) and was about to be deprioritized. A 30-minute DRICE investigation surfaced analytics data showing that migrating teams to the Business plan was the highest-ROI activation bet in the quarter. It became the biggest win.

The counterpart: ideas that "feel" high-potential often deflate quickly under 30 minutes of investigation. Better to find this out before the sprint.

---

## When to adopt DRICE

Use experiment win rate as the signal. When your win rate is above 70%, obvious wins remain. The DRICE overhead isn't worth it — standard RICE is enough. When win rate drops below 70%, the easy wins are gone and you need more rigorous evaluation to find good bets.

Most growth teams hit this inflection 12–18 months into a mature product area.

---

## How to use the output

The DRICE output — a ranked list of shortlisted ideas with specific dollar estimates — enables three conversations that standard RICE can't:

1. **Managing up:** "Give us 4 engineers this quarter and we'll generate $2.1M in pipeline improvements" — auditable, specific, evaluated against actual outcomes
2. **Tradeoff conversations:** Two ideas with the same RICE score might be $200k vs. $1.2M when modeled. The choice is now clear.
3. **Post-mortems:** You have a specific forecast to compare against actual results. Teams that track forecasts versus actuals improve at estimation rapidly.

---

## Common failure modes

| Failure | What goes wrong |
|---|---|
| Using DRICE to screen (not just rank) | DRICE is expensive — use RICE for screening, DRICE for the shortlist only |
| PM owns the engineering estimate | Engineers do the engineering estimate; PMs do the impact model |
| No real analytics data in the model | "I think conversion is around 30%" defeats the purpose; pull actual numbers |
| Skipping suspicious RICE scores | Team members regularly have information that changes a score; validate before locking |
| Treating the dollar estimate as precise | It's a directional model, not a CFO forecast; communicate it as a range |

---

## When NOT to use it

- When you're exploring an entirely new problem space with no meaningful analytics. You can't bottom-up model what you don't understand yet. Use discovery first.
- When the team is early-stage and most ideas are greenfield. DRICE works on existing user funnels with real conversion data. Without that data, the models are fabrications.
- When you need to prioritize one idea, not many. DRICE is a relative ranking tool. If you have one bet and are asking "should we do this," use a different lens.

---

## Further reading

- Darius Contractor + Alexey Komissarouk — *DRICE Prioritization Framework* (2023) — primary source with Dropbox case study, PayPal example, and templates
- ICE Scoring (this repo) — the simpler prioritization method; use when data is sparse
- RICE framework — the starting point DRICE extends

---

*This card is an original synthesis of the DRICE framework. For the Dropbox case study and templates, read the primary source.*
