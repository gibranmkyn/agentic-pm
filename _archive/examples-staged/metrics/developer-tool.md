---
product_type: Developer Tool / API Product
nsm: Weekly Active Integrations (WAI)
core_action: An integration making ≥1 successful API call in a 7-day window
stage: growth
---

# Metrics: Developer Tool / API Product — Weekly Active Integrations

## North Star Metric
**Weekly Active Integrations (WAI)** — Individual developer accounts don't capture the right unit. What matters is whether a live integration is running in production and calling the API — that's when value is being delivered to a real end user downstream. A developer who signs up and tests in sandbox is not delivering value yet. An integration in production is the NSM because it proxies delivered value (end users are using what was built), retention commitment (ripping out a live integration is expensive), and expansion potential (active integrations grow in call volume as the downstream product grows).

Core action: **An integration making ≥1 successful API call** — Not a login, not a sandbox test, not a webhook ping. A successful call from a live integration means the developer shipped something that works.

## Metric tree

Weekly Active Integrations (WAI)
├── Activation
│   ├── Time-to-first-successful-call (median, from signup to first production call)
│   ├── Sandbox-to-production conversion rate (% of sandbox users who go live)
│   └── Activation drop-off step (where in the docs/flow do developers abandon?)
├── Engagement
│   ├── API call volume per active integration per week
│   ├── Error rate per active integration (% of calls returning 4xx/5xx)
│   └── Endpoint breadth (# of distinct endpoints called by an active integration)
└── Expansion & retention
    ├── Call volume growth rate (month-over-month, per integration cohort)
    ├── Integration-level churn (integrations going from active to 0 calls for 30+ days)
    └── Paid tier conversion rate (integrations crossing usage threshold)

## Guardrail metrics
- p95 API latency — guards against call volume growth driven by retries on a degraded API
- Error rate — guards against integrations staying "active" in the WAI metric while actually failing silently

## What to watch at each stage
- **Pre-PMF:** Sandbox-to-production conversion rate. If developers can't get from sign-up to a live integration, no growth tactic will work. This is the activation funnel and it's almost always broken in ways that documentation can fix.
- **Growth:** Time-to-first-successful-call. Every extra hour in this journey is a drop-off risk. At growth stage, shaving the median from 3 days to 6 hours is often more impactful than adding a new endpoint.
- **Mature:** Endpoint breadth per integration. Integrations that use more of the API are stickier and spend more. At maturity, the roadmap question is: what would cause active integrations to expand their usage — and is there a capability gap holding them back?

## Common mistake for this product type
Using "registered developers" or "API keys issued" as the headline metric. These are acquisition metrics with no connection to whether anyone built anything useful. A developer tool with 50,000 registered accounts and 1,200 weekly active integrations is healthier than one with 200,000 registrations and 800 active integrations. Track what's in production.
