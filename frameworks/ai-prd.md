---
name: AI PRD
aliases: [AI Product Requirements Document, AI Requirements Layer]
author: Product Faculty
source_type: course
source: "Building LLM Products: AI PRD (Product Faculty AIPM course, 2026)"
use_when:
  - You're writing a PRD for a feature that uses LLMs, ML models, or other AI components
  - You have a standard PRD and need to add AI-specific requirements
  - You're about to write a timeline for an AI feature and need to know what phases to include
tags: [ai-pm, prd, requirements, llm]
---

# AI PRD

An extension to the standard PRD that adds the sections required for AI-powered features. These aren't separate documents — the AI PRD layers on top of the standard PRD (see [Modern PRD Lifecycle](modern-prd-lifecycle.md)). Learn the standard PRD first, then add this layer for features with AI components.

The AI layer matters because AI features have properties deterministic features don't: probabilistic outputs, variable inference costs, ethical risks, human-in-the-loop requirements, and quality metrics that can't be captured with standard feature analytics.

**Attribution:** Product Faculty — *Building LLM Products* (AIPM course, 2026). Institutional source; no individual author named. See [productfaculty.co](https://productfaculty.co).

---

## AI-specific sections to add

### Functional requirements (AI-specific)
- **LLM or model selected** — which model, version, provider; why this one
- **Data sources** — what knowledge or data the model has access to
- **Human-in-the-loop (HiTL) pattern** — when does a human review or approve AI output before it reaches the user? Name the pattern explicitly.
- **Feedback mechanism** — how users signal thumbs up/down, edit, or ignore the output; how this feeds back into the system

### Non-functional requirements
- **Streaming output** — does the UI stream tokens or wait for full response? (critical for latency perception)
- **Rate limiting and debouncing** — how is the system protected from abuse or overcalling?
- **Reliability** — what happens when the AI API is down? Disabled state, fallback behavior.
- **Content moderation** — what content policy applies; who reviews; what the moderation pipeline is

### Stakeholders — don't skip Privacy, Security, Legal
AI features routinely require legal sign-off (GDPR implications of sending user data to third-party models), privacy review (what data is retained in context), and security review (prompt injection vectors). Name these stakeholders at Stage 1.

---

## AI metrics framework (7 categories)

Don't measure AI quality with one number. Build a constellation.

| Category | What to measure |
|---|---|
| **Accuracy** | Accuracy score, precision/recall, factual correctness rate |
| **Speed** | First-token latency, total response time, streaming responsiveness |
| **Cost** | Token count per query, cost per successful interaction |
| **Scalability** | Throughput under load, failure rate at peak |
| **Robustness** | Performance on adversarial inputs, edge cases, distribution shift |
| **Explainability** | Can the user understand why the AI responded as it did? |
| **Ethics & Bias** | Demographic parity, fairness metrics, harmful content rate |

For most features, you won't measure all seven on day one. Start with Accuracy, Speed, and Cost. Add the rest as the feature matures.

---

## Vibe Check first

Before investing in formal evaluation infrastructure, run a vibe check: have 5–10 people use the feature with real tasks. If the outputs are directionally wrong, no measurement framework will help you — you need to fix the fundamental approach first.

Only after the vibe check passes should you invest in building the metrics infrastructure above.

---

## AI-specific timeline considerations

AI feature timelines differ from standard software timelines. Include:
- Prompt development and iteration (often 2–4 weeks for complex features)
- Evaluation rubric building and inter-rater calibration
- Prompt testing on representative inputs
- Load testing at scale
- Experiment window for quality validation post-launch

Promising hard dates on AI features without accounting for these phases is a reliable way to miss.

---

## Common traps

| Trap | Fix |
|---|---|
| No AI-specific success metrics | Add at minimum Accuracy, Speed, Cost — before launch |
| Vibe Check skipped, jumped straight to formal evals | Run vibe check first; don't measure what isn't directionally right |
| HiTL pattern not named | Name it explicitly — what triggers a human review, and who reviews? |
| Privacy/Security/Legal not involved until late | Name them as stakeholders in Stage 1 |
| Aggressive timeline that doesn't include prompt iteration | Add 2–4 weeks for prompt development for complex features |
| Prompt hacking risk not assessed | Name it in risks; specify moderation approach |

---

## When NOT to use it

- For features with no AI components — use [Modern PRD Lifecycle](modern-prd-lifecycle.md) without this layer.
- At Stage 1 (Planning) — add the AI layer at Stage 2 (Kickoff) or Stage 3 (Solution Review) when the AI approach is better defined.

---

## Connection to other frameworks

- [Modern PRD Lifecycle](modern-prd-lifecycle.md) — the AI PRD layers on top of the standard PRD; not a replacement.
- [Evaluation Rubric](evaluation-rubric.md) and [Error Analysis](error-analysis.md) — operationalize the AI metrics section.
- [Feasibility-First Inversion](feasibility-first-inversion.md) — the AI PRD should not be written before a Prompt-as-MVP has validated that the AI approach is directionally feasible.

---

## Further reading

- Product Faculty — *Building LLM Products: AI PRD* (AIPM course, 2026)
- Hamel Husain — *Field Guide: Improving AI Products* (2026) — public; covers quality measurement in depth

---

*This card is an original synthesis based on Product Faculty course material. For the full treatment, consult the AIPM course.*
