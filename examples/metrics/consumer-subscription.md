---
product_type: Consumer Subscription (Learning, Wellness, Streaming)
nsm: Monthly Active Subscribers (MAS) with ≥2 sessions in the last 30 days
core_action: Completing a session (lesson, workout, episode) at least twice a month
stage: growth
---

# Metrics: Consumer Subscription — Monthly Active Subscribers with ≥2 Sessions

## North Star Metric
**Monthly Active Subscribers (MAS) with ≥2 sessions in the last 30 days** — A subscriber who paid but never uses the product is a cancellation waiting to happen. The "≥2 sessions" qualifier separates subscribers who are getting value from subscribers who forgot they signed up. This metric tracks both the business (subscription revenue health) and the product (value delivered). One session is a fluke; two sessions is a behavior.

Core action: **Completing a session at least twice a month** — The second session is the signal. One session could be curiosity or a free trial. Two sessions means the user decided to come back. In most consumer subscription categories (fitness, learning, streaming), two sessions per month is the floor for retention past month 3.

## Metric tree

Monthly Active Subscribers (MAS) ≥2 sessions
├── Acquisition
│   ├── Trial starts per month
│   ├── Trial-to-paid conversion rate
│   └── Paid acquisition cost (CAC)
├── Activation
│   ├── % of new subscribers completing ≥2 sessions in first 30 days
│   ├── Time-to-second-session (median, new cohort)
│   └── % of subscribers who complete the "first week program" or equivalent onboarding
└── Retention
    ├── Month-3 subscriber retention (cohort)
    ├── Monthly churn rate (paying subscribers)
    └── Win-back rate (cancelled subscribers who reactivate within 90 days)

## Guardrail metrics
- Session completion rate — guards against artificially inflating "session starts" (autoplay, accidental opens) that inflate the MAS metric without delivering value
- NPS among 3+ month subscribers — guards against retaining subscribers who don't actually like the product (pre-cancel silence is common in subscription)

## What to watch at each stage
- **Pre-PMF:** Do users complete ≥2 sessions without any re-engagement email or push notification? Organic return visits before any activation program are the clearest PMF signal. If you need to push people back, the core product isn't doing it.
- **Growth:** Trial-to-paid conversion rate by acquisition channel. As you scale acquisition, channel mix changes. Some channels produce subscribers who convert; others produce browsers who trial and bounce. Segmenting conversion rate by channel tells you which spend is building the business.
- **Mature:** Win-back rate. At maturity, a meaningful portion of churned subscribers will reconsider if you have new content, a new program, or a pricing change. Win-back rate tells you how fresh the product feels to lapsed users. Low win-back at maturity usually means the content library has stagnated.

## Common mistake for this product type
Optimizing for trial starts as the headline acquisition metric. Trial volume is easy to inflate with discounts and aggressive ads. The metric that matters is trial-to-paid conversion rate — that's what tells you whether the product is worth paying for. Teams that scale trial starts without tracking conversion often burn their CAC budget on audiences that never convert and never notice until they do cohort analysis.
