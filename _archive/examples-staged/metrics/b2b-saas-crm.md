---
product_type: B2B SaaS CRM / Sales Tool
nsm: Weekly Active Reps (with ≥1 CRM-logged touchpoint)
core_action: Logging a customer touchpoint (call, email, meeting) in the CRM
stage: growth
---

# Metrics: B2B SaaS CRM / Sales Tool — Weekly Active Reps

## North Star Metric
**Weekly Active Reps (with ≥1 CRM-logged touchpoint)** — CRM tools live and die by data quality. A rep who logs in but doesn't enter data is creating no value — for themselves, their manager, or the business. Logging a touchpoint is the core job the CRM is hired to do. This metric measures whether reps are actually doing that job, not just whether they have a license.

Core action: **Logging a customer touchpoint** — Email logging, call notes, meeting records — these are the actions that make the CRM the system of record and make pipeline forecasts accurate. Reps who log consistently have better forecast accuracy and are retained customers; reps who don't will be blamed for "CRM isn't useful" and churn.

## Metric tree

Weekly Active Reps (with ≥1 logged touchpoint)
├── Adoption
│   ├── % of licensed reps active in a given week
│   ├── Days-to-first-logged-touchpoint (new rep activation speed)
│   └── Admin-to-rep activity ratio (is the CRM being used by reps or just admins?)
├── Data quality
│   ├── Average touchpoints logged per active rep per week
│   ├── % of open deals with ≥1 touchpoint in last 7 days (deal staleness)
│   └── Field completion rate (key fields: close date, deal stage, next step)
└── Business outcomes
    ├── Forecast accuracy (predicted vs. closed within a quarter)
    ├── Win rate per rep (tracked vs. not-tracked deal comparison)
    └── Net Revenue Retention (expansion in accounts with high CRM data completeness)

## Guardrail metrics
- Manual data entry time per rep per week — guards against over-engineered logging requirements that make the tool a burden
- Admin escalations about "bad data" — guards against data quality illusions where reps log but enter garbage

## What to watch at each stage
- **Pre-PMF:** Are any reps using the CRM without being required to by their manager? Voluntary adoption is the PMF signal. Mandate-driven adoption will plateau as soon as oversight relaxes.
- **Growth:** Days-to-first-logged-touchpoint for new reps. If new reps don't log within their first week, the onboarding experience is failing — and that rep will develop habits in a competitor tool or spreadsheet before your product gets a chance.
- **Mature:** Forecast accuracy tied to CRM data completeness. If you can show that reps with 90%+ field completion have 20% better forecast accuracy, you have the business case to drive deeper adoption in your largest accounts.

## Common mistake for this product type
Measuring "license utilization" (% of seats logging in) as the adoption metric and presenting it to buyers. Every B2B buyer knows license utilization tells you nothing about whether the tool is doing the job. Forecast accuracy and deal data completeness are the metrics that unlock renewals and expansions — report those instead.
