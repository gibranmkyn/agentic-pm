---
product_type: Two-Sided Marketplace
nsm: Monthly Successful Matches
core_action: A transaction completing successfully between a buyer and a seller (or service requester and provider)
stage: growth
---

# Metrics: Two-Sided Marketplace — Monthly Successful Matches

## North Star Metric
**Monthly Successful Matches** — A marketplace only creates value when a transaction actually completes. Listings are supply; searches are demand signals; but a completed match is the event where both sides got what they came for. Gross Merchandise Value is a downstream consequence of matches — but GMV obscures whether both sides are satisfied. Successful match count (where "successful" means completed + not refunded/cancelled) is the purest measure of value delivered to both sides simultaneously.

Core action: **A transaction completing successfully** — Browse sessions are noise. Listing views are noise. A completed transaction, not cancelled or refunded, is the one event that both sides value. It's also the event that generates revenue for the platform.

## Metric tree

Monthly Successful Matches
├── Supply health
│   ├── Active listings per week (new + renewed)
│   ├── Listing quality score (% meeting minimum criteria: photos, description, pricing)
│   └── Supply-side retention (% of sellers/providers still active at 90 days)
├── Demand health
│   ├── Monthly active buyers / requesters
│   ├── Search-to-contact rate (% of searches leading to a message or inquiry)
│   └── Repeat buyer rate (% of buyers who complete ≥2 transactions in 90 days)
└── Match quality
    ├── Match completion rate (contacts that convert to completed transactions)
    ├── Cancellation rate (post-booking or post-match, by side)
    └── Post-match rating rate and average rating (both sides)

## Guardrail metrics
- Supply-side churn rate — guards against demand-side optimization (ads, promotions) that brings in buyers when supply is shrinking; this creates a fake supply shortage and kills trust
- Buyer complaint and refund rate — guards against inflating match counts with low-quality supply that doesn't deliver on the promise

## What to watch at each stage
- **Pre-PMF:** Manually broker 20–30 matches and observe completion rate and post-match satisfaction. If you can't get to a high completion rate when you're fully controlling the supply and demand, the product problem is deeper than distribution. Automate nothing until you understand what makes a match work.
- **Growth:** Search-to-contact rate. If people search, find listings, but don't contact, the supply isn't good enough — either quality, price, or availability. This is the trust gap and it's the most common growth ceiling in marketplace businesses.
- **Mature:** Repeat buyer rate. Mature marketplaces that depend on first-time buyers for volume are one ad campaign away from collapse. Repeat buyers are cheaper to serve, more satisfied, and the base of word-of-mouth. If repeat rate isn't growing with the business, something about the post-match experience is failing.

## Common mistake for this product type
Optimizing supply (listing count) and demand (buyer signups) simultaneously as if they're independent. They're not — supply and demand health must be grown in proportion, and the right proportion depends on your specific market's balance. Adding 10,000 new listings when search-to-contact rate is already high will help; adding them when demand is the constraint just demoralizes providers who list and never get contacted. Know which side of the marketplace is the bottleneck before adding supply or demand.
