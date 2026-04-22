# agentic-pm

**A Claude Code plugin for PMs who use agents.** Describe your situation in plain English; agentic-pm picks the right framework spine, walks you through producing the artifact, and grounds every quality check in a wiki-attributed source.

> **About this project.** Personal portfolio piece — a working sketch of how I'd build PM tooling for the agentic era. Not packaged for install, not accepting contributions, not licensed for reuse. If it sparks an idea for you, [reach out](mailto:gibran.makyanie@gmail.com).

---

## Why agentic-pm

PMs don't fail from lack of frameworks — they fail from picking the wrong one under deadline pressure, or applying it loosely. agentic-pm flips the workflow: you describe the situation, the plugin autoselects the spine, asks 1–3 sharpening questions, and walks you through the artifact with quality checks that cite their wiki source.

Inspired by [AI PM OS](https://www.prodmgmt.world/products/pm-os) (Cursor-native, commercial). agentic-pm is Claude Code-native, distill-and-attribute-shaped, and built around the maintainer's [BrainDump](https://github.com/gibranmakyanie) knowledge wiki.

## How it works

Inside Claude Code:

```
/agentic-pm:opportunity we have transcripts from 8 churn interviews
```

1. The skill **autoselects the spine** — OST (default), OKPS (if goals are OKR-shaped), or two trees (B2B with buyer ≠ end user).
2. Asks 1–3 up-front situation questions to set scope.
3. Walks the sub-steps: ingest transcripts → snapshot template → opportunity surfacing → tree population → target selection.
4. Every quality check cites a wiki source (Torres: *"Pick 3–7 areas; let the tree be incomplete at the edges"*).
5. You leave with a populated OST in `Work/discovery/` and a handoff offer to `/agentic-pm:assumptions` or `/agentic-pm:prd`.

## v0.3 — 18 skills (layered) + 1 meta

Skills are grouped by when a PM invokes them. Every name is a verb + object that answers "what am I about to do?"

**Layer 1 — Product context (periodic; feeds many PRDs):**
- `/agentic-pm:write-strategy` — multi-quarter strategy doc
- `/agentic-pm:map-opportunities` — Opportunity Solution Tree with a selected target
- `/agentic-pm:define-metrics` — NSM, metric tree, or cycle goals
- `/agentic-pm:setup-voc` — continuous voice-of-customer program
- `/agentic-pm:plan-roadmap` — outcome-linked roadmap

**Layer 2 — PRD + its deep-framework sections (per feature):**
- `/agentic-pm:compile-prd` — composer; scans Work/ for section artifacts and emits at requested fidelity (one-pager / Stage 2 / full spec / Stage 5). Absorbs the former one-pager, pitch, and design-agent-system skills as modes and add-on blocks.
- `/agentic-pm:size-impact` — impact-sizing cascade with sensitivities
- `/agentic-pm:map-risks` — assumption map + validation plan (absorbs former prototype skill's execution detail)
- `/agentic-pm:write-rubric` — pre-launch AI evaluation rubric
- `/agentic-pm:align-stakeholders` — stakeholder alignment plan

**Layer 3 — Research (ad-hoc):**
- `/agentic-pm:plan-research` — Research Brief (Decision-First)
- `/agentic-pm:synthesize-research` — JTBD synthesis from transcripts

**Layer 4 — Post-launch:**
- `/agentic-pm:diagnose-ai` — error analysis + Three Gulfs fix sequencing
- `/agentic-pm:diagnose-metric` — decompose a moved metric to its likely cause
- `/agentic-pm:build-judge` — LLM judge validated against human labels
- `/agentic-pm:review-impact` — Stage 5 impact review: predicted vs actual, next decision

**Standalone:**
- `/agentic-pm:document-decision` — SPIDER decision doc
- `/agentic-pm:prioritize-backlog` — ranked backlog with rationale

**Meta:**
- `/agentic-pm:setup-context` — initialize the 5-file context system

Each skill's full spec — use case, autoselected spine, sub-steps, wiki-grounded quality bar, handoffs, output paths — lives in [WORKFLOWS.md](WORKFLOWS.md). The shared pattern every skill follows lives in [SKILL-PATTERN.md](SKILL-PATTERN.md).

## Design principles

1. **Verb + object naming.** Every skill answers "what am I about to do?" — `write-strategy`, `map-risks`, `compile-prd`. A PM types what they're about to go do; no abstract verbs like "strategize."
2. **Socratic, not extractive.** A skill's job is to build the PM's clarity and confidence that their approach is sound — by walking the framework in dialogue and pressure-testing the reasoning. The plan or artifact is a byproduct of sound reasoning, not the goal. See [SKILL-PATTERN.md](SKILL-PATTERN.md).
3. **Compilation model.** `compile-prd` is a composer, not an author. Section skills (`map-opportunities`, `define-metrics`, `size-impact`, `map-risks`, `write-rubric`, `align-stakeholders`) produce modular artifacts in `Work/`; compile-prd assembles them at the requested fidelity — a one-pager and a full PRD are the same content at different depths.
4. **Spine autoselect.** When multiple wiki frameworks could apply, the skill asks 1–3 up-front questions and picks. No one-size-fits-all template.
5. **Situation-triggered add-on blocks.** Optional sections appended only when conditions are met. Default to leaner artifacts.
6. **Wiki-grounded quality bars.** Every quality check cites a wiki concept verbatim. If a check has no source, it's dropped.
7. **User autonomy + speed mode.** Skills strongly recommend wiki-backed practices but never refuse. Declined recommendations propagate as tags on output (`feasibility-unverified`, `impact-unsized`, `speed-mode-used`) so downstream skills adjust without re-explaining. Every skill offers a speed-mode fallback for PMs under deadline pressure.
8. **Wiki-gap handling.** When a commercial workflow's moves aren't wiki-backed, swap the spine to what the wiki supports if the underlying job is real. Flag the original move as a wiki-expansion candidate. Don't fabricate.
9. **Context-aware.** Every skill reads 5 context files in `context/` before answering — COMPANY / GOALS / TEAM / PRODUCTS / CONSTRAINTS.
10. **Distill-and-attribute.** Every framework card is rewritten in our own words with public-source attribution. No verbatim from paywalled material.
11. **Work lands in `Work/`.** PRDs, trees, decisions accumulate in a structured folder, gitignored.

## What's inside

- **`skills/`** — one `SKILL.md` per skill (19 total: 18 non-meta + `setup-context`).
- **`agents/pm-advisor.md`** — coach-voice subagent for heavy synthesis.
- **`frameworks/`** — distilled, attributed reference cards. Each is an original synthesis crediting the source author + public source.
- **`context/`** — 5-file context system (initialized via `/agentic-pm:setup-context`).
- **`Work/`** — PM outputs land here (gitignored).
- **`drills/`** — worked examples showing skills running end-to-end on concrete scenarios.
- **`examples/metrics/`** — metric tree + NSM cards, one per product archetype.
- **`examples/research/`** — ready-to-use interview guides, one per research mode.
- **[WORKFLOWS.md](WORKFLOWS.md)** — source of truth for skill specs.
- **[SKILL-PATTERN.md](SKILL-PATTERN.md)** — the shared Socratic + compilation pattern every skill follows.
- **[PLAN.md](PLAN.md)** — implementation roadmap.

## Status

**v0.3 in progress.** Restructured from 22 skills to 18 (+ meta) using a layered model: product-context skills feed per-feature PRD work, which compiles from modular section artifacts at the requested fidelity (one-pager / full PRD / Stage 5). See [SKILL-PATTERN.md](SKILL-PATTERN.md) for the compilation model.

Portfolio piece — not packaged for install, not accepting contributions, not licensed for reuse. If you want to see how it feels, clone it locally and run `claude --plugin-dir ./agentic-pm` — but the primary purpose here is to show *how I'd approach the problem*, not to be used as a product.

## Contact

Gibran Makyanie — [gibran.makyanie@gmail.com](mailto:gibran.makyanie@gmail.com)
