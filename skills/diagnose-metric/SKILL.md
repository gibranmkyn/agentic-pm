---
name: diagnose-metric
description: "Figure out why a metric moved unexpectedly and what to do about it. Use when something went up or down and you need the cause, not just the correlation."
allowed-tools: Read Grep Glob Write Edit
---

# Diagnose Metric — Find the Cause, Not Just the Correlation

Produces a metric diagnosis with decomposition analysis, competing hypotheses, evidence assessment, and an act-or-monitor decision — using metric tree decomposition as the primary analytical structure.

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
- `Work/metrics/<topic>-measurement-plan.md` (metric tree provides the decomposition structure)
- `Work/metrics/impact-sizing-journal.md` (historical sizing data for calibration)

---

## Frameworks this skill loads

- `frameworks/metric-trees.md` — Gilad; causal hierarchy connecting product actions to outcomes; provides the decomposition structure
- `frameworks/north-star-metric.md` — Tavel, Gilad; NSM definition; helps locate the moving metric in the hierarchy
- `frameworks/guardrail-metrics.md` — Gupta, Kohavi; counter-metrics; helps check whether a positive primary metric is masking guardrail damage

**Wiki-gap note:** No dedicated metric diagnosis framework exists in the wiki. This skill builds on Metric Trees (decomposition structure) and applies a first-principles diagnostic loop. Flagged for future wiki expansion.

Read the frameworks before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to get a precise description of what moved, challenge premature hypotheses, and assess whether the investigation is worth the time.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Which metric moved, by how much, and over what time period? Be precise — '15% drop in weekly retention over 6 weeks' not 'retention is down.'"** Precision matters because the shape of the change determines the diagnosis approach. A sudden step-change (event-driven) is diagnosed differently than a gradual drift (systemic). A 2% fluctuation may be noise; a 15% drop is a signal.

2. **"Was this expected or a surprise? If expected, why are you investigating? If a surprise, when did you first notice?"** If expected, the PM may be confirming a theory — not genuinely investigating. That's a different exercise (validation, not diagnosis). If a surprise, the gap between when it started and when it was noticed tells you about the team's monitoring maturity.

3. **"What changed in the product during that window? Releases, experiments, policy changes, pricing changes."** Product changes are the most common cause and the first place to look. Get a complete list — not just "the big release" but also the small config changes, experiment ramp-ups, and backend migrations that nobody thinks to mention.

4. **"What changed outside the product? Seasonality, competitor launch, market shift, press coverage."** External factors are the most commonly overlooked cause. Teams default to "we did something wrong" when the cause is often "the market moved." Seasonality especially — many metric movements are calendar-driven.

5. **"Where does this metric sit in your metric tree? What's above it (lagging) and below it (leading)?"** *(Metric Trees: "each branch in the tree is a causal claim.") If the PM can't locate the metric in a tree, the decomposition step will be harder. If no metric tree exists, flag this as a gap and build a rough one during the session.*

6. **"Have you already looked at the data? What did you find? I'm asking because I want to know what hypotheses you've already formed — and whether they're confirmed or just first guesses."** Surfaces anchoring bias. If the PM has a strong hypothesis already, make sure it's been tested, not just assumed. First hypotheses are often wrong — not because PMs are bad at guessing, but because the most obvious explanation is rarely the full picture.

7. **"If you find the cause, what will you do about it? If the answer is 'nothing,' we should talk about whether this investigation is worth the time."** Not every metric movement warrants investigation. If the metric is non-critical and no action would follow regardless of the cause, the PM's time is better spent elsewhere. Name this when it's true.

Interview until you can answer: What exactly moved? When did it start? What's the PM's working hypothesis? Is this investigation worth the time?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2-3 sentences. Name the metric, the magnitude, the time window, and whether a hypothesis already exists.
2. **"Here's the approach"** — where to start in the metric tree, which segments to slice first, what external factors to check, whether the PM's existing hypothesis should be the starting point or whether you should decompose first.
3. **"Here are my concerns"** — anything unresolved from the interview. Anchoring to a premature hypothesis. Missing metric tree. Investigation that may not lead to action. Metric movement that looks like noise.

Ask: **"Want to adjust before I start the diagnosis?"**

Do not produce any artifact until the PM confirms.

---

## Spine — Metric Tree Decomposition Diagnosis

Single spine — no autoselect needed. The diagnostic loop:

### Step 1: Locate the metric in the tree
Which level? Which branch? What's above it (lagging indicators) and below it (leading indicators)? If no metric tree exists, build a rough 2-3 level tree for the affected metric.

### Step 2: Decompose — which sub-metrics moved and which didn't?
Walk down the tree. At each level, identify which branches moved and which held steady. The branch that moved tells you where to look next. The branch that didn't move tells you what to rule out.

### Step 3: Isolate — segment the movement
Slice by:
- User cohort (new vs. returning, free vs. paid, power vs. casual)
- Time period (when exactly did the change start? gradual or sudden?)
- Geography / locale
- Platform (iOS vs. Android vs. web)
- Acquisition channel (organic vs. paid, specific campaigns)
- Feature exposure (users who saw feature X vs. users who didn't)

The goal is to find the narrowest segment where the movement is concentrated. A "retention is down" diagnosis becomes "retention is down 25% for new users acquired from paid Instagram campaigns on iOS" — and that's diagnosable.

### Step 4: Hypothesize — what changed?
For the isolated segment and time window, generate at least 2 competing hypotheses:
- What changed in the product? (releases, experiments, config changes)
- What changed in the market? (competitor, seasonality, press)
- What changed in user behavior? (new cohort composition, usage pattern shift)

Never stop at 1 hypothesis. The first hypothesis is usually the most obvious, not the most correct.

### Step 5: Validate — find evidence for the leading hypothesis
For each hypothesis:
- What data would confirm it?
- What data would rule it out?
- Is the data available, or does it need to be collected?

If the PM has analytics access, suggest specific queries. If not, specify what to ask the data team for.

### Step 6: Act or monitor
Based on the evidence:
- **Act** — the cause is identified, it's within the team's control, and the impact warrants action. Name the specific action.
- **Monitor** — the cause is identified but may be temporary (seasonality, one-time event), or the impact is below the action threshold. Set a specific check-in date and trigger condition.
- **Investigate further** — the cause is not yet identified. Name what additional data or analysis is needed.

---

## Situation-triggered add-on blocks

- **Missing metric tree block** — triggered when no metric tree exists. Build a rough 2-3 level tree for the affected metric during the session. Recommend `/agentic-pm:define-metrics` to build the full tree afterward.
- **Guardrail check block** — triggered when the metric that moved is a primary metric (NSM or goal metric). Check whether the movement came at the cost of a guardrail metric. A retention improvement that coincided with a support ticket spike needs both investigated.
- **Noise vs. signal block** — triggered when the magnitude of change is small (<5% for high-volume metrics, <10% for low-volume). Before decomposing, assess whether this is within normal variance. If it is, recommend monitoring rather than investigating.

---

## Step-by-step flow

1. **Discovery interview.** Read context files and upstream artifacts. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the decomposition approach, concerns. Wait for PM approval before producing anything.
3. **Locate the metric in the tree** (Step 1 of the spine). If no tree exists, build a rough one.
4. **Decompose** (Step 2). Walk down the tree. Identify which sub-metrics moved.
5. **Isolate** (Step 3). Segment the movement. Find the narrowest segment where the change is concentrated.
6. **Hypothesize** (Step 4). Generate at least 2 competing hypotheses. Include both product-internal and market-external explanations.
7. **Validate** (Step 5). For each hypothesis, name the confirming and disconfirming evidence. Specify data queries or analyses needed.
8. **Act or monitor** (Step 6). State the recommendation with reasoning.
9. **Self-validate.** Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.
10. **Produce the artifact** at `Work/metrics/<metric>-diagnosis-YYYY-MM-DD.md`.

---

## Quality bar

Before finalizing the artifact:

- [ ] Metric precisely defined — name, magnitude, time period, direction; not vague ("retention is down") — specific ("D7 retention dropped 12% over 4 weeks for new users")
- [ ] Decomposition attempted before hypothesis — walked down the metric tree to find where the movement is concentrated before generating explanations — *Metric Trees: "the tree captures your team's theory of how daily work rolls up into outcomes"*
- [ ] At least 2 competing hypotheses named — never a single explanation without alternatives
- [ ] Cohort/segment analysis done (or specified) — the diagnosis identifies the narrowest affected segment, not just the aggregate
- [ ] External factors considered — not just product changes; seasonality, competitor moves, market shifts checked — *common oversight: teams default to "we did something wrong" when the cause is external*
- [ ] Action threshold defined — at what point does this become a problem worth fixing vs. noise? What magnitude would trigger action? — *not every metric movement warrants a response*
- [ ] Guardrail metrics checked (for primary metric movement) — *Guardrail Metrics: a positive primary metric could be masking damage elsewhere*

Cite the source concept when flagging a gap.

---

## Tag propagation

- No metric tree location identified (metric floating without tree context) → tag `metric-tree-unmapped`
- Single hypothesis without alternatives → tag `diagnosis-anchored`
- No segment/cohort analysis done → tag `diagnosis-unsegmented`
- Investigation undertaken with no action threshold defined → tag `diagnosis-no-action-threshold`

Strongly recommend; never refuse.

---

## Handoffs

- **Upstream:** `/agentic-pm:define-metrics` (metric tree provides the decomposition structure; if no tree exists, build one first)
- **Downstream:** `/agentic-pm:map-risks` (if the cause is unclear, the leading hypothesis needs validation as an assumption); `/agentic-pm:compile-prd` (if the fix requires a feature change)

---

## Output

`Work/metrics/<metric>-diagnosis-YYYY-MM-DD.md`

Contents: metric definition (name, magnitude, time period), metric tree location, decomposition analysis, segment isolation, competing hypotheses, evidence for/against each, recommendation (act / monitor / investigate further), action threshold.

---

## End every session with

- The recommendation stated in one sentence: act, monitor, or investigate further.
- If act: name the specific action and who owns it.
- If monitor: name the check-in date and the trigger condition that would upgrade monitoring to action.
- If investigate further: name the specific data or analysis needed and who should produce it.
- "Update the metric tree with what you learned. Diagnosis teaches you about causal relationships — that's institutional knowledge worth preserving."

---

## Completion status

Report exactly one of at close:
- **DONE** — diagnosis written, competing hypotheses evaluated, recommendation made, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — diagnosis written but tags applied (list each: `metric-tree-unmapped`, `diagnosis-anchored`, `diagnosis-unsegmented`, `diagnosis-no-action-threshold`)
- **BLOCKED** — no data access and no way to get the data needed for decomposition; state what data is required and who can provide it
- **NEEDS_CONTEXT** — metric not precisely defined; state what specificity is missing (name, magnitude, time period, direction)

Escalation: if the PM cannot define the metric precisely (name, magnitude, time period), stop. Diagnosing "things feel off" is not a metric diagnosis — it's a conversation that should happen before this skill is invoked.
