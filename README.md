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

## v0.1 — 8 skills + 2 meta

**Workflows** (multi-phase, span a real PM cycle):
- `/agentic-pm:product-strategy` — write a strategy and get buy-in
- `/agentic-pm:opportunity` — map opportunity space, pick a target
- `/agentic-pm:assumptions` — surface and risk-rank assumptions, plan validations
- `/agentic-pm:research` — plan research OR synthesize transcripts
- `/agentic-pm:decisions` — make decisions that don't get relitigated
- `/agentic-pm:measure` — define and size metrics rigorously

**Specialized** (single-purpose, where the wiki is strong and workflows under-cover):
- `/agentic-pm:eval-plan` — plan evaluation for AI features (rubric-first or traces-first)
- `/agentic-pm:prd` — write a PRD at the right shape for the stage and work type

**Meta:**
- `/agentic-pm:start` — initialize the 5-file context system
- `/agentic-pm:brainstorm` — situation router

Each skill's full spec — use case, autoselected spine table, sub-steps, wiki-grounded quality bar, handoffs, output paths — lives in [WORKFLOWS.md](WORKFLOWS.md).

## Design principles

1. **Job-first.** Skills are named after PM artifacts or situations, not frameworks. A PM thinks *"I need a strategy by Friday,"* not *"I need to apply Rumelt's Kernel."*
2. **Spine autoselect.** When multiple wiki frameworks could apply to the same artifact, the skill asks 1–3 up-front questions and picks. No one-size-fits-all template.
3. **Situation-triggered add-on blocks.** Optional sections appended only when conditions are met. Default to leaner artifacts.
4. **Wiki-grounded quality bars.** Every quality check cites a wiki concept verbatim. If a check has no source, it's dropped.
5. **User autonomy.** Skills strongly recommend wiki-backed practices but never refuse. Declined recommendations propagate as tags on output (`feasibility-unverified`, `impact-unsized`) so downstream skills adjust without re-explaining.
6. **Wiki-gap handling.** When a workflow's commercial moves aren't wiki-backed, swap the spine to what the wiki supports if the underlying job is real. Flag the original move as a wiki-expansion candidate. Don't fabricate.
7. **Context-aware.** Every skill reads 5 context files in `context/` before answering — COMPANY / GOALS / TEAM / PRODUCTS / CONSTRAINTS.
8. **Distill-and-attribute.** Every framework card is rewritten in our own words with public-source attribution. No verbatim from paywalled material.
9. **Work lands in `Work/`.** PRDs, trees, decisions accumulate in a structured folder, gitignored.

## What's inside

- **`skills/`** — one `SKILL.md` per v0.1 skill.
- **`agents/pm-advisor.md`** — coach-voice subagent for heavy synthesis.
- **`frameworks/`** — distilled, attributed reference cards. Each is an original synthesis crediting the source author + public source.
- **`context/`** — 5-file context system (initialized via `/agentic-pm:start`).
- **`Work/`** — PM outputs land here (gitignored).
- **[WORKFLOWS.md](WORKFLOWS.md)** — source of truth for skill specs.
- **[PLAN.md](PLAN.md)** — implementation roadmap.

## Status

**v0.1 in implementation.** The design spec is complete (PLAN.md, WORKFLOWS.md). The repo currently contains 3 gold-standard framework cards (Opportunity Solution Tree, Jobs To Be Done, Metric Trees) and the brainstorm router shell. The full v0.1 skill build-out is in progress.

Portfolio piece — not packaged for install, not accepting contributions, not licensed for reuse. If you want to see how it feels, clone it locally and run `claude --plugin-dir ./agentic-pm` once v0.1 ships — but the primary purpose here is to show *how I'd approach the problem*, not to be used as a product.

## Contact

Gibran Makyanie — [gibran.makyanie@gmail.com](mailto:gibran.makyanie@gmail.com)
