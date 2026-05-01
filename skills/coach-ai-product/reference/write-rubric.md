---
name: write-rubric
description: Use this playbook when building a pre-launch eval rubric — defining what "good" looks like before users see the feature. Loaded by the coach skill, not invoked directly.
---

# Write Rubric

Define "good" before you build an eval pipeline. A rubric is the human-legible definition of quality that all downstream evaluation — manual review, LLM judges, A/B tests — must trace back to. If you can't write a rubric, you don't know what you're measuring.

---

## Locate

Before walking the playbook, ask the PM:

1. What AI feature are you building a rubric for, and what does it produce? (open-ended generation / classification / structured extraction / multi-turn conversation)
2. Who is the Principal Domain Expert — the one person whose judgment is the authority on what "good" looks like for this feature's users?
3. Do you have any real outputs to review, even rough ones? (A "vibe check" pass on 20 real outputs before writing criteria prevents phantom rubric categories.)

**MCP awareness:** If an eval-platform MCP is configured, use it to pull representative production outputs and ground each rubric anchor in real examples. If an LLM API MCP is configured, use it to generate synthetic test data along Features × Scenarios × Personas dimensions. If neither is available, guide the PM through pasting 20–30 representative outputs to anchor the rubric. The wiki (Hamel + Shukla) is clear: rubrics built on real outputs survive inter-rater agreement; rubrics built on imagined scenarios don't.

---

## Pre-step: vibe check first

**Write down the vibes before writing the rubric.** (Hamel; OpenAI customers)

Before defining formal criteria, spend 20–30 minutes reviewing real outputs (or draft outputs from a prototype prompt) and writing informal notes:
- "This one feels right because..."
- "This one is off because..."
- "I keep noticing that..."

The vibe check surfaces real patterns. Rubric categories written without it tend to be theoretical — they measure things that don't fail in practice while missing things that do.

Only after the vibe check should you formalize categories.

---

## Step-by-step

### Step 1 — Define representative scenarios

List the top 10 situations users will encounter. Breadth over depth — cover the range of user intents, not just edge cases. For each scenario, name:
- What the user is trying to accomplish
- What a good output looks like for that intent
- What a bad output looks like

Concrete scenarios produce testable rubric criteria. "Users asking questions about our product" is too broad. "A new user asking for setup instructions who hasn't installed the product yet" is testable.

### Step 2 — Write success criteria per scenario

Make each criterion specific and measurable. Test the criteria: can two different reviewers score the same output and agree? If not, rewrite.

- Too vague: "the response is helpful"
- Specific: "the response names the correct return window and includes the portal link"

Push the PM to name what they would actually say if reviewing a bad output: "This is wrong because ___." That sentence is the criterion.

### Step 3 — Build 4–6 rubric categories

Typical starting set: Correctness, Completeness, Clarity, Tone, Safety. Cap at six — more categories dilute focus and slow review (Shukla: "more categories dilute focus").

For each category:
- Define 1–5 with anchors at each level (or use binary pass/fail — binary resolves rater disagreement faster)
- Write anchor descriptions at both ends and midpoint at minimum
- Add 1–2 concrete examples per anchor

Binary (pass/fail) is often cleaner for LLM judge handoff and catches inter-rater disagreements quickly. Use 1–5 only when you need to track gradations over time (e.g., quality trending up or down).

### Step 4 — Create reference examples

For each category, write:
- One concrete good example (the "gold standard")
- One concrete bad example (the "reject example")

These become ground truth for human reviewers and few-shot examples in future LLM judge prompts. Without reference examples, reviewers drift in interpretation over time.

### Step 5 — Run inter-rater validation

Have 2–3 people independently grade the same 10 outputs using the rubric. Calculate agreement.

**Target: ≥80% inter-rater agreement before treating the rubric as ground truth.** If reviewers disagree, the criteria are ambiguous — not the reviewers. Refine criteria and rerun.

Do not skip inter-rater validation. A rubric with 60% agreement measures reviewer opinions, not feature quality.

### Step 6 — Lock and version the rubric

Mark the rubric as locked before it enters eval pipelines or judge construction. Any change to rubric criteria requires a new version — do not silently edit a rubric that already has eval data attached to it.

---

## Quality bar

Before finalizing the rubric:

- [ ] Vibe check pass on real outputs completed before formal criteria written — *Evaluation Rubric (Shukla): vibe-check pre-step*
- [ ] 4–6 categories maximum — *Evaluation Rubric: "more categories dilute focus and slow review"*
- [ ] Each criterion specific enough for two reviewers to agree independently — *Evaluation Rubric*
- [ ] Anchor examples written for each category — *Evaluation Rubric*
- [ ] Binary pass/fail or 1–5 with defined anchors at each level — *Evaluation Rubric (Shukla)*
- [ ] ≥80% inter-rater agreement before treating rubric as ground truth — *Evaluation Rubric*
- [ ] Reference examples (good + bad) written for each category — *Evaluation Rubric*

---

## Tag propagation

- Vibe check skipped → `vibe-check-skipped`
- Fewer than 4 categories or more than 6 → `rubric-scope-mismatch`
- Inter-rater agreement not verified → `inter-rater-unverified`
- Reference examples missing → `rubric-unanchored`

---

## Output

`.agentic-pm/evals/<feature>-rubric.md`

Contents:
- Feature name and rubric version
- Representative scenarios (top 10)
- 4–6 rubric categories with:
  - Success criteria (specific, testable)
  - Anchor descriptions (binary or 1–5 with defined levels)
  - Reference examples (good + bad)
- Inter-rater validation results (% agreement, reviewers, date)
- Tags applied (if any)

---

## End every session with

- The rubric category whose criteria are most ambiguous — that's where to start inter-rater validation.
- If ≥100 labeled traces exist after rubric validation: "You have enough labeled data to build an LLM judge. Walk `validate-judge.md` next: one domain expert, one behavior, binary scoring — budget 1–2 days."

---

## Handoffs

- **Comes from:** `validate-feasibility.md` (Prompt-as-MVP traces are the first real outputs to vibe-check); `design-eval-pipeline.md` (rubric is Tier 0 in the eval hierarchy).
- **Leads to (offer, not auto-chain):** `validate-judge.md` — after rubric is locked and ≥100 labeled examples exist; `compile-ai-prd.md` — rubric belongs in the AI PRD's eval section.
