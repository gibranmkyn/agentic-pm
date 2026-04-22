---
skill: /agentic-pm:eval-plan
scenario: A customer support AI chatbot has been live 3 weeks. Support lead says quality is "off" but can't name what's wrong.
spine: Traces-First / Error Analysis — post-launch, real traces exist
---

# Drill: Support Chatbot, 3 Weeks Live, "Something Is Off"

## Situation

Canopy is a B2B SaaS project management tool with ~4,000 business customers. Three weeks ago, they launched an AI support chatbot trained on their help docs. The support lead flagged it in the weekly standup: "The bot isn't doing its job but I can't articulate why." No one has looked at the traces. The PM owns the AI feature and needs to figure out what's failing before the next sprint planning.

## How the skill ran

### Spine autoselect

The skill asked four questions:

1. **Have you shipped this AI feature yet, or is it still pre-launch?** — "Live for 3 weeks."
2. **What type of AI feature is it?** — "Open-ended generation — answers support questions based on help docs."
3. **Do you have production traces to review?** — "Yes. We have 847 chat sessions from the last 3 weeks."
4. **Who on the team would be the Principal Domain Expert?** — "The support lead — she's reviewed thousands of support tickets and knows what a good answer looks like."

**Spine selected: Traces-First (Error Analysis + Three Gulfs diagnostic).** Post-launch, real traces exist. Starting with a 100-trace sample, axial coding, pivot table, then Three Gulfs diagnosis on top categories. LLM Judge handoff will be offered after ≥100 labeled traces (satisfied by this analysis).

---

### Step-by-step (condensed)

**Step 1 — Sample 100 diverse traces**

From 847 sessions, the skill recommended deliberate sampling (not random):

- 40 traces: randomly sampled across all sessions (baseline)
- 20 traces: sessions where the user sent >3 messages (complexity / frustration signal)
- 20 traces: sessions ending in "Contact Support" escalation click (failure signal)
- 10 traces: sessions from the first 3 days post-launch (early edge cases)
- 10 traces: sessions containing "thanks" or "that helped" (success examples for contrast)

Total: 100 traces. PM reviewed alongside support lead.

**Step 2 — Rough notes (30–45 seconds per trace)**

After reviewing 100 traces, the PM had raw notes. Sample:

```
T007: User asked how to set up recurring tasks. Bot gave instructions for the old UI (pre-March update). Wrong answer.
T012: User asked why their notification isn't firing. Bot said "check your settings" — too vague, no specific path.
T019: User asked about API rate limits. Bot said "please contact support" — this is documented in the API guide.
T034: Bot answered correctly. User said "thanks, got it."
T041: User asked same question twice — bot gave the same answer both times with no acknowledgment of repetition.
T058: Bot correctly diagnosed the issue but gave 7 steps when the help doc had 3. Overcomplicated.
T067: User asked if feature X works in Firefox. Bot said "yes." It doesn't. Wrong answer.
...
```

**Step 3 — Axial coding → failure categories**

The PM exported 100 notes and asked an LLM to propose 5–6 categories. Initial proposals: "Wrong answers," "Incomplete answers," "Unhelpful deflections," "Repetition issues." The PM refined for specificity:

Final categories:
1. **Stale content** — bot references outdated UI or features that changed post-training
2. **Documentation exists, bot deflects** — answer is in the help docs but bot told user to contact support
3. **Over-length / over-complicated** — correct information, wrapped in too many steps
4. **Factual error** — confident wrong answer (feature availability, browser support)
5. **Conversational breakdown** — bot repeated itself, ignored follow-up, or lost thread mid-session

**Step 4 — Labeling and pivot table**

All 100 traces labeled against the five categories (some traces had multiple issues; primary label used for the pivot):

| Category | Count | % of failures |
|---|---|---|
| Stale content | 27 | 35% |
| Documentation exists, bot deflects | 18 | 23% |
| Factual error | 14 | 18% |
| Over-length / over-complicated | 11 | 14% |
| Conversational breakdown | 7 | 9% |

**Top 2 categories: Stale content (35%) and documentation-exists-but-deflects (23%).** Together they account for 58% of failures.

**Step 5 — Three Gulfs diagnosis on top 2 categories**

**Category 1: Stale content (35%)**

> Gulf diagnosis: **Specification gulf.** The bot's knowledge cutoff predates the March UI update. This isn't a model capability issue — it's a knowledge update cadence issue. The system prompt or RAG source hasn't been refreshed.
>
> Fix type: Specification → update the RAG source with the March release notes and new UI screenshots. Check how often help docs refresh and whether the pipeline auto-ingests or requires manual update.
>
> Estimated effort: 1–2 days to update the ingestion pipeline; 1 day to validate.

**Category 2: Documentation exists, bot deflects (23%)**

> Gulf diagnosis: **Specification gulf (retrieval).** The answer exists but the bot isn't finding it — likely a retrieval relevance problem. The bot is defaulting to a "contact support" fallback when its confidence drops below a threshold.
>
> Fix type: Specification → lower the deflection threshold or expand the retrieval context window. Run 10 "deflection" examples through the retrieval step to verify they're retrieving the wrong document (retrieval failure) vs. retrieving correctly but generating wrong output (generation failure). Different fix.
>
> Estimated effort: 2–3 days to diagnose retrieval vs. generation split; 1 week to fix.

**Step 6 — Fix sequencing**

Cheapest-first:

1. **Refresh RAG source** (stale content) — 2 days, high ROI, solves 35% of failures
2. **Diagnose and fix deflection threshold** (deflects on good retrieval) — 3 days, solves 23%
3. **Add response length guardrail** (over-long answers) — 1 day, solves 14%
4. **Audit high-confidence factual errors** (browser compatibility, feature availability) — 3 days, solves 18%; lower priority because it requires manual human review before going into training
5. **Conversational context retention** — 7% of failures; deprioritized to next sprint

Total expected improvement from fixes 1–3: ~72% of current failures addressed.

---

### Quality bar — what fired

**Check 1: Sample ≥100 traces before axial coding.** Passed. 100 traces reviewed before any categories proposed.

**Check 2: Categories emerge from data, not pre-set.** Passed. The PM rejected "Incomplete answers" as too vague and refined to "Documentation exists, bot deflects" — specific enough for independent labeling.

**Check 3: Failure mapped to gulf before fix type chosen.** Passed for top 2. The skill flagged a near-miss:

> "Category 4 (factual errors) was initially classified as Model Capability gulf — 'the model just gets these wrong.' That's premature. Before assigning model capability, check whether a retrieval step is feeding wrong source material. It's a Specification gulf until proven otherwise. Don't jump to fine-tuning before you've ruled out a data problem."

---

## Output artifact (excerpt)

`Work/evals/canopy-support-bot-eval-plan.md` — excerpt:

---

**Feature:** Canopy AI Support Chatbot — post-launch error analysis

**Analysis date:** 2024-10-21 | **Traces reviewed:** 100 of 847 (deliberate sample)

**Principal Domain Expert:** Head of Support (reviewed 30% of labeled traces for calibration)

**Error taxonomy:**

| Category | Count | Gulf | Fix type | Sprint |
|---|---|---|---|---|
| Stale content | 27 (35%) | Specification | Refresh RAG source | This sprint |
| Documentation exists, bot deflects | 18 (23%) | Specification (retrieval) | Diagnose retrieval vs. generation; fix threshold | This sprint |
| Factual error | 14 (18%) | TBD — check retrieval before assuming model cap | Human review + source update | Next sprint |
| Over-length responses | 11 (14%) | Specification | Response length guardrail in prompt | This sprint |
| Conversational breakdown | 7 (9%) | Generalization | Expand context window; add session-aware follow-up | Next sprint |

**LLM Judge opportunity:** 100 labeled traces now exist. Recommend Critique Shadowing with the support lead to build a binary judge for Category 1 (stale content detection). Budget: 1–2 days. Will auto-catch 80%+ of this failure type in ongoing monitoring.

**Next error analysis pass:** 2024-11-21 (30 days). New edge cases will emerge as user base grows.

---

## What the PM does next

Bring the fix sequence to sprint planning. Fixes 1 and 4 (RAG refresh + response length guardrail) can ship together in 3 days. Before then: ask the support lead to run the Critique Shadowing session for the stale-content judge — it's 1–2 days and gives ongoing coverage for the highest-frequency failure. Schedule the next error analysis for November 21.
