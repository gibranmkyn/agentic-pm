---
name: Feedback River
aliases: [Feedback Rivers, Feedback River System]
author: Sachin Rekhi
source_type: course
source: "Feedback Rivers (Rekhi, Reforge, 2024)"
use_when:
  - Your team is making decisions on stale, second-hand customer signal
  - You want to build product intuition without increasing the frequency of formal research
  - You're setting up a VoC program and need the real-time complement to the monthly aggregate
  - You need to counter the "I heard from a customer that..." anecdote culture with continuous, accessible signal
tags: [discovery, customer-feedback, product-intuition, infrastructure]
---

# Feedback River

A continuously streaming Slack channel that pushes raw customer voice from many sources — NPS verbatims, in-product feedback, social mentions, cancellation reasons, app reviews — into one place where anyone on the team can dip in daily. The goal is not comprehensive review; it's pattern accumulation that trains product intuition over time.

**Author:** Sachin Rekhi — *Feedback Rivers* (Reforge, 2024). Built at Notejoy with 12 simultaneous sources. See [sachinrekhi.com](https://www.sachinrekhi.com).

---

## The problem it solves

Most PMs operate on customer signal that is:

- **Infrequent** — quarterly usability studies, monthly NPS reports, occasional interviews
- **Filtered** — summarized by researchers who translate raw emotion into polished insights
- **Passive** — you have to deliberately seek it out; it's not part of the daily flow

Between formal research cycles, teams are making decisions on nothing. The Feedback River corrects this by making raw customer voice ambient and always-on.

---

## The core idea

One Slack channel. Many automated sources pushing to it. Anyone can read it without effort. You dip in for 15–20 minutes a day, scrolling without reading everything. The goal is to accumulate patterns — the same frustration appearing in NPS verbatims, help center searches, and cancellation surveys is high-signal. A single complaint in one source is noise.

---

## How to set one up

**Minimum viable River (20 minutes):**
1. Create a `#feedback` channel in Slack
2. Connect an NPS tool (Delighted, Wootric) → auto-push all survey verbatims
3. Add the Twitter/X Slack integration → push any brand mentions or keyword mentions

**Full implementation (Rekhi's 12-source Notejoy River):**

| Source | What it captures |
|---|---|
| NPS survey (day 14) | Why users love or are leaving |
| Twitter/X mentions | Public sentiment, unsolicited signal |
| In-product "Send Feedback" button | Mid-session frustrations and praise |
| Help center search queries | UX failures — searching means the product failed to make it obvious |
| Cancellation survey | Churned users' unfiltered exit reasons |
| App store reviews | Rating-linked verbatims (G2, App Store, Capterra) |
| Win/loss call notes (B2B) | Sales objections, competitive reasons, missing features |

Add sources gradually. The goal is breadth across signal types, not exhaustive coverage of one channel.

---

## How to use it

**Dip, don't read.** 15–20 minutes daily. Scroll. Don't try to read everything. Build flow state around pattern recognition.

**Look across sources.** The same theme in NPS, help searches, and cancellation reasons is high-signal. One mention in one channel is noise.

**Extract problems, not prescriptions.** When a user says "add feature X," the question is: what problem are they trying to solve? The River surfaces raw material; the PM interprets it.

**Resist feature triage.** The River is for intuition-building, not for managing a feature list. Pair it with a VoC Program for structured volume tracking and prioritization.

---

## Why it builds product intuition

Sachin Rekhi defines product intuition as "our ability to make accurate predictions about what products and features our customers will love, every day, without complete data" — a trained prediction engine.

Like a machine learning model, this engine needs training data. The Feedback River provides continuous training data in the form of customer anecdotes. Without it, a PM's intuition model is trained on whatever they happened to see last month. With it, the model updates daily.

---

## The recency bias risk

The Feedback River can be weaponized. A stakeholder finds a dramatic recent piece of feedback and uses it to override an agreed priority. "A customer just said X — we have to fix this."

Two mitigations:
1. **Pair with a VoC Program** — a structured record of requests with volume counts. "3 customers said X this week vs. 50 customers mentioned Y over the last quarter" defeats the anecdote override.
2. **Name the risk explicitly** when launching the River. Tell stakeholders: "This is for intuition-building. Prioritization happens in the monthly VoC review, not in this channel."

---

## B2B adaptations

When customer access is restricted by enterprise sales relationships:
- Require win/loss logging in the CRM (Salesforce) as a mandatory step when closing deals won or lost
- Build a separate end-user council; the economic buyer and the user rarely have the same problems
- Treat the sales team as a feedback channel — they hear objections daily; integrate a lightweight capture process
- Enable direct in-product feedback even when the enterprise buyer controls distribution

---

## Common failure modes

| Failure | Fix |
|---|---|
| Too many sources at launch | Start with 2–3 high-volume sources; add as the habit forms |
| Team reads it but no one acts | Remind the team: this is for intuition, not to-do lists; actions come from the VoC Program |
| Stakeholder weaponizes a single post | Show the volume data from the VoC Program as counter-evidence |
| Setup but not sustained | The value is in the daily habit, not the infrastructure; check-in at the month mark |

---

## When NOT to use it

- You're pre-product with no users. There's no signal yet. Wait until you're live.
- Your team is already swimming in customer signal and needs synthesis, not more input. Run a `research` sprint to make sense of what you have.
- You need quantified prioritization data. The River is qualitative and unstructured. Use the VoC Program for that.

---

## Relationship to VoC Program

The River and the VoC Program are complements, not substitutes:

| | Feedback River | VoC Program |
|---|---|---|
| Format | Slack stream | Spreadsheet with counts + $ |
| Cadence | Daily, passive | Monthly, structured |
| Purpose | Build intuition | Drive prioritization |
| Owner | Whole team reads | BizOps/Strategy manages |

Build both. They solve different problems.

---

## Further reading

- Sachin Rekhi — *Feedback Rivers* (Reforge, 2024) — primary source; full 12-source implementation
- Teresa Torres — *Continuous Discovery Habits* (Product Talk, 2021) — the structured discovery practice the River complements
- Voice of Customer framework card — the monthly aggregate program that pairs with the River

---

*This card is an original synthesis of Sachin Rekhi's Reforge talk. For the full treatment, see the primary source.*
