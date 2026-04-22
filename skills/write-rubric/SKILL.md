---
name: write-rubric
description: "Build an evaluation plan for an AI feature — pre-launch (define what 'good' looks like before users see it) or post-launch (characterize what's actually failing in production). Use when you need to know whether your AI feature works, or what to fix first."
allowed-tools: Read Grep Glob Write Edit
---

# Eval Plan — Know Whether Your AI Feature Works

Two modes, autoselected: rubric-first (pre-launch, no traces yet) or traces-first (post-launch, real failures to characterize). One outputs a rubric and reference examples; the other outputs a labeled error taxonomy and fix sequence.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan for upstream artifacts:**

Scan `Work/` for relevant upstream artifacts using Glob:
- `Work/validation/<feature>-assumption-map.md` — if found and feasibility risk is flagged, pre-populate the eval focus with that risk
- `Work/evals/<feature>-eval-plan.md` — if found, detect the existing eval plan and advance from there rather than starting fresh
- `Work/evals/<feature>-error-journal.md` — if found, detect prior error analysis passes and build on existing categories

Report what you found and what's missing in the Plan checkpoint. Don't ask the PM to point you to files that already exist in Work/.

---

## Frameworks this skill loads

- `frameworks/evaluation-rubric.md` — pre-launch spine (5-step: scenarios → criteria → 4–6 categories → reference examples → inter-rater validation)
- `frameworks/error-analysis.md` — post-launch spine (4-step: review 100 traces → axial coding → label → pivot table)
- `frameworks/three-gulfs-framework.md` — add-on: map failure categories to fix type (Comprehension / Specification / Generalization / Model Capability)
- `frameworks/critique-shadowing.md` — add-on: technique for building an LLM judge aligned to domain expert judgment
- `frameworks/llm-judge.md` — add-on: binary scoring, TPR/TNR validation (handoff only after ≥100 labeled traces)
- `frameworks/ai-evaluation-pipeline.md` — add-on: continuous measurement infrastructure for live features

Read all frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to ensure this eval will actually improve the feature, not just produce a spreadsheet.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Will you — the PM, not an engineer — own the error analysis loop? Because if you delegate this, it fails."** *(Error Analysis: "PMs own this — it requires product taste and user knowledge.")* Engineers optimize for technical metrics. PMs optimize for user outcomes. The PM must be the one reviewing traces and making quality judgments. If the PM won't own this, flag it before building a plan that will be orphaned.

2. **"What does 'quality' mean for this specific feature? Not 'accurate and helpful' — give me a concrete example of a good output and a bad output."** Generic quality definitions produce generic rubrics. A good eval requires the PM to articulate what specific failure looks like for their users in their context. Follow up: "If a user saw the bad output, what would they do? Close the tab? Call support? Lose trust permanently?"

3. **"Who is the Principal Domain Expert — the one person whose judgment is authoritative for what 'good' looks like? And are they actually available to review outputs?"** *(Critique Shadowing: "one authoritative voice, not a committee.")* Without a PDE, the rubric has no anchor. A committee produces averaged-out criteria that don't match any real user's expectations. If the PDE isn't available, the eval plan needs to account for that gap.

4. **"Do you have production traces, and how were they sampled? A convenience sample of the last 50 traces is not the same as a diverse sample across user segments and input types."** *(Error Analysis: "deliberately oversample rare cases and boundary conditions.")* Convenience samples oversample common cases and miss the edge cases that destroy user trust. Push on sampling methodology before accepting traces as representative.

5. **"What will you do with the results? If I hand you a prioritized list of failure categories, what changes? Be specific."** If no action will change regardless of findings, the eval is theater. The eval plan must connect to a fix sequence — Specification (prompt rewrite), Generalization (expand coverage), or Model Capability (model switch). *(Three Gulfs: "don't skip to model capability without working the list.")*

6. **"Have you shipped this feature, or is it still pre-launch? Because the approach is completely different."** Confirms mode. Pre-launch evals define what good looks like before users see failures. Post-launch evals characterize what's actually failing. Mixing the two produces a plan that does neither well.

7. **"What's your timeline for acting on this eval? Are you iterating this week, or building a quarterly review cadence?"** Calibrates depth. A PM who needs to fix the top failure category this sprint needs a fast error analysis pass. A PM building ongoing measurement infrastructure needs the full AI Evaluation Pipeline.

Interview until you can answer: Who owns this? What does quality mean concretely? Is the evidence base (traces) representative? Will anything actually change based on the results?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2–3 sentences. Name the feature, the mode (pre-launch vs. post-launch), the PDE, and the PM's ownership commitment.
2. **"Here's the approach"** — which spine (Rubric-First or Traces-First), whether Three Gulfs or LLM Judge add-ons apply, and what the eval will and won't cover.
3. **"Here are my concerns"** — PM not owning the loop, PDE unavailable, trace sampling bias, no action plan for results, quality definition too vague.

Ask: **"Want to adjust before I start building the eval plan?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Ask the PM:
1. Have you shipped this AI feature yet, or is it still pre-launch? *(determines mode)*
2. What type of AI feature is it? (open-ended generation / classification / retrieval / agent pipeline) *(affects what failure modes to anticipate)*
3. Do you have production traces to review? (yes / no / some) *(confirms mode; "some" = post-launch)*
4. Who on the team would be the Principal Domain Expert — the one person whose judgment is authoritative for quality? *(for rubric validation and judge building)*

Pick spine:
- **No traces yet (pre-launch)** → Rubric-First (Evaluation Rubric — 5-step)
- **Real traces exist (post-launch)** → Traces-First (Error Analysis — 4-step) + Three Gulfs diagnostic
- **Scaling review beyond manual** → Critique Shadowing → LLM Judge handoff (only after ≥100 human-labeled traces)
- **Setting up ongoing measurement** → AI Evaluation Pipeline add-on

If the PM is unsure, ask: "Have real users interacted with this feature in production?" Yes = post-launch. No = pre-launch.

---

## Situation-triggered add-on blocks

- **Three Gulfs diagnostic** — included when error analysis surfaces clustered failures. Maps each top category to its gulf type and the appropriate fix: Comprehension → do better error analysis; Specification → rewrite the prompt or rubric; Generalization → expand eval set / add RAG; Model Capability → switch or fine-tune. Appended after the error taxonomy, not before.
- **LLM Judge handoff** — offered only after ≥100 human-labeled traces exist. Before that threshold, there isn't enough ground truth to validate TPR/TNR. If declined after threshold met, output tagged `judge-unplanned`.
- **AI Evaluation Pipeline** — offered when the PM needs ongoing measurement infrastructure (continuous error analysis cadence, prompt library abstraction, multi-tier eval layers). Appended as a section in the eval plan, not a separate document.

---

## Step-by-step flow

1. **Discovery interview.** Read context files. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the mode you'd pick, PDE, concerns. Wait for PM approval before producing anything.
3. **Detect mode** from the interview (pre-launch vs. post-launch). Then follow the sub-steps for the selected mode below.

---

## Sub-steps — Pre-launch / Rubric-First (Evaluation Rubric spine)

1. **Define representative scenarios.** List the top 10 situations users will encounter. Breadth over depth — cover the range of user intents, not edge cases. Be concrete about what the user is trying to accomplish, not just what they might type.
2. **Write success criteria per scenario.** Make each criterion specific and measurable. Test the criteria: can two different reviewers score the same output and agree? If not, rewrite. Vague = "the response is helpful." Specific = "the response names the correct return window and includes the portal link."
3. **Build 4–6 rubric categories.** Common starting set: Correctness, Completeness, Clarity, Tone, Safety. Cap at six — more categories dilute focus and slow review. Each category needs defined anchors, not just endpoint descriptions.
4. **Create reference examples.** For each category, write one concrete good example and one bad example. These become ground truth for human reviewers and few-shot examples in future LLM judge prompts.
5. **Run inter-rater validation.** Have 2–3 people independently grade the same 10 outputs. Calculate agreement. Target: ≥80% before treating the rubric as ground truth. If reviewers disagree, refine criteria and rerun.
6. **LLM judge handoff (optional).** If the PM wants to automate rubric scoring, offer to invoke `/agentic-pm:write-rubric` in judge-build mode (requires Critique Shadowing process). Do not auto-chain.
7. **Self-validate.** Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.
8. **Produce artifact** at `Work/evals/<feature>-eval-plan.md`.

---

## Sub-steps — Post-launch / Traces-First (Error Analysis spine)

1. **Sample 100 diverse traces.** Include a range of input types, user segments, and edge cases. Randomness is not enough — deliberately oversample rare cases and boundary conditions.
2. **Review traces and take rough notes.** 30–45 seconds per trace. For each: what did the user ask, what did the AI respond, what's wrong (one-line note). Speed matters — build flow state. Don't optimize any single judgment.
3. **Axial coding → emergent failure categories.** Export notes. Ask an LLM to propose 5–6 categories. Then refine for specificity: "quality issues" → "conversational flow: repeated messages." Categories must be specific enough for independent labeling without asking questions.
4. **Label each error.** Assign every note to a category. Manual first pass, then optional LLM auto-label + review.
5. **Pivot table: count and prioritize.** Tally occurrences per category. The output: "conversational flow failures: 15; human handoff misses: 8." That's what makes prioritization real.
6. **Three Gulfs diagnosis per top category.** For each of the top 2–3 error categories: which gulf does this fall into? (Comprehension → still don't understand it; Specification → prompt ambiguity; Generalization → edge case coverage; Model Capability → ceiling hit). Name the fix type for each.
7. **Fix sequencing.** Order fixes cheapest-first: Specification (prompt rewrite) before Generalization (data expansion) before Model Capability (fine-tune or model switch).
8. **LLM Judge handoff (conditional).** Offer only if ≥100 labeled traces now exist. If yes: offer to walk through Critique Shadowing to build a judge for the top error category. If declined, tag `judge-unplanned` and move on.
9. **Set monthly cadence.** Note the date for the next error analysis pass. New edge cases emerge as the product evolves — static error categories from launch are rarely the categories that matter a year later.
10. **Self-validate.** Before presenting the artifacts, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifacts.
11. **Produce artifacts** at `Work/evals/<feature>-eval-plan.md` + `Work/evals/<feature>-error-journal.md`.

---

## Quality bar

Before finalizing the artifacts:

- [ ] PM (not engineer) owns the error analysis loop — *Error Analysis: "PMs own this — it requires product taste and user knowledge"*
- [ ] Post-launch: sample ≥100 traces before axial coding — *Error Analysis: sample size prerequisite*
- [ ] Categories emerge from data via axial coding, not pre-set — *Error Analysis: "emergent categories, not predetermined taxonomy"*
- [ ] Binary pass/fail scoring (not 1–5) for rubric and judge construction — *LLM Judge: "binary resolves rater disagreement; business decisions are binary"*
- [ ] LLM judge: validated against human labels using TPR + TNR (not accuracy) — *LLM Judge: "accuracy is misleading on imbalanced classes"*
- [ ] Principal Domain Expert named (strongly recommended; if skipped, output tagged `judge-unvalidated`) — *Critique Shadowing: "one authoritative voice, not a committee"*
- [ ] Rubric: ≥80% inter-rater agreement before treating rubric as ground truth — *Evaluation Rubric*
- [ ] Rubric: 4–6 categories max — *Evaluation Rubric: "more categories dilute focus and slow review"*
- [ ] Post-launch: failure mapped to gulf before fix type chosen — *Three Gulfs: "don't skip to model capability without working the list"*
- [ ] Monthly error-analysis cadence set for live features — *Error Analysis: "new edge cases emerge as the product evolves"*

---

## Tag propagation

- Post-launch error analysis done but PM is not the reviewer → tag `pm-eval-ownership-gap`
- LLM Judge handoff declined after ≥100 labeled traces → tag `judge-unplanned`
- Principal Domain Expert not named → tag `judge-unvalidated`
- Three Gulfs diagnosis skipped when errors cluster → tag `gulfs-skipped`

---

## Handoffs

- **Upstream:** `/agentic-pm:map-risks` (Prompt-as-MVP traces from feasibility validation are the first post-launch traces — feed them here); `/agentic-pm:compile-prd` (Stage 3 AI feature eval plan link lives in the PRD)
- **Downstream** (offer, not auto-chain): `/agentic-pm:define-metrics` (eval results feed metric tree and impact sizing); LLM judge construction via Critique Shadowing (offered after ≥100 labeled traces)

---

## Output

- `Work/evals/<feature>-eval-plan.md` — rubric (pre-launch) or error-analysis pivot table + gulfs diagnosis + fix sequence (post-launch)
- `Work/evals/<feature>-error-journal.md` — accumulates monthly; one entry per error analysis pass; builds institutional calibration over time

---

## End every session with

- Pre-launch: the rubric category whose criteria are most ambiguous — that's where to start inter-rater validation.
- Post-launch: the single highest-frequency error category and the gulf type it maps to — that's the first fix.
- If ≥100 labeled traces exist and LLM judge was not built: "You have enough labeled data to build an LLM judge. Run Critique Shadowing: one domain expert, one behavior, binary scoring — budget 1–2 days and you'll catch 80%+ of that error category automatically."

---

## Completion status

Report exactly one of at close:
- **DONE** — eval plan written, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — eval plan written but tags applied (list each: `pm-eval-ownership-gap`, `judge-unplanned`, `judge-unvalidated`, `gulfs-skipped`); state what must be addressed before the next error analysis pass
- **BLOCKED** — cannot run either mode; state what is missing (no feature identified, or trace count < 20)
- **NEEDS_CONTEXT** — launch stage (pre vs. post) not established; ask directly

Escalation: if the PM is not going to personally own the error analysis loop, flag this before producing artifacts. Delegating this to an engineer is the most common way eval practices fail.
