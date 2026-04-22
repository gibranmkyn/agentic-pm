---
skill: /agentic-pm:assumptions
scenario: A B2B SaaS team wants to build an AI-powered email drafting feature inside their CRM. No traces exist yet.
spine: Feasibility-First Inversion — AI feature flag triggered
---

# Drill: AI Email Drafting in a CRM, No Traces Yet

## Situation

Peloria is a mid-market CRM for sales teams at professional services firms. The product team wants to add AI-generated email drafts — the feature would watch a deal's activity log and suggest a contextual follow-up email when a rep opens a contact record. No prototypes exist. No users have seen it. The PM came from the opportunity tree with three candidate solutions; this one ranked highest. Time to map what could kill it.

## How the skill ran

### Spine autoselect

The skill asked four questions:

1. **What is the input?** — "We have three solutions from an OST. The target opportunity is: reps struggle to write timely, contextual follow-up emails without spending 10+ minutes pulling context from the CRM. This is the top-ranked solution."
2. **Does this feature use AI or ML?** — "Yes — LLM-generated text based on deal activity."
3. **Is this an early-stage new product or an existing product?** — "Existing product, growth stage."
4. **Are you coming from an OST handoff?** — "Yes, three solutions. Bring all three."

**Spine selected: Feasibility-First Inversion.** AI feature flag triggered. The feasibility gate comes before the full assumption map — can the AI actually do this job? Prompt-as-MVP is strongly recommended as the first validation step. Proceeding with cross-solution comparison view (OST input present).

---

### Step-by-step (condensed)

**Step 1 — Prompt-as-MVP recommendation**

Before enumerating assumptions across all four risk types, the skill surfaced the Prompt-as-MVP check:

> "This is an AI feature with no traces. The most expensive mistake is to build the data pipeline and UI before knowing whether the LLM can produce emails a rep would actually send. Spend 30 minutes: pull 20 real deal activity logs from the CRM (obfuscated), paste each into a prompt, and have two reps judge the output binary (send / not send). If pass rate is below 70%, the feasibility assumption is broken and no amount of value validation matters. Do this first."

The PM agreed. Prompt-as-MVP scheduled before any validation planning proceeds.

**Step 2 — Assumption enumeration across four risk types**

Assumptions mapped for Solution 1 (AI email drafting from activity log):

**Value assumptions:**
- V1: Reps experience time-cost of writing follow-ups as significant enough to change behavior (not just annoying)
- V2: A CRM-generated email feels authentic enough that reps will send it without heavy editing
- V3: The suggestion arrives at the right moment (when opening a record, not a day later)

**Usability assumptions:**
- U1: Reps will trust AI-generated text enough to read it (they may ignore it or dismiss it as generic)
- U2: The suggestion UI doesn't create more cognitive load than just opening Gmail
- U3: One suggested draft is enough — reps won't want to compare 3 options

**Feasibility assumptions:**
- F1: The LLM can produce contextually accurate emails from deal activity logs (Prompt-as-MVP will test this)
- F2: Deal activity data in Peloria is structured and complete enough to generate meaningful context
- F3: Latency is acceptable — suggestion renders before rep has moved on to composing manually

**Business Viability assumptions:**
- B1: AI email drafting is a differentiated enough capability that it moves upgrade/expansion (vs. a hygiene feature)
- B2: The feature doesn't cannibalize email tracking open rates (which Peloria charges for separately)
- B3: Enterprise deals can accept AI-touched customer communications (legal / compliance risk varies by sector)

**Step 3 — Risk ranking**

Ranked by conviction (how confident are we?) × impact-if-wrong (how much would it hurt?):

| Rank | Assumption | Risk type | Conviction | Impact | Notes |
|---|---|---|---|---|---|
| 1 | F1: LLM can produce usable emails from activity logs | Feasibility | Low | High | No Prompt-as-MVP yet — this is why we do it first |
| 2 | V2: Reps will send AI drafts without heavy editing | Value | Low | High | Even good AI output gets "edited to nothing" in sales contexts |
| 3 | B3: Compliance risk in enterprise segments | Business Viability | Low | High | Professional services firms have strict client comms policies |
| 4 | U1: Reps will trust and read the suggestion | Usability | Medium | High | Trust is earned — first impression matters enormously |
| 5 | F2: Activity data is complete enough | Feasibility | Medium | High | CRM data quality is notoriously bad in practice |

**Step 4 — Cross-solution comparison view (OST input)**

Three solutions from the opportunity tree, compared on riskiest assumption and cheapest validation:

| Solution | Riskiest assumption | Cheapest validation | Cost | Time |
|---|---|---|---|---|
| S1: AI email drafting from activity log | F1: LLM output quality | Prompt-as-MVP (20 logs, 2 reps) | ~2 days | Week 1 |
| S2: "One-click clone" of a past email the rep sent to similar deals | V1: Reps have good past emails to clone | 5 user interviews + CRM data pull | ~1 week | Week 1–2 |
| S3: Email template library curated by team managers | B1: Managers will maintain templates; reps will use them | Template adoption survey in 3 existing customers | ~3 days | Week 1–2 |

**Recommendation:** S1 has the highest ceiling but a fragile feasibility gate. S3 has the lowest risk but may not solve the real problem (contextual, not generic emails). S2 has interesting signal potential. **Pursue S1 Prompt-as-MVP in parallel with S3 adoption survey — cheapest way to know if the AI bet is worth it.**

---

### Quality bar — what fired

**Check 1: AI feature — Prompt-as-MVP strongly recommended.** Passed. The skill surfaced this before any assumption enumeration and the PM accepted.

**Check 2: Each top-N assumption has a falsifiable success signal.** One gap flagged:

> "B3 (compliance risk) doesn't have a falsifiable signal yet. 'Compliance is okay' is not a success condition. Rewrite: 'By week 3, a legal review of our three largest enterprise accounts confirms AI-drafted emails are permitted under their client communication policies.' That's testable."

B3 was rewritten with a concrete success signal before the artifact was finalized.

**Check 3: ≥1 assumption per risk type.** Passed. Value: 3, Usability: 3, Feasibility: 3, Business Viability: 3.

---

## Output artifact (excerpt)

`Work/validation/peloria-email-drafting-assumption-map.md` — excerpt:

---

**Feature:** AI email drafting — Peloria CRM (Solution 1 from deal-context OST)

**Spine:** Feasibility-First Inversion (AI feature)

**Prompt-as-MVP scheduled:** Yes — Week 1. Owner: [PM name]. 20 real activity logs → prompt → 2 reps score binary (send / not send). Pass threshold: 70%.

**Top 3 riskiest assumptions:**

**#1 — F1: LLM output quality**
- Assumption: GPT-4 can produce emails that feel contextual (not generic) from Peloria activity log data.
- Impact-if-wrong: Fatal. UI and pipeline investment is wasted.
- Validation: Prompt-as-MVP (see above). Pass = 70%+ send rate. Fail = pivot to S2 or S3.
- Success signal: ≥14 of 20 outputs rated "I would send this" by at least one of two reps.

**#2 — V2: Rep editing behavior**
- Assumption: Reps will send AI drafts with minimal editing (<2 minutes of changes).
- Impact-if-wrong: High. If reps rewrite everything, time savings disappear and the value prop collapses.
- Validation: Observe 5 reps using the prototype live. Measure edit time and edit depth.
- Success signal: Median edit time ≤90 seconds; <30% of words changed.

**#3 — B3: Enterprise compliance**
- Assumption: AI-drafted emails are permitted under client communication policies of Peloria's enterprise accounts.
- Impact-if-wrong: High. Could block the feature in our highest-value segment entirely.
- Validation: Legal review of top 3 enterprise accounts' communication policies by Week 3.
- Success signal: All three accounts confirm no policy conflict with AI-assisted drafting.

**Tag:** None. Prompt-as-MVP accepted; all assumptions have falsifiable success signals.

---

## What the PM does next

Run the Prompt-as-MVP this week — 20 activity logs, 2 reps, 30 minutes. If pass rate is ≥70%, move to assumption #2 (rep editing behavior) and schedule 5 prototype observations. If it fails, bring the S2 and S3 assumptions to `/agentic-pm:research` to plan the next round of validation.
