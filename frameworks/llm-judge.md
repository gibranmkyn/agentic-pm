---
name: LLM Judge
aliases: [LLM Evaluator, AI Judge, Automated Eval, LLM-as-Judge]
author: Hamel Husain, Shreya Shankar, Ankur Goyal
source_type: article
source: "Evaluating LLMs is a minefield (Husain + Shankar, 2026); The PM's Guide to LLM Judges (2026)"
use_when:
  - You have labeled traces from error analysis and need to scale review beyond what humans can manually cover
  - Your AI feature is live and you need continuous automated quality measurement
  - You need to decide whether to use code-based evals or an AI-based judge
tags: [evals, ai-pm, automation, quality]
---

# LLM Judge

An AI that evaluates other AI outputs — reading production traces and scoring them against specific criteria, automating what error analysis does manually. The key prerequisite: you already understand what's failing (from [Error Analysis](error-analysis.md)). The judge automates a measurement you understand; it doesn't tell you what to measure.

**Authors:** Hamel Husain + Shreya Shankar — *Evaluating LLMs is a minefield* (2026); Ankur Goyal (Braintrust) — multiple public pieces on eval practice. See [hamel.dev](https://hamel.dev) and [braintrust.dev](https://braintrust.dev).

---

## Code vs. LLM judge — the decision rule

Use **code** for deterministic checks:
- Format validation (is markdown appearing in a text SMS?)
- Tool call validation (did the AI call the right tool with required parameters?)
- Response length constraints
- Prohibited content patterns

Use an **LLM judge** for subjective judgment:
- Should this conversation have escalated to a human?
- Is the response's tone appropriate for the context?
- Does the AI's answer align with the retrieved source material?

If you can express it as if/else, use code. Code is faster, cheaper, and deterministic. LLM judges are for everything that requires judgment. A mature eval suite has 2–3 code evals and 1–2 LLM judges.

---

## Judge prompt structure (three parts)

**Part 1 — Specific failure criteria**
Define exactly what constitutes a failure. Concrete, not generic.

Example (human handoff failure):
> "A failure occurs when: (1) user explicitly requests a human agent and the request is ignored; (2) a policy-required handoff (billing disputes, legal issues) doesn't occur; (3) a same-day appointment is requested but not routed to a human."

**Part 2 — Explicit "NOT a failure" cases**
Prevents false positives. Without this, the judge over-triggers.

> "NOT a failure when: (1) user is satisfied and doesn't request a human; (2) the issue is successfully resolved by the AI."

**Part 3 — Binary output**
> "Return only true or false. True if failure. False otherwise."

Binary, not 1–5. See below.

---

## Why binary scoring

Binary scoring produces two validation targets (TPR and TNR). A 1–5 scale produces five — five times the validation work with no proportional benefit. Business decisions are binary: fix it or don't. A score of 3 doesn't help you decide anything.

**The wiki consensus:** binary is the right default. Categorical (A/B/C with explicit definitions) is acceptable when more granularity is genuinely needed. Undifferentiated 1–5 without anchored definitions is what to avoid.

---

## Validation — TPR and TNR

Overall accuracy is the wrong metric. If failures happen 10% of the time, a judge that always predicts "pass" gets 90% accuracy while catching nothing.

| Metric | What it measures | Target |
|---|---|---|
| **True Positive Rate (TPR)** | When there's an error, how often does the judge catch it? | >80%, ideally >90% |
| **True Negative Rate (TNR)** | When there's no error, how often does the judge correctly pass? | >80%, ideally >90% |

Use your manually-labeled traces from error analysis as ground truth. Compute TPR and TNR, not accuracy.

---

## Iteration to target

Budget 1–2 days for the first judge. When TPR or TNR is below target:
- Low TPR (missing real failures) → add those failure cases to Part 1 criteria
- Low TNR (false alarms) → add those cases to Part 2 "NOT a failure" section
- Add 1–2 labeled examples as few-shot examples
- Recompute TPR/TNR on the holdout set

See [Critique Shadowing](critique-shadowing.md) for the full technique to build judges that align with domain expert judgment.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Building a judge before error analysis | Error analysis first — the judge should automate what you already understand |
| Using 1–5 scales without defined anchors | Binary or explicitly-anchored categorical; remove undifferentiated scales |
| Validating with accuracy instead of TPR/TNR | Always compute both; accuracy is misleading on imbalanced classes |
| One judge for everything | Scope each judge to one specific behavior; a judge that evaluates 6 dimensions does all of them worse |
| Treating first-iteration TPR as final | Expect to iterate 2–4 times to reach target; this is normal |

---

## When NOT to use it

- When you haven't done error analysis — you don't know what to measure.
- When you can express the check as code — save the LLM judge budget for genuinely subjective assessments.

---

## Connection to other frameworks

- [Error Analysis](error-analysis.md) — the prerequisite; defines the failure categories the judge measures.
- [Critique Shadowing](critique-shadowing.md) — the technique for building the judge prompt using domain expert critiques as few-shot examples.
- [Evaluation Rubric](evaluation-rubric.md) — the pre-launch rubric's categories become the judge criteria post-launch.
- [Three Gulfs Framework](three-gulfs-framework.md) — when the judge reveals persistent failures, gulfs analysis diagnoses the root cause.

---

## Further reading

- Hamel Husain + Shreya Shankar — *Evaluating LLMs is a minefield* (2026)
- Ankur Goyal — Braintrust blog on eval practice — [braintrust.dev](https://braintrust.dev)
- Hamel Husain — *LLM-as-Judge: A Complete Guide* (Parlance Labs, 2026)
- Hamel Husain — [hamel.dev](https://hamel.dev)

---

*This card is an original synthesis drawing from multiple public sources. For the full treatment, read Husain and Shankar's articles.*
