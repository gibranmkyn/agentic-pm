---
name: Voice of Customer
aliases: [VoC, VoC Program, Voice of Customer Program]
author: Aakash Gupta, Sachin Rekhi
source_type: course
source: "Continuous Discovery Advanced Techniques (Gupta, 2026); Feedback Rivers (Rekhi, Reforge, 2024)"
use_when:
  - You want a systematic, company-wide program — not a one-off research project — to collect and route customer feedback
  - Product, sales, support, and success are all hearing things but none of it is aggregated or quantified
  - You need to show stakeholders volume data and revenue impact behind feature requests, not just anecdotes
  - You're setting up the discovery infrastructure before building an Opportunity Solution Tree
tags: [discovery, research, customer-feedback, program-design]
---

# Voice of Customer (VoC)

A company-wide program to systematically capture customer requests, count how often they appear, and attach dollar values to them. Not a research project with a start and end date — a standing infrastructure that runs continuously. The difference between a VoC program and "we talk to customers" is aggregation, quantification, and shared ownership across the company.

**Authors:** Aakash Gupta — *Continuous Discovery Advanced Techniques* (2026), extending Teresa Torres' product-trio practice to the whole company; Sachin Rekhi — *Feedback Rivers* (Reforge, 2024), the real-time complement.

---

## What makes it a program (not just research)

Four defining properties:

**Systematic** — defined inputs, defined outputs, recurring cadence. Not "we share things when they're interesting."

**Company-wide** — captures signal from customer support, sales, success, and product interviews. If only product is contributing, it's not a VoC program; it's a research database.

**Quantified** — each request has a volume count (how many customers mentioned it) and a dollar value (revenue at risk or accessible). The quantification is what makes it a decision input instead of an anecdote pile.

**Shared** — one system the whole company reads. Siloed versions in each team's Notion are not this.

---

## The two layers: River and Program

Sachin Rekhi draws a sharp line between two complementary practices:

| | Feedback River | VoC Program |
|---|---|---|
| What it is | Real-time Slack stream from many sources | Spreadsheet of top requests by volume + $ |
| Purpose | Build product intuition; stay calibrated | Make prioritization decisions; show evidence |
| Cadence | Daily, passive | Monthly structured review |
| Quantified | No — raw verbatims | Yes — volume counts and revenue impact |
| Owner | Whole team reads | BizOps/Strategy manages |

The River is what you *read* to keep your intuition fresh. The VoC Program is what you *manage* to drive roadmap decisions. Teams benefit from both.

---

## Channels to pull from

Start with these five:
- **Customer support tickets** — tag and count by theme; highest-volume channels
- **Churn reasons** — structured exit interviews or cancellation survey verbatims
- **Sales lost reasons** — why deals didn't close; often surfaces missing capabilities
- **NPS/CSAT verbatim comments** — especially low-score comments; rich in pain points
- **Customer success escalations** — high-priority accounts, urgent issues, renewal risks

Add as the program matures:
- Product team discovery interviews (weekly sessions feed into the system)
- App store and review site comments (G2, Capterra, App Store)
- In-product feedback prompts

---

## Format and structure

Live in a spreadsheet (Sheets or Excel), not a database tool like Notion. You need to filter, sort, and compute on the data — that's harder in docs-style tools. Typical columns:

| Column | Purpose |
|---|---|
| Customer request / pain point | One-line description of what the customer needs |
| Source | Support / Churn / Sales / NPS / Interview |
| Volume | Count of how many times this appeared |
| Dollar value at risk | ARR associated with customers who mentioned it |
| Priority tier | High / Medium / Low — reviewed monthly |

---

## How to set one up

1. **Audit existing channels.** List every place customer feedback currently lands. Name each one: support tickets in Zendesk, lost deal notes in Salesforce, NPS in Delighted. Make the current state explicit.

2. **Design the tagging taxonomy.** Define categories before you start collecting, not after. Categories that emerge post-collection are harder to backfill and rarely get done. Start with 8–12 themes; refine after the first month.

3. **Assign the champion.** BizOps or Strategy often works better than Product as the program owner — it keeps it from being siloed in R&D and signals that this is a company function. Name one person.

4. **Set the aggregation cadence.** Monthly review meetings. Stale data is worse than no data — if the program isn't reviewed regularly, people stop trusting it and revert to anecdotes.

5. **Define routing logic.** What happens when a theme hits a threshold? Which feedback type goes where? Where does VoC evidence feed the Opportunity Solution Tree vs. trigger a deep research sprint vs. feed directly into a PRD?

6. **Close the loop.** When feedback is acted on, communicate it back to the customers who raised it. This is the most-skipped step and the one that builds the most trust.

---

## Routing logic — the handoff triggers

A VoC program without handoff triggers is a reporting exercise, not a decision system. Define these explicitly:

- **High-volume theme + high dollar value** → feeds `opportunity` (OST); becomes a candidate opportunity under the relevant outcome
- **Emerging theme (5+ mentions in one month)** → triggers a `research` synthesis sprint to understand the problem before acting
- **Well-understood theme with clear solution signal** → feeds `prd` directly as feature input with quantified evidence

---

## Common failure modes

| Failure | What goes wrong |
|---|---|
| Only product team contributes | You're measuring what product hears, not what the company hears |
| Taxonomy designed after collecting | You can't backfill; months of data become uncategorized noise |
| No volume or dollar data | You can't prioritize; it's just a list of complaints |
| Monthly meeting skipped | Trust drops; people revert to "I heard from a customer that..." |
| Owner is everyone = no one | Program collapses after the initial setup energy fades |
| Recency bias weaponized | One dramatic recent piece of feedback overrides aggregate signal — prevent this by always showing volume counts |

---

## When NOT to use it

- You have one product, one customer segment, and the PM already talks to them weekly. A full program is overhead. Weekly interviews plus a simple shared log is enough.
- You're pre-product. There are no customers yet to create a program around. Start with discovery interviews; build the program once you're live.
- You're running a single research project to answer a specific question. That's `research`, not VoC. VoC is the infrastructure that makes research more targeted.

---

## Relationship to Feedback River (Rekhi)

The Feedback River is the daily-reading layer — a Slack channel fed by many sources (NPS integrations, Twitter mentions, in-product feedback buttons, cancellation surveys). It builds intuition through constant low-effort exposure. The VoC Program is the monthly-analysis layer — structured, quantified, actionable. Mature teams run both.

Warning on the River: stakeholders can weaponize a single recent dramatic piece of feedback to override agreed priorities. The VoC Program's volume data is the counter — "50 customers said X vs. 3 said Y" defeats anecdote-based overrides.

---

## Further reading

- Aakash Gupta — *Continuous Discovery Advanced Techniques* (2026) — VoC as company-wide extension of Teresa Torres' discovery habits
- Sachin Rekhi — *Feedback Rivers* (Reforge, 2024) — the real-time complement; how Notejoy built their 12-source feedback system
- Teresa Torres — *Continuous Discovery Habits* (Product Talk, 2021) — the product-trio discovery practice VoC programs extend

---

*This card is an original synthesis drawing from Gupta's advanced discovery course and Rekhi's Reforge talk. For the full treatment, read the primary sources.*
