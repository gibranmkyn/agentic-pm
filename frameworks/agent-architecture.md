---
name: Agent Architecture
aliases: [Agent System Design, Effective Agents, Agentic Patterns]
author: Anthropic (Building Effective Agents); OpenAI (Practical Guide to Building Agents); Product Faculty (Six Levers, AI Product Archetypes); Louis-François Bouchard (Autonomy Slider); Thomas Sheridan (10 Levels of Autonomy); Sandipan Bhaumik (Choreography vs Orchestration); Nat Eliason (3-layer memory); Alen Faljic (Instructions/Orchestration/Execution)
source_type: synthesis
source: "Anthropic — Building Effective Agents (2024); OpenAI — Practical Guide to Building Agents (2025); Product Faculty — AI PM Certification (2026); Towards AI — Deep Research Agents workshop (2026); Sheridan (1978) — supervisory control levels; Bhaumik (2026) — distributed systems for multi-agent; Eliason (2026) — OpenClaw memory architecture; Faljic (2026) — Claude Code for Designers"
use_when:
  - Deciding whether a feature needs an agent at all, or a simpler LLM workflow
  - Choosing between single-agent and multi-agent designs
  - Picking an agentic pattern (chain, route, parallel, orchestrator-workers, evaluator-optimizer, autonomous)
  - Configuring the design levers (tools, memory, planning, autonomy, HITL, grounding, guardrails)
  - Staging complexity over time — what to build in v1 vs later
tags: [ai-pm, agents, architecture, system-design]
---

# Agent Architecture

A framework for deciding *what kind of agentic system* to build and *how much autonomy* to give it, from a product perspective. Draws on Anthropic's "Building Effective Agents," OpenAI's practical agents guide, Product Faculty's AI PM canon (Six Levers, AI Product Archetypes, Sheridan's autonomy levels), Louis-François Bouchard's Autonomy Slider, and Sandipan Bhaumik's distributed-systems lens on multi-agent orchestration.

**Core claim:** most production "agent" problems are better solved by composable LLM workflows than by autonomous agents. Autonomy is expensive — in latency, cost, debuggability, and failure modes. Earn it incrementally.

> *"Most people are interested into building agents, but most of these agents that our clients want are actually somewhat super simple workflows."* — Louis-François Bouchard, Towards AI (2026)

---

## Terminology note — two "six levers"

Two frameworks each use the phrase "six levers." Keep them distinct:

- **Product Faculty's Six Levers (AI PM)** — the canonical taxonomy of *how you shape LLM behavior into a product*: **Instructions · Knowledge · Memory · Tools · Reasoning · Post-Training**. Use this as the PM's mental model for what you're building.
- **This framework's Design Levers** — seven configuration knobs for a chosen agent pattern: **Tools · Memory · Planning · Autonomy · HITL · Grounding · Guardrails**. Use these as the implementation dials once the pattern is picked.

The two frameworks compose. Product Faculty's "Reasoning" lever ≈ this framework's "Planning" lever. Product Faculty's "Instructions" lever is the system-prompt component that threads through every design-lever setting. Don't pick one and discard the other — they operate at different altitudes.

---

## The three concentric lenses — one reconciliation table

Three frameworks describe the same agent-system decision at different altitudes. Read across any row.

| Autonomy Slider (Bouchard) | AI Product Archetype (PF) | Anthropic pattern | PF Six Levers actively used |
|---|---|---|---|
| 1 Prompt | Single-Layer | — (no orchestration) | Instructions |
| 2 Prompt + few-shot | Single-Layer | — | Instructions |
| 3 Prompt + external context | Multi-Layer | 1 Augmented LLM | Instructions + Knowledge |
| 4 Workflow (fixed steps) | Multi-Layer | 2 Chain / 3 Route / 4 Parallelize | Instructions + Knowledge + Memory (+ Reasoning if chained) |
| 5 Agent (dynamic branching) | Agentic | 5 Orchestrator-workers (single) / 6 Evaluator-optimizer / 7 Autonomous | All six |
| 6 Multi-agent (delegated contexts) | Agentic | 5 Orchestrator-workers (multi) | All six |

**Use the table like this:**
- **Autonomy Slider** is the *escalation discipline* — start at 1, prove you need to move up.
- **Archetype** is the *PM-facing framing* — what levers you're committing to touch.
- **Pattern** is the *implementation shape* — how the control flow is wired.

The rest of the framework references this table rather than re-deriving the mapping.

---

## Positioning: AI Product Archetypes

Before picking a pattern, name the archetype. From Product Faculty:

| Archetype | Levers in use (PF) | Dominant PM concern |
|---|---|---|
| **Single-Layer** | Instructions only | Prompt consistency; hallucination risk is highest; task narrowness |
| **Multi-Layer** | Instructions + Knowledge + Memory | RAG freshness, retrieval quality, context management |
| **Agentic** | All six | Tool reliability, error propagation, autonomy-vs-oversight, cost/latency |

Single-Layer and Multi-Layer products rarely need an agent in the Anthropic sense. If you're not yet in the Agentic archetype, the honest answer is usually a workflow, not an agent.

---

## The Autonomy Slider (Bouchard) — the escalation discipline

Before "workflow or agent," run the slider. Every step up costs control, latency, and spend. Walk top-down; stop at the first level that works.

```
CONTROL ◄──────────────────────────────────────────► AUTONOMY
COST↓                                                  COST↑
LATENCY↓                                            LATENCY↑

[1]        [2]         [3]           [4]        [5]        [6]
Prompt  → +few-shot → +external  →  Workflow → Agent  → Multi-Agent
                      context       (fixed     (dynamic  (delegated
                      (<200K +      steps)     branching) contexts)
                      RAG)
```

**Each step needs a concrete failure at the step below to justify it:**
- "Output format is wrong" → Level 2 (few-shot).
- "Model lacks the facts" → Level 3 (paste context with [[prompt caching]]) or 4 (RAG).
- "Same steps every run, only inputs vary" → stay at Level 4 (workflow), do not escalate.
- "Steps genuinely vary per input" → Level 5 (agent).
- "Single agent's context >200K, or >20 tools, or genuine sub-task parallelism with context isolation" → Level 6 (multi-agent).

**The most common failure mode:** teams escalate to Level 5 or 6 because it sounds more impressive to stakeholders, investors, or grants. Towards AI's canonical anecdote — a client wanted multi-agent because a grant program rewarded "AI-forward architecture"; Towards AI shipped a single agent with specialist tools instead.

**Real products span the slider.** A production AI product is usually a *tree* of slider decisions, not one level. You might have a Level 5 research agent invoked from a Level 4 writing workflow, with a Level 3 classifier at the entry point.

---

## Step 0 — Workflow or agent?

Before choosing a pattern, decide if you need an agent at all.

| Signal | Workflow (predefined path) | Agent (LLM decides path) |
|---|---|---|
| Task shape | Known steps, known order | Steps and order depend on input |
| Scope | Narrow, well-specified | Open-ended, hard to enumerate |
| Latency tolerance | Seconds | Minutes to hours acceptable |
| Cost tolerance | $ per run matters | $$$ per run acceptable for value |
| Failure cost | High (prefer predictability) | Bounded / reversible |
| Debuggability | Must trace every step | Can tolerate "why did it do that" |

**Rule of thumb:** if a competent engineer could write the control flow as a flowchart, use a workflow. If the control flow *is* the problem, use an agent.

---

## The six patterns (in order of complexity)

Earn the next pattern by hitting the prior one's ceiling. Do not start at pattern 5.

### 1. Augmented LLM (no orchestration)
Single LLM call with tools, retrieval, or memory. No loop, no router. The floor for anything called "AI." If this works, ship it.

**When:** single-turn task, bounded context, no multi-step reasoning needed.
**Example:** "summarize this doc," "classify this ticket," "draft a reply to this email."

### 2. Prompt chaining / pipeline
Fixed sequence of LLM calls, output of step N feeds step N+1. Can include a gate between steps ("if classification != X, stop").

**When:** task decomposes cleanly into ordered sub-tasks; each step improves if handled in isolation.
**Example:** translate → style-match → fact-check; or extract-entities → enrich → format.
**Ceiling:** the steps are stable, but you're spending too many tokens re-threading state, or you need branching.

### 3. Routing
A classifier routes input to one of N specialized handlers. Classifier can be an LLM or a cheaper model.

**When:** inputs fall into distinct categories that benefit from different prompts, models, or tools.
**Example:** customer support intent routing; "simple question → Haiku, complex → Opus."
**Ceiling:** you need multiple handlers for the same input, or the routes themselves need sub-routing.

### 4. Parallelization
Same input fanned out to multiple LLM calls (voting, sectioning, or ensembling), then aggregated.

**Sub-types:**
- **Sectioning** — split input into independent chunks (e.g., per-document, per-section).
- **Voting** — same task, N times, majority/consensus wins. Good for safety-critical classification.
- **Ensembling** — different prompts/models, aggregate for robustness.

**When:** independent subtasks, or you need diverse perspectives on the same task.
**Ceiling:** aggregation logic is itself becoming a judgment call — you need a planner.

### 5. Orchestrator-workers (multi-agent)
A central orchestrator LLM decomposes the task and delegates to worker LLMs (often specialized). Orchestrator synthesizes results.

**When:** the decomposition is not knowable ahead of time — it depends on the input.
**Example:** coding agent that decides which files to edit; research agent that picks which sub-questions to investigate.
**Cost:** 3–15x the token spend of a single agent for the same task. Debug surface explodes.
**Ceiling:** you need the system to self-correct based on outputs, not just decompose.

### 6. Evaluator-optimizer loop
A generator produces output; an evaluator LLM critiques; generator revises. Loops until a quality bar is met or a budget is exhausted.

**When:** clear quality criteria exist, and iteration measurably improves output.
**Example:** literary translation with style critic; code generation with test-runner feedback.
**Ceiling:** this is close to an autonomous agent. The step beyond is removing the fixed loop and letting the agent decide when to evaluate.

### 7. Autonomous agent (the fully agentic system)
LLM operates in an open-ended loop — plans, takes actions via tools, observes results, replans, stops when done. No predefined control flow.

**When:** task is genuinely open-ended (SWE-bench-style); environment provides rich feedback; failure is bounded.
**Prerequisites:** production-grade evals, strong tool descriptions, sandboxing, HITL escape hatches, cost budgets, stop conditions.
**Warning:** this is the most expensive and least debuggable pattern. Most teams who "need an agent" actually need orchestrator-workers with a fixed loop.

---

## Single-agent vs multi-agent

Multi-agent is not a default. It is a specific solution to a specific shape of problem.

**Go multi-agent only when:**
1. **Context isolation matters** — each sub-task has a distinct context window that would collide if merged (research agent reading 50 sources).
2. **Specialization produces measurably better outputs** — a dedicated "code reviewer" agent outperforms a generalist with "now review the code" appended to its prompt.
3. **Parallelism is load-bearing** — sub-tasks genuinely run in parallel and aggregate (not sequential-masquerading-as-parallel).
4. **The orchestrator's decomposition is non-trivial** — if the decomposition is static, it's a workflow, not a multi-agent system.

**Stay single-agent when:**
- One well-scoped domain
- Sequential reasoning with shared context
- Latency matters (multi-agent is slow)
- You have <3 months of production traces — you don't know enough yet to design specialists

**The most common mistake:** framing a single-agent problem as multi-agent because "agents" is the trending word. Ship the single-agent version, hit its ceiling, then split.

---

## Multi-agent topology: flat vs hierarchical

Two shapes for multi-agent systems. Choose deliberately.

| Shape | Description | When to use |
|---|---|---|
| **Flat** | Any agent can message any other; all-to-all | Few agents (<5), peer specialists, loose coordination. Coordination cost grows fast as you add agents. |
| **Hierarchical** | An orchestrator assigns tasks to specialists; specialists communicate upward | Tasks with natural dependencies, a clear single point of user interaction, or enough agents that flat coordination is unwieldy. |

Amazon's production stack is hierarchical (coordinator + domain agents). Jesse Genet's 5-agent home setup is hierarchical (physical partitioning by domain). Paperclip's UI literally renders an org chart (CEO → CMO/UX/CTO). If you can't draw an org chart for your multi-agent system, it's probably not ready.

---

## Choreography vs orchestration (Bhaumik)

Two coordination styles for multi-agent systems, each with distinct failure modes:

**Choreography** (event-driven, decentralized): agents publish events to a message bus; downstream agents subscribe to event types. No central coordinator. Loosely coupled; easy to add agents. *"If you can't trace events through your system, choreography will destroy you."* Requires bulletproof observability.

**Orchestration** (centralized): a workflow orchestrator calls agents directly, manages parallelism, retries, state, logging. Agents are "dumb" — they take input, do work, return output. Strength: single observability dashboard, clear audit trail, explicit rollback path. *"In financial services we use orchestration almost exclusively. When something goes wrong with a credit decision, we need to know exactly which agent made that call, in what order, and with what data."*

**Decision matrix:**

| | Low autonomy needed | High autonomy needed |
|---|---|---|
| **Simple workflow** | Either | Choreography |
| **Complex workflow** | Orchestration | Hybrid (choreography + saga compensation) |

**Common failure mode:** teams pick choreography because "it feels more agentic," then spend months firefighting distributed event flows they can't debug. Default to orchestration in regulated or high-stakes domains.

**Four distributed-systems patterns that transfer from service architectures:**
1. **Immutable state snapshots with versioning** — never mutate; append new rows with a versioned key. Agent A produces StateV1 (frozen), stored append-only; Agent B validates schema, produces StateV2 as a new row. Rollback is trivial; every agent's input is reproducible.
2. **Data contracts at agent boundaries** — explicit schemas for agent inputs/outputs. Validate contracts *before* calling the agent. Enforce quality thresholds (e.g., reject handoff if confidence < 0.7). Version and govern contracts centrally.
3. **Circuit breaker** — track failure count per downstream agent; past threshold, open the circuit (stop calling). Half-open test after timeout; success closes, failure reopens. Graceful degradation: skip agent, use cache, alert human — don't cascade failure.
4. **Saga compensation (distributed rollback)** — every agent operation has `execute()` and `compensate()`. Orchestrator tracks executed agents; on failure at step N, walk backward running compensations. No partial transactions, no stuck workflows.

**Coordination complexity is exponential, not linear.** 5 agents ≈ 25× the complexity of 1 agent (10 potential connections, each a race condition or failure point). Production case Bhaumik cites: a cache invalidation failure between a credit-score agent and a risk-assessment agent produced 20% incorrect risk ratings; 2 days to diagnose.

---

## Three-layer production architecture (Merge / Anish)

Regardless of pattern, production agents need three layers. Teams ship the first, ignore the third, and fail enterprise review.

1. **Model layer** — the LLM running core logic. Everyone gets this right.
2. **Integrations layer** — data access and tool access to systems customers actually live in. Where MCP-vs-sync-data trade-offs live.
3. **Control layer** — permissions, governance, observability, audit trails. *"The control layer is the one that gets built last and breaks first."*

No control layer = failing enterprise security reviews and compliance. Budget it from v1, not v3.

---

## Three-layer memory architecture (Eliason / OpenClaw)

When memory is more than session scratchpad, flat files fail. Use three distinct memory types:

| Layer | Role | Analog |
|---|---|---|
| **Episodic** | What happened today, what was decided, what was done | Daily journal / working memory |
| **Semantic** | Distilled facts, preferences, recurring patterns extracted from episodic | Knowledge base / personal wiki |
| **Strategic** | High-level goals, constraints, principles; the agent's "constitution" | CLAUDE.md / system prompt that evolves |

A **nightly consolidation job** reviews episodic notes, extracts durable facts into semantic, proposes strategic updates, and compresses episodic to save context. Without consolidation, episodic becomes noise; with it, insight accumulates into signal.

> **Bottleneck-removal heuristic:** for any decision the agent asks you to make, ask *"Is there a way I can make it so you never have to ask me this again?"* The answer becomes an update to semantic or strategic memory. The agent gets more autonomous with each resolved question.

For long-running single-agent runs (hours of autonomous code gen), a simpler pattern works: a JSON progress file + a high-level docs file is enough for a future session to resume. JSON resists model overwrites better than markdown.

---

## AI vs script — Faljic's three-layer architecture

Within any agent or workflow, decide per-step whether to use AI logic or a deterministic script.

```
Instructions (human)  →  Orchestration (AI)  →  [ AI logic | Script ]
```

**Why it matters:** chained probabilistic steps compound unreliability. 95%^5 ≈ 77% end-to-end. Replacing probabilistic steps with deterministic scripts wherever possible raises this back to 90–95%+.

| Use AI logic when | Use scripts when |
|---|---|
| Judgment required (on-brand? fuzzy match?) | Exact naming conventions (SKU-based file renaming) |
| Pattern recognition (themes in reviews) | Exact pixel dimensions |
| Creative output (alt text, descriptions) | Defined API calls |
| Confidence-threshold routing (>90% → proceed, else flag) | Anything where variance is a defect |

**Rule of thumb:** never make AI responsible for things where variance is unacceptable. Build a script once, test once, know it works.

This compounds with Anthropic's 7 patterns: their patterns describe orchestration topology; Faljic's architecture prescribes — when you reach an execution step — *choose AI or script deliberately*.

---

## Context engineering — the underlying discipline

> *"Context engineering is the delicate art and science of filling the context window with just the right information for the next step."* — Andrej Karpathy

Pattern choice and lever choice both assume you've thought about **what information the agent sees at each step**. If prompt engineering is the instruction sheet, context engineering is the entire world the model sees. Most "the model is dumb" complaints are actually "the context is bad." Treat the context window as a scarce, degrading resource (a **context budget**), not a fixed capacity.

**Six layers of context** (Miqdad Jaffer / Aakash Gupta):
1. User identity and role
2. Historical behavior and session context
3. Relevant documents/knowledge (RAG)
4. Business rules and constraints
5. Relationships and entities in the workspace
6. Real-time signals (what just happened)

**What eats the budget:** system prompt, tool definitions (20+ tools adds up fast), few-shot examples, retrieved context, conversation history, tool-call outputs (web scrapes are especially heavy), thinking traces.

**Budget management techniques** (walk from cheapest to most invasive):
1. **Trim** raw content — cut boilerplate, duplicate text, irrelevant HTML.
2. **Summarize** long tool outputs before returning to the agent.
3. **Criterion-based retrieval** — return only the parts of RAG hits relevant to the query.
4. **Compaction** — periodic rewrite of conversation history into a condensed form; lossy, so pair with structured writes to disk.
5. **Delegation to tools** with their own internal context handling.
6. **Delegation to sub-agents** (multi-agent) — each runs in its own context window, returns a digest. The largest budget-freeing move.
7. **Progressive skill disclosure** — load only skill name + one-line description by default; full skill body loads on demand and is wiped after use.

Context engineering is a PM skill. Engineers tune the model; only PMs understand the full user context well enough to specify *what information should be included and why*.

---

## The harness

A **harness** is the software layer wrapping the LLM that manages context, state, role separation, tool access, and restart logic. It is not the model; it is the system around the model. The harness evolves as models improve — some components (aggressive compaction triggers, explicit sprint decomposition) become unnecessary; others (true multi-agent orchestration, hours-long sessions) become possible.

Key harness components for long-running or agentic systems:
- **Filesystem as shared state** — JSON and markdown files on disk as the coordination medium between sessions and agents. Explicit writes > compaction-based continuity (compaction ≠ coherence).
- **Structured handoffs** — when transitioning between sessions or sub-agents, explicit state transfer > implicit carryover.
- **Role separation** — generator/evaluator split to defeat sycophantic self-evaluation.
- **Progressive skill disclosure** — see above.
- **Restart willingness** — the harness must make throwing everything away and starting over cheap. Long-running agents that can't restart cleanly accumulate invisible debt.

"Harness engineering = context + constraints that shape agent output" (Lopopolo, OpenAI). Code is free; the scarce resource is human time and attention. The harness is where a PM's product judgment shapes what the agent can become.

---

## The design levers

Independent of pattern, configure these six levers. Each lever increases capability *and* risk.

### 1. Tools
What the agent can *do* in the world. Read APIs, write to DBs, send emails, run code.

- **Default:** start read-only. Write access is a one-way door.
- **Naming and descriptions are the product.** Bad tool descriptions are the #1 cause of agent failure. Treat them as prompt engineering, not API docs.
- **Error messages are tool outputs.** Design them for the LLM, not for humans.
- **The agent permission stack** (analogous to OAuth scopes): for each tool, name *what the agent can do* (send email, purchase, modify code, delete data) and *what it can share* (with other agents, with third parties). Minimum privilege. Revoke access when not needed. Each tool is a permission scope review, not an engineering decision.
- **MCP vs. sync-data access patterns** (Merge / Anish): for data access, match pattern to use case. **MCP / live calls** suit single low-latency actions ("update this ticket right now"). **Sync data** (normalized, pre-pulled) suits analysis across many records ("patterns across 400 tickets"). Picking wrong produces agents that are "consistently wrong in ways that are hard to diagnose."

### 2. Memory
What persists across turns or sessions.

- **None** — every turn is fresh. Simplest, often sufficient.
- **Short-term (session)** — conversation history, scratchpad.
- **Long-term (cross-session)** — user-specific facts persisting across sessions. Privacy + staleness concerns apply.
- **Shared knowledge** — RAG; not true memory but often confused with it.
- **Three-layer (Eliason)** — episodic / semantic / strategic with a nightly consolidation job. Required when the agent is long-running and compounds learning over time.

**Default:** start with none. Add session memory when you measurably lose quality without it. Go to three-layer only when the agent is meant to compound judgment over weeks — premature three-layer memory is a common source of complexity without value.

### 3. Planning
Does the agent plan before acting?

- **No plan** — react to each step (ReAct-style).
- **Plan-then-act** — generate plan, execute it, optionally replan.
- **Plan-critique-act** — generate plan, internal critique, revise, execute.

**Default:** no explicit planning for tasks under ~5 steps. Add plan-then-act when you see the agent losing the thread mid-task.

### 4. Autonomy level (Sheridan 1978 — canonical 10 levels)

The industry shorthand of "L1–L5 autonomy" collapses [[Sheridan Levels of Autonomy]]'s 10-level model. Use Sheridan numbers when precision matters; use the bands below when communicating with stakeholders.

| Sheridan | Who decides / acts | Band |
|---|---|---|
| 1 | Human does everything | Assistance |
| 2 | Computer offers a complete set of action alternatives | Assistance |
| 3 | Computer narrows to a few choices | Assistance |
| 4 | Computer suggests a single action | Assistance |
| 5 | Computer executes suggestion if human approves | **Hand-off boundary** |
| 6 | Computer executes after a restricted veto window | Automation |
| 7 | Computer executes automatically, then informs human | Automation |
| 8 | Computer executes automatically, informs only if asked | Automation |
| 9 | Computer executes automatically, informs only if it decides to | Automation |
| 10 | Computer decides and acts, ignoring human | Automation |

**Product calibration:**
- **High-stakes / regulated (medicine, law, finance, irreversible external effects):** stay at levels 2–5. Human verifies before action.
- **Low-stakes / reversible:** levels 6–8 are acceptable; human can override but doesn't have to approve each action.
- **Fully delegable / narrowly bounded:** levels 9–10 appropriate only once trust is established by evidence (production evals + incident history).

**Default for a new agent:** level 4–5 (suggest, human approves). Move up one Sheridan level per quarter at most, each move gated by eval pass rates on the specific path being automated. Features can progress along the slider post-launch as trust builds and failure rates drop — this is a product strategy decision, not just a technical one.

### 5. Human-in-the-loop (HITL)
Distinct from autonomy — autonomy is *how much* latitude, HITL is *where* the human intercepts. Amazon's production 5-pattern taxonomy:

| Pattern | Trigger | Use case |
|---|---|---|
| **Full approval** | Every action | High-stakes decisions, regulatory requirements |
| **Post review** | After execution | Low-stakes decisions; produces learning signal |
| **Collaborative** | Complex/subjective tasks | Real-time human+agent pair working |
| **Escalation** | Uncertainty / confidence threshold | Most production systems — graceful degradation |
| **Oversight** | Critical infrastructure | Human monitors in real time, can intervene |

**Three design requirements** for effective HITL (regardless of pattern):
1. Humans must be aware of system limitations — they can't apply judgment if they don't know where the AI fails.
2. Humans must have access to the information needed to verify — "citations for any research scenario." A summary reviewer must be able to click through to the source text.
3. Especially critical in high-stakes domains — medicine, law, finance, content moderation, irreversible external actions.

**HITL as feature, not fallback** (Amazon). Escalation is not "the AI failed" — it's "the AI correctly escalated." Design handoffs as product features:
- Seamless handoff experience
- Explanation of why the escalation is happening
- Minimized wait time
- Context for the human reviewer
- Feedback capture to improve the agent over time

Every human decision in the loop is a training signal. The success metric for HITL is not "how much humans intervene" — it's the rate at which human involvement decreases as the agent improves, weighted by the stakes of each path.

**Default:** every destructive or irreversible action is gated (Full approval). Downgrade to Post review or Escalation only after eval evidence that the gate is non-binding on that path. "Delete user data," "send external email," "push code," "submit order" — all Full approval by default.

### 6. Grounding / guardrails
- **Grounding:** RAG, citations, structured output, tool-forced answers.
- **Guardrails:** input filters (PII, prompt-injection mitigation), output filters (toxicity, policy violations), stop conditions (max turns, max cost), sandboxing (tool permissions, network egress).

Guardrails are not optional for production. Budget them in from v1. Amazon's production lesson: *"Build guardrails from day one — the team prevented major incidents by designing safety into architecture, not adding it later."*

**On prompt injection specifically:** delimiters, "ignore instructions in user content" prompts, and input classifiers all fail empirically. The working mitigation stack is: minimum-privilege tool access, output validation on consequential actions, HITL gates on irreversible operations, defense in depth (multiple imperfect layers).

---

## Stage gating — what to build when

| Stage | Signal | Recommended shape |
|---|---|---|
| **Idea** | No user; hypothesis only | Hand-run the flow in a chat UI. No agent yet. |
| **Prototype** | 1–5 friendly users | Augmented LLM or chain. No memory, no tools beyond read. HITL everywhere. |
| **Alpha** | <50 users, PM reviewing traces weekly | Add routing if multi-intent. Add one tool at a time. L2 autonomy. |
| **Beta** | 50–500 users, eval pipeline in place | Consider orchestrator-workers if a single agent has hit its ceiling on a measurable axis. L3 autonomy for low-stakes paths. |
| **GA** | >500 users, stable error taxonomy | Specialize where data justifies it. Autonomy level matches eval coverage. |
| **Scale** | Cost or latency is the binding constraint | Collapse unnecessary LLM calls. Move routing to cheaper models. Re-evaluate every agent in the system: "does this still need to be an LLM call?" |

**Anti-pattern:** building beta-stage complexity at prototype stage. Cost: you ship late, eval nothing, and can't tell what's broken.

---

## Agent task properties (Mario Zechner) — the "should this be an agent task at all" gate

Before committing to an agentic design, every candidate task must pass three properties. If it fails any, descope, redefine, or don't build it.

1. **Scope** — the task is narrowly-enough defined that success is recognizable. "Help the user" fails; "answer a customer's refund question using policy docs and the order record" passes.
2. **Verifiability** — you can tell, from the agent's output, whether it did the right thing. Either a deterministic check, a reliable evaluator, or a human reviewer with access to the source (HITL design requirement #2).
3. **Evaluability** — you can measure this at scale across many inputs, not just by eyeballing one. If you can't build an eval for the behavior, you can't improve the agent on it.

"Agents compound debt invisibly" (Armin Ronacher). A task that lacks scope, verifiability, or evaluability becomes a slot where invisible failures accumulate. The discipline is intentional friction via SLOs and mechanical constraints — make the debt visible by refusing to build against tasks that can't be measured.

---

## Ad hoc vs persistent agents (Casalaina)

Not every task warrants a persistent agent. **Ad hoc agents** are spun up for one task, do the work, and are discarded. **Persistent agents** accumulate memory and identity over time, with ongoing maintenance cost.

| | Ad hoc | Persistent |
|---|---|---|
| Lifespan | Minutes to hours | Days to forever |
| Memory | None or session-only | Three-layer, with consolidation |
| Cost to maintain | Zero — it disappears | Memory drift, stale knowledge, permission creep |
| When to use | Most tasks | Tasks where the agent's learning *is* the product |

Default to ad hoc. Choose persistent only when memory compounding materially changes the output quality over weeks — not because "personal AI assistant" sounds better in a pitch deck.

---

## Agent-specific evaluation (vs. standard LLM evals)

Agent evals are harder than model evals because the agent's *path* matters, not just its output:

- **Trajectory evals vs. unit-test evals.** Unit-test evals check the final output. Trajectory evals check intermediate steps: the right tools called in the right order with the right arguments. A correct answer via the wrong path is a bug in production.
- **Tool-use confusion matrix.** Did the agent call the right tool? Did it call the wrong one? Did it skip a tool it should have called? Separate dimensions, separate fixes.
- **Deterministic assertions over LLM-judge** where possible. `assert output contains "security_invoker"` beats "ask a judge if the output is secure." Judges are subject to criteria drift.
- **Two-condition eval** for skills or tool additions: run with and without; if both produce the same result, the component had no effect.
- **Golden dataset + train/val split.** The prompt optimizer (or the PM doing prompt iteration) must not see the validation set used for scoring.
- **Implicit feedback > thumbs up/down.** Reformulation rate, dwell time, "no, X" follow-ups — more reliable than explicit ratings. Google's original quality proxies.
- **The proxy eval problem.** Some outcomes are delayed (health advice, career guidance). Choose a proxy deliberately; the choice is a product judgment call.

For full treatment see the `eval-plan` skill and the `Agent Evals` wiki note. For this skill: the architecture doc must name the agent-specific eval hook, not just "we have evals."

---

## The "do you actually need this" checklist

Before designing a new agent, answer all of these:

- [ ] Can a workflow solve this? (If yes, use a workflow.)
- [ ] What's the single clearest task the agent does? (If you can't state it in one sentence, split or descope.)
- [ ] What's the agent's stop condition? (Missing stop conditions = runaway cost.)
- [ ] What's the eval? (No eval = no agent. Ship the eval first.)
- [ ] What's the worst thing the agent can do? (If irreversible, HITL it.)
- [ ] What's the budget per run? (Agents without budgets are incidents waiting to happen.)
- [ ] What's the fallback when the agent fails? (Silent failure is the worst failure.)

If any of these don't have a crisp answer, the design is not ready.

---

## Failure modes to design against

### Control-flow failures
1. **Infinite loops** — no stop condition, or stop condition depends on the agent's own judgment.
2. **Cost blowup** — recursive delegation, retries, or long contexts; no per-run budget.
3. **Authority creep** — agent's tool surface grows over time; each tool is a new attack surface.

### Context failures (named concepts from the long-running-agents literature)
4. **Context finitude** — context windows are finite; starting a new session = amnesia. Agents need explicit external memory to bridge sessions.
5. **Context rot** — as a session deepens, coherence degrades. Later context displaces earlier context; the model's working state drifts from original intent. Compaction does not reliably prevent this — lossy summaries drift. Measured performance decay typically starts around 200K tokens, well before advertised limits (1M+).
6. **Context anxiety** — agents approaching the end of their context window exhibit rushed, lower-quality behavior. Distinct from rot; it's anticipatory, not accumulated.
7. **Sycophantic self-evaluation** — a generator that serves as its own evaluator will label its own work "done" when it's broken. Forces a generator/evaluator separation for anything that matters.

### Tool and quality failures
8. **Tool hallucination** — agent invents tools or arguments; usually caused by ambiguous tool descriptions. Tool descriptions are prompt engineering, not API docs.
9. **"Amnesiac with permissions"** (Ioana Ghita) — the agent has no memory of prior runs but full production access. Dangerous combination; the fix is either to add memory or to remove permissions until memory exists.
10. **Invisible failures** — agents produce plausible-looking output on inputs they silently mishandle; the "architecturally ready, behaviorally unvalidated" gray zone between dev and prod.
11. **Eval blindness** — agent works in demos, fails on diverse inputs; no real eval in place.
12. **The "demo agent"** — works on the founder's happy path, untested on real user traces.

### Security failures
13. **Indirect prompt injection** — malicious instructions embedded in content the agent retrieves (a web page, email, document, tool response). The primary attack vector for agentic systems. *Prompt injection is not solvable, only mitigatable* (Schulhoff) — the attack surface is infinite natural language. Defenses that sound intuitive (delimiters, "ignore instructions in user content," input classifiers) all fail at HackAPrompt. What actually helps: **minimum privilege on tools, output validation before execution, HITL on consequential actions, defense in depth.**
14. **Poisoned context windows** — false or manipulative information injected into the agent's memory or retrieved context, altering its behavior on subsequent turns.
15. **Malicious MCP / tool endpoints** — tools that appear legitimate but route actions to attacker-controlled endpoints. Treat the tool surface as an OAuth permission scope review, not an engineering decision.

### Failure-mode framing
**"Agent injection : agentic era :: phishing : email era"** (Palo Alto Networks). The stakes are higher than phishing because the target is a system with direct write access to inboxes, repos, databases, and money.

---

## Decision algorithm (collapse to this if in a hurry)

0. **Zechner gate.** Does the task have scope, verifiability, evaluability? If any is no, descope or don't build.
1. **Autonomy Slider, top-down.** Start at Level 1 (prompt). Only escalate if the step below has a concrete failure. Most "agents" are actually Level 4 (workflow).
2. **Workflow or agent?** Flowchart-able → workflow → pick from patterns 1–4. Control flow *is* the problem → agent → continue.
3. **Single vs multi-agent.** Single domain, sequential, shared context, <200K tokens, <20 tools → single agent (pattern 5 with one worker, or a fixed loop). Multiple domains, independent sub-tasks, context >200K or >20 tools, context-isolation load-bearing → multi-agent (pattern 5).
4. **Multi-agent shape.** Default hierarchical topology + orchestration coordination. Choreography only with bulletproof tracing.
5. **Evaluator-optimizer (pattern 6)** if clear criteria and iteration helps.
6. **Autonomous (pattern 7)** only if open-ended, bounded failure, rich feedback, production evals in place, stage ≥ beta.
7. **Defaults to bake in:** Sheridan 4–5 autonomy; memory = none; tools = read-only; HITL = Full approval on every destructive action; ad-hoc lifecycle; eval hook specified; control layer named; context budget pruning plan if approaching 200K.

---

## Handoffs

- **Eval plan** — no agent ships without an eval. Pair every architecture decision with a corresponding eval hook.
- **PRD** — architecture decisions become constraints in the PRD's non-functional requirements.
- **AI prototyping** — use divergent prototyping to test 2–3 architecture variants before committing.
