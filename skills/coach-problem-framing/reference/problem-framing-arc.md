---
name: problem-framing-arc
description: Full-arc reference the coach re-reads when re-orienting across sessions — not a playbook, not invoked per phase. Synthesizes the problem-framing arc, phase descriptions, entry points, the fieldwork loop, routing logic, and anti-patterns. Loaded by the coach skill; other playbooks cite this as the canonical arc reference.
---

# Problem Framing Arc

The coach's full-arc map. Re-read this when re-orienting across sessions: when the PM asks "where are we?", when sessions have a gap between them, or when you need to connect the current phase to the whole arc.

This arc is **solution-agnostic by design.** The output is a problem statement someone could disagree with on the merits, plus a named handoff target. Picking a solution — or picking a solution shape — happens downstream. The arc ends when the framing is strong and the routing is honest.

---

## The arc

```
              surface-the-signal           ← what triggered this; signal-type classification
                      ↓
              listen-behaviorally          ← Continuous Discovery + Jobs To Be Done interview craft
                      ↓
              diagnose-the-problem         ← Strategy Kernel: what is actually going on, what is hard
                      ↓
              test-sharpness               ← Sharp Problems: intensity / frequency / population / status quo
                      ↓
              frame-three-ways             ← three competing framings (divergence before convergence)
                      ↓
              compile-problem-statement    ← Working Backwards: artifact written as one disputable paragraph
                      ↓
              route-the-handoff            ← which downstream coach does this problem call for?
                      ↓
     ┌────────────┬─────────────┬──────────────┬──────────────┐
     ↓            ↓             ↓              ↓              ↓
coach-ai-product  non-AI    coach-strategy  coach-metrics  coach-decisions
(learning         scoping   (when built)    (when built)   (when built)
 problem)         (compu-
                  tational
                  problem)

(insufficient-evidence loop — assignment is fieldwork, not framework — can fire from any phase)
```

---

## Phase map

### Locate (no playbook — coach's own logic)

Before loading any playbook, the coach reads `./.agentic-pm/` (any prior framing artifacts on this feature, plus `session.md`), `./CLAUDE.md`, `./README.md`, and recent git activity. The goal is a hypothesis: what signal is live, where is the PM in the arc, what evidence already exists, is this a cold start or a returning session?

Locate is not a phase the PM goes through. It is the coach's orientation step. Present findings as a one-sentence bundled status check the PM can correct in a sentence.

---

### Surface the signal — What triggered this?

The first move is classifying the incoming signal before any diagnosis begins. Signals come in several forms: a user complaint or support spike, a strategic ask from leadership ("we should do X"), a data anomaly, a competitive move, a metric drop. Each form carries different reliability, different urgency, and different failure modes.

Key moves: name the signal type; surface who first noticed it and how; identify whether the trigger is a behavioral observation or a stated preference. The signal type shapes which interview approach to load next. A leadership ask is the highest-risk signal — it often encodes a solution masquerading as a problem. A data anomaly is the most honest signal — it surfaces gap before any narrative is attached.

**Playbook:** `reference/surface-the-signal.md`

---

### Listen behaviorally — Build the evidence base

Stated preferences fail in a large majority of cases. The only reliable evidence comes from watching what people actually do — or interviewing people who actually switched behavior. The Continuous Discovery entry move is "tell me about the last time you did X," not "what would you want." Jobs To Be Done follows the causal thread: push past the first two layers (aspiration, surface) to Layer 3 (causal reality).

Key moves: recruit only people who have lived the problem recently; separate observation sessions (watch the workflow end-to-end without helping) from interview sessions; document behavioral stories, not survey answers; collect at least three independent stories before claiming a pattern. The diagnostic loop fires here if the PM has no behavioral evidence — stop and assign fieldwork.

**Playbook:** `reference/listen-behaviorally.md`

---

### Diagnose the problem — Name what is actually broken

Per the Strategy Kernel: most organizational debates about strategy are debates about the diagnosis, not about what to do. A bad diagnosis is a desire ("we're not growing fast enough"). A good diagnosis names what is actually going on, quantifies the gap, and names what makes it hard. The crux: there is usually one pivotal difficulty that most teams avoid because it is uncomfortable. Name it.

Key moves: state the gap in numbers; identify who experiences it and in what workflow; name the obstacle — why hasn't the current approach solved it already? Run the Hypothesis-Driven Problem Solving frame: what is the bottom-up evidence, and what hypothesis about the cause does it support? Test the crux by asking whether solving the hardest sub-problem would dissolve the rest.

**Playbook:** `reference/diagnose-the-problem.md`

---

### Test sharpness — Is this problem worth solving?

A sharp problem pulls users to a solution before the solution is well-built. A blunt problem requires perfect execution to overcome indifference. Run the three Sharp Problems tests: workflow compression (can an imagined solution be drawn 2–3× shorter than the current workflow?), whites-of-their-eyes (does the user's body register recognition when you name the problem?), recession test (does this survive a budget cut?).

Key moves: if a problem fails all three tests, improve the diagnosis before framing solutions; a better framing may surface a sharper problem. The sharpness test is also where frequency and population sizing happen — how many people experience this, how often, and how much friction does the status quo impose? A problem that affects 80% of users weekly in a high-value workflow is a different investment than one affecting 5% monthly.

**Playbook:** `reference/test-sharpness.md`

---

### Frame three ways — Diverge before converging

If the PM offers one framing, the coach asks for three. Same observed pain, three different ways to name what is broken. The one-idea funnel is as dangerous for problems as it is for solutions: it forecloses better problem statements before they are considered.

Key moves: generate three framings that are genuinely in tension — not variations of the same diagnosis; each framing should imply a different solution shape or different root cause; evaluate each against the behavioral evidence before selecting one to carry forward. The selected framing must be falsifiable — a stakeholder should be able to disagree with it on the merits.

**Playbook:** `reference/frame-three-ways.md`

---

### Compile the problem statement — Write as a discipline of thinking

Per Working Backwards: writing the artifact forces clarity that slides and bullet points allow you to skip. The problem statement compiles in PR-FAQ form — one paragraph a stakeholder could disagree with on the merits. If the framing cannot be written in that form, the framing is not done.

Key moves: write the artifact in `./.agentic-pm/framing/<feature>-problem-statement.md`; include the signal source, behavioral evidence summary, diagnosis (gap + obstacle), sharpness test results, and selected framing; tag with `framing-unvalidated` if Speed Mode was used; include a `Supersedes:` field if a prior version exists. The artifact is the residue of the reasoning — it does not substitute for the reasoning.

**Playbook:** `reference/compile-problem-statement.md`

---

### Route the handoff — Name the right downstream coach

The problem dictates the downstream coach. Run the computational-vs-learning test: can the problem be solved by expressing the logic explicitly (same input → same output, every time)? If yes, it is a computational problem — route to non-AI scoping. If the behavior can only be approximated from examples and the "right answer" varies by context, it is a learning problem — route to `coach-ai-product/discover-ai-feature`.

For non-feature problems: if the diagnosis is a strategic gap at the company or portfolio level (no clear company-level diagnosis), route to `coach-strategy` (when built). If the blocker is that the team cannot tell whether a metric moved, route to `coach-metrics` (when built). If the problem surfaces a one-way-door decision with asymmetric stakes, route to `coach-decisions` (when built). If evidence is insufficient to route confidently, assign fieldwork and return.

**Playbook:** `reference/route-the-handoff.md`

---

## Entry points

PMs do not always start at the beginning. The coach locates the PM and loads the right playbook.

| Entry condition | Arc position | First playbook to load |
|---|---|---|
| Cold start — vague trigger, no prior artifacts | `surface-the-signal` | `reference/surface-the-signal.md` |
| Has behavioral stories but no diagnosis | `diagnose-the-problem` | `reference/diagnose-the-problem.md` |
| Has a diagnosis, unsure whether it is worth solving | `test-sharpness` | `reference/test-sharpness.md` |
| Has one framing, wants to pressure-test it | `frame-three-ways` | `reference/frame-three-ways.md` |
| Returning to revise a compiled statement | `compile-problem-statement` | `reference/compile-problem-statement.md` |
| Has a compiled statement, needs to route | `route-the-handoff` | `reference/route-the-handoff.md` |

When returning to revise a prior statement, read the existing artifact at `.agentic-pm/framing/<feature>-problem-statement.md` before loading the playbook. The revision chain (via `Supersedes:`) shows how the framing has evolved — use it to understand what changed and why.

---

## The fieldwork loop

The insufficient-evidence loop can fire from any phase. It fires when the PM is trying to resolve a diagnostic question through frameworks alone — without behavioral observations, without watching users in context, without talking to people who recently switched behavior.

When the loop fires: name the specific question that fieldwork would answer; name the minimum evidence needed (three independent behavioral stories, one end-to-end observation session, production data on the suspected gap); name a concrete action with a real subject and a 48-hour window. Do not continue whiteboarding. Framework-walking cannot substitute for user contact.

The loop is not a failure state — it is an honest diagnosis of what is blocking progress. The unblock is fieldwork, not more structure.

---

## Routing matrix

| Problem type | Condition | Route to |
|---|---|---|
| Learning problem | Cannot be expressed as explicit logic; right answer varies by context | `coach-ai-product/discover-ai-feature` |
| Computational problem | Can be expressed as deterministic logic; same input → same output | Non-AI scoping (outside this arc) |
| Strategic gap | No clear company-level diagnosis; problem is above the feature layer | `coach-strategy` (when built) |
| Measurement gap | Cannot tell whether the metric moved; problem is an instrumentation or attribution gap | `coach-metrics` (when built) |
| One-way-door decision | Asymmetric stakes; reversibility is the crux | `coach-decisions` (when built) |
| Insufficient evidence | Cannot route confidently; behavioral evidence is missing | Fieldwork loop — return when evidence exists |

---

## Anti-patterns

**Premature solutioning.** The PM proposes a solution shape before the diagnosis is resolved. Walk it back: "We are framing the problem. The framing decides which solutions are even relevant." The arc ends before solutioning; that discipline is what makes the routing honest.

**Accepting stated preference as evidence.** "Users want X" is not evidence. A behavioral story — observed action, observed workaround, recorded switch — is evidence. The Jobs To Be Done finding: stated preferences fail in a large majority of cases. The Continuous Discovery entry move is "tell me about the last time."

**Skipping the diagnostic phase.** Impatience to reach the artifact is the default failure mode. A real diagnostic phase is bottom-up information gathering before committing to a refined problem statement. This is not waste; it prevents solving the wrong problem. If the PM is in a hurry, offer Speed Mode — but do not skip the diagnosis.

**One-framing convergence.** The team converges on the first problem framing offered without generating alternatives. Same observed pain can be framed multiple ways, implying different solutions and different root causes. Force three framings before evaluating any.

**Framework-walking as a substitute for fieldwork.** If no one has been observed using the current workflow, the playbook is premature. Walking through diagnostic frameworks without behavioral data produces confident-sounding but grounded-in-nothing diagnoses. Name this and stop.

**Forcing the AI route.** The computational-vs-learning test must be run honestly. A computational problem routed to `coach-ai-product` wastes the next three weeks on feasibility work the problem never needed. "We should add AI" is a hypothesis, not a diagnosis.

**Blunt diagnosis as a good diagnosis.** "We're not growing fast enough" is an aspiration, not a diagnosis. The Strategy Kernel requires naming what is actually going on, the gap in numbers, and what makes it hard. A diagnosis without an obstacle is incomplete — it describes the symptom, not the crux.
