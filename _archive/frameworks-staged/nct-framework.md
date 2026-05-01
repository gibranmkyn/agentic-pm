---
name: NCT Framework
aliases: [NCTs, Narrative Commitment Tasks, Narratives Commitments Tasks]
author: Ravi Mehta
source_type: course
source: "Ravi Mehta — Annual Goal Setting (Reforge, 2023)"
use_when:
  - Your team's OKRs are metric-only but the team doesn't yet understand which levers move the metric
  - You need goals that allow committing to learning, not just shipping
  - The 70% OKR stretch bar is creating confusion instead of ambition
tags: [goal-setting, planning, strategy, pm-craft]
---

# NCT Framework

An alternative to OKRs for product team goal-setting. NCTs (Narrative, Commitment, Tasks) address three structural failure modes of OKRs: goals divorced from strategy, forced metric-only commitments regardless of product risk stage, and the 70% success bar that creates ambiguity instead of clarity.

**Author:** Ravi Mehta — *Annual Goal Setting* (Reforge, 2023). See [ravimehta.com](https://ravimehta.com).

---

## The three components

### N — Narrative

The narrative answers *why* the team is working on something, *why now*, and *how it connects to company strategy*. Written in plain prose, not as a bullet list or metric statement.

A good narrative does three things:
1. **Provides context** — what customer problem is this solving, and why does it matter?
2. **Explains why now** — what changed that makes this the right moment?
3. **Ladders to strategy** — how does this connect to the product strategy and company strategy?

Compare a typical OKR objective ("Increase usage of the Saves to Trip feature") to an NCT narrative that explains the customer problem, the timing, and the strategic link. The OKR version has no context. A team given only the OKR version doesn't know *why it matters* and has less agency.

### C — Commitment

A specific, verifiable deliverable the team commits to achieving by the end of the period.

Key design criteria:
- **Objectively verifiable:** the whole team can judge pass/fail without ambiguity at end of quarter
- **100% target:** unlike OKRs with a 70% stretch bar, NCTs target full achievement. The team commits to what it's confident it can deliver.
- **Not necessarily a metric.** Valid commitments include:
  - Shipping a specific feature
  - Completing user research on a defined question
  - Establishing an experimentation infrastructure
  - Documenting the product levers that affect a metric
  - Moving a metric by X% (appropriate at execution-risk stage)

The 70% OKR bar creates a "zone of confusion": mid-quarter debates of "does this count in our 70%?" erode focus. The 100% commitment bar eliminates this — success is binary.

Conservative is right: teams far more commonly over-commit than sandbag. Starting with an achievable commitment builds the track record that earns the right to stretch targets later.

### T — Tasks

A rough list of work the team can begin immediately — a "warm start" to avoid the cold-start problem of a new goal period.

Tasks are a sketch pad, not a contract. Add, remove, replace throughout the quarter. The commitment drives the quarter; tasks are a tool to get moving. The quarter is successful if commitments are achieved even if none of the original tasks were completed as written.

---

## Risk-stage goal setting — the key insight

The appropriate type of commitment depends on where the team sits on the product risk spectrum.

| Risk stage | What the team doesn't know | Appropriate commitment type |
|---|---|---|
| **Understanding risk** | What levers actually move the metric | Complete N experiments; document hypotheses |
| **Dependency risk** | Whether you have the tools/infrastructure | Build the experimentation framework; establish the pipeline |
| **Execution risk** | Whether you can execute given resources | Move metric by X% |
| **Strategic risk** | Whether you have the right strategy | Validate two competing strategic hypotheses |

Forcing a metric-based commitment when the team is in understanding-risk territory is "playing with fire" — the team can't control the outcome. The right commitment at that stage is to *reduce the uncertainty*, not to *move the metric*.

This is the key divergence from OKRs: OKRs implicitly assume all teams are in execution-risk territory. NCTs are explicitly stage-dependent.

---

## NCT vs. OKR comparison

| Issue | OKRs | NCTs |
|---|---|---|
| Strategic context | Missing ("increase X by Y%") | Required (narrative) |
| Valid commitment types | Metric-only by convention | Metrics, deliverables, research, infrastructure |
| Success bar | 70% stretch creates confusion | 100% achievable creates binary clarity |
| Team agency | Low when goal is outside team's control | Higher; teams commit to what they control |
| Warm start | Teams often left cold | Tasks provide a starting list |

---

## Common failure modes

| Failure | Fix |
|---|---|
| Narrative is boilerplate, not genuinely strategic | Test: would a new team member understand *why* after reading it? |
| Commitment is aspirational instead of achievable | Ask: would you bet your quarterly review on achieving this? |
| Tasks treated as a contract | Remind the team: the commitment drives the quarter, not the task list |
| Metric commitment at understanding-risk stage | Match commitment type to risk stage |
| NCTs disconnected from company strategy | The narrative must explicitly ladder to strategy |

---

## When NOT to use it

- Pure execution teams with a clear metric and known levers — standard OKRs may be simpler and sufficient.
- When leadership mandates OKRs and won't accept alternatives — use NCTs informally inside the team while publishing OKRs externally.
- Teams with no strategy to ladder to — fix the strategy gap first.

---

## Connection to other frameworks

- [Strategy Kernel](strategy-kernel.md) — strategy drives the narrative; without a clear strategy, NCT narratives become vague.
- [Metric Trees](metric-trees.md) — the metric tree helps identify which metric the commitment should target (at execution-risk stage).
- [North Star Metric](north-star-metric.md) — the NSM sits above NCTs; NCTs operationalize movement toward the NSM.

---

## Further reading

- Ravi Mehta — *Annual Goal Setting* (Reforge, 2023)
- Ravi Mehta — [ravimehta.com](https://ravimehta.com)

---

*This card is an original synthesis. For the full treatment, take Mehta's Reforge course.*
