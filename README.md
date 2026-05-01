# agentic-pm

A collection of Claude Code skills I use to do my work as a product manager. Built and polished over time as I learn more — they reflect how I think about PM work today, not a finished product.

## Why you might want to use this

PMs don't fail from lack of frameworks — they fail from skipping steps under deadline pressure. Shipping an AI feature before defining what "good" means. Building an LLM judge before labeling enough traces by hand. Documenting a decision in Slack and watching it get relitigated three weeks later. Treating an AI feature's iteration phase like it has an end. Pasting transcripts into ChatGPT and asking "what are the patterns?" instead of doing real synthesis.

These skills are forcing functions against those failures. Each one walks you through the work Socratically — pushing for evidence, naming trade-offs, refusing to let you skip ahead. They're wiki-grounded: every quality check cites a specific author (Hamel Husain, Shreya Shankar, Eugene Yan, Justin Farris, Marily Nika, Richard Rumelt, Tatyana Mamut, Teresa Torres, etc.) so the pushback isn't just my opinion.

## What's in the toolkit

**`coach-ai-product`** — a senior AI PM coach for shipping AI features. Walks discovery, feasibility validation, AI UX, AI PRDs, eval pipelines, error analysis, LLM judges, ongoing iteration, and impact review.

## Planned (rough order, built when leverage justifies the time)

- `coach-decisions` — SPIDER decision docs, reversibility filtering, 5-cause diagnostic
- `coach-metrics` — NSM, metric trees, impact sizing, guardrails
- `coach-strategy` — Rumelt kernel, six dimensions, narrative
- (more as I find them)

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

- *"My AI summarization is generating bad outputs and I don't know where to start fixing it."* → walks error analysis + Three Gulfs diagnosis + fix sequencing
- *"I'm building an AI feature for X and need to validate it works before shipping."* → walks feasibility validation → rubric → eval pipeline
- *"We shipped an AI feature 6 weeks ago. Did it work?"* → walks impact review with calibration journal
- *"Where do I start with discovery for an AI feature?"* → walks UX mapping + integration pattern + Discovery-to-Eval Handoff

The coach reads `./CLAUDE.md`, `./.agentic-pm/` (prior session artifacts), git state, and configured MCPs first — then asks only what context didn't tell it. A returning PM usually answers one confirmation question instead of three onboarding questions. Artifacts land in `./.agentic-pm/` of whatever project you're in.

You don't type skill names. There's one coach; it locates you in the AI product arc and loads the right playbook.

---

## How it works

Inside Claude Code, the coach runs through a session like this:

1. **Locates you in the arc** — reads `./CLAUDE.md`, `./.agentic-pm/` (prior artifacts and `session.md`), git state, and configured MCPs first; then asks only what context didn't tell it. Idea / discovery / pre-launch spec / live with quality issues / mid-iteration / post-launch impact review.
2. **Loads the relevant playbook** from `skills/coach-ai-product/reference/`. Each playbook contains a Socratic walkthrough with wiki-grounded quality checks.
3. **Walks the playbook** — pushes for evidence, surfaces assumptions, names trade-offs, calls out hand-waving, and refuses to skip ahead (no LLM judges before labeling traces by hand; no rubrics before vibe-checks; no "we're done" framing for AI features).
4. **Lands an artifact in `.agentic-pm/`** — error journal, AI PRD section, eval pipeline design, iteration log, etc. Artifacts are written to the project directory you invoked Claude from, not the plugin directory.
5. **Names the next concrete action** — one thing you'll do in the next 48 hours.

`./.agentic-pm/` (in your project directory) is your persistent memory across sessions. The coach reads `session.md` (running cross-session notes) and any per-feature artifacts on every invocation. There's no separate context file system; situation is captured in the artifacts themselves.

---

## The AI product arc

```
Locate → Discover → Design (AI UX) → Validate feasibility → Ship in beta →
  ↻ Iterate forever (error analysis weekly, edge-case doc grows) ↻
  ↳ Periodic: impact review, judge revalidation
```

Iteration is the **permanent state**, not a final phase (Justin Farris/GitLab: "Beta is not temporary — 328 deployments over 18 months"). The coach resists "we're done now" framing.

---

## How the playbooks connect

The coach navigates this workflow. You enter at the phase that matches your situation; the coach figures out where you are and routes accordingly.

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

The coach loads these from `skills/coach-ai-product/reference/` on-demand. You don't invoke them directly.

| Playbook | What it walks |
|---|---|
| `discover-ai-feature` | UX mapping, archetype check, integration pattern (inline / sidecar / predictive), Discovery-to-Eval Handoff |
| `validate-feasibility` | Feasibility-First Inversion, Prompt-as-MVP on 20–50 real inputs, Four Product Risks |
| `design-ai-ux` | Integration patterns, 4 universal AI design patterns, guardrails for Marily Nika's failure patterns, Sheridan HITL level |
| `compile-ai-prd` | AI PRD with Six Levers, Sheridan HITL, eval-as-PRD framing (Goyal), counter-metrics, 5-stage rolling checklist |
| `write-rubric` | Pre-launch rubric, vibe-check pre-step, anchored 1–5 or binary, ≥80% inter-rater agreement |
| `design-eval-pipeline` | Tier 0–3 cost hierarchy, offline + online + human, guardrails vs evaluators, PM/eng boundary |
| `error-analysis` | 100-trace sample, axial coding, Three Gulfs diagnosis, fix sequencing (cheapest gulf first) |
| `validate-judge` | Critique Shadowing 5-step, binary scoring, train/dev/test splits, TPR/TNR validation |
| `iterate-feature` | Living edge-case doc, prompt library mindset, morning ritual, ongoing user conversations |
| `review-impact` | Predicted vs actual, calibration journal, Capability Funnel, invest/maintain/kill |

Plus an internal spine reference (`ai-product-arc.md`) the coach re-reads when re-orienting across sessions.

---

## Design principles

1. **One entry point.** A coach, not a buffet. Skills are internal toolkit; the PM doesn't memorize commands.
2. **Look at the data before formalizing** (per Hamel). Error analysis precedes evals; vibe-check precedes rubrics; manual review precedes LLM judges.
3. **PM owns the labeling** (per Hamel + Aman Khan). The eval set IS the artifact — pass rates without comprehensive eval coverage are vanity.
4. **Wiki-grounded quality bars.** Every quality check cites a wiki concept verbatim (Hamel, Shreya Shankar, Eugene Yan, Justin Farris, Marily Nika, Ankit Shukla, Ankur Goyal, Teresa Torres). If a check has no source, it's dropped.
5. **Distill-and-attribute.** Every framework card is rewritten in our own words with public-source attribution. No verbatim from paywalled material.
6. **Iteration is permanent state.** AI features ship in beta and iterate forever. The coach refuses "we're done" framing.
7. **Work lands in `.agentic-pm/`.** Artifacts accumulate in your project directory; the coach reads them on every invocation. `session.md` is the cross-session running log. No separate context system to maintain.

---

## What's inside

```
agentic-pm/
├── skills/coach-ai-product/  ← the AI product coach (this v0.4 release)
│   ├── SKILL.md              ← the coach (operating principles + arc spine)
│   └── reference/            ← 10 playbooks + the spine reference
│   (future: skills/coach-metrics/, skills/coach-decisions/, etc.)
├── frameworks/               ← distilled, attributed framework cards
│                                (scoped to the AI product arc; more land
│                                 when the next coach ships)
├── docs/                     ← design corpus (optional reading)
├── PLAN.md                   ← v0.4 design narrative + refactor history (local)
└── README.md
```

Session artifacts live in `./.agentic-pm/` inside your project directory (your CWD), not in the plugin. Design narrative, decisions, and refactor history are tracked in `PLAN.md` (local only).

---

## MCP recommendations

Skills hold the workflow recipe; MCPs give the coach actual hands. agentic-pm doesn't bundle any MCPs — your stack is yours — but the coach is meaningfully more capable when these are wired up. Per Pedro Rodrigues / Anthropic: *"Use MCP when the agent needs to call an external service. Use skills when the agent has shell access and needs domain-specific instructions for how to behave. Use both together."*

**High-value MCPs for agentic-pm playbooks:**

| MCP | Unlocks |
|---|---|
| **Eval platform** — [LangSmith](https://docs.smith.langchain.com/), [Braintrust](https://www.braintrust.dev/), [Arize Phoenix](https://phoenix.arize.com/), [Truesight](https://truesight.ai/) | `error-analysis`, `validate-judge`, `iterate-feature`: coach pulls real traces, labels them with you in-session, scores judges, writes pivot tables from production data instead of roleplay. **The single biggest leverage.** |
| **LLM APIs** — OpenAI MCP, Anthropic MCP | `validate-feasibility`: run Prompt-as-MVP against real inputs. `write-rubric`: generate synthetic test data along Features × Scenarios × Personas. |
| **Production data** — Postgres / BigQuery / Snowflake MCP | If your traces and metrics live in your own DB rather than an eval platform. Same role as the eval-platform MCP, different surface. |

**Useful but lower-leverage:**

| MCP | Unlocks |
|---|---|
| **Git/GitHub MCP** | Per Hamel: prompts belong in Git, atomic with code. Coach can commit prompt rewrites + diff against baseline. |
| **Linear / Jira / Notion MCP** | Push the AI PRD or impact review to wherever your team tracks work. |

**How playbooks behave with vs. without MCPs:**

Each playbook's *Locate* step checks for relevant MCPs. If present, the coach uses them directly (pull traces, score outputs, query metrics). If absent, the coach guides you through manual sample preparation — paste representative outputs, label in a spreadsheet, etc. Both paths produce the same artifact; the MCP path is faster and grounded in real data.

If you only add one MCP, add an eval-platform one. The headline demo (`error-analysis`) is dramatically better when the coach can pull traces directly.

---

## How it differs from AI PM OS

[AI PM OS](https://www.prodmgmt.world/products/pm-os) is a 200+ skill workspace. agentic-pm is a 10-playbook coach. Different product shape:

- **PM OS:** broad coverage (strategy, roadmap, stakeholder, meeting, etc.), buffet, you pick the workflow.
- **agentic-pm:** narrow on AI PM (eval, judge, error analysis, AI PRD, iteration). One coach. Walks you.

Both work in Claude Code. Pick whichever shape fits your job. If you're a senior PM whose product ships AI features and you want forcing functions against the eval-shaped failure modes, this is the sharper tool. If you want broad PM coverage and a buffet, AI PM OS.

---

## Status

**v0.4.1.** No formal license — clone for personal use is fine; reuse and redistribution aren't covered. If it sparks an idea for your own work, [reach out](mailto:gibran.makyanie@gmail.com).

## Contact

Gibran Makyanie — [gibran.makyanie@gmail.com](mailto:gibran.makyanie@gmail.com)
