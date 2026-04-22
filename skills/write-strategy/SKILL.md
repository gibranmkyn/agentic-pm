---
name: write-strategy
description: "Write a product strategy and get buy-in on it. Use when you need to produce a strategy doc for your product, area, or company — with the right spine for your scope and audience."
allowed-tools: Read Grep Glob Write Edit
---

# Product Strategy — Write a Strategy That Gets Buy-In

Produces a strategy document with an autoselected spine (Rumelt Kernel, Six Dimensions, or Strategic Narrative) matched to your scope and audience.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

If the PM names a specific skeptical reader during the discovery interview, check `context/people/` for their dossier. Use known objections to anticipate pushback in the strategy doc.

---

## Frameworks this skill loads

**Primary spines:**
- `frameworks/strategy-kernel.md` — Rumelt; for product leads with existing traction
- `frameworks/six-dimensions-of-product-strategy.md` — Rekhi; for founders / CPOs / new product bets
- `frameworks/strategic-narrative.md` — Raskin; for company-level / GTM-coupled / narrative-heavy contexts

**Add-on frameworks (loaded if conditions are met):**
- `frameworks/product-positioning.md` — Dunford; loaded only for external/GTM audience
- `frameworks/feature-portfolio-strategy.md` — Reforge; loaded only for mature products with many features

Read the selected spine and any applicable add-ons before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to sharpen the PM's thinking, not collect form fields.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"What's driving the timing? Why does this strategy need to exist now — not 3 months ago, not next quarter?"** Surfaces real urgency vs. artificial deadline. Changes how deep the diagnosis needs to go.

2. **"What's the current strategy, even if it's implicit? Every team has one."** Prevents building in a vacuum. Names the status quo the new strategy replaces — or reveals there isn't one, which is its own diagnosis.

3. **"Who is the most skeptical reader of this document? What will they push back on?"** Surfaces the real audience, not the stated one. A strategy the CEO will read is shaped differently than one the team will read. *(Strategy Kernel: the audience determines whether you need a narrative arc or an operational plan.)*

4. **"What trade-off are you afraid to make explicit in writing?"** *(Strategy Kernel: "'Grow and increase margins' — coherent actions force the resolution." If there's no trade-off, there's no strategy.)* Follow up: "If you had to kill one of your current initiatives to fund this strategy, which would it be?"

5. **"What competitor move or market shift is this responding to? If nothing external — what internal problem?"** Grounds the diagnosis in reality. A strategy that doesn't respond to a specific challenge is a wish list, not a strategy.

6. **"If this strategy succeeds, what does the world look like in 12 months? Be specific — revenue, user behavior, market position."** Tests whether the PM has a clear picture of the destination. Vague answers ("we'll be the market leader") need follow-up.

7. **"What's the version of this that fails? What does failure look like?"** Surfaces unexamined risks. If the PM can't articulate failure, the strategy hasn't been stress-tested.

8. **"Reading your GOALS.md, [specific goal] is your team's target this cycle. Does this strategy serve that goal, or are you proposing to change it?"** Context-aware challenge. Catches misalignment between stated goals and the strategy being written.

Interview until you can answer: What is the real diagnosis? Who is the real audience? What trade-off is being made? What would make this strategy fail?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2–3 sentences. Name the diagnosis, the audience, the trade-off.
2. **"Here's the approach"** — which spine you'd pick and why, what add-ons apply, what you're leaving out.
3. **"Here are my concerns"** — anything unresolved from the interview. Framework checks that might fail. Conflicts between the strategy and existing goals or constraints.

Ask: **"Want to adjust before I start writing?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Based on the interview, determine the spine. If not already clear, ask directly:
1. What is your scope? (Area PM / product lead / CPO / founder / company-level)
2. Who is your audience? (Team only / leadership / board / external / GTM-coupled)
3. What is the time horizon? (Quarter / year / multi-year)
4. Does an existing product with real traction exist, or is this a new bet?

Pick spine:
- **Founder / CPO / new product bet / no existing traction** → Six Dimensions of Product Strategy (PMF Narrative format; all 6 dimensions as explicit hypotheses)
- **Product lead / area lead with existing traction, internal audience** → Rumelt Kernel (Diagnosis → Guiding Policy → Coherent Actions)
- **Company-level / GTM-coupled / narrative-heavy / external audience** → Strategic Narrative (five-step: shift → stakes → promised land → obstacles → magic gifts)

When signals are mixed, name the top 2 and ask the PM to confirm.

---

## Situation-triggered add-on blocks

- **Positioning block** (Dunford's 5-step method) — appended when audience is external or the strategy is GTM-coupled. Not included for purely internal strategy; positioning work on an internal-only strategy is wasted effort.
- **Feature Portfolio block** (TARS analysis) — appended when scope is "existing mature product with many features" and the strategy requires making portfolio investment decisions. Not included for new bets or single-feature strategies.

---

## Step-by-step flow

1. **Discovery interview.** Read context files. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the spine you'd pick, scope, concerns. Wait for PM approval before producing anything.
3. **Detect spine and add-on conditions** from the interview. State the selected spine in one line before proceeding.
2. **Diagnosis / Problem definition (all spines):**
   - Rumelt: articulate what's actually hard — the specific challenge with data. Push back on vague diagnoses ("we're not growing fast enough" is not a diagnosis).
   - Six Dimensions: write out all 6 hypothesis dimensions; identify which have low conviction.
   - Narrative: identify the paradigm shift. Test: can a skeptic agree the shift is happening before caring about your product?
3. **Guiding policy / Strategic direction:**
   - Rumelt: the directional commitment. Name what it rules out. No lists of 17 priorities.
   - Six Dimensions: use Riskiest Hypothesis Sequencing to sequence validation — which dimension has lowest conviction?
   - Narrative: promised land and obstacles. The destination exists with or without the product.
4. **Coherent actions / PMF steps / Magic gifts:**
   - Rumelt: concrete verbs, not adjectives. Each action must address the diagnosis and reinforce others.
   - Six Dimensions: validation plan per riskiest dimension.
   - Narrative: product capabilities as the gifts that slay each obstacle. Match gift to obstacle in order.
5. **Append add-on blocks** if conditions are met (positioning, portfolio).
6. **Self-validate.** Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.
7. **Produce the artifact** at `Work/strategy/YYYY-MM-DD-<product>-strategy.md`.

---

## Quality bar

Before finalizing the artifact:

- [ ] Diagnosis is specific, not aspirational — *Strategy Kernel (Rumelt): "Bad diagnosis: 'We're not growing fast enough.' Good diagnosis quantifies the gap"*
- [ ] Guiding policy has ≤3 bets and real focus — *Strategy Kernel: "A list of 17 priorities is not a guiding policy — it has no focus"*
- [ ] Actions are verbs, not adjectives — *Strategy Kernel: "Coherent actions… must be concrete — verbs, not adjectives"*
- [ ] An explicit trade-off is named — *Strategy Kernel: "'Grow and increase margins' — coherent actions force the resolution"*
- [ ] (Six Dimensions variant) All 6 dimensions are present — *Six Dimensions: "Startups most often fail because they skip one or more dimensions — particularly growth and business model"*
- [ ] (Narrative variant) Paradigm shift comes before the product is introduced — *Strategic Narrative: "The product arrives as the answer to the obstacles, not as the starting point"*

Cite the source concept when flagging a gap.

---

## Tag propagation

- Positioning block declined when audience is external → tag `positioning-skipped`
- Six Dimensions variant: any dimension with unaddressed low conviction → tag `hypothesis-unvalidated-<dimension>`
- No coherent trade-off named → tag `trade-off-missing`

Strongly recommend; never refuse.

---

## Handoffs

- **Upstream:** `/agentic-pm:map-opportunities` (provides market and customer context)
- **Downstream:** `/agentic-pm:map-risks` (riskiest dimension from Six Dimensions → assumption map); `/agentic-pm:plan-research` (riskiest assumption drives research brief)

---

## Output

`Work/strategy/YYYY-MM-DD-<product>-strategy.md`

---

## End every session with

- A named next action: who shares this document with whom, and by when.
- If Six Dimensions was used: "Which dimension will you validate first? That's your next `/agentic-pm:map-risks` session."

---

## Completion status

Report exactly one of at close:
- **DONE** — strategy document written, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — document written but tags applied (list each: `positioning-skipped`, `hypothesis-unvalidated-<dimension>`, `trade-off-missing`)
- **BLOCKED** — cannot write a diagnosis without context; state what's missing
- **NEEDS_CONTEXT** — scope, audience, or horizon not established; state which is missing and why it determines the spine

Escalation: if no diagnosis can be written — only aspirations — name the gap. A strategy without a diagnosis is a wish list.
