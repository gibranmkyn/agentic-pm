---
name: Feasibility-First Inversion
aliases: [Feasibility First, AI PM Inversion, Capability-First AI PM]
author: Hamel Husain, Bryan Bischof, Miqdad Jaffer, Product Faculty
source_type: article
source: "Field Guide: Improving AI Products (Husain, 2026); Stop Managing AI Projects Like Traditional Software (Bischof, 2025); AI Product Strategy (Jaffer, 2026)"
use_when:
  - You're about to start building an AI feature and want to know if you should do discovery differently
  - A previous AI build hit a wall mid-development because the model couldn't do the task
  - You need to communicate to stakeholders why AI roadmaps can't have firm feature-on-date commitments
tags: [ai-pm, methodology, validation, product-development]
---

# Feasibility-First Inversion

Traditional PM orders its three risk checks in one direction: desirability first, then viability, then feasibility. Engineering feasibility is the last gate because in deterministic software, most things are buildable given time and money.

AI products invert this. Feasibility is the first gate, not the last. If the model can't do the task reliably, no amount of user research or business model elegance matters — the product doesn't exist yet.

This isn't a stylistic choice. It's forced by what AI systems are: statistical artifacts whose capability ceilings are unknown in advance, often unknown even to the model's makers.

**Authors:** Named independently from four angles: Hamel Husain (Parlance Labs), Bryan Bischof, Miqdad Jaffer, and Product Faculty — without cross-reference. Convergent independent claims are strong evidence.

---

## Why the inversion exists

Deterministic software has a predictable capability ceiling. Given a spec, engineers can build to it. AI systems don't have that property.

Three structural reasons feasibility must come first:

1. **Non-determinism** — the same input produces different outputs; "works in the demo, fails in production" is the default, not the exception
2. **Jagged capability** — the model may pass the first 10 test cases and fail 40% of the long tail; desirability research done before capability is verified over-promises
3. **Variable economics** — inference cost per success depends on failure rate; business viability can only be evaluated once feasibility is measured

---

## The Prompt-as-MVP

The practical operationalization of the inversion. Before any design work, before writing a PRD, before running design sprints:

1. Write the minimum prompt that would be needed if this feature shipped
2. Run it against 20–50 real user inputs (not cherry-picked examples — representative of production distribution)
3. Label each output binary: pass or fail
4. If 60–80%+ pass: feasibility is directionally validated; proceed to design
5. If not: narrow the scope, adjust the approach (add RAG, restructure the task), or kill the idea

The Prompt-as-MVP is the AI equivalent of a paper prototype — cheap, ugly, fast, and diagnostic. The difference is that a paper prototype tests user desirability; a Prompt-as-MVP tests model capability.

The first artifact on a feasibility-first team is a labeled spreadsheet of real inputs, not a PRD or a mockup.

---

## What changes in practice

| Traditional PM | Feasibility-First AI PM |
|---|---|
| Write PRD → design → build | Validate feasibility (Prompt-as-MVP) → then PRD |
| Commit to features on a date | Commit to capability levels at milestones |
| Feasibility = engineering estimate | Feasibility = measured failure rate on real data |
| Evals after launch | Evals during feasibility validation — day one |

---

## The failure mode from skipping the inversion

Teams that apply traditional PM to AI consistently hit the same wall around week 8–12 of a build:

- Weeks 1–2: user research confirms desirability
- Weeks 3–4: business case confirms viability
- Weeks 5–6: design and PRD completed
- Week 7: engineering begins
- Weeks 8–12: discovery — the model can't do this task at acceptable quality

The inversion prevents this by front-loading the discovery in week 1.

---

## Feasibility doesn't mean what it used to

In traditional PM, feasibility is an engineering team's estimate. In AI PM, feasibility is a measured property of the model-and-data system:

- Can the model handle the distribution of real user inputs (not cherry-picked examples)?
- What's the failure rate on edge cases?
- Can failure modes be caught by guardrails, or do they reach users?

Engineers cannot answer these questions without running experiments. The PM's job is to design the experiment — which inputs count, what the pass criteria are.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Treating AI feasibility like traditional engineering feasibility | Ask "what's the measured failure rate?" not "can we build this?" |
| Running the Prompt-as-MVP on cherry-picked inputs | Use representative inputs from production-like distribution |
| Stopping feasibility validation after 5 examples | 20–50 examples minimum; keep going until you hit the long-tail failure modes |
| Building the roadmap before feasibility is established | Commit to experiments and capability milestones; feature dates come after |

---

## When NOT to use it

- For AI features that use only deterministic components (rule-based routing, structured data extraction from fixed templates) — traditional feasibility assessment applies.
- When a model's capability is already proven for the specific task type in production at similar scale.

---

## Connection to other frameworks

- [Four Product Risks](four-product-risks.md) — the inversion doesn't eliminate the other risk checks; it changes their *order*. Value and viability still matter — just after feasibility.
- [Error Analysis](error-analysis.md) — the daily practice through which feasibility is measured and maintained post-launch.
- [Three Gulfs Framework](three-gulfs-framework.md) — names the specific failure modes when the inversion is skipped.

---

## Further reading

- Hamel Husain — *Field Guide: Improving AI Products* (Parlance Labs, 2026) — public
- Bryan Bischof — *Stop Managing AI Projects Like Traditional Software* (2025) — public article
- Miqdad Jaffer — *AI Product Strategy* (2026) — public
- Product Faculty — *Building LLM Products: 4D Overview* (AIPM course, 2026)

---

*This card is a synthesis of converging independent claims. For the full treatment, read the source articles.*
