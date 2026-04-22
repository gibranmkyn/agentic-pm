# Interview-First Skill Protocol

**Status:** cross-cutting design principle. Applies to every agentic-pm skill.

**Origin:** Observation from 1,500+ hours of Claude Code usage (Hannah Stulberg pattern): the most productive sessions spend more time being questioned by Claude than questioning it. The tool is a multiplier — vague input × powerful model = confidently wrong output at scale. Precise planning × powerful model = work that would take a team of three an entire sprint.

---

## The principle

**Slow the planning down to speed the output up.**

Every skill session has three phases. The first phase is where most of the value is created. The artifact is residue of good thinking — the interview is the thinking.

### Phase 1 — Discovery interview (the bulk of the session)

Before producing any artifact, interview the PM. The goal is not to collect information — it's to sharpen the PM's own thinking. Push on reasoning, challenge assumptions, surface angles they haven't considered.

**Rules:**
- Read all 5 context files first. Don't ask what you can read.
- Questions should challenge, not just collect. "What's driving the timing?" not "What's your product name?"
- Follow up. Don't accept the first answer if it's vague. "You said retention is the priority — what specifically changed that made retention more important than acquisition this quarter?"
- Name what's missing. "You haven't mentioned competitors. Is that because there aren't any, or because you haven't looked?"
- Surface the fear. "What's the version of this that fails? What does that look like?"
- Use the frameworks to ask informed questions. If the PM is writing a strategy and hasn't named a trade-off, the Strategy Kernel says that's a red flag — ask about it.
- 5–10 questions minimum before proposing a plan. More if the situation is ambiguous.

**What the interview is NOT:**
- A requirements-gathering checklist
- A form to fill out
- A gate to pass before getting to the "real" work
- An interrogation — the tone is coaching, not cross-examination

### Phase 2 — Plan checkpoint

After the interview, propose a plan. One screen. State:
1. "Here's what I heard" — reflect the PM's situation back to them in 2–3 sentences
2. "Here's the approach I'd take" — which spine, what scope, what add-ons, what I'm leaving out and why
3. "Here are my concerns" — anything from the interview that felt unresolved, any framework checks that might fail, any gaps in the evidence

Ask: "Want to adjust before I start?"

Do not produce any artifact until the PM has confirmed the plan. A PM who reviews and corrects a plan produces dramatically better output than one who reviews and corrects a draft.

### Phase 3 — Execute with checkpoints

Produce the artifact. Build in natural checkpoints where the PM can redirect:
- After the first major section, pause: "Does this match what you had in mind? I can adjust the depth, scope, or angle before continuing."
- At the quality bar, flag failures as decision points, not blockers.
- At the end, name the single next action and the handoff.

---

## Interview question design

Good interview questions share these traits:

1. **Specific to the skill's job.** A strategy interview asks different questions than a PRD interview. Generic "tell me more" doesn't count.
2. **Framework-grounded.** If the Strategy Kernel says "bad diagnosis is aspirational, good diagnosis quantifies the gap" — the interview question is: "You said the diagnosis is 'we're not growing fast enough.' Can you quantify the gap?"
3. **Challenge the framing.** "You're asking me to help you write a PRD. But reading your context, it sounds like the decision about whether to build this hasn't been made yet. Should we start with `/agentic-pm:decisions` instead?"
4. **Surface the audience.** "Who is the most skeptical reader of this document? What will they push back on?"
5. **Name what's missing.** "You've described the upside. What happens if this doesn't work? What's the cost of being wrong?"
6. **Time-aware.** "What's driving the timeline? Is this a real deadline or a self-imposed one? Because the approach changes."
7. **Push past the first answer.** "You said users want better search. What specifically did they say? Was that their word or yours?"

### Bad interview questions (avoid these)

- "What's your product?" — read the context file
- "Tell me about your goals" — read GOALS.md
- "What framework do you want to use?" — users don't think in framework names; that's the skill's job
- "Is there anything else I should know?" — too passive; name what you think is missing
- "Are you sure?" — challenges without substance; say what you're worried about

---

## Example: how this changes a skill session

### Before (current pattern — sprint-first)

```
PM: I need to write a strategy for H2.
Skill: What's your scope? (Product lead.) What's your audience? (Leadership.) 
       What's your time horizon? (Year.)
Skill: → Rumelt Kernel spine selected. Producing strategy document...
[Claude writes for 5 minutes, produces a 3-page strategy doc]
PM: This isn't right. It doesn't address the competitive threat from [X].
PM: Also the diagnosis is too generic.
PM: [Spends 45 minutes editing Claude's output]
```

### After (interview-first)

```
PM: I need to write a strategy for H2.
Skill: Before I start writing — a few questions to make sure I get this right.

  1. What's driving the timing? Why H2, why now?
  2. I see from your context that you're growth-stage B2B SaaS. Who's the 
     most skeptical reader of this strategy — your CEO, the board, or eng?
  3. What's the current strategy, even if it's implicit? Every team has one.
  4. What competitive threat are you most worried about that isn't in your 
     COMPANY.md context?
  5. If this strategy succeeds, what does the world look like in 12 months?
  6. What bet are you afraid to make explicit in this document?
  7. You haven't mentioned pricing or business model. Is that because it's 
     stable, or because it's too contentious to write down?

[PM answers for 15-20 minutes. Claude follows up on vague answers.]

Skill: Here's what I heard:
  - You're writing this for the board, not the team — that changes the 
    shape (narrative > operational detail)
  - The real diagnosis is market compression from [competitor] eating your 
    mid-market segment — not "we're not growing fast enough"
  - The bet you're afraid to name: killing the self-serve tier to focus 
    upmarket
  
  I'd use the Rumelt Kernel spine. The diagnosis will quantify the mid-market 
  compression. The guiding policy will force a position on self-serve. I'll 
  add the Positioning block since this is board-facing.
  
  Concern: your GOALS.md still has self-serve activation as a leading 
  indicator. If the strategy kills self-serve, we need to flag that conflict.
  
  Want to adjust before I start?

PM: Yes — good catch on the goals conflict. Let's address that in the doc.

[Claude produces a strategy doc that's right the first time.]
```

---

## How to add this to a skill

Every skill's `## Step-by-step flow` should begin with:

```
1. **Discovery interview.** Read context files. Interview the PM using the 
   questions in § Discovery interview (below). Push on vague answers. Follow 
   up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the spine you'd pick, scope, 
   concerns. Wait for PM approval before producing anything.
3. [existing sub-steps continue here]
```

And each skill should have a `## Discovery interview` section with 5–8 skill-specific probing questions, grounded in the frameworks the skill loads.

---

## Applying this to future skill development

When speccing a new skill:
1. Write the discovery interview questions **before** the sub-steps. If you can't write good interview questions, the skill's job isn't clear enough.
2. Test the questions: would a PM's answers to these questions meaningfully change the artifact? If not, the questions are too generic.
3. Ground at least 2 questions in the skill's frameworks — these are the questions the PM wouldn't think to ask themselves.
4. Include at least 1 "reframe" question that challenges whether the PM is using the right skill at all ("You're asking for a PRD, but it sounds like the decision hasn't been made yet").

---

*The tool is a multiplier. Multiply vague input by a powerful model, you get confidently wrong output at scale. Multiply precise thinking by a powerful model, you get work that would have taken a team of three an entire sprint.*
