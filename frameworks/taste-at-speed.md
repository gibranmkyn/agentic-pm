---
name: Taste at Speed
aliases: [Prototype Evaluation, PM Filtering Skill, 80% Kill Rate]
author: Boris Cherny, Aakash Gupta, Sachin Rekhi
source_type: article
source: "Aakash Gupta — Taste at Speed (Product Growth, 2026); Boris Cherny / Anthropic — prototyping interview (2026); Sachin Rekhi — AI Prototyping (2026)"
use_when:
  - You've built 3-5 prototypes and need a structured way to pick the survivor
  - Your team ships the first thing that works instead of the best thing
  - You want to evaluate prototypes against real product judgment, not gut feel
tags: [prototyping, judgment, taste, evaluation, quality]
---

# Taste at Speed

The ability to evaluate working software fast, kill most of it, and ship the survivors. A filtering function, not an acceleration function. The 80% kill rate is the whole point.

Without taste, speed just means you build the wrong thing faster — a feature factory on steroids. When everyone has equivalent AI tools, the differentiator is the human judgment applied on top.

**Authors:** Aakash Gupta — *Taste at Speed* (Product Growth, 2026); Boris Cherny / Anthropic — prototyping interview (2026); Sachin Rekhi — AI Prototyping workflow (2026).

---

## The 5 lenses for evaluating prototypes

Run all 5 before shipping anything. Each maps to a different type of failure.

### Lens 1: Problem-Solution Fit
*Did this solve the actual problem, or did it drift to an adjacent easier problem?*

Most prototypes drift. AI takes you to a solution too quickly. Your brain says "done." That instinct burns the entire advantage of prototyping. The fix: multiple filter passes — self, close team, broader team, internal users, external users. Each catches what the previous missed.

### Lens 2: Interaction Cost
*How many clicks/steps to core value?*

Benchmark against the user's current workflow. If your AI-powered search adds 2 clicks over the existing filter sidebar, users stick with the sidebar. Prototypes reveal this; specs never do.

### Lens 3: Edge Case Exposure
*What breaks when the user does something unexpected?*

Find edge cases in 10 minutes of clicking through the prototype vs. imagining them in a conference room for hours. Products have hidden surprises everywhere. Find them before launch, not after.

### Lens 4: Technical Debt Signal
*Is this prototype disposable or shippable?*

The PM needs to know the difference between "this prototype taught us what to build" and "this prototype IS what we should build." Ask your engineer: "If we ship this, what breaks in 6 months?"

### Lens 5: Business Model Alignment
*Does this feature help make money, retain users, or expand the market?*

A prototype can be delightful and strategically useless. If finance can't evaluate the investment, this lens failed.

---

## How to apply it

1. **Build 3-5 variants first.** Taste at Speed requires comparison. Evaluating a single prototype in isolation is not evaluation — it's rationalization.
2. **Run all 5 lenses on each variant.** Score pass/fail per lens, not 1-5 scales.
3. **Force the kill decision.** At least 60-80% of prototypes should die. If everything survives, either the lenses aren't being applied honestly or the variants weren't different enough.
4. **Spec the survivor.** The PRD comes after the prototype, not before. It covers edge cases, error states, tracking, and engineering handoff — the 10% the prototype didn't cover.

---

## Why speed compounds into a taste gap

A PM who evaluates 15 prototypes per week builds judgment faster than one who reviews one spec per month. After 6 months: experience gap turns into taste gap turns into career gap. The reps compound every week.

At Anthropic, before shipping:
- Agent teams: hundreds of versions
- Condensed file view: ~30 prototypes + a month of dogfooding
- Terminal spinner: 50-100 iterations, 80% didn't ship

---

## Common failure modes

| Failure | Fix |
|---|---|
| Evaluating a single prototype in isolation | Build 3-5 variants; comparison is the mechanism |
| Anchoring to the first thing that works | Working software creates gravity — name that bias before evaluation |
| Skipping Lens 4 (technical debt) | Ask engineering before declaring a prototype shippable |
| All 5 survive | Your lenses aren't sharp enough, or your variants aren't different enough |
| Applying taste without speed | The reps matter; one evaluation per month doesn't build judgment |

---

## When NOT to use it

- You only have one prototype. Go build 2-4 more first.
- You're in problem-space work (discovery interviews, opportunity mapping). Taste at Speed is a solution-space tool.
- The decision is already made and you need execution, not more evaluation.

---

## Connection to other frameworks

- [AI Prototyping](ai-prototyping.md) — Taste at Speed is the evaluation step in the prototyping workflow.
- [Vibe Coding](vibe-coding.md) — the build step that produces the prototypes Taste at Speed evaluates.
- [Opportunity Solution Tree](opportunity-solution-tree.md) — the opportunity that justifies the prototype that gets evaluated.

---

## Further reading

- Aakash Gupta — *Taste at Speed* (Product Growth, 2026)
- Boris Cherny / Anthropic — prototyping interview with Gupta (2026)
- Sachin Rekhi — Product Shaping (2026)
- Nadav Abrahami — AI Prototyping Workflow (2026)

---

*This card is an original synthesis drawing from multiple public sources. For the full treatment, read Gupta's original article.*
