---
name: ai-product-arc
description: Full-arc reference the coach re-reads when re-orienting across sessions — not a playbook, not invoked per phase. Synthesizes the AI product development arc, phase descriptions, and which playbook each phase loads. Loaded by the coach skill, not invoked directly.
---

# AI Product Arc

The coach's full-arc map. Re-read this when re-orienting across sessions: when the PM asks "where are we?", when sessions have a gap between them, or when you need to understand how the current work connects to the whole arc.

This is not a linear checklist. **Iteration is the permanent state** — not a final phase. Per Justin Farris (GitLab): "Beta is not temporary — 328 deployments over 18 months." Resist any "we're done now" framing.

---

## The arc

```
Locate → Discover → Validate Feasibility → Design AI UX →
  Compile AI PRD → Write Rubric → Design Eval Pipeline → Ship in beta →
    ↻ Iterate forever (error analysis weekly, edge-case doc grows, rubric refresh as needed) ↻
    ↳ Periodic: review impact (quarterly), judge revalidation (monthly)
```

The Iterate loop is where most of the work lives. The pre-launch phases (Discover through Design Eval Pipeline) happen once per feature; the Iterate loop happens continuously for as long as the feature is live.

---

## Phase map

### Locate (no playbook — coach's own logic)

Before any playbook, the coach asks 2–3 questions to figure out where the PM is:
- Is this an idea stage / discovery / pre-launch spec?
- Is this a live feature with quality issues?
- Is this mid-iteration or a periodic impact check?

Check `.agentic-pm/` for existing artifacts — if the PM has been here before, pick up where the artifacts leave off. Locate is not a phase the PM goes through; it's the coach's orientation step.

---

### Discover — What problem is worth solving?

**Source:** Justin Farris (AI Product Development Process); 4D Method — Discovery phase (Product Faculty)

Don't start with "what can we do with AI?" Start with "what manual workflows cause genuine toil?" Then figure out where AI fits.

Key moves:
- UX mapping to find painful workflows (5-step: Persona, Stages, Activities, Pain Points, Prioritize)
- Talk to expert users who can validate whether AI suggestions are actually good
- Identify the integration pattern: inline (AI assists within workflow), sidecar (AI runs alongside), or predictive (AI simulates/predicts outcomes)
- JTBD framing: what job is the user hiring this feature to do?

**Playbook:** `discover-ai-feature.md`

---

### Validate Feasibility — Can the intelligence do this?

**Source:** Feasibility-First Inversion; Four Product Risks (Cagan); Riskiest Hypothesis Sequencing; 4D Method

For AI features, feasibility is the first gate. The inversion from traditional PM is deliberate: test whether the model can do the task on real inputs before writing a spec.

Key moves:
- Prompt-as-MVP: minimal prompt, 20–50 real inputs, binary pass/fail, 30 minutes
- Four Product Risks: enumerate assumptions across Value / Usability / Feasibility / Business Viability
- Riskiest Hypothesis Sequencing: validate by conviction × impact-if-wrong, not ease of testing

A PRD written before Prompt-as-MVP is fiction until the model is tested.

**Playbook:** `validate-feasibility.md`

---

### Design AI UX — How does the AI sit in the product?

**Source:** AI Product Development Process (Farris); 4D Method — Design phase; AI Failure Patterns (Marily Nika); Calibrated Trust

Design must account for the full amorphous space of possible outputs — not just the happy path. The experience surrounding the AI moment (guardrails, context panel, feedback mechanism) matters as much as the output.

Key moves:
- Choose integration pattern (inline / sidecar / predictive)
- Apply 4 universal AI design patterns (input, special instructions, output, feedback)
- Design for Marily Nika's three failure patterns: chaos → signal uncertainty; ambiguity → disambiguate before generation; certainty illusion → calibrated trust design
- Name the Sheridan HITL level (1–10): start conservative, evolve as trust builds

**Playbook:** `design-ai-ux.md`

---

### Compile AI PRD — Spec the feature with eval as acceptance criteria

**Source:** AI PRD; 4D Method — Discovery phase output; Eval-as-PRD (Ankur Goyal); Six Levers (Product Faculty); Sheridan Levels of Autonomy; AI Failure Patterns (Nika)

The AI PRD is not a general PRD with AI bolted on. The eval section is the acceptance criteria — a scoring function anyone on the team can run, not prose intent.

Key moves:
- 5-stage rolling checklist (don't enforce later-stage sections early)
- Name the Six Levers in use
- Name the Sheridan HITL level at launch + target level post-trust
- Write Marily Nika failure-pattern guardrails for all three patterns
- Eval section = scoring function (quantified pass/fail, not prose)

**Playbook:** `compile-ai-prd.md`

---

### Write Rubric — Define "good" before the eval pipeline

**Source:** Evaluation Rubric (Shukla); Hamel/OpenAI vibe-check pre-step

Define quality criteria before building formal eval infrastructure. A rubric that isn't grounded in real outputs will measure things that don't actually fail while missing the things that do.

Key moves:
- Vibe check first: 20–30 real outputs, informal notes, before writing formal criteria
- 4–6 categories max; anchors at each level; binary or 1–5
- Inter-rater validation: ≥80% agreement before treating as ground truth
- Reference examples (gold standard + reject) for each category

**Playbook:** `write-rubric.md`

---

### Design Eval Pipeline — Build the measurement infrastructure

**Source:** AI Evaluation Pipeline; Capability Funnel (Bischof); Tier 0–3 cost hierarchy

Once the rubric is locked, design the measurement infrastructure that runs continuously.

Key moves:
- Tier hierarchy: Tier 0 (code/regex) → Tier 1 (embedding similarity) → Tier 2 (LLM judge) → Tier 3 (human review)
- Start at the cheapest tier that catches the failure mode
- Offline / online / human mix calibrated to risk level
- Capability Funnel: each stage a binary eval; funnel of failures is the experiment breeding pool

**Playbook:** `design-eval-pipeline.md`

---

### Error Analysis — Sample to saturation, find the failure modes

**Source:** Error Analysis (Hamel/Shreya Shankar); Three Gulfs Framework (Yan); Capability Funnel (Bischof)

The headline loop for live AI features. Runs weekly (or at minimum monthly). The PM personally reviews traces — this is not delegatable to engineering.

Key moves:
- Sample to theoretical saturation (stop when you stop learning new failure modes; ~100 traces heuristic; 30+ under context pressure)
- Axial coding: emergent categories, not predetermined taxonomy
- Pivot table: count and % per category — this is the prioritization input
- Three Gulfs diagnosis: Comprehension / Specification / Generalization / Model Capability
- Fix sequencing: cheapest gulf first (Specification → Comprehension → Generalization → Capability)

**Playbook:** `error-analysis.md`

---

### Validate Judge — Automate detection of a specific failure mode

**Source:** Critique Shadowing 5-step (Hamel); LLM Judge; TPR/TNR validation

Build only after error analysis has produced enough labeled traces to know what "good" looks like. Judges not validated against humans are fake.

Key moves:
- Critique Shadowing 5-step: scope → domain expert → dataset → expert critiques → judge prompt
- Binary scoring only (not 1–5)
- Train/dev/test: 10–20% / 40% / 40%; test set touched once
- Validate TPR and TNR on holdout (not accuracy); target >80% each
- Weekly maintenance: new production traces, spot-check, revalidate when new failure modes emerge

**Playbook:** `validate-judge.md`

---

### Iterate Feature — Permanent state post-launch

**Source:** AI Product Development Process (Farris); living edge-case document; prompt library abstraction

Iteration is not a phase — it's the dominant state from launch forward. The living edge-case document and prompt library abstraction are the operational tools.

Key moves:
- Living edge-case document: group, stack, use for prioritization and stakeholder visibility
- Prompt library abstraction: wrap model calls so prompts and models can be swapped independently
- Run new models through the full prompt library before deploying (score against baseline to catch regressions)
- Ongoing user conversations: surveys mask real behavior; direct conversation doesn't

**Playbook:** `iterate-feature.md`

---

### Review Impact — Quarterly calibration, not a milestone

**Source:** Capability Funnel (Bischof); Impact Sizing; Calibration Journal; Farris: iteration as permanent state

Runs quarterly. The unit of progress is experiments, not features. The output is one of three decisions: invest / maintain / kill.

Key moves:
- Capability Funnel: which funnel stage is the current bottleneck?
- Plan vs actual with data sources (not opinion)
- Guardrail metrics checked alongside primary
- Delta diagnosis: which cascade step broke? Prediction error or execution gap?
- Calibration journal entry: "We predicted X; actual was Z; because [cause]."

**Playbook:** `review-impact.md`

---

## Key tensions to hold

**Feasibility before spec.** The pull to write a beautiful PRD before testing the model on real inputs is constant. Name it and invert.

**Iteration is permanent.** The pull to declare a feature "done" after launch is constant. Resist it. Error analysis is a weekly loop, not a post-mortem.

**Vibe check before formalization.** The pull to skip manual review and go straight to LLM judges and formal eval pipelines is constant. Label data before you automate the labeling.

**PM owns the eval.** The pull to delegate trace review to engineering is constant. It fails when delegated. The PM holds product taste.

---

## Sources

- Justin Farris / GitLab — AI Product Development Process (Discovery / Prototyping / Iteration as permanent state)
- Product Faculty — 4D Method (Discovery → Design → Develop → Deploy)
- Hamel Husain / Shreya Shankar — Error Analysis, Critique Shadowing
- Ankur Goyal (Braintrust) — Eval-as-PRD
- Bryan Bischof — Capability Funnel
- Dr. Marily Nika — AI Failure Patterns
- Thomas Sheridan — Levels of Autonomy
- Ankit Shukla — Evaluation Rubric
