---
name: setup-context
description: "Initialize agentic-pm for a new user or team by filling in the five context files via guided Q&A. Run this first before any other skill."
allowed-tools: Read Write Edit
---

# Start — Context Setup

Walks you through five short question sets and writes the `context/` files that every other skill reads. Takes about 5 minutes.

---

## Before doing anything

Read all five context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

Check each for angle-bracket placeholders (`< >`). If **all five are filled in** (no `<` characters remain), tell the user their context is already set up and offer to update any specific file. Otherwise, proceed with setup.

---

## Discovery interview

This skill's interview IS its core function — the context files are the artifact. But the interview must push harder than a form fill. Don't accept vague answers. Every downstream skill reads these files; vague context here produces vague artifacts everywhere.

Push on these areas (adapt per slot; follow up on soft answers):

1. **COMPANY.md — Don't accept vague descriptions.** "We help businesses grow" is not a product description. Push: **"What specifically does your product do that a competitor doesn't? Not the mission statement — the thing users actually use."** Follow up on stage: **"You said 'growth stage' — growth from what to what? ARR range, user count, team size?"** A vague company description produces vague strategy documents.

2. **GOALS.md — Push for one metric, not three.** **"What's the one metric that matters most this cycle? Not three — one. If you could only move one number, which one?"** Most PMs list 3–5 goals of equal weight, which means no goal is prioritized. Follow up: **"If that metric improves but these others get worse, is that acceptable? If not, you have guardrails, not goals — name the difference."**

3. **TEAM.md — Challenge on the gap.** **"What's your team's biggest gap — the thing that's held you back in the last two cycles?"** Don't accept "we need more engineers" — every team needs more engineers. Push for the specific capability gap: **"Is it design? Data science? Domain expertise? PM capacity? The gap determines which skills will flag constraints."** Also push on capacity: **"You said 70% capacity. What's consuming the other 30%? On-call? Maintenance? Meetings? Because that affects what we can realistically plan."**

4. **PRODUCTS.md — Get specific on AI surfaces.** If the PM mentions AI features, push: **"Which AI features specifically? What model are they using? Have they been evaluated, or are they vibes-only?"** This feeds directly into `/agentic-pm:write-rubric`. Vague AI surface descriptions produce eval plans that don't know what they're evaluating.

5. **CONSTRAINTS.md — Push for specifics, not categories.** **"You said 'we have technical constraints.' What specifically? Is it a legacy database that can't handle real-time queries? A third-party API with rate limits? A monolith that takes 3 weeks to deploy?"** Generic constraints are useless — they don't change any downstream decision. Follow up on organizational constraints: **"What's the approval chain for shipping a new feature? How long does it actually take from 'ready to ship' to 'in production'?"**

The interview is complete when every context file contains enough specificity that a downstream skill can make different decisions based on it. If changing the context file wouldn't change any downstream output, it's too vague.

---

## Step-by-step flow

Work through one context slot at a time. For each slot:
1. Ask the questions below in a single message.
2. Wait for answers. **Push back on vague answers using the Discovery interview challenges above.** Don't accept soft defaults — follow up until the answer is specific enough to change a downstream decision.
3. Write the filled file immediately — don't batch.
4. Confirm the write with a one-line summary before moving on.

---

### Slot 1 — Company (`context/COMPANY.md`)

Ask:

> **Company setup (1/5)**
>
> Answer these to set up your company context:
> 1. In one or two sentences: what does your product do, and what's the core value it delivers?
> 2. Who specifically do you serve? (Be specific — not "SMBs" but "ops leads at 50–500-person logistics companies")
> 3. How do you make money? (Subscription, usage-based, transactional, marketplace, etc.)
> 4. What stage are you at? (pre-PMF / early-PMF / growth / mature)
> 5. Anything significant that changed in the last 6 months that affects your priorities?

Write answers to `context/COMPANY.md`.

---

### Slot 2 — Goals (`context/GOALS.md`)

Ask:

> **Goals setup (2/5)**
>
> 1. What's the single most important outcome your company is chasing this year — one sentence?
> 2. What's your team's goal this cycle? (metric + target + timeframe — e.g., "increase 7-day retention from 32% to 45% by end of Q2")
> 3. What 2–4 metrics does your team track weekly as leading indicators?
> 4. What will you absolutely not sacrifice, even if it means hitting a goal more slowly? (latency, cost, support quality, etc.)

Write answers to `context/GOALS.md`.

---

### Slot 3 — Team (`context/TEAM.md`)

Ask:

> **Team setup (3/5)**
>
> 1. Who's on the team? (roles and rough counts — no names needed)
> 2. What's your honest weekly capacity, counting on-call and maintenance?
> 3. What is the team genuinely good at?
> 4. What does the team struggle with or lack?
> 5. Do any team members have deep domain expertise in a specific AI surface? (This is used by `/agentic-pm:write-rubric` to identify the Principal Domain Expert. Format: name/role + which surface they know.)

Write answers to `context/TEAM.md`.

---

### Slot 4 — Products (`context/PRODUCTS.md`)

Ask:

> **Products setup (4/5)**
>
> 1. What surfaces do you ship? (iOS, web, API, etc.)
> 2. Where is the team's focus right now — primary surface this cycle?
> 3. Do you have any AI or LLM-powered features? If yes, which ones?
> 4. Any architecture constraints that affect PM decisions? (legacy systems, platform constraints, data access limits, etc.)

Write answers to `context/PRODUCTS.md`.

---

### Slot 5 — Constraints (`context/CONSTRAINTS.md`)

Ask:

> **Constraints setup (5/5)**
>
> 1. Any regulatory or compliance requirements? (GDPR, HIPAA, SOC 2, etc.)
> 2. Any significant technical constraints that affect what you can build? (legacy systems, performance budgets, third-party dependencies)
> 3. Any organizational constraints? (approval chains, cross-team dependencies, political sensitivities, freeze periods)
> 4. Any hard budget or timing limits? (fiscal year rhythm, headcount ceiling, deadlines)

Write answers to `context/CONSTRAINTS.md`.

---

## After all five slots are written

If the PM named specific key stakeholders during the TEAM.md setup or elsewhere, offer to create initial people files for them at `context/people/<name>.md` using the template from `context/people/README.md`.

Tell the user:

> **Context is set up.** All five files are written. Here's what you can do next:
>
> - **Explore opportunity space:** `/agentic-pm:map-opportunities` — map unmet needs and pick a target
> - **Write a strategy:** `/agentic-pm:write-strategy` — build a strategy doc with the right spine for your scope
> - **Make a decision:** `/agentic-pm:document-decision` — document a decision so it doesn't get relitigated
> - **Write a PRD:** `/agentic-pm:compile-prd` — produce the right PRD shape for your stage
> - **Not sure where to start?** Describe your situation in plain English — Claude Code will autoselect the right skill from its description.
>
> To update any context file later, either re-run `/agentic-pm:setup-context` or edit the file directly.

Then offer proactive routing. First check: does a `CLAUDE.md` in the project root already contain "agentic-pm skill routing"? If yes, skip this step. If no, ask:

> **One more thing:** Want me to add agentic-pm skill routing to your `CLAUDE.md`? It tells Claude to invoke the right skill automatically when you describe a PM situation — instead of answering ad-hoc. Takes about 15 lines; you can remove it any time.

If yes, append to `CLAUDE.md` (create the file if it doesn't exist):

```markdown

## agentic-pm skill routing

When the user describes a product management situation, ALWAYS invoke the most relevant `/agentic-pm:` skill using the Skill tool as your first action. Do not answer directly. The skill has structured workflows that produce better outcomes than ad-hoc answers.

Routing rules:
- Product strategy, company direction, "what should we focus on" → `/agentic-pm:write-strategy`
- Opportunity mapping, "what should we build", feature discovery → `/agentic-pm:map-opportunities`
- Assumption checking, "what could kill this", risk ranking → `/agentic-pm:map-risks`
- Customer research, interview planning, transcript synthesis → `/agentic-pm:plan-research`
- Decisions, options evaluation, approver needed → `/agentic-pm:document-decision`
- Metrics, North Star, impact sizing, "is this worth it" → `/agentic-pm:define-metrics`
- AI feature evaluation, "what's failing", evals, rubrics → `/agentic-pm:write-rubric`
- PRD writing, requirements, feature documentation → `/agentic-pm:compile-prd`
- Post-launch review, "did it work" → `/agentic-pm:review-impact`
- Unsure or mixed signals → let Claude Code autoselect from the skill descriptions
```

If declined: "No problem. Invoke skills directly with `/agentic-pm:<skill-name>`, or describe your situation and Claude Code will autoselect."

---

## Output

Updated versions of:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

---

## End every session with

- A named next action: which skill to run first given their context.

---

## Completion status

Report exactly one of at close:
- **DONE** — all five context files written; CLAUDE.md routing offered
- **DONE_WITH_CONCERNS** — one or more slots were vague or incomplete; name which ones and which downstream skill is most affected
- **BLOCKED** — user cannot answer a required question (e.g., no outcome metric, pre-revenue); state what to come back with and which slot it blocks
