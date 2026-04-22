---
name: prioritize-backlog
description: "Rank a set of features, experiments, or tasks into a defensible ordered list — using DRICE for roadmap items with financial models, ICE for early-stage or data-sparse decisions, or LNO for personal PM workload."
allowed-tools: Read Grep Glob Write Edit
---

# Prioritize — A Defensible Ranked List

Too many things to work on. This skill produces a ranked list you can share — not gut feel dressed up as data, not a RICE score nobody believes. The spine autoselects based on your situation: DRICE when you need a financial model, ICE when you need a quick directional sort, LNO when you're managing your own time.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Also read upstream artifacts when present:
- `Work/discovery/<product>-ost.md` (OST — opportunities are the natural candidates for prioritization)
- `Work/metrics/<product>-measurement-plan.md` (outcome metrics and impact sizing)

---

## Frameworks this skill loads

- `frameworks/drice.md` — spine option 1: two-stage RICE + financial modeling for roadmap items (Darius Contractor)
- `frameworks/ice-scoring.md` — spine option 2: rapid scoring with evidence-explicit Confidence dimension (Itamar Gilad)
- `frameworks/lno-framework.md` — spine option 3: personal task categorization as Leveraged / Neutral / Overhead (Shreyas Doshi)

Read all three frameworks before running the session. The spine is chosen after asking the PM the up-front questions.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to understand whether the PM needs a real ranking or a defensible artifact, and whether the data exists to produce either.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Is everything on this list actually a candidate, or are some items already decided — by an exec, a commitment, a dependency?"** Surfaces political pre-filtering. If three of the ten items are already committed, the PM isn't prioritizing ten things — they're prioritizing seven. Name the committed items and remove them from the scoring. Scoring items the PM can't actually deprioritize wastes everyone's time and distorts the ranking.

2. **"What's been tried before to prioritize — gut feel, HiPPO, a previous framework, nothing?"** Surfaces the baseline. If the PM has been prioritizing by gut and it's working, the value here is making the reasoning explicit and shareable — not replacing it. If HiPPO is the current method, the ranked list needs to be defensible enough to challenge the highest-paid person's opinion. *(DRICE: "the financial model makes the ranking defensible to leadership.")*

3. **"Do you need a defensible ranking to share with stakeholders, or genuine clarity for yourself about what to do first?"** These are different jobs. A ranking for stakeholders needs explicit methodology, cited evidence, and a format leadership will read. A ranking for the PM needs honest assessment of uncertainty and a clear first move. *(ICE Scoring: "Confidence requires evidence citation — enthusiasm is not evidence.")*

4. **"What happens to the items that fall off the list — do they go away permanently, come back next quarter, or haunt you as zombie requests?"** Surfaces the organizational pattern. If deprioritized items always come back, the PM needs a "not doing" section that explicitly addresses why — otherwise they're re-litigating the same list every cycle. Follow up: "Who brings them back? That stakeholder needs to be part of the prioritization conversation."

5. **"Does the data actually exist to score these items, or will the scores be educated guesses?"** *(ICE Scoring: "score Confidence against actual evidence, not enthusiasm"; DRICE: "pull real analytics data.")* If funnel data doesn't exist, DRICE will produce impressive-looking numbers built on assumptions. ICE with honest Confidence scores is better than DRICE with fabricated analytics. Name what you know vs. what you're guessing.

6. **"What's the cost of getting this ranking wrong — a wasted sprint, a wasted quarter, or a strategic miss?"** Calibrates how much rigor to apply. A wasted sprint is recoverable. A wasted quarter with 8 engineers is not. The stakes determine whether ICE quick-sort is sufficient or DRICE deep estimation is worth the investment.

Interview until you can answer: Are all items genuinely open? What's the decision audience? Does data exist? What's the cost of getting it wrong? Will deprioritized items stay dead?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — the real candidate list (minus pre-decided items), the data quality, the audience, the stakes.
2. **"Here's the approach"** — which spine (DRICE / ICE / LNO) and why, how many items to score, what data to use vs. estimate.
3. **"Here are my concerns"** — pre-decided items on the list, data gaps that will make scores unreliable, stakeholder who will override the ranking anyway.

Ask: **"Want to adjust before I start scoring?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Three options — ask the PM to pick based on the situation, then recommend:

| Situation | Recommended spine |
|---|---|
| Prioritizing a feature roadmap with real funnel analytics | **DRICE** |
| Quick sort of a large idea list; sparse data; early-stage | **ICE Scoring** |
| Deciding how to allocate your own time as a PM | **LNO** |
| Growth experiments with declining win rate (< 70%) | **DRICE** |
| Any situation before funnel analytics exist | **ICE Scoring** |

If not already established in the interview, ask directly:

1. **Are you prioritizing features for a roadmap, experiments to run, or tasks for yourself?** This determines which spine applies.
2. **How much data do you have on these items?** Real analytics (funnel conversion rates, user counts, revenue numbers) → DRICE. Directional estimates only → ICE.
3. **Do you need a defensible financial model, or a quick directional sort?** Leadership presentation with resource commitments → DRICE. Internal planning with the team → ICE.

If the answer is personal time management, go directly to LNO — no further questions needed.

---

## Sub-steps — All spines

### Step 1 — Discovery interview

Read context files. Interview the PM using the questions in the Discovery interview section above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan. Establish whether all items are genuinely open and whether data exists to score them.

### Step 2 — Plan checkpoint

Propose: what you heard, the spine you'd pick, data quality, concerns. Wait for PM approval before producing anything.

---

## Sub-steps — DRICE spine

### Stage 1 — RICE fast screening

List all candidate items. Everything goes on the list — no pre-filtering. Ask: what are you considering but not sure about? Those go on the list too.

Score each on four dimensions with T-shirt sizes (S/M/L):
- **Reach:** What percentage of users would experience this?
- **Impact:** If it works, how much does it move the target metric?
- **Confidence:** How likely is it to work? What's your prior?
- **Effort:** How many weeks of engineering?

Formula: `Score = (Reach% × Impact% × Confidence%) / Weeks of effort`

Sort descending. Take the top 2× as many items as you can build this period — this is the DRICE shortlist. Review suspicious scores with the PM before locking in.

### Stage 2 — DRICE deep estimation (30 min per item)

For each shortlisted item:

1. **Hypothesis:** What will change and by how much? State a specific number: "improve free-to-paid conversion by 2.7%, generating $540k/year." Vague hypotheses hide weak ideas.
2. **Impact estimate (PM-owned):** Pull real analytics data. Build a bottom-up model: current conversion × user count × revenue per conversion = dollar impact of a 1% improvement.
3. **Engineering estimate (engineer-owned):** Have an engineer review the PM's hypothesis and estimates. This step regularly reveals ideas that are far simpler or harder than estimated.
4. **Non-engineering overhead:** Design, legal, marketing. Usually secondary, but note it.

Result: every shortlisted item has a specific expected annual revenue number. Sort by that number.

---

## Sub-steps — ICE Scoring spine

### Step 1 — List all candidates

Everything goes on the list. No pre-filtering — filtering is what ICE is for.

### Step 2 — Score each on three dimensions (1–10)

| Dimension | What to score | Low (1–3) | High (8–10) |
|---|---|---|---|
| **Impact** | If this works, how much does it move the goal? | Marginal | Order-of-magnitude |
| **Confidence** | How sure are you it will work? | Wild guess | Strong evidence from research or experiments |
| **Ease** | How little effort does this require? | Months | Hours |

**Confidence requires evidence citation.** Any score above 5 should name the specific evidence backing it: "7 of our last 8 user interviews showed this pain" or "we ran a similar experiment last year and saw 15% lift." Enthusiasm is not evidence.

### Step 3 — Multiply to get ICE score

`ICE = Impact × Confidence × Ease`

Sort descending. High-scoring items run first.

### Step 4 — Sanity check the top items

Does the top item feel right? If not, name which assumption is driving it. Often a Confidence score is inflated or an Impact score is optimistic. Adjust the assumption, not the gut feeling.

### Step 5 — "Not doing" cut

Explicitly name what's falling off the list and why. One line per dropped item. This is not optional — naming what you're not doing is as important as naming what you are.

---

## Sub-steps — LNO spine

### Step 1 — List everything on your plate

Every recurring meeting, every project, every stakeholder ask, every task. Nothing is pre-filtered.

### Step 2 — Classify each as L, N, or O

- **Leveraged (L):** If you spent 10x as long on this, would the outcome be dramatically better? Yes = Leveraged.
- **Neutral (N):** Important, standard impact. Adequate effort is the right call.
- **Overhead (O):** Little or no impact on outcomes that matter. Say no, delegate, or don't do it.

### Step 3 — Protect Leveraged time

Look at where L items sit in your calendar. If they're scheduled for late Friday or squeezed between N work, block protected time for them first.

### Step 4 — Name the Overhead items you're going to cut

Apply the test: "If I didn't do this, what bad thing would actually happen?" If the answer is "nothing" or "someone would be mildly inconvenient," it's Overhead. Name how you're going to stop doing it: say no, delegate, or simply de-schedule.

---

## Self-validate (all spines)

Before presenting the priority list, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the ranked list.

Produce the artifact at `Work/discovery/<feature-area>-priority-YYYY-MM-DD.md`.

---

## Quality bar

Before finalizing the prioritized list:

- [ ] All candidate items listed before scoring — no pre-filtering — *DRICE: "filtering is what the framework is for"; ICE: "everything goes on the list"*
- [ ] Chosen spine applied consistently to all items — *consistency is the point*
- [ ] DRICE: real analytics data used in impact models (not T-shirt sizes for Stage 2) — *DRICE: "pull real analytics data"*
- [ ] ICE: Confidence scores cite specific evidence (not enthusiasm) — *ICE Scoring: "score Confidence against actual evidence, not enthusiasm"*
- [ ] Assumptions named for top 3 items — *know what your ranking depends on*
- [ ] "Not doing" items explicit with one-line reason each — *Roadmap Planning: "what we're NOT doing communicates prioritization"*
- [ ] LNO: L tasks identified and protected time blocked — *LNO: "most PM time disappears into N and O work"*

---

## Tag propagation

- Items pre-filtered before scoring → tag `prioritization-cherry-picked`

---

## Handoffs

**Upstream:**
- `/agentic-pm:map-opportunities` — OST opportunities are the natural candidates; use the OST as the input list for DRICE or ICE

**Downstream (offer, not auto-chain):**
- `/agentic-pm:plan-roadmap` — ranked list feeds the roadmap; top items become the big rocks
- `/agentic-pm:compile-prd` — top items become PRD inputs
- `/agentic-pm:map-risks` — low-confidence items (low ICE Confidence score, or low DRICE Confidence) need assumption validation before committing

---

## Output

`Work/discovery/<feature-area>-priority-YYYY-MM-DD.md`

Contents:
- Spine used and rationale
- Full candidate list (before scoring)
- Scoring table with all dimensions
- Final ranked list
- Top 3: assumptions named per item
- "Not doing this period" with one-line reason per dropped item
- Tags applied (if any)

---

## End every session with

- The top-ranked item — name which assumption makes or breaks its position. If that assumption is wrong, what falls to first?
- The item most likely to move up when more data is gathered — that's the next research or validation target
- If items were pre-filtered before scoring: "Any item you've already decided not to do should be on the list anyway. Let the framework filter it. Pre-filtering is how the best bets get buried."

---

## Completion status

Report exactly one of at close:
- **DONE** — ranked list produced, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — list produced but tags applied (list each); state what must be addressed before using the ranking to make resource commitments
- **BLOCKED** — cannot proceed; state what is missing (no candidate items, no analytics for DRICE)
- **NEEDS_CONTEXT** — cannot pick a spine; ask the three up-front questions before proceeding
