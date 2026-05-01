---
name: Roadmap Planning
aliases: [Product Roadmap, Now Next Later, 201 Roadmap, Roadmapping]
author: Aakash Gupta
source_type: course
source: "Roadmaps Advanced Techniques (Gupta, 2026); 2025 Product Strategy Playbook (Gupta, 2026)"
use_when:
  - You need to communicate high-conviction bets to leadership, engineering, or external stakeholders
  - Your roadmap is a feature list with no connection to strategy or OKRs
  - You're planning a quarter or half and need to anchor everything to an outcome metric
  - Stakeholders are pitching ideas faster than you can evaluate them — you need a forcing function
tags: [planning, strategy, communication, prioritization]
---

# Roadmap Planning

A product roadmap is a communication tool — a point-in-time record of high-conviction bets that connect to the team's current OKRs. It is not where thinking starts. It is not an execution contract. And it is not a list of features with arbitrary dates attached. The roadmap should be the *last* step in the planning sequence, not the first.

**Author:** Aakash Gupta — *Roadmaps Advanced Techniques* and *2025 Product Strategy Playbook* (2026). See [aakashg.com](https://www.aakashg.com) and *Product Growth*.

---

## The correct planning sequence

Most teams build the roadmap first, then retroactively create strategy and OKRs around pre-chosen items. This produces roadmaps full of ideas that sound good but don't connect to any outcome the team is actually accountable for. The correct order:

1. **Mission** — why does this team exist?
2. **Vision** — what does success look like in 3–5 years?
3. **Strategy** — how do we win, given what we know about the market?
4. **OKRs** — what specifically must we achieve this period to be on track?
5. **Roadmap** — what are the high-conviction big bets that will achieve those OKRs?

If you start at step 5 without doing steps 1–4, your roadmap is a wish list. If you have OKRs but no strategy, your roadmap is a collection of locally-rational bets that may not add up to winning.

---

## Three main formats

### Now / Next / Later

Best for working with engineering and design on immediate execution. Avoids the dates trap — no specific delivery dates means no over-promising to sales and marketing. Emphasizes discovery over delivery. Signals "things change as we learn" rather than "here is a contract."

Good pairing: use Now/Next/Later with the team, and a more detailed spreadsheet for leadership stakeholders.

### Classic Spreadsheet (201 Roadmap)

The format most teams already use — upgrade it with four additions:
- **Numeric OKR impact estimate per initiative** — replace Low/Medium/High with an actual number tied to the OKR target
- **Incremental annualized revenue** — unites all teams on business impact, not feature value
- **Design and research sizing** — not just engineering time; the PM work matters too
- **Dependency mapping** — which cross-team dependencies must resolve before this can ship?

The **301 Roadmap** extends further with themes, tabs per team, and full OKR organization. Start with 201; move to 301 when the team has more than 3 squads.

### Outcome-linked format (2025 AI context)

In fast-moving environments where capabilities shift monthly, a Gantt chart is the wrong format for strategy. The best format in the strategy layer is: objectives, key results, problems to solve, and hypothesized solutions. Gantt charts belong in execution (Jira), not in strategy documents.

---

## Every roadmap item must link to a parent opportunity

This is the single hardest quality bar to maintain. Every item on the roadmap should be traceable to a customer opportunity — a real unmet need surfaced from discovery — and from that opportunity up to the OKR it serves. Items that can't be traced are one of two things: a stakeholder request that bypassed discovery, or a solution to a problem nobody surfaced from customers.

When pressure mounts to add items that can't be traced, name it explicitly: "This item doesn't connect to a known customer opportunity. Before we add it, let's name what opportunity we're solving." Sometimes the opportunity is real but wasn't on the tree. That's fine — add it. But don't skip the check.

---

## Confidence scores

Every roadmap item should carry a confidence level:

| Level | What it means |
|---|---|
| High | Validated — assumption map worked; user research backs it; prior experiments ran |
| Medium | Explored but not validated — we understand the problem, we haven't tested the solution |
| Low | Hypothesis — the opportunity is real but we don't know if this solution will work |

Confidence scores are not a sign of weakness. They're honest risk labeling that helps leadership understand which bets might slip and why. A roadmap where everything is "High" confidence is a roadmap where nobody is being honest.

---

## The "not doing" section

Every roadmap needs explicit items in a "what we're NOT doing this period" section. Not because you need to be defensive, but because what you're not doing communicates prioritization as clearly as what you are doing. Without it, every dropped idea looks like an oversight instead of a deliberate choice.

The "not doing" section is also the fastest way to defuse stakeholder pressure: "Yes, that idea is captured here. We're not doing it this half because of X. Here's when we'd revisit it."

---

## Making roadmaps travel

The average stakeholder doesn't care about your product strategy. So the roadmap needs to be designed to travel — to circulate beyond your immediate team and seed alignment further into the org.

What makes a roadmap circulate:
1. **High visual fidelity** — establishes that you've done the thinking; a low-effort slide deck does the opposite
2. **Strong themes** — stakeholders should grasp the big picture in seconds; group by outcome, not by team
3. **Level of detail that demonstrates mastery** — the reader should feel the PM has done the work, not filled in a template

Run a "publicity tour" at quarter or half-start — brief every key stakeholder group, answer questions, then move on. Don't spend more than 5% of your time in a quarter on roadmap communication.

---

## Common failure modes

| Failure | What goes wrong |
|---|---|
| Roadmap is the starting point | Items are pre-chosen; strategy and OKRs are retrofitted around them |
| No outcome metric at the top | Items aren't connected; stakeholders don't know what you're optimizing for |
| Every item is "High" confidence | Nobody is being honest about which bets are risky |
| Huge list of small things | Roadmaps communicate big rocks; execution tracking goes in Jira |
| No "not doing" section | Every dropped idea looks like an oversight |
| One format for all audiences | Engineering needs Now/Next/Later; leadership needs OKR impact; external needs high-level themes |

---

## Recommended operating model

- **3 big rocks per engineering squad** — no more. More than 3 means nothing is actually a priority.
- **Sum of impact estimates > OKR target by 10%** — items always slip; buffer this in.
- **Update when you learn, not quarterly** — treat mid-period pivots as learning signals, not failures.
- **Different roadmaps for different audiences** — not different strategies; different communication formats.
- **Analytics owns impact sizing** — when analysts are measured on forecast accuracy, rigor improves dramatically. Teams start discovering before the quarter that their roadmap can't hit OKRs.

---

## Why RICE fails (Sachin Rekhi's critique)

Score-based prioritization frameworks like RICE produce three consistent failures:
- **False rigor** — the scores are subjective guesses dressed as data
- **Incremental bias** — high-confidence, low-effort work always beats ambitious bets structurally
- **Strategic blindness** — nothing in RICE checks whether the high-scoring item actually matters to the company's direction

The roadmap is not a RICE output. It's the product of a strategy conversation that already filtered for strategic relevance, which RICE cannot do.

---

## When NOT to use it

- You have no outcome metric to anchor to. Get one first — without it, the roadmap is arbitrary.
- You're pre-product and still in discovery. A roadmap implies conviction you don't have yet.
- You're using it to manage sprint tasks. That's what Jira is for.

---

## Further reading

- Aakash Gupta — *Roadmaps Advanced Techniques* (Product Growth, 2026)
- Aakash Gupta — *2025 Product Strategy Playbook* (2026)
- Aakash Gupta — *How to Create Within-Company Viral Roadmaps* (2024)
- Teresa Torres — *Continuous Discovery Habits* (Product Talk, 2021) — the discovery infrastructure that makes roadmaps grounded

---

*This card is an original synthesis drawing from Aakash Gupta's roadmap frameworks. For the full treatment, read the primary sources.*
