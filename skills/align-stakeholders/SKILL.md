---
name: align-stakeholders
description: "Map who needs to align on a decision or direction, name each stakeholder's specific objection, run pre-alignment before the big meeting, and produce a communication plan so nothing is a surprise."
allowed-tools: Read Grep Glob Write Edit
---

# Stakeholder — Align Without Constant Back-and-Forth

A stakeholder alignment plan is not a list of people to email. It's a map of who can block the work, what they actually care about, what they'll object to, and when and how you're going to engage them before any high-stakes meeting. The goal is a room full of non-surprises.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Scan `context/people/` for any existing stakeholder dossiers. If people files exist for stakeholders the PM mentions, load them — they contain communication preferences, known positions, and past objections that will sharpen both the discovery interview and the alignment plan.

Also read upstream artifacts when present:
- `Work/decisions/<topic>-decision.md` (SPIDER doc — identifies stakeholder roles in the decision)
- `Work/discovery/<product>-roadmap-YYYY-MM-DD.md` (roadmap — the artifact needing alignment)
- `Work/strategy/<product>-strategy.md` (strategy document — context for stakeholder concerns)

---

## Frameworks this skill loads

- `frameworks/stakeholder-management.md` — spine: stakeholder mapping, invisible org chart, pre-alignment technique, communication plan, political archetypes
- `frameworks/lno-framework.md` — reference: protecting cross-functional coordination time as Leveraged work

Read both frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to understand the real alignment problem — which is rarely what the PM says it is on the first pass.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"What specifically needs alignment — a decision, a strategy, a direction, a resource ask? 'Stakeholder alignment' is not a thing. Alignment toward what?"** Forces specificity. Most PMs who ask for stakeholder help describe the process ("I need to align people") instead of the substance ("I need the CTO to approve moving two engineers off infra to work on this feature"). The substance determines the approach. *(Stakeholder Management: "alignment toward what? One sentence.")*

2. **"Who is the actual blocker — name the person, their title, and their role in this decision. Not 'leadership' or 'the exec team' — one person."** *(Stakeholder Management: "name roles, not just 'leadership.'")* If the PM can't name the specific person, they haven't diagnosed the alignment problem yet. A plan that targets "leadership" will miss the one person whose objection actually matters. Follow up: "If that one person said yes tomorrow, would this move forward?"

3. **"What is the blocker's real objection — not the stated one, the real one?"** The stated objection is usually reasonable and procedural ("we need more data"). The real objection is usually emotional or political ("this threatens my team's roadmap" or "I don't trust the PM's judgment on this"). If the PM doesn't know the real objection, that's the first thing to find out — before building any alignment plan. Follow up: "What do they stand to lose if your proposal succeeds?"

4. **"What have you already tried — and if nothing, why not? If something, why didn't it work?"** Surfaces whether the PM has been avoiding the conversation or has hit a real impasse. If they've tried nothing, the first action might be a 15-minute 1:1, not a full stakeholder plan. If they've tried and failed, what went wrong reveals what approach to take next. *(Stakeholder Management: "meetings before the meeting — pre-align in low-pressure 1:1s.")*

5. **"Are you looking for alignment or permission? These need completely different approaches."** Alignment means getting people to a shared understanding so they'll actively support the work. Permission means getting a yes from someone with authority. Alignment requires empathy, shared context, and time. Permission requires a clear ask, a tight case, and understanding what the decision-maker needs to feel comfortable saying yes. Mixing them up wastes effort.

6. **"What's the deadline — when does this alignment need to be in place, and what happens if it isn't?"** *(Stakeholder Management: "the timeline drives the plan.")* If the deadline is a board meeting in two days, the plan is a focused 1:1 with the blocker and a tight written summary. If the deadline is next quarter's planning cycle, the plan can include relationship building and incremental trust-building. Follow up: "Is this a real deadline or a self-imposed one?"

Interview until you can answer: What specific thing needs alignment? Who is the actual blocker? What's their real objection? What's been tried? Is this alignment or permission? What's the timeline?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the specific decision or direction, the actual blocker and their real objection, what's been tried, whether this is alignment or permission.
2. **"Here's the approach"** — Stakeholder Management spine, who to map, where to start (the blocker's 1:1 or the invisible org chart), the engagement sequence.
3. **"Here are my concerns"** — blocker's real objection unknown, PM has been avoiding the conversation, timeline too tight for proper pre-alignment, this might be a permission problem disguised as an alignment problem.

Ask: **"Want to adjust before I start building the stakeholder plan?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

One spine: Stakeholder Management (Aakash Gupta + Lenny Rachitsky).

If not already established in the interview, ask directly:

1. **What is the specific decision or direction you're aligning on?** One sentence. "We're aligning stakeholders" is not specific enough — alignment toward what?
2. **Who are the key stakeholders?** Name roles, not just "leadership" or "the team." Specific: CTO, Head of Sales, Legal, VP Customer Success.
3. **Are there known resistors or blockers?** If yes, name them and what you know about their concern. If you don't know, that's the most important thing to find out before the big meeting.
4. **What's the timeline?** When is the high-stakes meeting or decision point? The pre-alignment work has to happen before that, so the timeline drives the plan.

---

## Sub-steps

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Establish the specific decision and the actual blocker before proceeding.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine, the blocker and their objection, the engagement approach, concerns. Wait for PM approval before producing anything.

### Step 3 — Map stakeholders

For each stakeholder, capture four things:

| Stakeholder | Interest level | Influence level | Current stance |
|---|---|---|---|
| (role) | High / Medium / Low | High / Medium / Low | Champion / Neutral / Skeptic / Blocker |

Do not stop at "Champion" or "Supportive." For every stakeholder — even apparent supporters — name what they care about and what could shift their stance. Supporters who feel blindsided by an implementation detail become skeptics fast.

**High influence + high interest = critical path.** These are the people who can block or unblock. They get the most engagement: 1:1 pre-alignment conversations, not just status emails.

**Low influence + low interest = light touch.** A written update is enough.

### Step 4 — Map the invisible org chart

The formal org chart misses who actually shapes opinions. For each critical-path stakeholder, ask: who do they listen to? Who talks to them before big meetings? Who controls their calendar?

Three informal power types:
- **Informal leaders** — people others defer to regardless of title; when they signal approval, others follow
- **Power brokers** — control information flow or resource allocation behind the scenes
- **Gatekeepers** — control access to decision-makers; you need them to reach the people who matter

Map these before planning any outreach. If you're engaging the wrong people, you're not actually pre-aligning.

### Step 5 — Name the objection for every critical-path stakeholder

This is the most important step. For every stakeholder on the critical path, the PM must answer:

*What specifically might they object to or resist, and why?*

Vague: "The CTO is probably fine with this."
Specific: "The CTO will push back on the timeline because she committed her team to the infrastructure overhaul in Q3 and this feature uses the same team."

You cannot manage a vague objection. You can only respond to a specific one. If you don't know a stakeholder's objection, schedule a 15-minute conversation to find out — before the big meeting, not during it.

If a stakeholder's objection can't be named, mark them as "objection unknown" and make finding it the first action in the plan.

### Step 6 — Identify the critical path

Which stakeholders must align for this to move? Name them explicitly. The critical path is the minimum coalition needed — not "everyone should be aligned," but "without X and Y, this can't proceed."

For each critical-path stakeholder: what does alignment look like? What would they need to hear, see, or decide before they're ready to move forward?

### Step 7 — Build the per-stakeholder engagement plan

For each critical-path stakeholder:

- **What they care about most** (be concrete — not "wants success" but "protecting her team's sprint commitments" or "ensuring the data is handled compliantly")
- **Their specific objection or fear** (from step 3)
- **The one thing that would shift them** (what evidence, what change to the proposal, what assurance?)
- **How to engage:** pre-alignment 1:1 conversation, written summary, demo, data review

"Meetings before the meeting" is the rule. Pre-align in low-pressure 1:1s. The big meeting should be low-drama and full of non-surprises.

### Step 8 — Build the communication plan

| Stakeholder | What they need to hear | Format | Timing |
|---|---|---|---|
| (role) | (framing specific to their concerns) | 1:1 / written / deck | (X days before decision meeting) |

Format must match what each stakeholder actually reads and trusts. Some read everything. Most skim headlines and look at charts. Calibrate the format to the consumer, not to what's easiest to produce.

**Always close in writing.** Verbal agreements in pre-alignment conversations disappear. After each 1:1, send a brief follow-up: "Thanks for the conversation — here's my understanding of your concern and how I'm planning to address it." This creates a shared record.

### Step 9 — Self-validate

Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.

### Step 10 — Produce the stakeholder alignment plan

One document, clear enough to share with your manager and revisit before the big meeting.

---

## Quality bar

Before finalizing the stakeholder plan:

- [ ] Every critical-path stakeholder has a specific objection named (not just "supportive") — *Stakeholder Management: "vague can't be managed; only specific can"*
- [ ] Invisible org chart mapped — informal leaders, power brokers, gatekeepers identified — *Stakeholder Management*
- [ ] Pre-alignment 1:1s planned for every critical-path stakeholder — *Stakeholder Management: "meetings before the meeting; no surprises in the room"*
- [ ] Communication format matches each stakeholder's style — *Stakeholder Management: calibrate to the consumer*
- [ ] "What they care about" is concrete (not "wants success") — *Stakeholder Management: "vague is not actionable"*
- [ ] Written follow-up planned after each pre-alignment conversation — *Stakeholder Management: "always close in writing"*
- [ ] Timeline is explicit: pre-alignment work scheduled before decision meeting — *Stakeholder Management*

---

## Tag propagation

- Critical-path stakeholder with no objection named → tag `alignment-objection-unknown`
- No pre-alignment 1:1s planned → tag `alignment-no-premeetings`
- Communication plan is the same format for all stakeholders → tag `alignment-one-size-fits-all`

---

## Handoffs

**Upstream:**
- `/agentic-pm:document-decision` — the SPIDER decision doc identifies stakeholder roles; use it as input to this skill

**Downstream (offer, not auto-chain):**
- `/agentic-pm:compile-prd` — alignment plan feeds the XFN (cross-functional) requirements section; ensures stakeholder concerns are captured in the build spec

---

## Output

`Work/decisions/<topic>-stakeholder-plan-YYYY-MM-DD.md`

Contents:
- Decision or direction being aligned on (one sentence)
- Timeline: decision meeting date, pre-alignment deadline
- Stakeholder map (table: role, interest, influence, current stance)
- Invisible org chart notes (informal leaders, power brokers, gatekeepers)
- Critical path: named stakeholders and what alignment looks like for each
- Per-stakeholder engagement plan: what they care about, specific objection, one thing that would shift them, engagement format
- Communication plan table
- Tags applied (if any)

---

## End every session with

- The single highest-risk stakeholder — the one whose objection, if unaddressed, would block the work
- The first pre-alignment 1:1 to schedule and what question to use to open it
- If any critical-path stakeholder has an unknown objection: "Schedule a 15-minute conversation with them before anything else. You cannot pre-align someone whose concern you don't understand."
- If you learned something new about a stakeholder during this session (objection, position, communication preference), offer to append it to their people file at `context/people/<name>.md`. If the file doesn't exist, offer to create it using the template from `context/people/README.md`.

---

## Completion status

Report exactly one of at close:
- **DONE** — stakeholder plan written, all quality checks passed, pre-alignment conversations scheduled
- **DONE_WITH_CONCERNS** — plan written but tags applied (list each); state what must be resolved before the decision meeting
- **BLOCKED** — cannot proceed; state what is missing (decision not specific enough to identify stakeholders)
- **NEEDS_CONTEXT** — decision or direction not established; ask for the one-sentence description before proceeding
