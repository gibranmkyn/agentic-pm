---
name: discover-ai-feature
description: Use this playbook when the PM has an outcome (or a vague "we should add AI") and needs to discover whether AI fits, where it fits, and what specific feature to scope. Loaded by the coach skill, not invoked directly.
---

# Discover-AI-Feature — From workflow to AI-feature problem statement

## Use case

This playbook is for the PM who has an outcome to hit (or a manager-mandated "do AI") and doesn't yet know what specific feature to build. The job is to anchor on a real workflow, talk to expert users, decide whether AI is even the right tool, pick an integration pattern, and frame the problem in eval-shaped form before any prototype gets built.

This is the entry point of the AI product arc. It pairs Justin Farris's workflow-first stance with Product Faculty's 4D Discovery, the AI Product Archetypes check, and the Discovery-to-Eval handoff.

---

## Locate

Before walking the playbook, ask the PM:

1. **"Where is this coming from? Is there a specific manual workflow that's painful, or is the brief 'add AI to our product'?"** — this distinguishes a real opportunity from a top-down AI mandate. Both are workable; the playbook treats the second more skeptically.
2. **"Have you watched anyone do this work end-to-end recently? When?"** — if they haven't, observation is the unblock and the rest of the playbook is premature.
3. **"Who is the expert user — the person who can tell whether an AI-generated answer is correct?"** — name them. If the PM can't, that's the next task: find them. (Per Farris, expert-user access is a precondition for AI discovery.)

If the PM names a workflow, has watched someone do it recently, and has an expert user accessible — proceed. Otherwise the next concrete action is fieldwork, not framework-walking.

---

## Spine

One spine, no autoselect: 4D Phase 1 (UX Mapping: Persona → Stages → Activities → Pain Points → Prioritize), threaded with Farris's three integration patterns (inline / sidecar / predictive) and the Archetype check. JTBD switch-stories appear inline when the PM has interview transcripts.

---

## Sub-steps

### 1. Anchor on the workflow, not the AI capability

Ask: **"Walk me through the manual workflow this is meant to replace or accelerate. Step by step. What does the user do today, in what order, with what tools?"**

Push for: a concrete, observed sequence. Not "users want X." A walkthrough of real activity.

Flag if missing:
- The PM describes a *capability* ("we want a chatbot that...") instead of a workflow.
- The workflow is hypothetical — no one has actually been observed doing it.
- The pain is asserted but not named — "it's slow," "it's annoying," with no specific moment.

If any of these surface, stop and name the gap. **The fix is observation, not more whiteboarding.** Per Farris: "Find the painful process, understand it deeply, then layer AI on top. Don't abstract it away."

### 2. Identify the expert user

Ask: **"Who's the person who can tell whether an AI suggestion is *good* — not just whether it looks fluent? Have you talked to them?"**

Push for: a named human, ideally interviewed. A senior practitioner of the workflow — not a manager describing it secondhand, not a non-expert user who can't validate output quality.

Flag if missing:
- The PM names a "user" who is actually a buyer or a manager.
- The PM is using their own intuition as the quality voice.
- No expert user has been interviewed yet.

The expert user is who will eventually serve as the benevolent dictator on quality (per Hamel). Discovery without one means the eval set will be junk later.

### 3. UX-map the workflow (4D Phase 1)

Walk the PM through the 5-step UX map. Make them produce, not summarize:

1. **Persona** — who specifically? Role + context + skill level + concrete behaviors. Not a marketing archetype.
2. **Stages** — what are the major stages of this workflow, start to end?
3. **Activities** — what specific activities happen in each stage? (Verbs, not nouns.)
4. **Pain Points** — at which activity does friction live? Name the moments, with quotes if available.
5. **Prioritize** — which pain point, if removed, would change the user's relationship to this workflow?

Ask at each layer: **"What's the evidence for this? Interview, observation, or hypothesis?"** Tag hypotheses; they're the riskiest assumptions for later validation.

Flag if missing:
- The persona is one paragraph of marketing prose. (Won't survive the Discovery-to-Eval handoff.)
- The stages are abstract ("planning, execution, review") instead of workflow-specific.
- All pain points are claimed equally important. No prioritization = no signal.

### 4. Archetype check — is this even an AI problem?

Ask: **"Why does this need AI? What capability is AI giving you that a deterministic system or a better UI couldn't?"**

Push for an honest answer. Three failure modes to call out:
- **Chatbot fatigue territory.** "Add a chat interface to our product" with no specific job. Push back: "Where does the chat actually outperform a search box or a form?"
- **AI sprinkled on top.** A predictive feature where rules would be cheaper and more reliable. Ask: "What's the rule-based version, and why is it insufficient?"
- **Capability ceiling not changed.** AI is being used to do something users could already do faster themselves. Ask: "What does AI enable that was previously impossible or impractically expensive?" (Per Farris.)

If the answer holds, name the archetype: **Single-Layer** (instructions only — narrow tasks, prompt engineering dominates), **Multi-Layer** (instructions + knowledge + memory — RAG, domain-specific), or **Agentic** (all six levers — multi-step, tool use, autonomy concerns). The archetype determines downstream PM concerns, not just engineering choices.

If the AI answer doesn't hold — say so. Recommend the PM scope a non-AI feature instead. This is a valid playbook outcome.

### 5. Pick the integration pattern

Three patterns from Farris. Ask the PM to choose one and defend the choice:

- **Inline** — AI assists *within* the existing workflow (autocomplete, in-form suggestions, summarization in place). User doesn't switch context. Best when the AI augments an active task.
- **Sidecar** — AI runs alongside (chat panel, contextual assistant, sidebar). User can ignore it. Best when the AI is supplementary, not load-bearing.
- **Predictive / what-if** — AI simulates outcomes ("what would happen if we changed X?"). User explicitly invokes it for foresight.

Ask: **"Which fits the workflow you mapped? What does the user do with the AI output once they have it — accept it, edit it, ignore it, act on it?"**

Push for: a defensible choice grounded in the UX map. If the PM says "all three" — that's a sign they haven't picked yet. Pick the one that maps to the prioritized pain point in step 3.

### 6. Frame in Six Levers terms

Ask: **"Which of the Six Levers is this feature primarily pulling? Instructions, Knowledge, Memory, Tools, Reasoning, or Post-Training?"**

Why this matters: the lever determines what the team will actually need to build, and what the eval surface looks like later. A feature pulling the Knowledge lever needs RAG + retrieval evals; a feature pulling Reasoning needs step-level diagnostics. Naming the lever in discovery prevents PRD-time surprises.

Push for: one primary lever, plus 1–2 secondary levers if applicable. Heuristic per the wiki: "Start with Instructions (zero cost). Layer on Knowledge (RAG) when you need domain specificity."

### 7. Discovery-to-Eval handoff: capture the eval-shaped problem statement

This is the discovery output that distinguishes AI discovery from generic feature discovery. Ask:

- **"What's the dataset? What real user inputs would feed this AI?"** — name the source (production logs, interview snippets, synthetic scenarios from the UX map).
- **"What's the scoring function? How will you know if the output is good?"** — push for binary pass/fail criteria, each traceable to a specific user value-anchor from the UX map. Not "the output is high quality." A criterion an engineer could implement.
- **"Who's the benevolent dictator on quality?"** — same expert user from step 2, now formalized as the labeling authority for downstream evals.

Per the Discovery-to-Eval Handoff: the dimensions you enumerate in discovery (Features × Scenarios × Personas) are the same dimensions that will populate the eval dataset later. If discovery has been done well, the eval dataset is half-built.

Flag if missing:
- The PM can name pain points but cannot name a single binary pass/fail criterion. → discovery is incomplete; more interviews needed.
- The "good output" definition lives only in the PM's head. → externalize it now, before any prompt is written.

### 8. Synthesize switch-stories (if interview transcripts exist)

If the PM has interview transcripts from people who already switched (or will switch) to a solution like this, run a quick JTBD pass:

- **Push** — what dissatisfaction drives the switch?
- **Pull** — what's the attraction of the new outcome?
- **Anxiety** — what's the fear of trying it?
- **Habit** — what's the attachment to the current way?

Filter to Layer-3 causal reality (what actually drove the switch), not Layer-1 stated preference. Use the salient verbatim quotes as candidate few-shot examples for the eventual eval rubric.

If no transcripts exist — say so, and recommend interview work as the unblock.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Workflow has been observed in real use, not just described | AI Product Development Process: "Observe workflow before intervening. Find the painful process, understand it deeply, then layer AI on top. Don't abstract it away." |
| Expert user is named and accessible (not a buyer, not a non-expert) | AI Product Development Process: "Talk to expert users who use the product daily. They can validate whether AI suggestions are actually good." |
| UX map has all 5 steps populated with evidence (Persona, Stages, Activities, Pain Points, Prioritize) | 4D Method: "Map the User Experience — 5-step UX mapping: Persona, Stages, Activities, Pain Points, Prioritize" |
| Archetype is named (Single-Layer / Multi-Layer / Agentic) and the AI vs. non-AI choice is defended | AI Product Archetypes: "The archetype determines which engineering challenges and PM concerns dominate." |
| Capability ceiling claim holds — AI enables something a deterministic system cannot | AI Product Development Process: "Reserve AI for places where it genuinely changes the capability ceiling — where it enables something that was previously impossible or impractically expensive." |
| Integration pattern is picked (inline / sidecar / predictive) and tied to the prioritized pain point | AI Product Development Process: "Three AI integration patterns to discover: Inline, Sidecar, What-if / predictive." |
| Primary Six Lever is named (Instructions / Knowledge / Memory / Tools / Reasoning / Post-Training) | Six Levers (AI PM): "The first five levers are where most AI PM work happens." |
| Eval-shaped problem statement exists: dataset source + binary pass/fail criteria + named labeling authority | Discovery-to-Eval Handoff: "The handoff test: can an engineer build the first round of the eval dataset by reading only the PRD and the interview transcripts?" |
| Pain point prioritization grounded in user evidence, not internal opinion | AI-Powered Discovery: UX Mapping demands pain-point evidence per activity, not abstracted summaries. |
| Persona is dimensional (role + context + skill + concrete behaviors), not marketing prose | Discovery-to-Eval Handoff: "Personas should be dimensional (role + context + skill level + concrete behaviors)." |

If any check is unmet, name the gap to the PM as the next concrete action — interview, observation, expert-user recruit, or eval-criteria externalization.

---

## Output

`.agentic-pm/discovery/<feature>-discovery.md` — a single file containing:

1. **Workflow walkthrough** (step-by-step manual sequence the AI is meant to address)
2. **Expert user** (named human + access status)
3. **UX map** (5 layers with evidence tags)
4. **Archetype + capability ceiling argument**
5. **Integration pattern + rationale**
6. **Primary + secondary Six Levers**
7. **Eval-shaped problem statement** (dataset source, 3–10 binary pass/fail criteria, benevolent dictator)
8. **JTBD switch-stories** (if transcripts exist)
9. **Open assumptions** — riskiest beliefs to test next, named explicitly (these become the validate-feasibility input)

---

## Handoffs

- **Next:** `validate-feasibility.md` — Prompt-as-MVP on 20–50 real inputs to test whether the AI can actually do the task before any design or build work.
- **If discovery surfaced that AI is the wrong tool:** stop here and recommend a non-AI scoping path. This is a valid outcome.
- **If interview transcripts are missing or stale:** recommend the PM run discovery interviews before continuing — feasibility validation built on imagined scenarios produces eval sets that test the team's assumptions, not user reality.

End the session with the single riskiest assumption surfaced in the eval-shaped problem statement, and one concrete action in the next 48 hours — typically: talk to the expert user, or run an N-of-5 prompt sketch against real inputs to feel the capability before investing in a full Prompt-as-MVP.
