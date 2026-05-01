# agentic-pm

A collection of Claude Code skills I use to do my work as a product manager. Built and polished as I learn — they reflect how I think about PM work today, not a finished product.

## Why

PMs don't fail from lack of frameworks — they fail from skipping steps under deadline pressure. Shipping an AI feature before defining what "good" means. Building an LLM judge before labeling enough traces by hand. Documenting a decision in Slack and watching it get relitigated three weeks later. Treating an AI feature's iteration phase like it has an end.

These skills are forcing functions against those failures. Each one walks you through the work Socratically — pushing for evidence, naming trade-offs, refusing to let you skip ahead. Quality checks are grounded in specific public sources, so the pushback isn't just opinion.

## What's in the toolkit

**`coach-ai-product`** — a senior AI PM coach for shipping AI features. Walks discovery, feasibility validation, AI UX, AI PRDs, eval pipelines, error analysis, LLM judges, ongoing iteration, and impact review.

**Planned** (built when leverage justifies the time):

- `coach-decisions` — decision docs, reversibility filtering, root-cause diagnostics
- `coach-metrics` — north star metric, metric trees, impact sizing, guardrails
- `coach-strategy` — strategy kernel, six dimensions, narrative

---

## Quick start

Install once as a plugin:

```bash
git clone https://github.com/gibranmkyn/agentic-pm.git ~/.claude/plugins/agentic-pm
```

(Or clone elsewhere and symlink to `~/.claude/plugins/agentic-pm/`.)

Then invoke from any project directory you're working in:

```bash
cd ~/work/your-project
claude
```

Inside Claude Code, describe your AI feature situation. Examples that route well:

- *"My AI summarization is generating bad outputs and I don't know where to start fixing it."* → error analysis with three-gulfs diagnosis and fix sequencing
- *"I'm building an AI feature for X and need to validate it works before shipping."* → feasibility validation → rubric → eval pipeline
- *"We shipped an AI feature 6 weeks ago. Did it work?"* → impact review with calibration journal
- *"Where do I start with discovery for an AI feature?"* → UX mapping, integration pattern, discovery-to-eval handoff

You don't type skill names. There's one coach; it locates you in the AI product arc and loads the right playbook. Artifacts land in `./.agentic-pm/` of whatever project you're in.

---

## How a session goes

1. **Locate.** The coach reads `./CLAUDE.md`, `./.agentic-pm/` (prior artifacts and `session.md`), git state, and configured MCPs first; then asks only what context didn't tell it. A returning PM usually answers one confirmation question instead of three onboarding questions.
2. **Load the relevant playbook** from `skills/coach-ai-product/reference/`. Each playbook is a Socratic walkthrough with grounded quality checks.
3. **Walk the playbook** — pushes for evidence, surfaces assumptions, names trade-offs, calls out hand-waving, and refuses to skip ahead (no LLM judges before labeling traces by hand; no rubrics before vibe-checks; no "we're done" framing for AI features).
4. **Land an artifact in `.agentic-pm/`** — error journal, AI PRD section, eval pipeline design, iteration log, etc. Written to the project directory you invoked Claude from, not the plugin directory.
5. **Name the next concrete action** — one thing you'll do in the next 48 hours.

`./.agentic-pm/` is your persistent memory across sessions. The coach reads `session.md` (cross-session running notes) and any per-feature artifacts on every invocation.

---

## The AI product arc

```
Locate → Discover → Design (AI UX) → Validate feasibility → Ship in beta →
  ↻ Iterate forever (error analysis weekly, edge-case doc grows) ↻
  ↳ Periodic: impact review, judge revalidation
```

Iteration is the **permanent state**, not a final phase. The coach refuses "we're done now" framing.

---

## How the playbooks connect

You enter at the phase that matches your situation; the coach figures out where you are and routes accordingly.

```
                  discover-ai-feature
                          ↓
                  validate-feasibility   ← Prompt-as-MVP gate (kill or proceed)
                          ↓
                  design-ai-ux           ← integration pattern + failure-pattern guardrails
                          ↓
                  compile-ai-prd         ← AI PRD with eval-as-PRD framing
                          ↓
                  write-rubric           ← define "good" before formal evals
                          ↓
                  design-eval-pipeline   ← Tier 0–3, offline/online/human, PM/eng boundary
                          ↓
                  ═══ SHIP TO BETA ═══
                          ↓
              ┌───────────┴────────────┐
              ↓                        ↓
       iterate-feature        error-analysis     ← when quality issue surfaces
       (permanent state              ↓
        — daily / weekly /     validate-judge   ← when scaling judgment past
        bi-weekly cadences)         ↑              what humans can review
              │                     │
              └─────── feeds ───────┘

   Periodic (quarterly): review-impact   ← predicted vs actual, invest/maintain/kill
```

Common entry points by situation:

| Where you are | Start with |
|---|---|
| Vague AI ambition, no feature yet | `discover-ai-feature` |
| Have a concept, want to test it can work | `validate-feasibility` |
| Pre-launch — need to spec the feature | `compile-ai-prd` |
| Pre-launch — need to plan evals | `write-rubric` (define "good") then `design-eval-pipeline` (architecture) |
| Live, quality issue surfaced (**headline demo**) | `error-analysis` |
| Live, want to set up the iteration cadence | `iterate-feature` |
| Quarterly: did the feature actually work? | `review-impact` |

---

## The 10 playbooks

The coach loads these from `skills/coach-ai-product/reference/` on demand. You don't invoke them directly.

| Playbook | What it walks |
|---|---|
| `discover-ai-feature` | UX mapping, archetype check, integration pattern (inline / sidecar / predictive), discovery-to-eval handoff |
| `validate-feasibility` | Feasibility-first inversion, Prompt-as-MVP on 20–50 real inputs, four product risks |
| `design-ai-ux` | Integration patterns, four universal AI design patterns, failure-pattern guardrails, HITL level |
| `compile-ai-prd` | AI PRD with six levers, HITL, eval-as-PRD framing, counter-metrics, 5-stage rolling checklist |
| `write-rubric` | Pre-launch rubric, vibe-check pre-step, anchored 1–5 or binary, ≥80% inter-rater agreement |
| `design-eval-pipeline` | Tier 0–3 cost hierarchy, offline + online + human, guardrails vs evaluators, PM/eng boundary |
| `error-analysis` | 100-trace sample, axial coding, three-gulfs diagnosis, fix sequencing (cheapest gulf first) |
| `validate-judge` | Critique-shadowing 5-step, binary scoring, train/dev/test splits, TPR/TNR validation |
| `iterate-feature` | Living edge-case doc, prompt library mindset, morning ritual, ongoing user conversations |
| `review-impact` | Predicted vs actual, calibration journal, capability funnel, invest/maintain/kill |

Plus an internal spine reference (`ai-product-arc.md`) the coach re-reads when re-orienting across sessions.

---

## Design principles

1. **One entry point.** A coach, not a buffet. Skills are internal toolkit; you don't memorize commands.
2. **Look at the data before formalizing.** Error analysis precedes evals. Vibe-check precedes rubrics. Manual review precedes LLM judges.
3. **PM owns the labeling.** Eng owns the harness; PM owns the rubric, labels, and eval set. The eval set is the artifact — pass rates without coverage are vanity metrics.
4. **Grounded quality bars.** Every quality check cites a specific public source. If a check has no source, it's dropped.
5. **Iteration is permanent state.** AI features ship in beta and iterate forever. The coach refuses "we're done" framing.
6. **Work lands in `.agentic-pm/`.** Artifacts accumulate in your project directory; the coach reads them on every invocation. `session.md` is the cross-session running log. No separate context system to maintain.

---

## What's inside

```
agentic-pm/
├── skills/coach-ai-product/  ← the AI product coach (this v0.4 release)
│   ├── SKILL.md              ← the coach (operating principles + arc spine)
│   └── reference/            ← 10 playbooks + the spine reference
│   (future: skills/coach-metrics/, skills/coach-decisions/, etc.)
├── frameworks/               ← distilled framework cards (scoped to the AI
│                                product arc; more land when the next coach ships)
├── docs/                     ← design corpus (optional reading)
└── README.md
```

Session artifacts live in `./.agentic-pm/` inside your project directory (your CWD), not in the plugin.

---

## MCP recommendations

Skills hold the workflow recipe; MCPs give the coach actual hands. agentic-pm doesn't bundle any MCPs — your stack is yours — but the coach is meaningfully more capable when these are wired up.

**High-value MCPs:**

| MCP | Unlocks |
|---|---|
| **Eval platform** — LangSmith, Braintrust, Arize Phoenix, Truesight | `error-analysis`, `validate-judge`, `iterate-feature`: coach pulls real traces, labels them with you in-session, scores judges, writes pivot tables from production data instead of roleplay. **The single biggest leverage.** |
| **LLM APIs** — OpenAI MCP, Anthropic MCP | `validate-feasibility`: run Prompt-as-MVP against real inputs. `write-rubric`: generate synthetic test data along Features × Scenarios × Personas. |
| **Production data** — Postgres / BigQuery / Snowflake MCP | If your traces and metrics live in your own DB rather than an eval platform. Same role, different surface. |

**Useful but lower-leverage:**

| MCP | Unlocks |
|---|---|
| **Git / GitHub MCP** | Prompts belong in Git, atomic with code. Coach can commit prompt rewrites and diff against baseline. |
| **Linear / Jira / Notion MCP** | Push the AI PRD or impact review to wherever your team tracks work. |

Each playbook's *Locate* step checks for relevant MCPs. If present, the coach uses them directly (pull traces, score outputs, query metrics). If absent, the coach guides you through manual sample preparation — paste representative outputs, label in a spreadsheet, etc. Both paths produce the same artifact; the MCP path is faster and grounded in real data.

If you only add one MCP, add an eval-platform one. The headline demo (`error-analysis`) is dramatically better when the coach can pull traces directly.

---

## Status

**v0.4.1.** No formal license — clone for personal use is fine; reuse and redistribution aren't covered. If it sparks an idea for your own work, [reach out](mailto:gibran.makyanie@gmail.com).

## Contact

Gibran Makyanie — [gibran.makyanie@gmail.com](mailto:gibran.makyanie@gmail.com)
