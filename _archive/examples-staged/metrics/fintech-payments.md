---
product_type: Fintech / Payments Product
nsm: Monthly Payment Volume (MPV) per Active User
core_action: Initiating and completing a payment transaction
stage: growth
---

# Metrics: Fintech / Payments Product — Monthly Payment Volume per Active User

## North Star Metric
**Monthly Payment Volume (MPV) per Active User** — Total payment volume is a misleading headline number because it's inflated by a small number of power users or a single large B2B client. MPV per active user normalizes for this and measures whether the product is genuinely embedded in each user's financial behavior. As this metric grows, it means users are trusting the product with more of their money — that trust is the moat, and it directly predicts revenue (which is a % of volume).

Core action: **Initiating and completing a payment transaction** — Not a login, not a balance check. A completed transaction means the user chose this product over cash, a bank transfer, or a competitor. That choice, repeated, is what builds payment habit.

## Metric tree

Monthly Payment Volume per Active User
├── Activation
│   ├── Time-to-first-transaction (median, from signup to first completed payment)
│   ├── % of new users who complete a transaction within 7 days
│   └── Funding method connection rate (% who link a bank/card before churning)
├── Engagement
│   ├── Transactions per active user per month
│   ├── Average transaction value (by user segment)
│   └── Use case breadth (% using ≥2 payment types: P2P, bill pay, merchant, etc.)
└── Trust & expansion
    ├── % of users who increase MPV in months 3–6 vs. months 1–2 (habit deepening)
    ├── Direct deposit attachment rate (for products that support it)
    └── Monthly active user retention at month 6 (payment habit durability)

## Guardrail metrics
- Failed transaction rate — guards against volume growth driven by retry loops on failing payments (inflates MPV, destroys user trust)
- Fraud rate (% of volume flagged) — guards against volume that comes from compromised accounts or fraud rings; especially critical in instant-transfer products
- Regulatory / compliance flag rate — guards against moving fast on UX without keeping pace on KYC/AML obligations

## What to watch at each stage
- **Pre-PMF:** Time-to-first-transaction. If users sign up and don't transact within 7 days, find out why. The most common reasons: friction in linking a funding source, unclear use case, or lack of a reason to send money right now. All three are fixable before building more features.
- **Growth:** Direct deposit attachment rate. Users who direct-deposit their paycheck into your product are 3–5x more retained than those who don't. This is the "primary account" signal and the single best leading indicator of durable retention in consumer fintech.
- **Mature:** Use case breadth. A user who pays P2P, pays a bill, and pays a merchant has three reasons to stay. A user who only uses one feature has one reason to stay. At maturity, the roadmap should be building the second and third use cases for your highest-value users.

## Common mistake for this product type
Tracking total transaction volume without segmenting by user tenure. Volume in months 1–2 is acquisition-driven and noisy. Volume in months 3–12 is the signal — it tells you whether payment habit actually formed. Teams that report aggregate MPV often miss that their growth is coming entirely from new user influx, while retention volume is flat or declining. Always cohort the volume data.
