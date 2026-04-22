---
name: Critique Shadowing
aliases: [LLM Judge Building Process, Critique-Shadowing Technique]
author: Hamel Husain
source_type: article
source: "LLM-as-Judge: A Complete Guide (Husain, Parlance Labs, 2026)"
use_when:
  - You've completed error analysis and now need to build an automated LLM judge
  - You want a judge that matches how your specific domain expert evaluates quality
  - You need to scale quality review beyond what humans can manually review
tags: [evals, ai-pm, llm-judge, methodology]
---

# Critique Shadowing

A 5-step technique for building an LLM judge that aligns with human expert judgment. The core insight: you cannot write a good judge prompt by imagining what "good" looks like. You have to see it in the data. The domain expert's written critiques — produced during manual evaluation — become the few-shot examples that make the judge work.

Based on 30+ production implementations by Hamel Husain at Parlance Labs.

**Author:** Hamel Husain — *LLM-as-Judge: A Complete Guide* (Parlance Labs, 2026). See [hamel.dev](https://hamel.dev).

---

## Five steps

### Step 1 — Identify the Principal Domain Expert
One person whose judgment is authoritative for the product's quality. Not a committee. One voice.

The domain expert must be someone who can genuinely assess whether outputs meet user needs — a lead nurse for a clinical product, the PM for a customer support tool, a senior engineer for a code generation feature. A "convenient proxy" produces a judge calibrated to the proxy's beliefs, not user needs.

### Step 2 — Build a diverse dataset
Structure test cases across three dimensions:
- **Features** — specific capabilities the AI is expected to handle
- **Scenarios** — situations the AI will encounter (standard case, ambiguous input, edge case, out-of-scope request, multi-turn)
- **Personas** — representative user types (new user, expert, busy professional, non-native speaker)

Generate user inputs using LLMs. Feed inputs into the real system. Capture outputs. Start with ~30 examples and keep adding until new test cases stop surfacing new failure modes.

### Step 3 — Domain expert makes binary judgments + writes detailed critiques
Binary pass/fail for each example — not 1–5 scales.

Each judgment is accompanied by a written critique that:
- Explains why it passed or failed
- Is specific enough that a new employee could apply the same standard
- Is specific enough to function as a few-shot example in a prompt

The critique is the training data, not the label. A label without a critique only tells you what happened; a critique tells you why — and the "why" is what the judge will learn.

### Step 4 — Build the judge prompt iteratively using critiques as few-shot examples
Structure the judge prompt:
1. System context (role, domain knowledge)
2. Evaluation guidelines (what failure means, what "NOT a failure" means)
3. Few-shot examples: input + AI response + expert critique + judgment
4. Request for critique + judgment on the new item

The expert's critiques from Step 3 are the few-shot examples. They go directly into the prompt.

### Step 5 — Iterate until convergence (>90% agreement)
Track agreement between the judge and the domain expert on a holdout set. Most implementations reach 90%+ in 3 iterations. Each iteration:
1. Run the judge on the domain expert's labeled examples
2. Find where judge and expert disagree
3. Add the disagreement cases as additional few-shot examples
4. Update the guidelines based on patterns in the disagreements

---

## A valuable side effect

Building the judge forces the domain expert to articulate implicit standards. Domain experts often discover during this process that they've been evaluating inconsistently — applying different criteria to similar cases without realizing it. The process of externalizing judgment often reveals where quality criteria need standardization before the judge can be reliable.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Wrong domain expert (convenient, not authoritative) | The judge will be calibrated to the proxy's beliefs, not user needs |
| Using 1–5 scales instead of binary | Harder to validate; business decisions are binary; stick to pass/fail |
| Critiques too short ("this is wrong") | The critique must explain specifically enough to function as a few-shot example |
| Stopping at 60–70% agreement | That's early-iteration performance, not a mature judge; keep iterating |
| Scope too broad (chatbot that "does anything") | Too many criteria to converge; scope the judge to one specific behavior first |

---

## When NOT to use it

- When error analysis hasn't been done yet — the features and scenarios in Step 2 should emerge from error analysis findings, not be invented upfront.
- For deterministic checks (format validation, schema compliance) — use code instead of an LLM judge.

---

## Connection to other frameworks

- [Error Analysis](error-analysis.md) — must come before critique shadowing; error analysis defines what failure categories to build the judge around.
- [LLM Judge](llm-judge.md) — critique shadowing is the technique for building a judge; the LLM judge concept covers the broader architecture and validation metrics (TPR/TNR).
- [Three Gulfs Framework](three-gulfs-framework.md) — once the judge is running, gulfs analysis diagnoses whether persistent failures are Specification or Capability gulfs.

---

## Further reading

- Hamel Husain — *LLM-as-Judge: A Complete Guide* (Parlance Labs, 2026) — primary source
- Hamel Husain — [hamel.dev](https://hamel.dev) — full evaluation blog and guides

---

*This card is an original synthesis. For the full treatment, read Husain's complete guide.*
