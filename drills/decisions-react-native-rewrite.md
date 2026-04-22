---
skill: /agentic-pm:decisions
scenario: Engineering wants to rewrite the mobile app in React Native. PM has been asked to document the decision. Two camps have formed.
spine: Full SPIDER — significant two-way door decision, team is split
---

# Drill: Mobile App Rewrite in React Native — Document It Before It Gets Relitigated

## Situation

Driftwood (the habit-tracking app) has a native iOS app (Swift) and a native Android app (Kotlin). Engineering has proposed rewriting both in React Native to cut mobile team headcount and ship cross-platform faster. Two camps: the iOS lead says the UX will regress; the backend lead says the maintenance cost of two native codebases is unsustainable. The Head of Product has been asked to document the decision before the engineering offsite next week where it will be called.

## How the skill ran

### Spine autoselect

The skill asked four questions:

1. **What is the decision?** — "Whether to rewrite Driftwood's iOS and Android apps in React Native, replacing the current native codebases."
2. **Is this reversible?** — "Sort of — we could go back to native, but it would take 9–12 months of re-engineering and there would be significant team disruption."
3. **Is this about 'why isn't something getting done' rather than 'which option to choose'?** — "No, this is a genuine options decision."
4. **Is there information we don't have that would meaningfully change this decision?** — "Maybe — we don't have a performance benchmark of React Native vs. native for our specific interactions."

**Spine selected: Full SPIDER.** The rewrite is a significant two-way door decision — technically reversible but costly enough that it's effectively one-way in practice. Team is split. Full SPIDER required, not mini-SPIDER.

On question 4: the skill flagged a possible Decision-First Research handoff. The PM declined — "We can make the decision without the benchmark; we'll live with that uncertainty and note it in the Explanation field." Proceeding with SPIDER.

**Reversibility classification:**

> "This is a two-way door decision that behaves like a one-way door in practice. The theoretical ability to revert doesn't reduce the real cost of reverting. Treat this as high-stakes and run the full SPIDER."

---

### Step-by-step (condensed)

**Step 1 — Situation**

Written for someone unfamiliar with the project:

> Driftwood currently maintains two separate native mobile codebases: iOS (Swift, ~45K LOC) and Android (Kotlin, ~38K LOC). Maintaining feature parity across both adds ~2–3 weeks to every feature shipped. The mobile team is 2 iOS engineers and 2 Android engineers; the Android lead is leaving in Q1. Engineering leadership has proposed a full rewrite in React Native, which would allow one shared codebase maintained by a smaller cross-platform team. The iOS lead has raised concerns about animation fidelity and haptic feedback quality in React Native. A decision is needed before the Q1 hiring plan is finalized.

**Step 2 — People**

| Role | Person | Notes |
|---|---|---|
| Advocate | VP Engineering (Marcus) | Proposing React Native |
| Approver | CEO (Priya) | Cannot be skipped — this affects headcount and product quality |
| Input-givers | iOS Lead (Sophie), Android Lead (James), Head of Design (Yuki) | Must be consulted before Decision field is filled |
| Aligned (informed after) | Mobile team, CS team | Affected but not decision-makers |

**Stakeholder gap check flagged one issue:**

> "The Head of Design (Yuki) is listed as an Input-giver but hasn't been consulted yet. Driftwood's core UX relies heavily on animations and haptic feedback — exactly the area Sophie has flagged as risky in React Native. Yuki's input on acceptable UX regression is material to this decision. Do not finalize the Decision field before consulting her."

**Step 3 — Ideas (all options, listed neutrally)**

The skill enforced neutrality in this section — pros/cons without advocacy:

**Option A: Rewrite in React Native**
- Pros: Single codebase, faster cross-platform shipping, reduced headcount need, strong ecosystem (Shopify, Meta, Coinbase use it at scale)
- Cons: Known animation and haptic limitations; 6–9 month rewrite timeline during which no new features ship; team will need to re-learn paradigm; debugging tooling is less mature than native
- Unknowns: Performance on Driftwood's specific animation-heavy habit-check interaction (not benchmarked)

**Option B: Maintain current native codebases; hire to backfill Android lead**
- Pros: Zero UX regression; no timeline disruption; team already expert; iOS lead satisfied
- Cons: Ongoing 2–3 week parity overhead per feature; hiring cost; two separate stacks accumulate technical debt independently; risk of same problem recurring in 2 years
- Unknowns: How long before the iOS codebase also needs a significant refactor?

**Option C: Rewrite Android only in React Native; keep iOS native**
- Pros: Reduces maintenance burden by ~half; lower risk (Android UX expectations are more forgiving of cross-platform); tests React Native before committing fully
- Cons: Still two codebases, just one is React Native; doesn't solve the fundamental problem; may create a worse hybrid state
- Unknowns: Whether a hybrid codebase is harder to maintain than two fully native ones

**Option D: Adopt a Flutter rewrite instead of React Native**
- Pros: Flutter's animation performance is closer to native; Dart compiles to native ARM; growing ecosystem
- Cons: Team has no Dart experience; harder to hire for; less adjacent to existing JS/TS skills in the web team
- Unknowns: Migration complexity compared to React Native

*Note: Options C and D were not part of the original proposal. The skill added them when the PM confirmed no other options had been formally considered. Per SPIDER: "If their idea is absent, they will relitigate regardless."*

**Step 4 — Decision**

Left intentionally blank pending Yuki's input and a performance benchmark decision (accept uncertainty or run the test). The Approver (CEO) fills this field.

**Step 5 — Explanation**

Pre-filled with the expected framing once a decision is reached:

> [To be filled by Approver] The chosen option was selected based on [weight of UX risk vs. maintenance cost]. Key trade-off: [faster shipping vs. animation fidelity]. The benchmark question was [resolved / accepted as unknown]. This decision commits Driftwood to [describe commitment] for approximately [timeline].

**Step 6 — Rollout**

Filled in for Option A (the proposed option) as a pre-draft; to be adjusted per actual decision:

| Owner | Action | Timeline |
|---|---|---|
| VP Eng (Marcus) | Stand up React Native proof-of-concept for habit-check animation | 2 weeks pre-decision |
| iOS Lead (Sophie) | Review PoC and write 1-page UX regression assessment | 1 week post-PoC |
| Head of Design (Yuki) | Define minimum animation fidelity threshold | 1 week (input-giver consultation) |
| CEO (Priya) | Call decision at engineering offsite | Oct 28 |
| VP Eng (Marcus) | Kick off rewrite planning if Option A chosen | Nov 4 |

**Decision date:** October 28, 2024 (engineering offsite).

---

### Quality bar — what fired

**Check 1: Ideas section includes all options, including ones the advocate dislikes.** Passed. Flutter (Option D) and the hybrid Android-only approach (Option C) were added at the skill's prompting. The iOS lead (who opposes the rewrite) now sees "stay native" listed as Option B with fair pros/cons.

**Check 2: Approver is explicitly named.** Passed. CEO Priya named; decision date set.

**Check 3: Input-givers consulted before Decision field filled.** One gap flagged, propagated as tag:

> "The artifact is tagged `stakeholders-pending`: Yuki (Head of Design) has not been consulted. Her input on UX regression thresholds is material. The Decision field remains blank until she has weighed in. Don't let the engineering offsite override this — if Yuki's input isn't in the document, the iOS lead will raise it in the meeting and the decision will be relitigated on the spot."

---

## Output artifact (excerpt)

`Work/decisions/2024-10-28-react-native-rewrite.md` — excerpt:

---

**Decision:** Whether to rewrite Driftwood's mobile apps in React Native

**Date:** 2024-10-28 | **Status:** PENDING (input-givers not yet consulted — see stakeholders-pending tag)

**Reversibility:** Two-way door in theory; one-way in practice (9–12 month revert cost). Treat as high-stakes.

**People:**
- Advocate: Marcus (VP Eng)
- Approver: Priya (CEO) — **decision cannot close without her**
- Input-givers: Sophie (iOS Lead), James (Android Lead), Yuki (Head of Design) — **Yuki not yet consulted**
- Aligned: Mobile team, CS team

**Ideas summary:**

| Option | Core trade-off | Recommended next step |
|---|---|---|
| A: Full React Native rewrite | Ship speed vs. UX fidelity | PoC needed to assess animation risk |
| B: Stay native, hire | UX safety vs. maintenance cost | Quantify hiring cost + 2-year trajectory |
| C: Android-only React Native | Partial relief, hybrid risk | Likely dominated by A or B |
| D: Flutter rewrite | Better animation, higher learning curve | De-prioritized unless A benchmarks poorly |

**Decision:** [BLANK — Approver to fill at offsite, after Yuki consult]

**Tag:** `stakeholders-pending` — Yuki (Head of Design) not yet consulted

---

## What the PM does next

Get Yuki's input before the offsite — one 30-minute conversation, not a meeting. Ask her specifically: "What's the minimum acceptable quality for the habit-check animation? Would you be willing to sign off on a React Native PoC if it hits that bar?" That answer determines whether the benchmark is worth running. Then send the document to all Input-givers 48 hours before the offsite so no one is reading it for the first time in the room.
