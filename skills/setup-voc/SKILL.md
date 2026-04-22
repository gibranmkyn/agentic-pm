---
name: setup-voc
description: "Design a company-wide Voice of Customer program — systematic feedback collection and routing across support, sales, NPS, and interviews, with explicit handoff triggers to discovery and research."
allowed-tools: Read Grep Glob Write Edit
---

# VoC Setup — Build a Company-Wide Customer Feedback Program

This is program design, not project research. The output is a standing infrastructure: which channels feed in, who owns each, how feedback is tagged and aggregated, and when the evidence triggers a handoff to opportunity mapping, research, or PRD. One-off research projects live in `/agentic-pm:plan-research` (plan mode) or `/agentic-pm:synthesize-research` (synthesis mode). This is the system that makes research more targeted over time.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Also check for existing research artifacts:
- `Work/research/` — existing research briefs or reports that might feed initial themes
- `Work/discovery/` — existing OST that will be the primary handoff target

---

## Frameworks this skill loads

- `frameworks/voice-of-customer.md` — spine: program design with channel audit, tagging taxonomy, routing logic, and cadence
- `frameworks/feedback-river.md` — add-on: the real-time Slack-based complement to the monthly aggregate program

Read both frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to understand why this program is being built now and whether the conditions exist for it to survive past the first month.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Why now — what happened that made systematic VoC a priority this week, not last quarter?"** Surfaces the real trigger. A new exec demanding "customer obsession"? A churn spike with no explanation? A competitor launching a feature customers have been requesting? The trigger shapes the program — a churn-driven VoC program is structured differently than a growth-driven one.

2. **"What feedback channels already exist informally — support tickets someone reads, sales call notes in a spreadsheet, a Slack channel where CSMs paste complaints?"** *(VoC: "captures signals from support tickets, churn reasons, sales lost, and interviews.")* Most companies already have 3–5 informal channels. The program's job is to formalize them, not create new ones. If the PM says "none," push back — feedback is always landing somewhere, even if nobody owns it.

3. **"Who will own this program long-term — a named person, not 'the team' or 'product'?"** *(VoC: "assign a champion.")* A VoC program without a named owner dies within 90 days. Follow up: "What percentage of their time will this take? If the answer is 'they'll fit it in,' it won't happen."

4. **"What happened to the last VoC effort — if any? Why did it fail, or why didn't one exist before?"** Surfaces organizational antibodies. If the last effort died because nobody tagged feedback, this program needs a simpler taxonomy. If it died because the monthly meeting became a status update nobody prepared for, this program needs a different cadence. If no effort existed, ask why — it usually reveals something about the company's relationship to customer feedback.

5. **"What decisions should VoC evidence actually change? If you had a perfect VoC system today, what would you do differently tomorrow?"** *(VoC: routing logic — "when does VoC evidence feed OST vs. research vs. prd?")* If the PM can't name a specific decision, the program is theater. A VoC system that produces reports nobody acts on is worse than no system — it creates the illusion of customer-centricity without the substance.

6. **"Who is the most important internal consumer of this data — the PM team, the exec team, CX, sales? What format do they actually read?"** Determines the output format. Execs want a monthly digest with dollar values. PMs want tagged themes they can map to opportunities. CX wants to close the loop with customers. Building the wrong format for the wrong audience means the data gets collected but never consumed.

Interview until you can answer: Why now? What already exists informally? Who will own it? What killed the last attempt? What decisions will change?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the trigger, the informal channels that already exist, the owner candidate, what went wrong last time (if anything), what decisions VoC should change.
2. **"Here's the approach"** — VoC Program Design spine, which existing channels to formalize first, proposed taxonomy complexity, Feedback River recommendation, routing targets.
3. **"Here are my concerns"** — no named owner, previous effort failed for structural reasons that haven't changed, PM can't name decisions VoC would change, too many channels to formalize at once.

Ask: **"Want to adjust before I start designing the program?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

One spine: VoC Program Design (Aakash Gupta + Sachin Rekhi's Continuous Discovery advanced techniques).

If not already established in the interview, ask directly:

1. **What feedback channels currently exist?** Name each one specifically: support tickets in Zendesk, lost deal notes in Salesforce, NPS surveys in Delighted. Not "we have a few" — a complete inventory.
2. **Who will own and maintain this program?** BizOps/Strategy is often the right owner (keeps it from being siloed in Product). Name the person and their approximate weekly time commitment.
3. **Is there a dedicated research function, or does the PM own research?** This determines how granular the handoff triggers need to be.
4. **Do you have an existing Opportunity Solution Tree?** If yes, the VoC program output goes there. If no, running `/agentic-pm:map-opportunities` first will give the VoC system a clearer target.

---

## Sub-steps

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Establish program ownership and decision impact before proceeding.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine, which channels to formalize first, concerns. Wait for PM approval before producing anything.

### Step 3 — Audit existing feedback channels

List every place customer feedback currently lands. Named, specific, and honest about quality. For each channel, capture:
- What feedback type it captures (complaints? requests? cancellation reasons? praise?)
- Current volume (rough order of magnitude)
- Who reads it today
- Whether it's tagged or structured in any way

Typical starting set:
- Customer support tickets (Zendesk, Intercom, email)
- Churn / cancellation reasons (survey or structured field)
- Sales lost reasons (CRM notes or fields)
- NPS/CSAT verbatim comments
- Customer success escalations and QBR notes
- Product team discovery interview notes

If fewer than 3 channels exist, say so — the program cannot be meaningful until at least 3 distinct channels are feeding it.

### Step 4 — Define the tagging taxonomy

Define categories before collecting, not after. This is the most-skipped step and the one that makes the program fail 6 months in when nobody can backfill.

Approach:
1. Look at the existing audit from Step 1 — what themes appear across channels?
2. Define 8–12 tag categories. Too few = everything is uncategorized. Too many = nobody tags consistently.
3. Write 1–2 sentence definitions for each category. Test: can two different people apply the same tag to the same piece of feedback without asking questions? If not, refine.

Common starting tags: onboarding friction, feature gap, performance/reliability, pricing and value, documentation, integration needs, workflow mismatch, competitor comparison, compliance/security, trust and safety.

### Step 5 — Design the routing logic

What type of feedback goes where? Document this explicitly — without routing logic, the VoC program becomes a pile of tagged complaints with no action path.

| Trigger | Route to |
|---|---|
| Theme hits ≥5 instances in one month | Flag for `/agentic-pm:map-opportunities` — candidate opportunity for the OST |
| Theme hits ≥15 instances + high dollar value | Trigger a `/agentic-pm:synthesize-research` sprint |
| Well-understood theme with clear solution signal | Feed directly to `/agentic-pm:compile-prd` as quantified feature input |
| Single anecdote, no pattern yet | Add to the Feedback River; don't act yet |

Thresholds should be set based on the company's typical feedback volume. At low volume (< 100 pieces of feedback/month), use absolute counts. At high volume, use percentages.

### Step 6 — Set the aggregation cadence

Monthly review meetings are the default. Stale data is worse than no data — if the program isn't reviewed regularly, people stop trusting it and revert to anecdotes.

Define:
- **When:** Day of month, who attends (PM, BizOps, CX lead at minimum)
- **Agenda:** Top 5 themes by volume, themes with highest dollar value, new emerging themes from this month, routing decisions
- **Artifact:** A monthly VoC digest that the team can share asynchronously

### Step 7 — Set up the Feedback River (optional but recommended)

The Feedback River is the real-time complement: a `#feedback` Slack channel with automated pushes from NPS tools, social mentions, in-product feedback buttons, and cancellation surveys. It builds product intuition day-to-day. The monthly VoC review drives prioritization decisions.

Minimum viable River: create the Slack channel, connect NPS tool, connect Twitter/X mentions. Takes 20 minutes. Add sources over time.

Warning: without pairing it with the VoC Program's volume data, the River enables stakeholder anecdote overrides ("but a customer just said X"). Establish both from the start.

### Step 8 — Name the program owner and time commitment

One person. Not "the team." Not "Product."

The right owner in most organizations is BizOps or Strategy — this signals that VoC is a company function, not a Product function, and keeps it from getting deprioritized when the product team enters an execution sprint.

Document: name, role, estimated weekly time (realistic, not aspirational — 2 hours/week for a small program, 5–8 hours/week for a mature one).

### Step 9 — Define the close-the-loop process

When feedback is acted on, tell the customers who raised it. This is the most consistently skipped step and the one with the highest trust-building impact.

Simple version: a monthly email to the customers who mentioned a theme that was addressed: "You told us X was painful. We shipped Y. Here's how to use it." Even 10 customers per month getting this message builds a vocal advocate cohort.

### Step 10 — Self-validate

Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.

### Step 11 — Produce the VoC program doc

Write the final artifact to `Work/research/voc-program.md`.

---

## Quality bar

Before finalizing the VoC program doc:

- [ ] At least 3 distinct feedback channels identified (not just NPS) — *VoC: "captures signals from support tickets, churn reasons, sales lost, and interviews"*
- [ ] Tagging taxonomy defined before collection starts (not after) — *VoC: design the taxonomy first*
- [ ] Routing logic documented explicitly (not ad hoc) — *VoC: "when does VoC evidence feed OST vs. research vs. prd?"*
- [ ] Handoff triggers to OST and research are specific and threshold-based — *VoC: routing triggers*
- [ ] Program owner named with realistic time commitment — *VoC: "assign a champion"*
- [ ] Aggregation cadence set (monthly minimum) — *VoC: "monthly review meetings; stale data is worse than no data"*
- [ ] Close-the-loop process defined — *VoC: "communicate back to customers when their feedback was acted on"*

---

## Tag propagation

- Fewer than 3 feedback channels sourced → tag `voc-channel-sparse`
- Routing logic not documented → tag `voc-routing-undefined`
- No named owner → tag `voc-no-owner`

---

## Handoffs

**Upstream:** None — this is a program setup, not a downstream task. It is the infrastructure that feeds other skills.

**Downstream (offer, not auto-chain):**
- `/agentic-pm:map-opportunities` — VoC evidence feeds the OST; high-volume themes become candidate opportunities
- `/agentic-pm:synthesize-research` — high-volume themes with unclear root cause trigger a deep synthesis sprint

---

## Output

`Work/research/voc-program.md`

Contents:
- Channel audit (named channels, volume, current structure)
- Tagging taxonomy (8–12 categories with definitions)
- Routing logic (trigger → destination table)
- Aggregation cadence (date, attendees, agenda)
- Feedback River setup instructions (if applicable)
- Program owner and time commitment
- Close-the-loop process
- Tags applied (if any)

---

## End every session with

- The single highest-volume feedback channel that currently lacks structure — that's where to start the tagging taxonomy
- The first routing decision: what's the first theme likely to hit the handoff threshold in the next 30 days, and where will it go?
- A reminder: the first monthly review date

---

## Completion status

Report exactly one of at close:
- **DONE** — VoC program doc written, all quality checks passed, owner named, cadence set
- **DONE_WITH_CONCERNS** — doc written but tags applied (list each); state what must be resolved before the first monthly review
- **BLOCKED** — cannot proceed; state what is missing (no existing channels, no owner candidate)
- **NEEDS_CONTEXT** — company context not initialized; run `/agentic-pm:setup-context` first
