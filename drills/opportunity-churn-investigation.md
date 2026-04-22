---
skill: /agentic-pm:opportunity
scenario: Churn is up 15% QoQ at a B2C subscription app. Team is guessing at causes. PM has 6 interview transcripts.
spine: OST — default, not OKR-shaped; team uses opportunity language; not B2B
---

# Drill: Churn Spike, 6 Transcripts, No Clear Cause

## Situation

Driftwood is a B2C habit-tracking app with a subscription tier ($7.99/mo). Churn spiked from 4.2% monthly to 4.8% monthly over the last two quarters — 15% relative increase. The engineering team is pointing at onboarding friction. Marketing is pointing at pricing. The PM ran 6 exit interviews with users who cancelled in the last 30 days and now has transcripts. Nobody has looked at them yet.

## How the skill ran

### Spine autoselect

The skill asked four questions:

1. **What outcome metric are you trying to move?** — "Monthly churn rate. We want to get it back below 4%."
2. **Is your team structured around OKRs, or do you use opportunity language?** — "We use opportunity language — nobody here talks about KRs."
3. **Is this B2B with a distinct buyer vs. end-user?** — "No, direct-to-consumer."
4. **Are you creating a new tree or updating an existing one?** — "New tree — we've never done this before."

**Spine selected: OST (default).** Team is not OKR-native; no B2B split. Outcome metric is clear. Proceeding with the standard flow: tiered input pipeline → snapshot files → opportunity tree.

---

### Step-by-step (condensed)

**Step 1 — Experience moment decomposition**

Before touching the transcripts, the skill mapped the user journey into 5 candidate opportunity areas:

- Onboarding (day 0–3): first habit set-up, first streak
- Daily engagement loop: checking in, seeing progress
- Plateau / stagnation: streaks reset, goals feel static
- Social / accountability layer: sharing, comparing
- Billing / value re-evaluation: renewal reminder, price increase

**Step 2 — Tiered input pipeline: Transcript snapshots (Tier 1)**

The skill processed each transcript through the snapshot template. Here is Snapshot 3 in full:

---

`Work/discovery/snapshots/2024-10-14-P3.md`

**Participant:** P3 — 34F, used Driftwood for 7 months, cancelled after missing a 21-day streak.

**Experience map (chronological):**
- Months 1–3: High engagement, building a sleep and hydration habit. Checked in daily.
- Month 4: Missed a three-day stretch during a work trip. Streak reset to zero.
- Months 5–6: Continued but felt "less invested." Habit goals felt the same as before.
- Month 7: Renewal reminder arrived. Didn't feel like she was getting more value than a free app. Cancelled.

**Opportunities (unmet needs):**
- `[story]` She had no way to preserve partial credit for a streak she came back to — the binary reset felt punishing, not motivating.
- `[story]` After 4 months, her habit goals hadn't evolved. No prompts to raise the bar or add variety.
- `[opinion]` Said she "probably would have stayed" if the price were lower — flagged as weak signal, no behavioral anchor.

**Verbatim salient quote:**
> "I came back from the trip determined to restart. And then I saw zero. All of it was gone. I just… didn't care anymore."

**Misc insights:** High activation (7 months). Churn not driven by onboarding. Churn trigger: loss of meaning after streak reset + no progression signal.

---

**Step 3 — Opportunity surfacing (cross-transcript synthesis)**

After all 6 snapshots, the skill ran a synthesis pass:

| Opportunity area | Evidence count | Evidence type | Frequency |
|---|---|---|---|
| Streak loss feels punishing, not recoverable | 4/6 transcripts | `[story]` | High |
| No progression — habits feel static after 3+ months | 3/6 transcripts | `[story]` | Medium |
| Renewal trigger hits with no value reminder | 3/6 transcripts | `[story]` | Medium |
| Social / accountability layer missing | 2/6 transcripts | `[opinion]` | Low |
| Price too high | 2/6 transcripts | `[opinion]` | Low |

Note: "Price too high" and "social layer missing" are `[opinion]`-anchored only. Not placed in the tree.

**One solution-in-disguise flagged:**

> "Add a streak recovery feature" — flagged. This is a solution (a feature capability), not an opportunity. The opportunity above it is: "Users who miss days feel the reset is unfair and lose motivation to continue." Rewritten and placed correctly in the tree.

**Step 4 — Tree population**

OST produced with churn rate as outcome:

```
Outcome: Reduce monthly churn from 4.8% → <4.0%
│
├── [Opportunity 1] Users who break a streak feel punished and disengage
│   ├── Solution A: "Streak shield" — one free forgiveness day per month
│   ├── Solution B: Progressive streak recovery — partial credit for returning within 48h
│   ├── Solution C: Reframe metric from "streak length" to "completion rate over 30 days"
│   └── Solution D: Scheduled "off days" that don't break streaks
│
├── [Opportunity 2] Long-term users feel no progression — habits go stale
│   ├── Solution A: Dynamic challenge level suggestions at the 90-day mark
│   ├── Solution B: Habit library expansion prompts at milestone anniversaries
│   └── Solution C: PM-curated "level up" flows every 3 months
│
└── [Opportunity 3] Renewal reminder arrives with no value signal
    ├── Solution A: Pre-renewal summary email: your year in habits (streaks, completions)
    ├── Solution B: In-app renewal flow showing progress vs. free-tier limits
    └── Solution C: Proactive "you're about to renew — here's what's new" push

[Opportunities parked pending more stories:]
- Social / accountability layer
- Price sensitivity
```

**Step 5 — Target selection**

Ranked opportunity areas by: frequency × pain intensity × proximity to churn rate.

Winner: **Opportunity 1 (streak loss/disengagement).** Appeared in 4/6 stories, highest emotional intensity in transcripts, direct behavioral path to churn event. Recommended: start with Solution B (partial credit recovery) — cheapest to test via a toggle in a smoke test.

---

### Quality bar — what fired

**Check 1: Every opportunity sourced from customer stories.** Passed. All three tree-placed opportunities carry `[story]` tags with transcript citations. "Price too high" was parked — no behavioral anchor.

**Check 2: No solution placed without a parent opportunity.** Passed. "Streak recovery feature" was flagged as a solution-in-disguise during tree population and rewritten as opportunity 1 before any solutions were placed.

**Check 3: 3–7 opportunity areas at top of tree.** Passed. Three areas placed, two parked pending more stories. The skill noted:

> "We have behavioral signal for 3 opportunity areas. The social and price buckets are opinion-only — placing them would make the tree feel complete but actually just hides weak evidence. Leave them parked."

---

## Output artifact (excerpt)

`Work/discovery/driftwood-habit-ost.md` — excerpt:

---

**Outcome:** Reduce monthly churn from 4.8% → <4.0% by Q2

**Evidence base:** 6 exit interviews (Oct 2024); snapshot files in `Work/discovery/snapshots/`

**Target opportunity:** Streak loss and disengagement (Opportunity 1)

**Why this target:** Highest frequency (4/6 stories), highest emotional intensity, clearest causal path — users who reset streaks showed withdrawal behavior within 48h. Proximity to the churn metric is direct: disengagement → no renewal.

**Solutions under investigation (Opportunity 1):**
1. Progressive streak recovery — partial credit if you return within 48h
2. Streak shield — one forgiveness day per month
3. Completion rate reframe — move from streak length to 30-day %
4. Scheduled off days — pre-declared days don't break the streak

**Parked (opinion-only signal, pending behavioral stories):**
- Social / accountability layer
- Price sensitivity

**Completeness note:** Tree is intentionally incomplete at the edges. We have strong signal on the emotional arc of streak loss. We don't yet have stories about why users who *didn't* churn stayed. Run 3 interviews with 6+ month retained users before committing to solutions.

---

## What the PM does next

Run 3 retention interviews with users who reset a streak but *didn't* cancel — these are the counter-stories. Then take the tree + solution set to `/agentic-pm:assumptions` to surface what would kill Solution B (partial credit recovery) before building anything.
