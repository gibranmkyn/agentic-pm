---
name: surface-the-signal
description: Entry-point playbook for coach-problem-framing. Triages what triggered the PM to seek problem-framing help, classifies the signal type, runs a decision-first check, sizes the planning aperture, and routes to the next phase. Loaded by the coach, not invoked directly.
---

# Surface-the-Signal — From fuzzy trigger to typed signal and clear next phase

## Use case

This playbook is for the PM who walked in with something that prompted them — a complaint, a request, a data anomaly, a mandate — but has not yet named what the actual problem is. The job here is not to diagnose the problem; it is to make the signal specific, classify it, and confirm the work is worth doing before any framework-walking begins.

This is the entry point of the problem-framing arc. It is always loaded first unless the PM enters mid-arc with a signal already typed and a decision already named.

---

## Locate

Before walking the playbook, read the CWD context: `./CLAUDE.md`, `./.agentic-pm/session.md`, any prior `.agentic-pm/framing/` artifacts. Form a hypothesis about the signal type and where the PM is. Present it as a one-sentence bundled status check the PM can correct.

Then confirm three things before proceeding:

1. **"What specifically happened that made you sit down to frame a problem today?"** — if the answer is a category ("we're getting complaints") rather than a specific event, this playbook will surface the specific event in sub-step 1.
2. **"Is there a decision that's waiting on this framing?"** — if there is no downstream decision, Decision-First Research would call this discovery theater. Name that risk upfront.
3. **"Have you run any behavioral interviews on this signal yet?"** — if yes, `listen-behaviorally.md` may be the right phase instead of this one. Confirm before loading.

---

## Spine

One spine, no autoselect: Decision-First Research (clarify the decision before designing any evidence-gathering), threaded with the signal-type classifier and the planning aperture from Discovery Culture. Continuous Discovery's signal-triage framing appears inline when the PM names an ongoing discovery rhythm.

---

## Sub-steps

### 1. Locate the specific triggering event

Ask: **"Walk me to the single event that triggered this. Not the category — the specific moment. When was it? What exactly happened?"**

Push for: a named event with a date or time range. A specific user complaint with a quote, a specific metric reading at a specific time, a specific meeting where the ask was made, a specific ticket number from customer success.

Flag if missing:
- The PM describes a pattern ("we keep hearing this") instead of a specific first instance.
- The trigger is stated as a problem statement already ("users can't do X") rather than as a raw event that prompted the PM to care.
- The PM says "I've been thinking about this for a while" — push: "What made it urgent this week, specifically?"

If the PM cannot name a specific event, ask: "What would you point to if a skeptical stakeholder asked why you're spending time on this right now?" That usually surfaces the real trigger. Do not move to sub-step 2 until the event is concrete.

### 2. Classify the signal type

Once the triggering event is concrete, classify it. Ask: **"Which of these fits best — or is it a combination?"**

Walk the PM through the seven types and confirm one primary type:

- **User complaint** — a user or user group expressed dissatisfaction with a specific behavior or outcome. Source: direct feedback, support ticket, NPS verbatim, sales call.
- **Strategic ask from leadership** — an exec or senior stakeholder asked the team to look into or build something. May or may not include a problem definition.
- **Data anomaly** — a metric moved unexpectedly (up or down), or a tracking gap was noticed. The signal is in the numbers, not a person's statement.
- **Top-down mandate** ("we should do X") — a directive to pursue a specific solution or direction, often arriving without a problem statement attached.
- **Founder or PM hunch** — an internal belief that something is broken or possible, driven by intuition or pattern recognition rather than a specific external event.
- **OKR-driven** — a gap between current state and a committed key result surfaced this as a problem to investigate.
- **Customer-success escalation** — a CS or account team surfaced a complaint or churn risk from a named account or segment, prioritized because of its commercial weight.

Push for: one primary type. If the PM says "a bit of several," push: "Which one would you lead with if you had 30 seconds to explain why this matters?" Mixed-signal situations are real but the primary type determines the routing risk — a mandate masquerading as a user complaint is a common failure mode.

Flag if missing:
- The PM classifies a mandate as a user complaint without any user evidence. Name the distinction: a mandate is a proposed solution with an implied problem; a user complaint is observed friction. They route differently.
- The PM classifies a hunch as a data anomaly. Ask: "Is the metric actually wrong, or does it just feel wrong to you?"

Each signal type carries a default risk pattern. Name it:
- **User complaint** → stated preference risk: the complaint is real but the implied solution is wrong. Behavioral evidence is needed before framing.
- **Strategic ask / mandate** → problem-definition gap: the ask arrived solution-first. The problem it solves may be undefined or contested.
- **Data anomaly** → diagnosis risk: a metric moved but the cause is unknown. Framing before diagnosing the cause produces the wrong problem statement.
- **Founder / PM hunch** → confirmation bias risk: the PM is the source and the audience. Behavioral interviews are the only reliable check.
- **OKR-driven** → aspiration risk: the key result may be aspirational rather than grounded in a diagnosed gap. Decision-First Research would ask: "What evidence says the gap exists and is hard?"
- **CS escalation** → sample bias risk: the escalated account may not represent the segment. Ask whether this is one loud customer or a pattern.

### 3. Decision-first check

Ask: **"What decision will this framing inform? Who is making it, and by when?"**

This is the Decision-First Research check. Every framing session should serve a specific decision. Push the PM to name it before any further work.

Push for: a decision with a decider, a time horizon, and a clear yes/no or A/B/C shape. "What features should we prioritize to address this?" is a bounded decision. "Why are users churning?" is an open research question, not a decision — it needs bounding before it is worth framing.

Flag if missing:
- The PM cannot name a specific decision. Ask: "If you had a perfect problem statement tomorrow, what would you do with it? Who would you show it to? What would they decide?" Work backward from that.
- The decision has already been made (mandate situation). If the decision is settled, the framing work may be cover rather than input. Name that risk directly: "If the mandate is already locked, we should be honest about whether this framing is an input to a decision or a rationale for one already made."
- The decision is not worth the framing cost. Run the three feasibility filters from Decision-First Research: Is framing this feasible given time and access? Is it reasonable — is the cost of the framing proportional to the stakes of the decision? Is it worthwhile — will a better problem statement actually change what gets built? If any filter fails, name it and offer to stop.

Push for evidence gap: **"What information are you missing that would change how you'd decide?"** If the PM cannot name an evidence gap, they may already have enough information to decide and do not need a full framing session. Name this.

### 4. Planning aperture

Ask: **"How much time do you realistically have to frame this problem before a scope decision is expected?"**

Use the planning aperture guidelines from Discovery Culture to name the appropriate time budget honestly:

- **Ambitious initiative** (new product, major redesign, entering a new segment) — 8–12 weeks of problem-framing work is defensible. This is not a signal to fill 12 weeks; it is a signal that shortcuts will be costly.
- **Contained initiative** (feature enhancement, workflow improvement, segment expansion within existing product) — 2–4 weeks is appropriate. Enough for behavioral interviews and diagnosis; not enough for ethnographic research.
- **Tactical initiative** (straightforward improvement with clear evidence already in hand) — less than one week. If the evidence is already there and the decision is clear, the framing may just need to be written down.

Push for: a specific time horizon the PM is working within, not a preference. "Ideally we'd have more time" is not an aperture.

Flag if missing:
- The time budget is shorter than the signal type warrants. Name the mismatch and ask what evidence could be prioritized if time is compressed — do not let a compressed timeline become an excuse to skip behavioral evidence entirely.
- The PM says there is no deadline. Ask: "What happens if you haven't framed this in four weeks? Who gets impatient?" That usually surfaces a real constraint.

Name the implication for the session: if the aperture is tactical, the coach can move faster and the artifact is lighter. If the aperture is ambitious, the session should surface what the PM does not yet know — rushing to a problem statement now would produce premature convergence.

### 5. Discovery theater check

Before routing to the next phase, ask: **"If you had a crisp problem statement by end of day, would it actually change any near-term roadmap decision? Or is the framing work being done because it feels like the right thing to do?"**

This is the Discovery Culture / Continuous Discovery check against discovery theater. Discovery theater is research that does not change decisions. Signs here: the signal surfaced weeks ago, nothing changed, no decision is waiting, the framing is being done because a stakeholder asked for it rather than because the answer would change what gets built.

If the PM recognizes this pattern, name it without judgment: "Discovery theater is not a failure — it happens when teams are under pressure to show rigor without having a real decision to make. The honest question is whether the framing work is the unblock or whether the unblock is a conversation with the stakeholder about what they actually need to decide."

Do not refuse to continue if the PM still wants to proceed; name the risk and tag the artifact `framing-theater-risk` if the check fails.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Triggering event is specific — a named event, not a category or pattern | Continuous Discovery Habits: "Entry question: 'Tell me about the last time you [did X]' — forces a specific, real event" |
| Signal type is classified to one primary type with its default risk pattern named | Decision-First Research: "Clarify the decision — 'What is the specific thing we need to decide?' Bound it." |
| A specific downstream decision is named with a decider and a time horizon | Decision-First Research: "What is the specific thing we need to decide? … is good. 'Why are users churning?' is too open." |
| Evidence gap is named — what information is missing that would change the decision | Decision-First Research: "Identify the evidence gap — what information is currently missing that would change how you'd decide?" |
| Three feasibility filters applied: feasible, reasonable, worthwhile | Decision-First Research: "Before committing to any research: Feasible? Reasonable? Worthwhile?" |
| Planning aperture is named with a specific time horizon matched to initiative type | Discovery Culture: "Complex, ambitious: 8–12+ weeks. Contained, well-defined: 2–4 weeks. Tactical, straightforward: <1 week." |
| Discovery theater check has run — framing work is an input to a real decision | Continuous Discovery Habits: "Discovery theater = doing research that doesn't change roadmap decisions." |

If any check is unmet, name the gap to the PM before routing to the next phase. Do not route around an unmet check silently.

---

## Output

`.agentic-pm/framing/<feature>-signal-triage.md` — a single file containing:

1. **Triggering event** — the specific event, dated, with source
2. **Signal type** — primary type + default risk pattern named
3. **Decision** — the specific decision this framing serves, decider, time horizon
4. **Evidence gap** — what information is missing that would change the decision
5. **Feasibility filters** — pass/fail on feasible, reasonable, worthwhile, with brief rationale for any fail
6. **Planning aperture** — initiative type, time budget, implication for depth of framing work
7. **Discovery theater check** — pass or flagged with `framing-theater-risk` tag
8. **Recommended next phase** — one of: `listen-behaviorally.md`, `diagnose-the-problem.md`, or fieldwork assignment (session ends here)

---

## Handoffs

- **To `listen-behaviorally.md`** — when the signal is typed, the decision is named, but behavioral evidence is thin or absent. This is the default route for user-complaint, hunch, CS-escalation, and OKR-driven signals. The PM needs structured interview craft before diagnosis is possible.
- **To `diagnose-the-problem.md`** — when behavioral interview data is already in hand (PM enters with transcripts, prior research, or recent observation notes), the signal type is clear, and the gap is diagnosis rather than evidence. Skip `listen-behaviorally.md` only if the behavioral evidence is genuinely present — not just claimed.
- **Fieldwork assignment (session ends here)** — when the feasibility filters fail, or the decision cannot be named, or the PM has not yet observed the workflow in question and no interview data exists. Name the specific fieldwork: talk to a named user type, watch a specific workflow end-to-end, pull a specific metric from a specific data source. Do not let the PM substitute more framework-walking for the evidence that would actually move the framing forward.

End every session with the single most important next action in the next 48 hours — specific, not "do more research." A named user. A named data pull. A named conversation. Not "iterate on this."
