---
name: Vibe Coding
aliases: [PM Vibe Coding, Vibe Coding for PMs]
author: Lauren Kearney, Kalan Goyal
source_type: article
source: "Lauren Kearney — Vibe Coding for PMs (Twitch livestream, 2026); Kalan Goyal (YouTube GPM) — Leading AI Products with Speed and Orchestration (2026)"
use_when:
  - You have a product idea and want to build a testable demo in hours, not weeks
  - You're a PM who doesn't code but needs to validate an assumption with working software
  - You want to learn what to build by building the smallest believable version
tags: [prototyping, vibe-coding, pm-skills, validation]
---

# Vibe Coding

Using AI tools to turn natural language into runnable prototypes, then iterating based on observed behavior. For PMs: a form of prototyping that accelerates learning by building the smallest believable demo before committing engineering resources.

The input is intent + job to be done. The process is natural language to AI tool to runnable demo. The goal is validation, not polish. The output is learning — what to build, change, or kill.

**Authors:** Lauren Kearney — *Vibe Coding for PMs* (Twitch livestream, 2026); Kalan Goyal (YouTube GPM) — *Leading AI Products with Speed and Orchestration* (2026).

---

## The 4-step framework (Kearney)

### Step 1: Name the job to be done
One sentence, not a feature or persona. Format: "When [user] is in [situation] and wants to [goal], they can [outcome]." If you can't write this sentence, you're not ready to prototype.

### Step 2: Identify the must-be-true assumption
The riskiest, most testable thing about this idea. If this assumption is false, the idea isn't worth building at all.

Requirements for a good must-be-true assumption:
- Observable and measurable (not "users will love this")
- Specific enough to be falsifiable
- Quantitative if possible

This mirrors Teresa Torres's "riskiest assumption test" from *Continuous Discovery Habits*, applied specifically to prototype design.

### Step 3: Build the smallest believable demo
Enough fidelity that users can react realistically. For AI experiences: real prompts, real outputs, minimal UI wrapper, realistic scenarios including edge cases. Disposable by default.

### Step 4: Capture and communicate learnings
Not just the demo outcome — what you tested, what worked, what broke, what failure modes you saw, how you drove to a decision (build / change / kill).

---

## What changes vs. what doesn't

**What changes:** Speed of learning. You move from idea to evidence faster.

**What doesn't change:**
- The production quality bar (security, privacy, accessibility, abuse prevention, reliability)
- The engineering ownership model — engineering owns the production path
- The need for PR reviews, instrumentation, rollback plans, clear ownership
- The need for problem-space work before solution-space work

---

## Guardrails

1. **Vibe code to learn, not to ship.** Validation, not production.
2. **Keep it lightweight.** Disposable by default. No emotional attachment.
3. **Respect the real bar.** Don't skip the security/privacy/accessibility checklist.
4. **Handoff cleanly.** Once something is validated, engineering owns it.

---

## Prototype velocity (Goyal)

Kalan Goyal frames vibe coding as the key enabler of prototype velocity for PMs in the AI era. When a PM can show what they're thinking — even imperfectly — it reduces back-and-forth and drives clarity. The entire team can look at the same interactive thing and collectively say "this feels right" or "let's pivot." This is qualitatively different from a PRD or mockup.

Connection to decision velocity: vibe coding shrinks the loop between idea and evidence. When you can prototype at the speed of thought, your only limit is the quality of your ideas.

---

## Common failure modes

| Failure | Fix |
|---|---|
| Building without naming the must-be-true assumption | Write the assumption before opening any tool |
| Growing the prototype into production code | Mark it disposable on day 1; tech debt compounds fast past trivial |
| Skipping the job-to-be-done sentence | If you can't write one sentence, you're not ready to prototype |
| Testing "do users like this?" instead of the specific assumption | Design the test around the must-be-true assumption, not general appeal |
| Emotional attachment to the demo | The demo exists to be killed. If nothing could kill it, you're not testing. |

---

## When NOT to use it

- You haven't identified the problem yet. Vibe coding is solution-space work. Do discovery first.
- You need production-grade code. Vibe coding produces throwaway artifacts.
- The assumption can be tested without building anything (a conversation, a survey, a data pull would suffice).

---

## Connection to other frameworks

- [AI Prototyping](ai-prototyping.md) — the broader discipline; vibe coding is one workflow within it.
- [Taste at Speed](taste-at-speed.md) — the evaluation function applied after vibe coding produces variants.
- [Foundation Sprint](foundation-sprint.md) — Day 2 of the Foundation Sprint can use vibe coding for the prototype-and-test phase.

---

## Further reading

- Lauren Kearney — *Vibe Coding for PMs* (Twitch livestream, 2026)
- Kalan Goyal — *Leading AI Products with Speed and Orchestration* (YouTube GPM, 2026)
- Andrej Karpathy — coined "vibe coding" (2025)
- YC Startup School — *How to Get the Most Out of Vibe Coding* (2025)

---

*This card is an original synthesis drawing from multiple public sources. For the full treatment, watch Kearney's livestream and Goyal's talk.*
