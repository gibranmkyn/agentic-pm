---
name: iterate-feature
description: Use this playbook when the PM has shipped an AI feature (in beta or GA) and is now in the permanent-iteration phase — establishing the weekly rhythm, the living edge-case doc, the prompt library mindset, the morning ritual, and the cadence of real user conversations. Loaded by the coach skill, not invoked directly.
---

# Iterate-Feature — From shipped to permanent iteration as operating rhythm

## Use case

This playbook is for the PM whose AI feature is live and who needs to set up — or audit — the recurring cadence that keeps it improving. Iteration is not a phase to exit. Per Justin Farris/GitLab: *"Beta is not temporary. 328 deployments over 18 months."* The job here is to establish a sustainable weekly rhythm that compounds, not a "let's revisit in Q3" plan that lets the feature decay.

This playbook is the recurring loop in the AI product arc. PMs return to it again and again; the artifact is a running log, not a one-shot document.

---

## Locate

Ask:

1. **"How long has the feature been live? Days, weeks, months?"** — different stages need different rhythms. Day 1–30: aggressive daily review. Month 2–6: weekly cadence stabilizes. Beyond: rhythm + occasional deeper dives.
2. **"What's already running — error analysis cadence, edge-case doc, eval pipeline, user conversations? Or is iteration ad hoc right now?"** — distinguishes "set up the rhythm from scratch" from "audit and tighten an existing rhythm."
3. **"What's the current pressure — a quality issue, a model swap on the horizon, leadership asking 'is this done yet,' or just steady state?"** — shapes which sub-steps to prioritize this session.

Read `.agentic-pm/` for existing artifacts. If `.agentic-pm/evals/<feature>-error-journal.md` or similar exists from prior sessions, pick up the iteration log from there rather than starting fresh.

**MCP awareness:** If an eval-platform MCP is configured, use it for the daily morning ritual — pull yesterday's production examples, surface novel failures, add to the offline dataset. The whole iteration cadence (daily / weekly / bi-weekly) is dramatically lower-friction with an MCP wired up. If no MCP is available, the PM needs a manual ritual — bookmark the eval platform UI, set a daily 15-minute calendar block, paste examples into the iteration log. Either path requires the cadence; the MCP path makes it sustainable.

---

## Spine

One spine, no autoselect: Farris's Phase 3 (iteration as permanent state) — living edge-case doc + prompt library abstraction + ongoing user conversations — combined with the morning ritual (Goyal/Hamel: production examples → eval reconciliation → novel failures → offline dataset). Capability Funnel framing makes the cadence experiment-counted, not feature-counted.

---

## Sub-steps

### 1. Establish or audit the iteration cadence

Force the PM to commit to a weekly rhythm. Generic answers fail this step.

*Ask:*
- **"What's happening every week, every day, every month? Walk me through the cadence."**
- **"Who owns each cadence — name the human?"**

Recommended baseline (adapt to feature stage):

| Cadence | Activity | Time | Owner |
|---|---|---|---|
| Daily | Pull 5–10 production examples; eyeball; jot vibes | 15 min | PM |
| Weekly | Error analysis on ~30 traces (sample to saturation if topics shift); update edge-case doc | 60–90 min | PM + benevolent dictator |
| Weekly | Reconcile eval scores with what the daily review surfaced; flag drift | 30 min | PM + eng |
| Bi-weekly | User conversation — 1 expert user, 30 min, on real usage | 30 min | PM |
| Monthly | Re-run full prompt library against current model; check for regressions | (eng-led) | Eng + PM |
| Quarterly | Impact review (route to `review-impact.md`) | (separate session) | PM + leadership |

*Ask:* **"Which of these is currently happening, and which is slipping? What's the actual time commitment — not the aspirational one?"**

Flag if missing:
- "We'll review monthly" — too slow. Drift accumulates between cycles. Per Hamel: 60–80% of dev time is error analysis + eval work; this isn't overhead, it's the work.
- No owner per cadence — cadences without owners decay.
- All cadences land on the PM with no eng counterpart — sustainable for ~3 weeks, then breaks.

### 2. Build (or update) the living edge-case document

Per Farris: maintain a *living edge-case document* — group, stack, prioritize. Make it shareable so eng + design see what users actually do.

*Ask:*
- **"Where is the edge-case doc? Who reads it? When was it last updated?"**
- **"How are edge cases grouped — by failure mode, by Three Gulf, by user persona, by feature surface?"**

The doc should:
- Live in `.agentic-pm/iteration/<feature>-edge-cases.md` (or a shared location accessible to eng + design)
- Group cases by failure mode (cluster from axial coding)
- Include real examples (anonymized verbatim, not paraphrased)
- Be prioritized — top failure modes by frequency × severity, not just a flat list
- Be appended to weekly, not rewritten — the history matters for tracking how failure modes evolve

Flag if missing:
- Edge cases live only in Slack messages or in the PM's head. → externalize, this week.
- Edge cases are listed but not grouped or prioritized. → run an axial coding pass.
- Eng and design haven't seen the doc. → fix the visibility, not by Slack-pinging — make it part of the cadence.

### 3. Establish the prompt library abstraction (PM-aware, eng-built)

Per Farris: wrap model calls in a library so models and prompts can be swapped independently without rewiring product code. The PM doesn't write the code, but should know this exists and demand it.

*Ask:*
- **"How does a prompt change get deployed today — code change, config change, separate prompt management tool?"**
- **"When a new model arrives, how does it get evaluated against the current prompt set?"**

Required properties (PM should ensure these are true):
- Prompts are versioned in Git, not in a separate prompt management tool. (Per Hamel: prompt management tools create indirection.)
- Prompts are deployed atomically with application code.
- The full prompt library can be re-run against any new model on demand, with results scored against baseline.
- Eng can swap a model behind a feature flag without touching product code.

Flag if missing:
- Prompts are scattered across files / not versioned. → call out the regression risk.
- Model swaps require a code review and a new release. → too slow; iteration speed will suffer.
- No baseline scoring exists, so "this model is better" is a gut call. → name the gap.

### 4. Establish the morning ritual

Per Goyal: best teams' daily rhythm is *daily standup → pull production examples from yesterday → reconcile with eval scores → find novel failures → add to offline dataset → grind on those failures.*

*Ask:* **"What's your morning ritual — concretely, what do you look at before standup?"**

The ritual should produce, weekly:
- 5–20 new traces flagged as novel failures
- Annotation labels for those traces (PM as benevolent dictator)
- Adds to the offline eval dataset (so the dataset grows from production reality, not from imagined scenarios)
- A running list of "vibes" — qualitative observations captured immediately, before they evaporate from chat history

Per Hamel: *"Maintain failing evals deliberately — if everything passes, you have blind spots."* The eval set should always have some failures in it. A 100% pass rate is a sign the dataset is stale.

Flag if missing:
- The ritual is "check dashboards." → dashboards aggregate; you need to look at *individual outputs.*
- No vibes capture. → "Write down the vibes" the moment you see something wrong; they evaporate fast.
- The offline dataset hasn't grown in weeks. → fix the production-to-CI flywheel.

### 5. Run new models through the full prompt library before deploying

When a new model arrives (and one will, frequently), the playbook is:
1. Run the full prompt library against the new model with no other changes.
2. Score against the current baseline using the same eval pipeline.
3. Compare per failure mode — not just aggregate. (A new model can improve aggregate quality while regressing on a specific failure mode that matters to your most loyal users.)
4. Decide — adopt, ablate, hold.

*Ask:* **"When was the last time you ran the prompt library against a new model? What happened?"**

Flag if missing:
- The team adopts new models based on benchmarks rather than the prompt library. → benchmarks measure other people's tasks, not yours.
- "We'll do that when the next big model drops" — too slow. Models drop monthly now; have the harness ready.

### 6. Schedule periodic real user conversations (not surveys)

Per Farris: *"Don't hide behind surveys. Get out and talk to users regularly. The gap between survey responses and actual usage behavior is enormous for AI products."*

*Ask:*
- **"When was your last real conversation with an expert user — actual back-and-forth, not a survey?"**
- **"What's the cadence going forward — bi-weekly, monthly?"**

Push for: a calendared cadence with named users. "When we have time" = never. Per the wiki, novelty-driven acquisition masks true PMF (Hilary Gridley / WHOOP) — without longitudinal conversations, the team will misread engagement.

Recommended: at least 2 expert users on a bi-weekly conversation cycle for the first 6 months post-launch. The same benevolent-dictator from discovery is the strongest candidate.

Flag if missing:
- Survey data is the primary signal. → name the gap; surveys lie about AI usage specifically.
- "Users are happy, NPS is up." → press: which users? At what cadence? On what behavior?

### 7. Capability Funnel framing — count experiments, not features

Per Bischof + Hamel: roadmaps for AI features should commit to capability levels and experiments, not feature outcomes by date.

*Ask:*
- **"What capability level are you currently at? What's level N+1?"**
- **"How are you reporting iteration progress to leadership — features shipped, or experiments run + capability levels reached?"**

If the PM is reporting features-shipped, name the framing problem. Leadership will interpret "feature shipped" as done; the AI feature is never done. Reframe: *"At end of Q3, we expect to reach capability level 4. If not, we pivot."*

### 8. Resist "we're done now" framing

End every iterate-feature session by naming the framing risk. Common forms:
- Leadership asks "when is this done?" — push back: AI features are in permanent iteration; the right question is "where is the bottleneck."
- The PM proposes archiving the iteration log because "the feature is stable." → stable doesn't mean static; the model and the user behavior both drift.
- Eng wants to deprioritize the eval harness for a quarter to ship something else. → name the cost: drift accumulates silently and surfaces as a quality crisis later.

If the PM treats this playbook as a one-shot setup rather than a recurring rhythm, that's the most important gap to flag.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Iteration treated as permanent state, not a phase to exit | AI Product Development Process: "Beta is not temporary. GitLab's code suggestions: 328 deployments over ~18 months, still in iteration." |
| Living edge-case doc exists, is updated weekly, and is shared with eng + design | AI Product Development Process: "Maintain a living edge-case document: group, stack, and use it to drive prioritization and stakeholder visibility." |
| Prompt library abstraction in place — models and prompts swappable independently | AI Product Development Process: "Implement prompt library abstraction: wrap model calls in a library so you can swap models and prompts independently without rewiring the product." |
| New models run through the full prompt library against baseline before deploying | AI Product Development Process: "Run new models through the full prompt library before deploying — score against baseline to catch regressions." |
| Periodic real user conversations scheduled (not just survey data) | AI Product Development Process: "Don't hide behind surveys. Get out and talk to users regularly. The gap between survey responses and actual usage behavior is enormous for AI products." |
| Eval set grows from production failures, not static | AI Evals: "When monitoring reveals new failures, add representative examples to CI dataset — prevents regressions on newly discovered issues." |
| Morning ritual exists: daily production review → vibes capture → novel failures → offline dataset adds | AI Evals: "Best teams: daily standup → pull production examples from yesterday → reconcile with eval scores → find novel failures → add to offline dataset → grind on those failures." |
| "Failing evals deliberately maintained" — dataset has known failures, not 100% pass rate | AI Evals: "Maintain failing evals deliberately — if everything passes, you have blind spots." |
| Vibes captured the moment they're observed, not deferred | AI Evals: "Write down the vibes — qualitative observations evaporate from chat history; capture them immediately." |
| Iteration progress reported as experiments + capability levels, not features shipped | Capability Funnel: "Commit to experiments, not outcomes... 'At the end of three months, if we reach capability level 4, we move to production. If not, we pivot.'" |
| Each cadence has a named owner | AI Evals (operational): cadences without owners decay. |

If any check is unmet, name the gap. The most common gap is "we'll get to that" — which is how the rhythm dies.

---

## Output

`.agentic-pm/iteration/<feature>-iteration-log.md` — a running log appended each session, not rewritten. Each entry contains:

1. **Date + session focus** (cadence audit, edge-case review, model swap, etc.)
2. **What was tried this cycle** (prompt change, retrieval tweak, guardrail addition, model swap)
3. **Eval impact** (per-failure-mode scores before/after, not aggregate; production samples that confirm or contradict the eval signal)
4. **New edge cases added** (with verbatim examples)
5. **User-conversation notes** (who, what they said, what behavior was observed)
6. **Open questions for next cycle**
7. **Cadence health** (which rhythms ran, which slipped, who owns the recovery)

Adjacent artifact: `.agentic-pm/iteration/<feature>-edge-cases.md` — the living edge-case doc, grouped by failure mode, prioritized by frequency × severity, appended weekly.

---

## Handoffs

- **When a quality issue surfaces:** route to `error-analysis.md` for a focused diagnosis (sample to saturation → axial coding → Three Gulfs → fix sequencing).
- **When the eval pipeline judge needs revalidation against new failure modes:** route to `validate-judge.md`.
- **When leadership asks for a quarterly check-in:** route to `review-impact.md`.
- **When a new feature within the same product is being scoped:** route to `discover-ai-feature.md`. The iteration log is input to that discovery.

End the session with: which cadence is most fragile right now (most likely to slip), and one concrete action in the next 48 hours to keep it alive — typically: schedule the bi-weekly user conversation, run today's morning ritual on 5 production traces, or update the edge-case doc with the failure mode you've been carrying in your head.
