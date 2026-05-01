---
name: design-eval-pipeline
description: Use this playbook when the PM has an AI feature in or approaching pre-launch and needs to decide what evals to build, at what cost, in what sequence — offline vs. online vs. human, what kind of judges, where the PM/eng boundary sits, and what NOT to formalize yet. Loaded by the coach skill, not invoked directly.
---

# Design-Eval-Pipeline — From rubric to a tiered, sequenced eval system

## Use case

This playbook is for the PM who has a rubric (or is about to) and needs to design the eval *system* — not just the rubric, not just the LLM judge, but the full mix of cheap-to-expensive evaluators, the pre-launch / production / human-review split, the guardrails-vs-evaluators decision, and the ownership boundary with engineering.

The risk this playbook prevents: defaulting to "build an LLM judge" because that's the prestige move. Per Hamel, the cost hierarchy goes Tier 0 (verifiable execution) → Tier 1 (code assertions) → Tier 2 (reference-based) → Tier 3 (LLM-as-Judge). Most failures should be caught at Tier 0–1. The playbook makes the PM defend any Tier 3 commitment.

---

## Locate

Ask:

1. **"Has any error analysis happened yet — manual review of real outputs, vibe-checks, axial coding? Or are you designing evals against imagined failures?"** — if no error analysis has happened, the eval pipeline being designed will measure the wrong things. Route to `error-analysis.md` first.
2. **"Is the feature already live, in beta, or pre-launch?"** — determines whether you're designing offline + online + human (live), or starting offline-only (pre-launch).
3. **"What's the budget for ongoing eval maintenance — labor, not compute? Are you committing to weekly error analysis, or hoping evals run themselves?"** — surfaces whether Tier 3 LLM judges are even maintainable. They need ~100 labeled examples to build, plus weekly upkeep against criteria drift.

If error analysis has happened (even informally), proceed. Otherwise the unblock is fieldwork: **look at the data first.**

**MCP awareness:** Before recommending a pipeline architecture, check what eval/data MCPs are available — that's signal about what infrastructure is already in place. A team with LangSmith MCP wired up has different defaults than a team running everything in Jupyter. If an eval-platform MCP is present, the design should use it as the central pipeline (offline + online + human queues). If only LLM API MCPs are present, the pipeline should default to notebook-centric workflows (per Hamel's recommendation: "use platforms only when you have a specific production blocker").

---

## Spine

Two frameworks layered, no autoselect:

1. **Cost hierarchy (Hamel):** Tier 0 (verifiable execution) → Tier 1 (code assertions) → Tier 2 (reference-based) → Tier 3 (LLM-as-Judge). Build the cheapest evaluator that catches the failure. Only escalate to Tier 3 for failures that persist after prompt fixes and that you'll iterate on 10+ times.
2. **Three eval types (Shukla):** Offline (pre-launch gate) + Online (continuous in production) + Human (1% sample, ongoing). All three are required at some maturity stage. Most teams only do offline.

Threaded through: three monitoring layers (system, quality, business), guardrails-vs-evaluators distinction, and the PM/eng ownership boundary.

---

## Sub-steps

### 1. List the failure modes the eval pipeline needs to catch

Pull from error analysis if it exists; otherwise stop and route there. Do not design evals against imagined failures.

*Ask:* **"What are the top 5 failure modes you've actually observed — in vibe-check, error analysis, or production?"**

Push for: named, distinct failure modes. Not "low quality." Not "hallucinations" without specifics. Each failure mode should be diagnosed against the Three Gulfs (Comprehension / Specification / Generalization) so the PM knows which gulf the eval is meant to close.

Flag if missing:
- Failure modes are abstract or aspirational ("we want it to be helpful").
- Failure modes are generic LLM categories (helpfulness, coherence) imported from prefab metrics. Per Hamel: *"Generic metrics are dangerous... in the worst case they create an illusion of confidence that is unjustified."*

### 2. Match each failure mode to the cheapest evaluator that catches it

Walk the cost hierarchy bottom-up. For each failure mode from step 1, ask: **"Could this be caught at Tier 0? Tier 1? Tier 2? Or does it genuinely need Tier 3?"**

Tier guidance:

- **Tier 0 — Verifiable execution.** Output is an executable artifact (SQL, code, JSON, config). Run it. Pass/fail = the most reliable eval possible. No judge, no human, no ambiguity.
- **Tier 1 — Code assertions, regex, schema validators.** Output has a structural property a deterministic check can verify. Format compliance, banned-words checks, length bounds, required fields, etc.
- **Tier 2 — Reference-based.** A known-correct answer exists. Compare against it (exact match, semantic similarity for retrieval only).
- **Tier 3 — LLM-as-Judge.** Failure is genuinely subjective: tone, faithfulness, relevance, completeness in a domain where rules can't enumerate "good." Most expensive: needs 100+ labeled examples to build, ~10–20% / 40% / 40% train/dev/test splits, validated TPR/TNR, and ongoing weekly maintenance.

Push hard: **"Why isn't this catchable at Tier 0–1? What's the specific subjective judgment a code check can't make?"**

The Teresa Torres case study (81% → 3% error rate via *keyword match*, not LLM judge) is the canonical example — domain expertise in a PM's hands often spots simple deterministic solutions engineers would over-engineer.

Flag if missing: the PM commits to Tier 3 by default. → Name the cost: 100+ labels, weekly maintenance, criteria drift risk. Push to escalate from Tier 1 only when failures persist after prompt fixes.

### 3. Sequence: error analysis → vibe-check rubric → judge construction (if at all)

Don't let the PM skip ahead. The wiki sequence is:

1. **Vibe check** — gestalt notes on 20–50 outputs. "Write down the vibes." Per Copilot team and OpenAI sources.
2. **Error analysis** — open coding of failure modes, axial coding to consolidate. PM-owned.
3. **Pre-launch rubric** — 1–5 scale with anchored examples per level (calibrated by humans, inter-rater agreement >80%).
4. **Code assertions** — Tier 0–1 evals for the failure modes that have deterministic shape.
5. **LLM judges (Tier 3)** — only for residual subjective failures; built via Critique Shadowing 5-step with train/dev/test splits.

*Ask:* **"Where are you in this sequence? What's the next missing piece?"**

Common failure: the PM wants to build the Tier 3 judge first because it's the prestige artifact. Push back hard. Per Hamel: *"Look at the data. Error analysis precedes evals. Vibe-check precedes rubrics. Manual review precedes LLM judges."*

### 4. Decide the eval-type mix (offline / online / human)

Per Shukla, all three are required. Walk through each:

**Offline (pre-launch gate).**
- *What:* curated dataset (100+ examples — core features, known regressions, edge cases). Run on every prompt change, every model swap.
- *Lives in CI.* Favor Tier 0–1 evaluators here for cost reasons; LLM judges only if the failure mode requires it.
- *Ask:* **"What's the offline dataset's source — production logs, synthetic data along Features × Scenarios × Personas, or both?"** Push for grounding in real customer scenarios per the Discovery-to-Eval Handoff. Synthetic data without discovery grounding produces evals that test the team's assumptions, not user reality.

**Online (continuous in production).**
- *What:* sampling production traffic asynchronously, running judges + assertions on it.
- *Catches:* drift, new failure modes, real edge cases users hit.
- *Ask:* **"What % of production traffic gets evaluated, and how do new failures get added back to the offline dataset?"** This is the flywheel — production failures must feed CI, or you'll regress.

**Human (1% sample, ongoing).**
- *What:* domain expert reviews ~1% of production traffic continuously.
- *Catches:* what LLM judges miss; surfaces criteria drift; keeps the team calibrated.
- *Ask:* **"Who's labeling, and how often? Is it the same expert who served as benevolent dictator in discovery?"** Per Hamel: don't outsource error analysis. The human in the loop is non-negotiable per Shankar's criteria-drift research.

Flag if missing: the PM commits only to offline. Name the gap — drift will be invisible, novel failures will accumulate silently, and the offline dataset will get stale.

### 5. Three monitoring layers (Shukla)

Distinct from the offline/online/human axis. Ask the PM to design instrumentation across all three:

| Layer | What to measure | What it tells you |
|---|---|---|
| **System** | Latency (P99, not P50), error rate, token usage, cost per call | Infrastructure is broken (or expensive) |
| **Quality** | Judge scores, thumbs up/down, task success, hallucination rate | The AI is working (or not) |
| **Business** | Feature adoption, retention, CSAT/NPS, support deflection, downstream metric the feature is meant to move | The feature is worth keeping |

*Ask:* **"What's the business-layer metric this feature is supposed to move? If quality scores improve but the business metric doesn't, what's your plan?"** Per Hamel + Aman, when quality and business metrics disagree, the eval is measuring the wrong thing. The PM is accountable for diagnosing the gap.

Flag if missing: the PM has quality metrics but no business metric. → name it. Quality without business impact is the 99% score trap.

### 6. Guardrails vs. evaluators — categorically different

This is a frequent confusion. Walk through the distinction:

| | Guardrails | Evaluators |
|---|---|---|
| **When** | Inline, before user sees response | Async, post-response |
| **Speed** | Fast (milliseconds) | Can be slow |
| **Type** | Deterministic (regex, block-lists, schema, refusal patterns) | Nuanced (quality, correctness, faithfulness) |
| **Purpose** | Prevent high-impact failures in real-time | Monitor and improve over time |
| **On trigger** | Redact, refuse, regenerate | Feed dashboards and improvement loops |

*Ask:* **"For each high-impact failure mode (PII leak, banned content, unsafe action, factually wrong claim with regulatory exposure), do you have a synchronous deterministic guardrail — separate from your async LLM evaluator?"**

Flag if missing: the PM relies on an LLM judge as a synchronous safety check. → name the latency + reliability cost. Guardrails should not depend on LLM judgment unless latency and reliability allow it.

### 7. Define the PM/eng ownership boundary

Make the boundary explicit. Per Hamel + Aman:

- **PM owns:** the rubric criteria, the labels (ground truth), the failure-mode taxonomy, the benevolent-dictator decisions on edge cases, the eval set itself (the artifact — *"the set of evals is the artifact, not just the scores"*), the business-metric accountability, the call when quality and business metrics disagree.
- **Eng owns:** the harness, the data splits, the TPR/TNR validation, the CI wiring, the annotation tooling, the production sampling infrastructure, the cost controls.

*Ask:* **"Who's labeling? Who's writing the rubric? Who's making the call when judge says good but human disagrees?"** Push for named humans, not roles. The benevolent dictator must be one person.

Flag if missing: labeling is delegated to LLMs from the start, or to outsourced annotators with no domain context, or to "the eng team." → name the failure mode. Per the wiki: *"Don't outsource error analysis — you break the feedback loop and lose tacit knowledge."*

### 8. Eval-driven development: what NOT to formalize

Per Hamel: eval-driven development (writing tests for failures you imagine) is generally wrong for AI. LLMs have infinite failure surface — you can't anticipate what will break. Write evaluators for failures you *discover*, not failures you *imagine*. Exception: highly specific, known constraints ("never mention competitors", "always cite sources").

*Ask:* **"For every eval you're committing to build — is this catching a failure you've actually seen, or a failure you're worried about in theory?"**

Flag if missing: half the proposed eval suite is for theoretical failures. → cut. The eval set should grow from production over time, not be enumerated upfront.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Each evaluator type matches a real observed failure mode (not generic metric, not theoretical) | AI Evals: "All you get from using these prefab evals is you don't know what they actually do and... they create an illusion of confidence that is unjustified." |
| Cost hierarchy applied bottom-up: Tier 0 / 1 / 2 considered before Tier 3 | AI Evals: "Cost hierarchy of evaluator types... Only build expensive evaluators for failures that persist after prompt fixes and that you'll iterate on repeatedly." |
| Tier 0 (verifiable execution) used for any executable artifact (SQL, code, configs) | AI Evals: "When your AI produces executable artifacts — code, SQL, configs, scripts — run them. Pass/fail on execution is the most reliable eval possible." |
| All three eval types planned (offline + online + human), not just offline | AI Evals (Shukla): "Most teams only do offline. All three are required." |
| Three monitoring layers instrumented (system, quality, business) | AI Evals (Shukla): "Three production monitoring layers: System, Quality, Business." |
| Guardrails (synchronous, deterministic) distinguished from evaluators (async, nuanced) | AI Evals: "Guardrails vs. Evaluators — these are categorically different — don't confuse them." |
| PM ownership of labels and rubric is named (not delegated to eng or LLM) | AI Evals: "Labels are product work, not technical work. Whoever is closest to the domain expert should write the labels — in a well-organized team, that's the PM." |
| Benevolent dictator on quality is named (one human) | AI Evals: "One domain expert as authoritative quality voice. Eliminates conflicts." |
| Sequencing respected: error analysis → vibe-check rubric → judge construction (not skipped) | AI Evals: "Look at the data. Error analysis first, then judges; look at the data before building anything." |
| Eval set treated as the artifact, not the pass rate | AI Evals: "The set of evals is the artifact — not just the scores. A pass rate is only meaningful when the eval set was built from comprehensive error analysis." |
| Production-failure-to-CI flywheel exists (online failures feed offline dataset) | AI Evals: "When monitoring reveals new failures, add representative examples to CI dataset — prevents regressions on newly discovered issues." |
| Business-layer metric is named, with a plan for when quality and business disagree | AI Evaluation Pipeline: "What happens when eval is good but the business metric goes down? — this signals the eval is measuring the wrong thing. PM is accountable." |

If any check is unmet, name the gap. Most common gaps: defaulting to Tier 3, skipping human eval, no business metric, no flywheel from production back to CI.

---

## Output

`.agentic-pm/evals/<feature>-eval-pipeline-design.md` — a single file containing:

1. **Failure modes catalog** — each named, traced to the Three Gulfs, with the evaluator tier assigned
2. **Cost-hierarchy table** — failure mode → Tier 0/1/2/3 evaluator + rationale for the tier
3. **Eval-type mix** — offline dataset source + size; online sampling rate; human review cadence + reviewer
4. **Monitoring layers** — system / quality / business metrics specified, with the business-metric / quality-metric reconciliation plan
5. **Guardrails list** — synchronous deterministic checks for high-impact failures, separate from async evaluators
6. **PM/eng ownership table** — named humans for labels, rubric, benevolent-dictator, judge maintenance
7. **Sequencing plan** — what gets built when, with explicit "not building yet" entries for theoretical evaluators
8. **Flywheel design** — how production failures feed back into the offline dataset

---

## Handoffs

- **If the rubric isn't written yet:** route to `write-rubric.md` first. The rubric is the first eval and the input to the judge.
- **If error analysis hasn't happened:** route to `error-analysis.md`. Designing evals against imagined failures is wasted work.
- **Next (if Tier 3 LLM judge is justified):** `validate-judge.md` — Critique Shadowing 5-step to build and validate the judge against human labels with proper train/dev/test splits.
- **Once shipped:** `iterate-feature.md` — the eval pipeline becomes the morning ritual, not a launched-and-forgotten artifact.

End the session with the single most expensive evaluator the PM is committing to and the cheapest one that could catch the same failure. If the cheaper evaluator is plausible, that's the next 48-hour action: try it before building the expensive one.
