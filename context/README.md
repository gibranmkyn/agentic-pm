# Context system

Every `agentic-pm` skill reads these five files before doing anything. They provide the shared ground truth — your company, goals, team, products, and constraints — so each skill produces output that fits your actual situation rather than a generic template.

## Files

| File | What it holds |
|---|---|
| `COMPANY.md` | What you do, who you serve, business model, stage, recent shifts |
| `GOALS.md` | Company-level goal, team cycle metric, leading indicators, guardrails |
| `TEAM.md` | Roles, capacity, strengths, gaps, domain experts for AI features |
| `PRODUCTS.md` | What you ship, primary surface, AI surfaces, architecture notes |
| `CONSTRAINTS.md` | Regulatory, technical, organizational, budget/timing limits |

## How to populate them

Run `/agentic-pm:start` — it walks you through a short Q&A and writes the files for you.

If you prefer to edit manually, open the file you want to update and replace the placeholder lines with your answers. Angle brackets (`< >`) mark what to replace.

## How skills use context

Every skill opens these files before the first response. If a file is still the default template (contains `<` placeholders), the skill will stop and ask you to run `/agentic-pm:start` first. A skill's output is only as good as the context you've given it.

## Refreshing context

Context goes stale. Re-run `/agentic-pm:start` (or edit files directly) when:
- Your team's goal metric changes
- You launch a new product or surface
- There's a significant org or regulatory shift

Skills don't cache context between sessions — they read live from these files every time.
