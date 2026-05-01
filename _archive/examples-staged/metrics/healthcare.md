---
product_type: Healthcare / Clinical Product
nsm: Monthly Active Patients with ≥1 Care Action
core_action: A patient completing a care-relevant action (appointment scheduled, medication logged, care plan step taken, message sent to provider)
stage: growth
---

# Metrics: Healthcare / Clinical Product — Monthly Active Patients with ≥1 Care Action

## North Star Metric
**Monthly Active Patients with ≥1 Care Action** — Healthcare products have a unique trap: passive engagement (reading content, viewing charts) doesn't improve health outcomes. A care action — scheduling an appointment, logging a medication, completing a care plan step, messaging a care team — is the unit of work that connects digital engagement to clinical value. Patients who take ≥1 care action per month are more likely to stay on their care plan, less likely to miss appointments, and (in outcomes studies) show better clinical markers. This metric proxies clinical effectiveness, not just product engagement.

Core action: **Completing a care action** — Logins and page views are irrelevant. A care action is anything that moves a patient's care forward. The specific action types depend on the product (scheduling, adherence logging, messaging) — define them explicitly per product, then measure their occurrence.

## Metric tree

Monthly Active Patients (≥1 care action)
├── Activation
│   ├── % of newly enrolled patients who take a care action within 14 days
│   ├── Time-to-first-care-action (median, new patient cohort)
│   └── Care plan completion rate at 30 days (for products with structured care programs)
├── Engagement
│   ├── Care actions per active patient per month
│   ├── Action type breadth (# of distinct action types per patient: scheduling + logging + messaging)
│   └── Provider message response rate (% of patient messages receiving a response within 24h)
└── Outcomes (where data exists)
    ├── Appointment adherence rate (% of scheduled appointments kept)
    ├── Medication adherence rate (for logging-enabled products)
    └── 90-day patient retention (still active on the platform at 3 months)

## Guardrail metrics
- Patient-reported usability complaints — guards against engagement driven by confusing or alarming UX (patients who feel overwhelmed by data or notifications may disengage entirely)
- Clinical staff workload per patient — guards against feature additions that increase patient activity but create unsustainable administrative burden for care teams

## What to watch at each stage
- **Pre-PMF:** Are any patients self-initiating care actions (not responding to reminders, not required by their provider)? Voluntary care action behavior, before any nudge system is in place, is the signal that the product has genuine clinical utility.
- **Growth:** Time-to-first-care-action. The first two weeks after enrollment are the highest-risk period for abandonment. Every day added to this timeline correlates with lower 90-day retention. Focus onboarding energy here before building new features.
- **Mature:** Action type breadth. Patients using the product for scheduling AND medication logging AND messaging are more retained and show better clinical outcomes than single-use patients. Cross-care-action usage is the stickiness driver at maturity.

## Common mistake for this product type
Measuring app logins or page views as the engagement metric and presenting them to health system partners as evidence of clinical value. Clinical buyers evaluate products on outcomes, not engagement. A patient who logs in every day to read educational content but never books an appointment or messages their care team is generating engagement data and no clinical value. Map your metrics to care actions from the start — it's what buyers will eventually demand, and it forces the product team to build features that actually matter for health.
