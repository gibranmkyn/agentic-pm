---
name: compile-ai-prd
description: Use this playbook when writing a PRD for an AI feature — always with the AI layer on, always with eval-as-PRD framing, Sheridan HITL level, Six Levers, and Marily Nika's failure pattern guardrails. Loaded by the coach skill, not invoked directly.
---

# Compile AI PRD

The AI PRD is not a general PRD with an AI section bolted on. It is a different artifact. The best AI PRD in 2026 is not a document — it is a data set, a task function, and a scoring function the whole team can run. (Ankur Goyal)

This playbook is for AI features only. There is no "general PRD mode" here. Every AI PRD names the Sheridan HITL level, lists the Six Levers in use, specifies failure-pattern guardrails, and includes an eval section that doubles as the acceptance criteria.

---

## Locate

Before walking the playbook, ask the PM:

1. What AI feature are you speccing, and what does the model specifically do? (Be precise — not "AI assistant" but "given a support ticket, classify intent and suggest a resolution from the knowledge base.")
2. What stage is this PRD for? (Stage 1 one-pager / Stage 2 kickoff / Stage 3 full spec / Stage 4 launch readiness / Stage 5 impact review)
3. Has feasibility been validated? Has Prompt-as-MVP been run on real inputs? If not, flag — a PRD without a feasibility check is fiction.

Also check `.agentic-pm/` for upstream artifacts: assumption map (`.agentic-pm/validation/<feature>-assumption-map.md`), rubric (`.agentic-pm/evals/<feature>-rubric.md`), and any existing PRD (`.agentic-pm/prds/<feature>-prd.md`).

---

## Eval-as-PRD framing

> "The best PRD in 2026 is not a document. It is a data set, a task function, and a scoring function the whole team can run." — Ankur Goyal (Braintrust)

| Old PRD | AI PRD |
|---|---|
| Prose spec, ignored by half the team | Scoring function anyone can run |
| Acceptance criteria in words | Quantified pass/fail |
| User research as interviews/docs | Dataset of real user needs |
| Sprint cycle | Offline → online eval flywheel |

The durability argument: prompts are temporary; models change; agent frameworks get replaced. But encoding user needs as a dataset and scoring function survives every model swap.

This means: **the eval section of the AI PRD is not optional and is not deferred to later stages.** The eval criteria are the acceptance criteria. If the PM can't write the scoring function, they haven't finished speccing the feature.

---

## The 5-stage rolling checklist

The PRD evolves in place across five stages. Don't enforce later-stage sections early — false completeness is a top failure mode.

**Stage 1 — Planning (one-pager)**
- Problem statement (evidence-backed, not assumed)
- Target metric and directional sizing
- AI capability hypothesis (what specifically should the model do?)
- Feasibility validation status (Prompt-as-MVP done / not yet done)

**Stage 2 — Kickoff**
- All Stage 1 sections +
- Six Levers: which levers does this feature use? (Instructions, Knowledge, Memory, Tools, Reasoning, Post Training)
- Sheridan HITL level (1–10; see below)
- Success metric + guardrail metrics + counter-metrics
- Eval criteria (the scoring function, even if rough)
- Marily Nika failure pattern guardrails (see below)

**Stage 3 — Solution Review**
- All Stage 2 sections +
- Full rubric or eval plan linked (`.agentic-pm/evals/<feature>-rubric.md`)
- Edge cases and failure modes with mitigations
- Rollout plan (shadow mode / beta / staged / full)
- Rollback criteria (when do we pull it back?)
- XFN requirements and tracking spec

**Stage 4 — Launch Readiness**
- Verify: eng concerns addressed, design done, GTM enabled
- Verify: eval passing on staging or shadow traffic
- Verify: HITL checkpoints implemented at the named Sheridan level

**Stage 5 — Impact Review**
- Link `.agentic-pm/impact/YYYY-MM-DD-<feature>-impact.md`
- Calibration note for the sizing journal

---

## Six Levers (Product Faculty)

Every AI PRD names which levers the feature uses and how:

| Lever | What it controls | Primary mechanism |
|---|---|---|
| **Instructions** | How to behave | System prompts, personas, constraints, output formats, tone |
| **Knowledge** | What to know | RAG, embeddings, document retrieval, knowledge bases |
| **Memory** | What to remember | Conversation history, user context, session state |
| **Tools** | What to do | Function calling, APIs, actions, external integrations |
| **Reasoning** | How to think | Structured reasoning, multi-step workflows, planning |
| **Post Training** | How to improve | Fine-tuning, RLHF, preference optimization |

Lever ordering heuristic: start with Instructions (zero cost). Layer Knowledge (RAG) for domain specificity. Add Memory when personalization matters. Add Tools for real-world actions. Add Reasoning for complex multi-step tasks. Only consider Post Training when all others are insufficient.

State which levers are **active at launch** vs. **planned for future iteration**.

---

## Sheridan HITL Level

Every AI PRD names the Human-in-the-Loop level at launch (Sheridan's 10-level classification):

| Level | Who decides/acts |
|---|---|
| 1 | Human does everything |
| 2 | Computer offers complete set of alternatives |
| 3 | Computer narrows selection to a few |
| 4 | Computer suggests a single action |
| 5 | Computer executes if human approves |
| 6 | Computer allows limited time to veto before auto-execution |
| 7 | Computer executes automatically, then informs human |
| 8 | Computer executes automatically, informs only if asked |
| 9 | Computer executes, informs only if it decides to |
| 10 | Computer acts fully autonomously |

Start conservative (lower levels build trust). State the launch level and the target level after trust is established. In high-stakes domains (medicine, finance, legal), stay at levels 2–5. For reversible, low-stakes actions, levels 6–8 are appropriate.

---

## Marily Nika's Three Failure Patterns

Every AI PRD names guardrails for the three structural failure patterns that model quality alone cannot fix:

**Pattern 1: Inventing structure from chaos**
Given unstructured input, the model produces clean, authoritative-looking output — but the structure is fabricated. The output's polish hides the inaccuracy.
- Guardrail: signal when input is unstructured; provide source attribution; show confidence or flag low-signal inputs.

**Pattern 2: Collapsing under semantic ambiguity**
Given an ambiguous prompt, the model guesses and fills gaps plausibly. Users receive confidently stated, plausibly wrong output.
- Guardrail: require disambiguation before generation; build clarifying-question flows; use variance diagnostic to identify ambiguous product prompts.

**Pattern 3: The illusion of certainty**
The model answers with 100% confidence even when accuracy is low. It doesn't say "I don't know." Over time, this quietly destroys user trust.
- Guardrail: explicitly design uncertainty signaling; build fallback behaviors; use Calibrated Trust design so users form appropriately calibrated expectations.

These patterns are evergreen — they hold regardless of model version and require product-level guardrails, not model improvements.

---

## Step-by-step

### Step 1 — Confirm feasibility validation status

Has Prompt-as-MVP been run on real inputs? If not, the PRD can begin at Stage 1 but must flag `feasibility-unverified`. A Stage 3+ spec without feasibility validation is fiction.

### Step 2 — Scan .agentic-pm/ for upstream artifacts

Report section freshness: sharp (artifact exists, ≤60 days old), stale (>60 days), missing. Thin sections get tagged — don't pretend they're complete.

### Step 3 — Compile at the requested stage

Apply the rolling checklist. Don't fill in later-stage sections prematurely — false completeness is worse than explicit gaps.

### Step 4 — Write the Six Levers section

For each lever in use: name the mechanism, the current implementation, and known risks.

### Step 5 — Name the Sheridan HITL level

State the launch level. State the target level post-trust-establishment. Name the HITL checkpoints implemented at the launch level.

### Step 6 — Write the Marily Nika guardrails section

For each of the three failure patterns: name the product guardrail implemented. If a guardrail is not yet designed, flag it — don't omit the section.

### Step 7 — Write the eval section (the scoring function)

This is the acceptance criteria. It must be specific enough for engineering to implement a pass/fail check:
- What is being measured?
- What is the pass threshold?
- How is it measured (human review / automated eval / A/B metric)?

Link to the rubric if one exists. If no rubric exists yet, flag `evals-unplanned` — the eval section cannot be a prose description of intent.

### Step 8 — Counter-metrics and guardrails

Every AI PRD at Stage 2+ specifies counter-metrics. A feature that improves the primary metric while degrading a guardrail is a net loss. Name what you will not sacrifice.

### Step 9 — Self-validate and produce the artifact

---

## Quality bar

- [ ] Feasibility validation status confirmed (Prompt-as-MVP done or explicitly flagged) — *Feasibility-First Inversion*
- [ ] Six Levers in use named for each active lever — *Six Levers (Product Faculty)*
- [ ] Sheridan HITL level named at launch + target level post-trust — *Sheridan Levels of Autonomy*
- [ ] All three Marily Nika failure patterns have named guardrails — *AI Failure Patterns (Nika)*
- [ ] Eval section is a scoring function (quantified pass/fail), not prose intent — *Eval-as-PRD (Ankur Goyal)*
- [ ] Counter-metrics specified by Stage 2 — *Modern PRD: "missing counter-metrics is a top-5 mistake"*
- [ ] Stage 5 Impact Review scheduled on every PRD at launch — *Modern PRD*
- [ ] Rolling checklist enforced: no later-stage sections filled before earlier ones are sharp — *Modern PRD: "templates create false completeness"*

---

## Tag propagation

- Feasibility not validated before spec → `feasibility-unverified`
- Eval section is prose, not a scoring function → `evals-unplanned`
- Sheridan HITL level not specified → `agent-autonomy-unspecified`
- Marily Nika guardrails missing → `failure-patterns-unguarded`
- Counter-metrics absent at Stage 2+ → `guardrails-unchecked`
- Later-stage sections completed before earlier ones sharp → `false-completeness-risk`
- Sharp section artifact >60 days old → `stale-upstream`

---

## Output

`.agentic-pm/prds/<feature>-prd.md` — one living file per feature. Updated in place across stages. Frontmatter records latest stage + compile date.

---

## End every session with

- The current stage and the entry gate for the next stage.
- Thin-section tags surfaced prominently with the specific action needed for each.
- If AI feature at Stage 2+ with no rubric: "Run `write-rubric.md` before Stage 3 — the eval section is not complete without it."

---

## Handoffs

- **Comes from:** `validate-feasibility.md` (assumption map feeds risks section); `write-rubric.md` (rubric feeds eval section); `design-ai-ux.md` (UX patterns feed solution section).
- **Leads to (offer, not auto-chain):** `design-eval-pipeline.md` — after Stage 3 spec is complete, design the eval infrastructure; `review-impact.md` — Stage 5 at quarterly cadence.
