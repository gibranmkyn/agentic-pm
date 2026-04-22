---
name: plan-roadmap
description: "Build a quarterly or half-year roadmap anchored to an outcome metric and linked Opportunity Solution Tree — not a feature list, but a communication artifact that shows what you're betting on and why."
allowed-tools: Read Grep Glob Write Edit
---

# Roadmap — Bets Connected to Outcomes

A roadmap is a communication tool. It records high-conviction bets, links them to outcomes, and signals what you're not doing. Building it before you have a strategy and an OST produces a feature list, not a roadmap. This skill enforces that sequence.

**Discovery-theater safeguard:** Before generating any roadmap artifact, ask if there is a linked OST from `/agentic-pm:map-opportunities`. If none exists, strongly recommend running that skill first. If the PM declines, proceed but tag the output `discovery-unlinked`.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Scan `context/people/` for dependency owners mentioned in `TEAM.md`. If they exist, factor known constraints into sequencing.

**Auto-scan for upstream artifacts:**

Scan `Work/` for relevant upstream artifacts using Glob:
- `Work/discovery/<product>-ost.md` — required (discovery-theater safeguard). If found, load the opportunity tree for grounded roadmap items
- `Work/strategy/<product>-strategy.md` — if found, auto-extract strategic bets. The roadmap must serve the strategy
- `Work/metrics/<product>-measurement-plan.md` — if found, auto-extract the outcome metric and impact sizing

Report what you found in the Plan checkpoint: "Scanning Work/ for upstream artifacts... Found: [list]. Missing: [list]." Don't ask the PM to point you to files that already exist in Work/.

---

## Frameworks this skill loads

- `frameworks/roadmap-planning.md` — spine: planning sequence, three formats (Now/Next/Later, spreadsheet, outcome-linked), confidence scores, "not doing" section
- `frameworks/opportunity-solution-tree.md` — reference: each roadmap item must link to a parent opportunity in the OST
- `frameworks/riskiest-hypothesis-sequencing.md` — add-on: sequencing roadmap items by validation status

Read all frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to understand whether this roadmap is grounded in strategy or is a feature list dressed up with dates.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Is this roadmap a planning tool for your team or a communication tool for stakeholders? The format changes completely depending on which."** *(Roadmap Planning: three formats — Now/Next/Later for teams, outcome-linked spreadsheet for leadership, theme view for external.)* A roadmap trying to be both ends up satisfying neither. If the PM says "both," push: "Which audience sees it first? Start there."

2. **"Do you have a strategy doc or an Opportunity Solution Tree upstream of this? A roadmap without strategy is a feature list."** *(Roadmap Planning: "OKRs before roadmap; any item without OKR connection is a candidate for removal.")* This is the discovery-theater safeguard. If no strategy or OST exists, strongly recommend running those first. If the PM declines, proceed but name the risk: every item on this roadmap will be an assertion, not a bet connected to an outcome.

3. **"Who is demanding this roadmap and what will they do with it? An exec who wants dates is asking a different question than a team that wants priorities."** Surfaces the real audience and their real need. An exec asking for a roadmap often wants a commitment schedule. A team asking for a roadmap wants clarity on what matters. These produce different artifacts. Follow up: "If you hand them this roadmap, what decision does it enable them to make?"

4. **"What was wrong with the last roadmap — commitments missed, scope creep, wrong bets, or did one not exist?"** Surfaces the failure mode this roadmap needs to avoid. If the last roadmap was a list of features that all shipped but didn't move metrics, this roadmap needs outcome anchoring. If commitments were missed, this roadmap needs realistic confidence scores. If there was no last roadmap, ask why — it usually reveals something about the org's relationship to planning.

5. **"Look at the items you're planning to put on this roadmap. How many are customer opportunities you discovered vs. stakeholder requests someone asked for?"** *(OST: "you cannot place a solution without first naming the opportunity above it.")* If most items are stakeholder requests, the roadmap is a political document, not a planning document. That's fine — but name it. A political roadmap needs different handling than a discovery-grounded one.

6. **"What's the one bet on this roadmap you're most uncertain about — and why is it still on the list?"** Surfaces the item most likely to waste the team's time. If the PM can't name an uncertain bet, either everything is validated (unlikely) or the PM hasn't thought critically about confidence levels. *(Roadmap Planning: confidence scores — High, Medium, Low — are honest risk communication.)*

Interview until you can answer: Is this planning or communication? Is there strategy upstream? Who is the real audience? What went wrong last time? Are items grounded in discovery or driven by stakeholders?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the audience, the upstream strategy situation, what went wrong with the last roadmap, the mix of discovery-grounded vs. stakeholder-driven items.
2. **"Here's the approach"** — Roadmap Planning spine, which format to use, whether to build the planning-sequence check first, how to handle unanchored items.
3. **"Here are my concerns"** — no OST or strategy upstream, items not connected to outcomes, audience mismatch, political items masquerading as discovery-driven bets.

Ask: **"Want to adjust before I start building the roadmap?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

One spine: Roadmap Planning (Aakash Gupta) — but format varies by audience.

If not already established in the interview, ask directly:

1. **Do you have an Opportunity Solution Tree or outcome metric to anchor to?** If yes, pull from `Work/discovery/`. If no, strongly recommend running `/agentic-pm:map-opportunities` first. If the PM declines, proceed and tag `discovery-unlinked`.
2. **What time horizon?** Quarter / Half / Year — determines granularity and confidence expectations.
3. **Who is the primary audience?** Team (Now/Next/Later format), leadership (outcome-linked spreadsheet), external stakeholders (high-level theme view). Different audiences need different formats.
4. **Do you have a strategy document and OKRs?** The roadmap is the last step in the planning sequence — mission → vision → strategy → OKRs → roadmap. Without OKRs, the roadmap has no anchor.

---

## Sub-steps

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Establish whether strategy and OST exist upstream before proceeding.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine, the format, upstream gaps, concerns. Wait for PM approval before producing anything.

### Step 3 — Anchor to an outcome

Pull the outcome metric from `GOALS.md` and the linked OST. State it at the top of the roadmap. Every item on the roadmap exists to move this metric.

If there is no outcome metric, stop. Ask the PM: "What metric is the team accountable for moving this period?" A project or feature is not a business outcome. If the PM cannot name one, go to `/agentic-pm:define-metrics` first.

### Step 4 — Pull the planning sequence check

Before building the roadmap, confirm what's in place:

| Layer | Status |
|---|---|
| Mission (why team exists) | Present / Missing |
| Vision (what success looks like) | Present / Missing |
| Strategy (how we win) | Present / Missing |
| OKRs (what to achieve this period) | Present / Missing |
| Roadmap (high-conviction bets) | → Building now |

Items missing above "OKRs" mean the roadmap has no foundation. Name what's missing and offer to route upward before proceeding.

### Step 5 — Pick the roadmap format

| Format | Best for |
|---|---|
| **Now / Next / Later** | Engineering and design team; avoids date-over-promising; emphasizes discovery |
| **Outcome-linked spreadsheet (201 Roadmap)** | Leadership; shows OKR impact estimate per item, annualized revenue, dependencies |
| **Theme view** | External stakeholders; high-level; no dates or specifics |

If the PM has multiple audiences, they may need more than one format. Build the team-facing format first; derive the others from it.

### Step 6 — For each roadmap item: link to a parent opportunity

This is the quality bar that prevents the roadmap from becoming a stakeholder gift list. For every item on the roadmap, the PM must be able to name:
- Which opportunity in the OST this addresses
- Which outcome metric it moves and by what estimated magnitude
- What the confidence level is (High / Medium / Low — see definitions below)

Items that can't be traced to a parent opportunity are one of two things: a stakeholder request that bypassed discovery, or a solution looking for a problem. Name this when it happens — don't silently accept unanchored items.

If items consistently lack parent opportunities, tag `roadmap-items-unanchored`.

### Step 7 — Add confidence scores

| Level | What it means |
|---|---|
| **High** | Validated — user research backs it; prior experiments succeeded; assumption map green |
| **Medium** | Explored but not validated — we understand the problem, haven't tested the solution |
| **Low** | Hypothesis — opportunity is real, solution is uncertain |

Confidence scores are honest risk communication, not weakness. A roadmap where everything is "High" is a roadmap where nobody is being honest. Low-confidence items are where `/agentic-pm:map-risks` should run next.

### Step 8 — Identify dependencies and sequencing constraints

For each item:
- What cross-team dependencies exist? (infra, legal, design, data platform)
- Which items must complete before others can start?
- Does the sum of OKR impact estimates from all items exceed the OKR target by >10%? (Buffer for slippage — things always slip.)

### Step 9 — Add the "what we're NOT doing" section

Explicitly name what's falling off the roadmap this period and why. One line per dropped item: "X — deprioritized because it doesn't connect to the Q3 outcome metric; revisit in Q4 planning."

This section does three things: communicates prioritization, prevents "I thought we were doing X" surprises, and gives stakeholders a place to look before re-raising dropped items.

### Step 10 — Self-validate

Before presenting the roadmap, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the roadmap.

### Step 11 — Produce the roadmap artifact

Structure:
- Outcome metric at the top (the one thing the roadmap exists to move)
- Period and audience
- Roadmap items with: parent opportunity, OKR impact estimate, confidence score, owner, dependencies
- "Not doing this period" section
- Confidence legend

---

## Quality bar

Before finalizing the roadmap:

- [ ] Outcome metric stated at the top — *Roadmap Planning: "OKRs before roadmap; any item without OKR connection is a candidate for removal"*
- [ ] Every roadmap item links to a parent opportunity in the OST — *OST: "you cannot place a solution without first naming the opportunity"*
- [ ] Confidence scores present on every item — *Roadmap Planning: honest risk labeling*
- [ ] "Not doing" section populated — *Roadmap Planning: "what we're NOT doing communicates prioritization"*
- [ ] Time horizon explicit (Q / H / Y) — *Roadmap Planning*
- [ ] Dependencies mapped — *Roadmap Planning: 201 Roadmap includes dependency mapping*
- [ ] Sum of OKR impact estimates > target by ≥10% — *Roadmap Planning: "things always slip"*

---

## Tag propagation

- No linked OST when roadmap is created → tag `discovery-unlinked`
- Items without parent opportunity in OST → tag `roadmap-items-unanchored`
- No outcome metric at the top → tag `roadmap-outcome-missing`

---

## Handoffs

**Upstream:**
- `/agentic-pm:map-opportunities` — OST provides the parent opportunities every item must link to (strongly recommended before this skill)
- `/agentic-pm:define-metrics` — impact sizing per roadmap item; OKR impact estimates

**Downstream (offer, not auto-chain):**
- `/agentic-pm:compile-prd` — roadmap items become PRD inputs; the roadmap is the planning artifact, the PRD is the build spec
- `/agentic-pm:map-risks` — low-confidence roadmap items need assumption validation before the team commits to building

---

## Output

`Work/discovery/<product>-roadmap-YYYY-MM-DD.md`

Contents:
- Outcome metric
- Time horizon and audience
- Planning sequence status (which upstream layers are in place)
- Roadmap items table (item, parent opportunity, OKR impact, confidence, owner, dependencies)
- "Not doing this period" section
- Tags applied (if any)

---

## End every session with

- The highest-confidence item — that's the first thing the team should build
- The lowest-confidence item that's still on the roadmap — that's the first assumption to validate with `/agentic-pm:map-risks`
- If no OST exists: "Every item on this roadmap should trace to a customer opportunity. Run `/agentic-pm:map-opportunities` to build the OST — it will make every future roadmap conversation sharper."

---

## Completion status

Report exactly one of at close:
- **DONE** — roadmap written, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — roadmap written but tags applied (list each: `discovery-unlinked`, `roadmap-items-unanchored`, `roadmap-outcome-missing`); state what must be resolved before the team commits to the roadmap
- **BLOCKED** — cannot build a grounded roadmap; state what is missing (no outcome metric, no OKRs)
- **NEEDS_CONTEXT** — audience or time horizon not established; ask directly
