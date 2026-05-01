---
name: validate-feasibility
description: Use this playbook when validating an AI feature idea — running Prompt-as-MVP on real inputs before any product spec, and risk-ranking assumptions across the four product risk types. Loaded by the coach skill, not invoked directly.
---

# Validate Feasibility

For AI features, feasibility is the first gate — not value, not usability. Test whether the intelligence can do the task on real inputs before writing a spec. Prompt-as-MVP on 20–50 real inputs is the default first move. Everything else waits.

---

## Locate

Before walking the playbook, ask the PM:

1. What is the AI feature, and what specifically should the model do? (Be precise: not "summarize meetings" — "given a 45-minute meeting transcript, produce a 3-bullet summary of decisions made and action items assigned.")
2. Do you have 20–50 real inputs from production or near-production users? Synthetic examples give false confidence — the feature must be tested on real data.
3. Have you already run any prompt experiments? If so, bring the failure examples — they're the input to the assumption map.

**MCP awareness:** If an LLM API MCP is configured (OpenAI, Anthropic, or similar), use it directly to run Prompt-as-MVP on 20–50 real inputs in-session — capture pass/fail per input, surface failure patterns immediately. If no LLM MCP is available, guide the PM through running the prompt manually (their own playground, local script) and pasting results back. The binary pass/fail criterion is the same either way.

---

## Feasibility-First Inversion: the default for AI features

**Traditional PM:** validate value first (will users want this?), then usability, then feasibility.

**AI PM:** validate feasibility first (can the intelligence actually do this?). The Four Product Risks still apply — but for AI features, feasibility is the riskiest assumption in almost every case until proven otherwise.

Why the inversion: AI feasibility cannot be assumed or designed around. A beautifully designed feature that the model can't do reliably is a beautiful design for zero users. The fastest way to waste 3 months is to write a PRD for an AI feature before checking if it works on 30 real inputs.

**If the PM hasn't run Prompt-as-MVP yet, that is Step 1. Always.**

---

## Prompt-as-MVP

The cheapest AI feasibility test:

1. Write a minimal prompt for the feature (1–3 sentences of instruction).
2. Run it against 20–50 **real inputs** — not synthetic, not "representative examples" you wrote yourself.
3. Score each output **binary pass/fail** — not a 1–5 quality rating. Pass = this is good enough to ship in beta. Fail = this is not.
4. Tally the pass rate. A rough threshold: <50% pass rate on 20–50 inputs signals you need to understand the failure modes before going further; ≥70% is a reasonable baseline to proceed with a spec.

What to do with the failures: they are your first error analysis input. Do not discard them — they seed the assumption map and, eventually, the error journal.

**If the PM declines Prompt-as-MVP:** tag `feasibility-unverified` and note prominently. It is the most expensive assumption to validate late.

---

## Four Product Risks + Riskiest Hypothesis Sequencing

After Prompt-as-MVP, enumerate assumptions across all four risk types (Cagan):

| Risk type | Question | AI-specific note |
|---|---|---|
| **Value** | Will users actually use this if it works? | Watch for novelty adoption masking true PMF |
| **Usability** | Can users figure out how to use it effectively? | Non-determinism requires explicit expectation design |
| **Feasibility** | Can the intelligence do this reliably enough? | Prompt-as-MVP is the primary validation technique |
| **Business viability** | Does this work for the business? | Consider inference cost, latency, and legal/compliance |

Risk-rank each assumption: conviction (how confident are we?) × impact-if-wrong (how much would it hurt?). Sequence validations by riskiest first — not by ease of testing.

---

## Validation technique matrix

| Risk type | Techniques |
|---|---|
| Value | Customer interviews, smoke test, pre-sales, concierge MVP |
| Usability | Prototype tests, usability testing |
| Feasibility — AI | Prompt-as-MVP (20–50 real inputs, binary pass/fail) |
| Feasibility — deterministic | Technical spike, architecture assessment |
| Business model / cost | Inference cost modeling, pricing experiments |
| Cross-cutting | Pre-mortem, Wizard-of-Oz, war-gaming |

Do not default to "build a prototype" for all risk types. Match the validation technique to the risk type.

---

## Step-by-step

### Step 1 — Prompt-as-MVP (always first for AI features)

Specify the task precisely. Run on 20–50 real inputs. Score binary pass/fail. Document the failures. Report the pass rate.

### Step 2 — Enumerate assumptions by risk type

For the Four Product Risks spine: at least 1–2 assumptions per type. Surface the assumption the PM is *least* likely to test — the one they most believe is settled.

### Step 3 — Risk-rank by conviction × impact-if-wrong

Generate a ranked list. The top assumption is the one that would kill the feature if wrong.

Ask: "What would make you abandon this feature entirely? Name a specific finding." Tests whether the PM has a real kill criterion. If nothing could make them walk away, the assumption map is a compliance exercise.

### Step 4 — Match validation techniques to risk types

Do not default to MVP for all risk types. Write a falsifiable success signal per top assumption — quantitative or qualitative, both acceptable if falsifiable.

### Step 5 — Produce the assumption map and validation plan

Document:
- Assumption map: assumptions grouped by risk type, ranked by priority
- Validation plan: validation technique per top assumption, success signal, timeline

### Step 6 — Self-validate

Before presenting artifacts, run the quality bar checks.

---

## Quality bar

- [ ] Prompt-as-MVP on ≥20 real inputs before spec work — *Feasibility-First Inversion: "feasibility is the first gate for AI features"*
- [ ] Binary pass/fail scoring on Prompt-as-MVP outputs — *Feasibility-First Inversion*
- [ ] AI features: feasibility risk explicitly addressed before value risk — *Feasibility-First Inversion*
- [ ] Each top assumption has a falsifiable success signal — *Riskiest Hypothesis Sequencing*
- [ ] Validation technique matched to risk type (not default MVP for everything) — *Riskiest Hypothesis Sequencing: "different hypothesis types require different validation techniques"*
- [ ] Four Product Risks: ≥1 assumption per risk type — *Four Product Risks (Cagan)*
- [ ] Kill criterion named (what specific finding would stop the feature) — *Riskiest Hypothesis Sequencing*

---

## Tag propagation

- Feasibility-first recommendation declined (AI feature) → `feasibility-unverified`
- Validation plan skipped for top-risk assumptions → `validation-deferred`
- Prototype built without a named kill criterion → `kill-criteria-absent`
- AI prototype tested on synthetic inputs only → `feasibility-untested`

---

## Output

- `.agentic-pm/validation/<feature>-assumption-map.md` — assumptions by risk type, ranked
- `.agentic-pm/validation/<feature>-validation-plan.md` — validation technique per top assumption, success signal, timeline

Prompt-as-MVP failures are also saved as the initial input to `.agentic-pm/evals/<feature>-error-journal.md` if a journal doesn't yet exist.

---

## End every session with

- The single riskiest assumption and the specific validation that will resolve it in the next 2 weeks.
- If Prompt-as-MVP hasn't been run: "Run Prompt-as-MVP before writing any more spec — 20 real inputs, 30 minutes, could save months."

---

## Handoffs

- **Comes from:** `discover-ai-feature.md` (feature idea is validated here before being specced).
- **Leads to (offer, not auto-chain):** `compile-ai-prd.md` — assumption map feeds the risks section; `write-rubric.md` — Prompt-as-MVP failures are the first real outputs to vibe-check.
