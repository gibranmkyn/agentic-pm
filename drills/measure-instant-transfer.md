---
skill: /agentic-pm:measure
scenario: A payments fintech launching a new instant-transfer feature. PM needs to know if it's worth building and what to track.
spine: Impact Sizing — tactical path, "is this feature worth building?"
---

# Drill: Instant Transfer Launch — Size the Impact Before Committing

## Situation

Velo is a B2C payments app targeting gig workers and freelancers who get paid via platform payouts (Upwork, Fiverr, Rover). The product team is considering an instant-transfer feature — move your Velo balance to your bank account in under 30 seconds, for a 1.5% fee. Standard transfers are free but take 1–2 business days. The PM needs to answer: is this worth the 6-week engineering sprint? What metrics do we track?

## How the skill ran

### Spine autoselect

The skill asked three questions:

1. **What is your product stage?** — "Growth. We have ~180,000 MAU, PMF is established."
2. **What is the measurement question?** — "Is this feature worth building? What's the expected revenue impact?"
3. **Do you have analytics access?** — "Yes — DAU/MAU, payout frequency, transfer size distribution, current transfer-to-bank volume."

**Spine selected: Impact Sizing (tactical path).** The question is "is this feature worth building?" with analytics access available. Running the 4-step cascade: estimate usage → cascade to revenue → de-risk weakest assumption → output a range.

Guardrail metrics block appended (standard for any feature impact model).

---

### Step-by-step (condensed)

**Step 1 — Locate the feature in the metric tree**

Instant transfer sits in the monetization branch of Velo's tree:

```
Revenue
└── Transaction revenue
    ├── Payout volume processed
    └── Fee-bearing transactions (currently: ~0)
        └── Instant transfer fee (new)
```

The feature creates a new revenue branch. It also touches the retention branch — instant access to funds is a sticky value driver.

**Step 2 — Estimate usage: eligible → exposed → engaged**

Data pulls from analytics:

| Cohort | Count | Source |
|---|---|---|
| MAU (current) | 180,000 | Dashboard |
| Users who receive ≥1 payout/month | 112,000 | Payout data |
| Users who currently initiate a bank transfer within 48h of payout | 67,000 | Transfer log |
| Users who transfer amounts ≥$50 (threshold for fee to feel proportionate) | 41,000 | Transfer size distribution |

**Eligible users (realistic TAM for this feature):** ~41,000 — those who transfer ≥$50 frequently enough that a 1.5% fee is <$3.

**Adoption rate estimate:** First-principles. Not historical (no comparable feature).

- Comparable: Cash App "Instant Deposit" adoption was ~25% of eligible users in Y1 (public source: company S-1 language, not internal data). Upstart comps from payroll fintechs: 20–35%.
- Velo-specific adjustment: Gig workers face tighter cash flow — urgency of instant access is higher than median. Adjust to 28% midpoint.
- **Estimated engaged users: ~11,500 (28% of 41,000)**

**Step 3 — Cascade: engagement → top-line → bottom-line**

Assumptions:
- Average transfer size: $180 (median from Velo transfer log, ≥$50 cohort)
- Fee rate: 1.5%
- Revenue per engaged transaction: $180 × 1.5% = $2.70
- Average transfers per engaged user per month: 1.4 (from transfer frequency data)

Monthly recurring revenue estimate:
- 11,500 users × 1.4 transfers × $2.70 = **$43,470/month → ~$521K annualized**

**Step 4 — Sensitivity ranges**

Three scenarios (adoption rate is the weakest assumption):

| Scenario | Adoption rate | Engaged users | ARR |
|---|---|---|---|
| Bear | 15% | 6,150 | $279K |
| Base | 28% | 11,500 | $521K |
| Bull | 40% | 16,400 | $742K |

Engineering sprint cost: ~$150K (6 weeks × 2 engineers + PM time).

Payback: Base scenario reaches payback in ~3.5 months post-launch. Bear scenario: ~6.5 months. Both break even inside 1 year.

**Conclusion:** Feature clears the bar in all scenarios. The bear case still returns >1.8x in Year 1.

**Weakest assumption identified:** Adoption rate (28%). No internal comparable. If gig workers already rely on overdraft or Venmo instant transfers, Velo's instant transfer gets perceived as redundant rather than a relief valve. That's the assumption worth testing.

**Step 5 — De-risk the weakest assumption**

> "Don't refine the whole model. Pull one data point: how many of your ≥$50 transfer users already have a Cash App or Venmo instant transfer habit? A survey of 100 users or a 1-question in-app prompt ('How do you usually handle cash flow gaps between payouts?') costs <1 week and could shift the adoption estimate significantly."

---

### Quality bar — what fired

**Check 1: First-principles model preferred over historical correlation.** Passed. Used Cash App S-1 analog + product-specific adjustment. Did not run a regression on Velo's own limited data.

**Check 2: Weakest assumption de-risked.** Passed. Adoption rate named explicitly; one cheap data pull recommended.

**Check 3: Output is a range, not a point estimate.** Passed. Three scenarios with named assumptions per scenario. The skill flagged:

> "The base case is your planning number, not your promise number. Lead with the bear case when talking to leadership — if you hit the base, that's upside."

---

## Output artifact (excerpt)

`Work/metrics/velo-instant-transfer-measurement-plan.md` — excerpt:

---

**Feature:** Instant Transfer (1.5% fee, <30s settlement)

**Spine:** Impact Sizing — growth stage, feature-level

**Success metric:** Monthly fee revenue from instant transfers

**Leading indicator:** % of ≥$50 transfer users who use instant transfer ≥1x in first 30 days post-launch (adoption rate proxy)

**Impact model:**

| | Bear | Base | Bull |
|---|---|---|---|
| Adoption rate | 15% | 28% | 40% |
| Engaged users | 6,150 | 11,500 | 16,400 |
| ARR | $279K | $521K | $742K |

**Key assumption to de-risk:** Adoption rate. Recommend 1-question in-app prompt to 100 ≥$50 transfer users: "When you need money fast, what do you do?" Results should arrive before sprint kickoff.

**Guardrail metrics:**
- Standard transfer volume — must not decline >5% (instant transfers should expand the pie, not cannibalize free transfers by eroding trust)
- App store rating — 1.5% fee must not generate a "hidden fees" perception; monitor weekly in launch month
- User complaints flagged with "fee" or "charge" — watch support queue

**Filing note:** Saved to `Work/metrics/impact-sizing-journal.md` entry #4. Revisit calibration after 90 days of live data.

---

## What the PM does next

Run the "cash flow gap" in-app prompt this week. If >40% of users say they already use a competitor's instant transfer, the adoption model is more pessimistic than the bear case — raise that with eng before sprint kickoff. If <20%, proceed with confidence. Take the measurement plan to `/agentic-pm:prd` for the Stage 2 spec.
