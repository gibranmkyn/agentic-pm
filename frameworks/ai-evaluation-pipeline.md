---
name: AI Evaluation Pipeline
aliases: [AI Evals, Evaluation Pipeline, AI Quality Measurement]
author: Dylan Selberg, Justin Farris, Kumesh Aroomoogan
source_type: course
source: "What Does an AI PM Do? (Reforge, 2024); AI Product Development Process (Farris, Reforge, 2024)"
use_when:
  - You're setting up infrastructure to measure AI feature quality continuously (not just at launch)
  - You're a PM asking what ongoing investment in evals looks like beyond error analysis
  - You need to communicate to engineering what a production-grade AI eval architecture includes
tags: [ai-pm, evals, infrastructure, quality]
---

# AI Evaluation Pipeline

Infrastructure and practices for measuring AI feature quality continuously — before launch, at launch, and throughout the product's life. Widely identified as the most underinvested discipline in AI product development.

This is not a one-time checklist. It's a continuous operating mode. AI features don't reach a stable quality state the way deterministic software does; they degrade as user behavior shifts, model updates change outputs, and edge cases accumulate.

**Authors:** Dylan Selberg (HubSpot), Justin Farris (GitLab), Kumesh Aroomoogan (LinkedIn) — Reforge AI PM course (2024). Institutional source — multiple Reforge practitioners, no single author.

---

## Why AI evaluation is harder

AI features have properties deterministic features don't:

- **No single correct answer** — quality is a distribution, not a pass/fail
- **Non-determinism** — the same input can produce different outputs
- **Infinite edge cases** — traditional software has a finite failure mode set; AI features don't
- **Deeply personalized tasks** — automated metrics often can't capture subjective quality
- **Variable cost** — inference cost depends on failure rate, which must be measured to know

---

## Evaluation architecture

### Prompt library abstraction
Wrap all AI model calls in a library so you can swap models and prompts independently. When a new model version arrives, run the entire prompt library and score against the baseline. This is how GitLab ran 328 deployments of its code suggestions feature over 18 months — continuous iteration without breaking anything.

### Multi-tier evaluation
Layer three types of measurement:
1. **Deterministic** — code-based checks for structure, format, required fields
2. **Human-in-the-loop** — judgment calls on representative samples, calibrated to domain expert standards
3. **Live observation** — production signals (acceptance rate, abandonment, thumbs down) as continuous measurement

### Continuous measurement
Don't evaluate only at launch. Eval infrastructure should run constantly and flag regressions. Quality degradation often happens gradually — a model update, a distribution shift — and is only visible if you're measuring.

---

## The constellation of metrics pattern

No single metric captures AI quality. Build a set of complementary signals that together give confidence:

- **Quantitative** — acceptance rate, latency, error rate
- **Qualitative** — human panel scores, domain expert review
- **Outcome-based** — downstream user behavior changes (did users actually accomplish the task?)

When your data contradicts your anecdotes, dig into the discrepancy — one of them is wrong, and usually it's the data.

---

## Cadence and phases

**Pre-launch:** Beta periods, internal dogfooding, controlled rollouts. Zoom uses 6–7,000 employees for internal dogfooding before external release.

**Launch:** Experimental or beta state. Set stakeholder expectations that iteration will continue — GA is not "done."

**Post-launch:** Continuous improvement. Eval infrastructure running, [monthly error analysis](error-analysis.md) on new traces, regression detection.

---

## Bootstrap when there's no ground truth

When you have no labeled data yet (common for novel use cases):
1. Recruit a panel of volunteer evaluators including domain experts
2. Generate AI outputs and have evaluators rate them
3. Identify gaps between expected and actual quality
4. Scale up — small panels (5–10) are not enough; build for continuous, scaled evaluation

---

## Common failure modes

| Failure | Fix |
|---|---|
| Evaluating only at launch | Set up continuous measurement from day one |
| Measuring generic "helpfulness" | Do [error analysis](error-analysis.md) first to identify what to actually measure |
| Relying on automated metrics alone for judgment-heavy tasks | Human evaluation is still the gold standard for subjective quality |
| No prompt library abstraction | Builds technical debt that makes model switching expensive |

---

## When NOT to use it

- For AI features in early-stage feasibility validation — the Prompt-as-MVP phase (see [Feasibility-First Inversion](feasibility-first-inversion.md)) comes before infrastructure investment.
- For a single-use AI feature that ships once and isn't maintained.

---

## Connection to other frameworks

- [Error Analysis](error-analysis.md) — the foundational practice; the pipeline makes it continuous.
- [LLM Judge](llm-judge.md) — one layer of the multi-tier architecture.
- [Evaluation Rubric](evaluation-rubric.md) — defines the quality criteria the pipeline measures.

---

## Further reading

- Reforge — AI PM course materials (2024) — primary sources
- Dylan Selberg (HubSpot), Justin Farris (GitLab), Kumesh Aroomoogan (LinkedIn) — Reforge practitioners
- GitLab blog — public writing on AI feature development and eval practices

---

*This card is an original synthesis based on Reforge course content. Attribution to multiple Reforge practitioners; no single individual author.*
