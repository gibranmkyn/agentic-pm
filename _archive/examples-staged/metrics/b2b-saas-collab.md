---
product_type: B2B SaaS Collaboration Tool
nsm: Weekly Active Teams
core_action: A team completing a collaborative action together (comment, co-edit, review, assign)
stage: growth
---

# Metrics: B2B SaaS Collaboration Tool — Weekly Active Teams

## North Star Metric
**Weekly Active Teams** — Individual active users is a vanity metric for collaboration tools. A user who logs in alone and uses the tool as a personal to-do app creates no collaborative value and will churn when they find a cheaper alternative. Teams that collaborate together embed the product in their workflow — that's the value being delivered and the retention driver.

Core action: **A team completing a collaborative action** — Comments, co-edits, assignments, and reviews are the signals that multiple people are using the tool for its intended purpose. A team where only one person is active isn't a collaboration team — it's a solo user.

## Metric tree

Weekly Active Teams
├── Seat expansion
│   ├── Average active seats per paying team (weekly)
│   ├── Seat invite rate (invitations sent per active team per week)
│   └── Invite-to-activation rate (% of invites who complete a collaborative action within 7 days)
├── Collaboration depth
│   ├── Average collaborative actions per active team per week
│   ├── % of teams with ≥3 active members (threshold for "collaborative" classification)
│   └── Cross-functional usage (teams with members from >1 department)
└── Retention
    ├── Team-level week-8 retention (still active at 2 months)
    ├── Contract renewal rate (annual)
    └── Net Revenue Retention (expansion vs. churn)

## Guardrail metrics
- Support ticket volume per 100 active teams — guards against feature complexity that drives usage but frustrates users
- Single-user team rate — guards against growth in accounts that look active but have zero collaborative behavior (one person using it as a notes app)

## What to watch at each stage
- **Pre-PMF:** Find the teams (not users) that are using the product without you asking them to and would be "very disappointed" if it went away. The Sean Ellis Test run at the team level is more meaningful than at the individual level for collaboration tools.
- **Growth:** Seat expansion within existing accounts. The fastest growth path for collaboration tools is expansion inside an account, not new logo acquisition. If NRR is below 110%, something is blocking seat spread.
- **Mature:** Cross-functional usage — are teams that include members from engineering AND design AND product more retained than single-function teams? If yes, becoming multi-functional is a moat. Prioritize it in roadmap.

## Common mistake for this product type
Reporting "DAU/MAU" as the primary health metric. For collaboration tools, a 30-day active window masks the difference between a user who checks in weekly as part of a team workflow vs. one who logs in once to look at a doc. The unit is the team, and the signal is collaborative action frequency — not presence.
