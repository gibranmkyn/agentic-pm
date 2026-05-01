# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Claude Code **plugin** distributed as `~/.claude/plugins/agentic-pm/`. It contains one skill — `coach-ai-product` — that coaches a PM through the AI product arc (discovery → feasibility → UX → PRD → rubric → eval pipeline → ship → iterate forever → quarterly impact review). The plugin manifest is `.claude-plugin/plugin.json` (currently v0.4.0). Planned siblings (`coach-decisions`, `coach-metrics`, `coach-strategy`) are not yet built.

There is **no build / lint / test toolchain**. Everything in this repo is markdown — skills, playbooks, framework cards, design docs. Don't go looking for `package.json` or a test runner.

## Layered architecture

The coach is one entry point that loads playbooks on demand:

```
skills/coach-ai-product/
├── SKILL.md          ← the coach (identity, arc spine, operating principles, Locate logic)
└── reference/
    ├── ai-product-arc.md       ← spine reference; coach re-reads when re-orienting across sessions
    ├── discover-ai-feature.md  ┐
    ├── validate-feasibility.md │
    ├── design-ai-ux.md         │  10 playbooks. Coach reads SKILL.md every time
    ├── compile-ai-prd.md       │  and loads exactly one playbook based on the
    ├── write-rubric.md         │  PM's phase. Don't auto-chain playbooks.
    ├── design-eval-pipeline.md │
    ├── error-analysis.md       │
    ├── validate-judge.md       │
    ├── iterate-feature.md      │
    └── review-impact.md        ┘
```

`frameworks/` holds 16 distilled, attributed framework cards scoped to the AI arc. Currently the playbooks cite frameworks by **author name in prose** (Hamel, Shreya Shankar, Eugene Yan, Justin Farris, Marily Nika, Ankur Goyal, Tatyana Mamut, Teresa Torres, etc.), **not by file path**. The cards are a free-floating reference library; a future improvement is to wire them in by path so the link is real. Don't add cards that aren't grounded in a public, citable source.

`docs/` holds the cross-cutting design corpus. Three documents describe protocols every skill must follow — read these before authoring or editing a skill:
- `SKILL-PATTERN.md` — the 5-phase spine (context load → discovery interview → propose → self-validate → land artifact). Skills are Socratic, not extractive: artifact is the residue of good reasoning, not the goal.
- `INTERVIEW-PROTOCOL.md` — the discovery interview is most of the session. Don't shortcut to the artifact.
- `VALIDATION-PROTOCOL.md` — builder-validator: Claude self-checks the artifact against the skill's quality bar before presenting it.

## The single most load-bearing convention

**Session artifacts land in the user's CWD at `./.agentic-pm/`, NOT in this plugin directory.** The plugin is read-only at runtime; `./.agentic-pm/` (in whatever project the PM ran `claude` from) is where state accumulates. The coach reads `./.agentic-pm/session.md` (cross-session running notes) and any per-feature artifacts on every invocation. If you're editing a playbook and it produces an artifact, the path is `./.agentic-pm/<category>/<feature>-<artifact>.md` (e.g. `.agentic-pm/evals/<feature>-error-journal.md`). Never write to a path inside the plugin directory.

## Conventions worth not breaking

- **Wiki-grounded quality bars.** Every quality check in a playbook cites a specific author or named framework. If a check has no source, it's dropped. Distill-and-attribute — no verbatim from paywalled material.
- **Iteration is the permanent state.** AI features ship in beta and iterate forever. The coach refuses any "we're done now" framing. Per Justin Farris / GitLab: "Beta is not temporary — 328 deployments over 18 months."
- **Look at the data before formalizing** (per Hamel). Error analysis precedes evals; vibe-check precedes rubrics; manual review precedes LLM judges. Don't let a playbook recommend formal infrastructure before the prerequisite labeling work.
- **PM owns the labeling** (per Hamel + Aman Khan). Eng owns the harness; PM owns the rubric, labels, and eval set. The eval set IS the artifact — pass rates without coverage are vanity.
- **One coach, not a buffet.** PMs don't invoke skills by name. The coach locates the PM in the arc and loads the right playbook. When adding a new top-level skill (`coach-metrics` etc.), follow the same shape: one `SKILL.md` entry point with `reference/` playbooks loaded on demand.

## Things that are gitignored and won't appear on a fresh clone

`PLAN.md` (design narrative + refactor history), `_archive/` (prior v0.3 attempts + pre-staged content for unbuilt coaches — `_archive/frameworks-staged/`, `_archive/examples-staged/`), `Work/` (the maintainer's personal scratch space), and `.claude/`. If you need historical context for a refactor decision, ask the maintainer for `PLAN.md`.
