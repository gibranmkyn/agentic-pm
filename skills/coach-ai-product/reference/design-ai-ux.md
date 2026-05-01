---
name: design-ai-ux
description: Use this playbook when the PM has a feature concept (post-discovery, often post-feasibility) and needs to design the UX that handles non-deterministic outputs, calibrated trust, and the structural failure modes of LLMs. Loaded by the coach skill, not invoked directly.
---

# Design-AI-UX — From feature concept to UX that survives non-determinism

## Use case

This playbook is for the PM who knows what AI feature they want to build but hasn't yet designed the UX around the model. The challenge is unique to AI: outputs are non-deterministic, the model can fabricate structure, semantic ambiguity collapses silently, and the system answers "I don't know" with the same confidence as "I'm sure." The UX must be designed for the *full output space*, not the happy path — and must structurally guard against the three failure modes Marily Nika names as evergreen.

This playbook is a sequel to `discover-ai-feature.md` and a precondition for `compile-ai-prd.md`.

---

## Locate

Ask the PM:

1. **"Have you done discovery — UX map, integration pattern, archetype check? Or is this earlier than that?"** — if no UX map exists, route back to `discover-ai-feature.md` first. Designing UX before knowing the workflow produces premature wireframes.
2. **"What's the failure cost? If the AI is wrong, what does the user lose — minutes, money, trust, a legal exposure?"** — failure cost shapes the Sheridan autonomy level. Anchor it concretely.
3. **"Have you seen real outputs from a Prompt-as-MVP, or are you designing against an imagined output?"** — if the answer is "imagined," flag that the design will encode hallucinations. Real outputs (even from a 10-prompt sketch) are the unblock.

If the PM has discovery + at least a feel for real outputs, proceed. Otherwise the next concrete action is fieldwork, not Figma.

---

## Spine

Two frameworks layered:

1. **4D Phase 2 — four universal AI design patterns:** Input affordances, Special Instructions / system prompt visibility, Output rendering for the amorphous space, Feedback mechanism.
2. **Marily Nika's three structural failure patterns:** Inventing structure from chaos, collapsing under semantic ambiguity, illusion of certainty. Each demands a specific guardrail.

These run in parallel — every design pattern must be evaluated against every failure mode. Sheridan autonomy level threads through the whole.

No autoselect needed; this spine is universal.

---

## Sub-steps

### 1. Confirm or pick the integration pattern

If the PM did `discover-ai-feature.md`, pull the integration pattern forward (inline / sidecar / predictive) and confirm. If they didn't, pick now:

Ask: **"Where does the AI sit in the workflow — inline (within the active task), sidecar (alongside it), or predictive (the user invokes it for foresight)?"**

The pattern determines surface area: inline patterns demand the lightest UI but the most aggressive guardrails (the user can't easily ignore a wrong suggestion); sidecar patterns can be more conversational but risk being ignored entirely; predictive patterns demand explicit input affordances and clear "this is a simulation" framing.

Flag if missing: the PM picks "all three" or hasn't decided. → not a designable feature yet.

### 2. Apply the four AI design patterns

Walk the four patterns from 4D Phase 2. For each, ask the question, push for evidence, flag the gap.

**a. Input affordance.** *Ask:* **"How does the user provide context to the model? A free-form box? A form? Their existing data? A click on something?"**

Push for: an input shape that maps to the workflow. If the input is "open chat box" for a feature that should be inline-form-based, flag it.

**b. Special instructions / system prompt visibility.** *Ask:* **"Will the user see, edit, or override the system prompt? Or is it locked? What can they tell the AI to change?"**

Push for: an explicit decision. Levers like "tone," "audience," "length" should be user-controllable if they vary by task. Hidden system prompts produce frustrating one-shot generation flows.

**c. Output rendering for the amorphous space.** *Ask:* **"What's the full space of outputs the model could produce? Walk me through 5 — best case, worst case, weird-but-plausible, refusal, partial."**

Push for: actual examples. If the PM only describes the happy path, the design will fail on every other case. Per Farris: "Outputs are non-deterministic → UX is indeterminate. Design must account for the full amorphous space of possible outputs, not just the happy path."

The output rendering must:
- Distinguish AI-generated content from user-edited content visually
- Allow editing or overriding (don't trap the user in the AI's output)
- Handle long outputs (truncation, pagination, expansion)
- Handle empty/refusal/error gracefully

**d. Feedback mechanism.** *Ask:* **"How does the user signal good vs. bad? Thumbs? Edit-as-feedback? Explicit accept/reject? Implicit (re-run = bad)?"**

Push for: at least one explicit + one implicit signal. Per the wiki, both are needed — explicit signals are high-quality but rare; implicit signals are universal but require interpretation.

Flag if missing: a "feedback later" deferral. Feedback is product infrastructure, not polish; it feeds the eval flywheel from day one.

### 3. Design guardrails for the three structural failure patterns

This is the most important step in the playbook. Walk the PM through Nika's three patterns and force a designed response for each. Generic answers fail this step.

**Pattern 1 — Inventing structure from chaos.** Given unstructured input (messy thread, fragmented notes), the model produces a polished, authoritative-looking output where the structure is fabricated.

*Ask:* **"When the input is messy or low-signal, how does the UX tell the user 'this output is interpretive, not extracted'?"**

Required design elements:
- A signal when input is unstructured ("This thread had 47 messages — here's our best interpretation")
- Source attribution where the output came from
- Confidence indication, especially when low

Flag if missing: the output is rendered identically regardless of input quality.

**Pattern 2 — Collapsing under semantic ambiguity.** Given a vague prompt, the model guesses the audience and produces generic output, hiding its uncertainty under fluent prose.

*Ask:* **"When the user's input is ambiguous, does the system ask a clarifying question — or just generate?"**

Required design elements:
- Disambiguation flow before generation when input is ambiguous (clarifying-question pattern)
- A mechanism to detect ambiguity (variance check on internal generations is the diagnostic)
- A fallback when the user refuses to disambiguate (state explicit assumptions in the output)

Flag if missing: the system always generates immediately. → Pattern 2 is unguarded.

**Pattern 3 — Illusion of certainty.** The model answers "Is this good?" with 100% confidence even when actual accuracy is 10%. It can't say "I don't know" or "out of scope" without explicit guardrails.

*Ask:* **"What does 'I don't know' look like in this UI? What does 'out of scope' look like?"**

Required design elements:
- Explicit "I don't know" / "out of scope" output states with their own UI treatment
- Calibrated-trust signaling: confidence indicators, source citations, hedging language tied to actual certainty
- Refusal patterns for high-risk requests
- A trust-collapse-recovery flow (when a user catches an error, the system acknowledges and de-escalates trust appropriately)

Flag if missing: the UI implicitly assumes the model is always confident. This is the fastest path to user trust collapse — per Nika, *"Users experience a jarring trust collapse: the system seemed confident, then it was wrong. This is worse than a system that signals uncertainty."*

### 4. Pick the Sheridan autonomy level

Walk through Sheridan's 10 levels and force a choice:

| Level | Who decides/acts |
|---|---|
| 1 | Human does everything |
| 2 | Computer offers a complete set of action alternatives |
| 3 | Computer narrows the selection down to a few choices |
| 4 | Computer suggests a single action |
| 5 | Computer executes suggestion if human approves |
| 6 | Computer allows human a restricted time to veto before automatic execution |
| 7 | Computer executes automatically, then necessarily informs human |
| 8 | Computer executes automatically and informs human only if asked |
| 9 | Computer executes automatically and informs human only if it decides to |
| 10 | Computer decides everything and acts autonomously |

Levels 1–4 = assistance. Levels 5–10 = automation.

*Ask:* **"Given the failure cost you named in Locate, which level fits — and why not one level higher or lower?"**

Push for: a defensible level tied to failure cost. Heuristics:
- High-stakes / irreversible / regulated (medicine, law, finance, money movement): Level 2–4. Human must verify before action.
- Low-stakes / reversible / clearly bounded (suggested edits, drafts, summaries): Level 5–7.
- Fully delegable + high trust earned over time (background automation, agentic workflows on bounded tasks): Level 8–10 — only after evals prove the trust is real.

Flag if missing: the PM picks Level 7+ for a high-stakes workflow with no eval system yet. → name the mismatch. Sheridan progression is earned post-launch, not declared upfront.

### 5. Design the post-AI-output workflow

The output is the middle of the workflow, not the end. Ask:

- **"After the AI produces output, what does the user do with it — edit, approve, reject, export, share, act?"**
- **"Where does the result land — in a new doc, in their existing artifact, in a queue for review?"**
- **"How does the user override the AI? What's the escape hatch?"**

The post-output workflow is where most AI features fail in real use. The model produces something usable, but the user can't easily get from there to their next state. Common failures:
- No edit affordance (user has to copy-paste out)
- No "redo with adjustment" without retyping the whole prompt
- No version history (user loses their previous attempt)
- No export to where the work actually lives

Flag if missing: a "we'll figure that out later" deferral. The post-output flow is the difference between a demo and a feature.

### 6. Spot-check against archetype-specific risks

If the feature is **Single-Layer**: hallucination is the dominant risk. The UX must treat outputs as suggestions, not facts. Source attribution and "verify before using" framing are mandatory.

If **Multi-Layer**: retrieval failure is the dominant risk. The UX must indicate when the AI didn't find supporting knowledge ("I couldn't find anything about X") rather than silently falling back to the base model.

If **Agentic**: cascade failure is the dominant risk. The UX must show the agent's plan before execution (Sheridan ≤5), allow the user to interrupt mid-workflow, and surface step-level failures rather than only end-state failures.

Ask: **"Given the archetype, what's the dominant risk in your UX, and how is the design specifically guarding against it?"**

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Integration pattern is named (inline / sidecar / predictive) and tied to the workflow | AI Product Development Process: "Three AI integration patterns to discover: Inline, Sidecar, What-if / predictive." |
| All four 4D AI design patterns are designed (input, special instructions, output, feedback) | 4D Method: "Understand Common AI Design Patterns — 4 universal patterns (input, special instructions, output, feedback)." |
| Output rendering accounts for the full amorphous space, not just the happy path | AI Product Development Process: "Outputs are non-deterministic → UX is indeterminate. Design must account for the full amorphous space of possible outputs, not just the happy path." |
| Pattern 1 guard exists: signal when input is unstructured, source attribution, confidence indication | AI Failure Patterns: "Explicitly signal when input is unstructured and output is interpretive. Provide source attribution so users can verify." |
| Pattern 2 guard exists: disambiguation flow before generation on ambiguous input | AI Failure Patterns: "Require disambiguation before generation. Build clarifying question flows into the product." |
| Pattern 3 guard exists: explicit "I don't know" / "out of scope" output states with UI treatment | AI Failure Patterns: "Guardrails must be explicitly designed — models will not self-limit without them. Build uncertainty signaling into the UI." |
| Sheridan autonomy level is named and tied to failure cost | Sheridan Levels of Autonomy: "When designing an AI feature, the PM must explicitly choose a target level and be able to justify it." |
| Sheridan level is conservative for high-stakes domains (medicine, law, finance: Level 2–5) | Sheridan Levels of Autonomy: "High-stakes domains (medicine, law, finance): stay at levels 2–5; human must verify before action." |
| Both explicit and implicit feedback signals are designed | AI Evaluation Pipeline: "Two signal types that must both be instrumented: Explicit signals... Implicit signals." |
| Post-AI-output workflow is designed (edit, override, export, escape hatch) | AI Product Development Process: "Consider not just the AI output but the entire surrounding workflow: steps before and after the AI moment." |
| Surrounding UX (guardrails, context, feedback) is designed, not just the AI moment | AI Product Development Process: "The experience surrounding the AI (guardrails, context panel, feedback mechanism) matters as much as the AI output." |

If any check is unmet, name the gap. The fix is rarely "add more polish" — it's almost always "design for a failure case you've been avoiding."

---

## Output

`.agentic-pm/design/<feature>-ai-ux.md` — a single file containing:

1. **Integration pattern + rationale**
2. **Four AI design patterns** (input, special instructions, output, feedback) — each with a concrete decision, not a placeholder
3. **Failure-pattern guardrails** — one explicit design response per Nika pattern (chaos / ambiguity / certainty)
4. **Sheridan autonomy level + failure-cost rationale**
5. **Post-AI-output workflow** — what the user does next, with edit/override/escape paths
6. **Archetype-specific risk + guard**
7. **Open design assumptions** — wireframe-level decisions that need user testing or eval feedback to validate

---

## Handoffs

- **Next:** `compile-ai-prd.md` — with discovery + UX design + (ideally) feasibility validation in hand, the PM has enough to write the AI PRD with Six Levers, Sheridan, and counter-metrics.
- **If feasibility hasn't been validated yet:** route to `validate-feasibility.md` first. Designing UX in detail before the model can actually do the task is throwaway work.
- **If discovery is incomplete or no UX map exists:** route back to `discover-ai-feature.md`.

End the session with the single riskiest design decision (typically: which Nika pattern is least guarded, or whether the Sheridan level is right) and one concrete action in the next 48 hours — typically: walk through 5 sample outputs with the expert user, or sketch the disambiguation flow and put it in front of one user.
