---
name: Three Gulfs Framework
aliases: [Three Gulfs, Gulf of Comprehension, Gulf of Specification, Gulf of Generalization]
author: Eugene Yan
source_type: talk
source: "AI Evals for Engineers course preview (Yan, 2025)"
use_when:
  - You have error analysis results and need to decide what type of fix to apply
  - The team is debating whether to rewrite the prompt or retrain the model
  - You want to triage AI failures by their root cause before committing to a fix
tags: [evals, ai-pm, diagnostic, methodology]
---

# Three Gulfs Framework

When an LLM pipeline fails, there are three distinct types of failure, each requiring a different practitioner mindset and fix. Skipping straight from "this is broken" to "we need to retrain the model" is one of the most common and expensive mistakes in AI product development. The Three Gulfs framework keeps you from applying the wrong remedy.

**Author:** Eugene Yan (Amazon) — *AI Evals for Engineers* course preview (2025). See [eugeneyan.com](https://eugeneyan.com).

---

## The four gulfs (diagnose in order)

### Gulf 1 — Comprehension
**Symptom:** The team can't characterize what's failing. No taxonomy. "The model is sometimes wrong" with no further specificity.

**Root cause:** Insufficient data analysis — you haven't looked at enough failures carefully enough to understand them.

**Hat needed:** Data science / analysis hat.

**Fix:** [Error analysis](error-analysis.md). Review 100 traces. Apply axial coding to surface failure categories. Build a pivot table. You cannot fix what you haven't characterized.

### Gulf 2 — Specification
**Symptom:** Failures cluster around cases where the AI misunderstood the task, behaved in unexpected ways, or over-applied a rule. The model *could* do this correctly if instructed differently.

**Root cause:** Instructions are ambiguous, incomplete, or unrepresentative. Few-shot examples don't cover the failing cases. Prompt has accumulated contradictions.

**Hat needed:** Technical writer / communicator hat.

**Fix:** Rewrite the prompt. Add representative few-shot examples. Clarify edge-case handling. Start with criteria before examples.

Common sub-causes:
- All examples in one demographic → model fails on others
- Over-specification creates unintended behavior ("you are a trusted advisor" → model is too candid in sensitive situations)
- Prompts that grew organically without refactoring

### Gulf 3 — Generalization
**Symptom:** Prompt improvements help on common cases but the model still fails on edge cases and out-of-distribution inputs.

**Root cause:** The system has been well-specified but lacks training coverage of the distribution it's encountering.

**Hat needed:** ML engineering hat.

**Fix:** Expand the evaluation set. Generate synthetic data for edge cases. Fine-tune if the production distribution differs significantly from pretraining.

### Gulf 4 — Model capability
**Symptom:** High-quality prompts, good data coverage, and failures persist systematically on the core task requirement.

**Root cause:** The model doesn't have the capability to perform this task at the required quality level.

**Fix:** Decompose the task into smaller sub-tasks the model can handle. Use a stronger model. Redesign the scope of the feature. Fine-tune on the specific task if the capability is trainable.

---

## How to use it

Work the list in order. Stop at the first gulf that applies.

1. **Do you understand the failures?** If no → fix Comprehension gap first. Do error analysis.
2. **Are instructions clear and representative?** If no → fix Specification gap. Rewrite the prompt.
3. **Does it generalize to edge cases?** If no → fix Generalization gap. Expand eval set and data.
4. **Has it hit a ceiling after good prompts and data?** → Capability gap. Change the model or the task.

**Don't skip to model capability** unless you've genuinely ruled out gulfs 1–3. Most perceived model capability gaps turn out to be specification gaps — the prompt was ambiguous, not the model insufficient.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Jumping to model capability without working the list | Work the gulfs in order |
| Treating all failures as specification gaps | Some are data coverage (generalization); running more prompt iterations won't help |
| Doing error analysis once and assuming the gulfs are fixed | Each product iteration can introduce new gulfs; run periodically |

---

## When NOT to use it

- When you're still in the Comprehension gulf and haven't characterized what's failing yet — finish error analysis first, then apply the gulfs framework to the resulting categories.

---

## Connection to other frameworks

- [Error Analysis](error-analysis.md) — resolves the Comprehension gulf; must come first.
- [Evaluation Rubric](evaluation-rubric.md) — specification gaps often signal that the rubric criteria were underspecified; revisit the rubric when you find gulf 2 failures.
- [LLM Judge](llm-judge.md) — once gulfs are diagnosed, the judge provides ongoing measurement to confirm fixes are working.

---

## Further reading

- Eugene Yan — [eugeneyan.com](https://eugeneyan.com) — public writing on ML engineering and evaluation
- Eugene Yan — *AI Evals for Engineers* (course, 2025) — primary source

---

*This card is an original synthesis. For the full treatment, see Yan's course materials.*
