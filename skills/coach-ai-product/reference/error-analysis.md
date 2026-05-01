---
name: error-analysis
description: Use this playbook when an AI feature has quality issues and the PM needs to systematically characterize what's failing, map failures to root causes, and sequence fixes cheapest-first. Loaded by the coach skill, not invoked directly.
---

# Error Analysis

Users are complaining, quality is off, or something feels wrong but you can't name it. This playbook runs a structured diagnosis: sample real traces, find failure patterns through axial coding, map each pattern to a root cause type (Three Gulfs), then sequence fixes cheapest-first. No guessing. No jumping to model changes before you understand the problem.

---

## Locate

Before walking the playbook, ask the PM:

1. What feature is misbehaving, and what kind of output is it producing? (open-ended generation / classification / retrieval / agent flow)
2. Do you have access to production traces (logs of input + output)? If not, can you generate 30–100 by running real inputs through the feature?
3. Who is the domain expert who can adjudicate borderline cases? Per Hamel: one benevolent dictator, not a committee.

Also check `.agentic-pm/evals/` for an existing error journal on this feature. If one exists, today's session adds a new dated entry rather than starting from scratch.

**MCP awareness:** If an eval-platform MCP is configured (LangSmith, Braintrust, Phoenix, or similar), use it directly — pull a 100-trace sample, label collaboratively with the PM in-session, write the pivot table from real data. If no MCP is available, guide the PM through manual sample preparation: query their production DB or eval platform UI, paste 30–100 representative traces, label in a spreadsheet. Either path lands the same artifact.

---

## PM ownership is non-negotiable

**The PM must personally review traces — not delegate to engineering.** Engineers optimize for technical correctness. PMs catch product-level failures: wrong tone, missing empathy, policy misapplication, trust breakdowns. Delegating the trace review is the most common way AI quality practices fail. If the PM won't own this, flag it before proceeding.

---

## Sample size: theoretical saturation

Stop sampling when you stop learning new failure modes — that's theoretical saturation (Hamel/Shreya). In practice:
- **100 traces** is the typical heuristic for a meaningful first pass.
- **30–50** is acceptable under context pressure, provided they cover diverse input types and user segments. Label each trace as you go and stop when three consecutive traces produce no new category.
- Below 30 you're generating guesses, not data. The session is blocked.

**Sampling must be deliberate, not random.** Deliberately oversample:
- Failure-adjacent conversations (user expressed frustration, repeated themselves, gave up)
- Edge cases and unusual inputs
- High-stakes user types (high-value accounts, churned users, power users)
- The specific situations that triggered the quality complaint

---

## Step-by-step

### Step 1 — Verify readiness

Confirm before starting:
- PM (not an engineer) will personally review the traces.
- A diverse trace sample exists or can be generated (30+ minimum, 100 preferred).
- If an error journal entry exists for this feature, load the prior failure categories to refine rather than restart.

If trace access is blocked, name that as the unblock. Don't proceed with theoretical analysis.

### Step 2 — Quick-review each trace

30–45 seconds per trace. Build flow state — don't over-analyze any single judgment. For each trace:
- What did the user ask?
- What did the AI respond?
- What's wrong? (one-line note, no categories yet)

Speed matters here. Generate raw notes, not conclusions. This step is about volume of observations, not depth per observation.

### Step 3 — Axial coding: emergent categories

Export the one-line notes. Do **not** start with pre-set categories — the categories must emerge from the data (Hamel/Shreya: "emergent categories, not predetermined taxonomy").

Process:
1. Ask an LLM to read all notes and propose 5–6 candidate categories.
2. Review each for specificity: "quality issues" is not specific enough; "conversational flow: repeated questions not handled" is specific enough for independent labeling.
3. Refine until every category is specific enough that two different people could apply it to the same note and agree.

This typically requires 1–2 iterations. Categories requiring judgment calls need more refinement.

### Step 4 — Label all traces

Assign each trace note to one category. Fastest approach: manual first pass on 20–30 traces to calibrate, then LLM auto-label the rest + spot-check 20%.

Produce a pivot table:
```
Category                         | Count | % of total
Human handoff miss               |  15   | 15%
Incorrect policy citation        |  12   | 12%
Out-of-scope not deflected       |   8   |  8%
Conversational flow breakdown    |   7   |  7%
```

The pivot table is the deliverable that makes prioritization real. "Handoff misses: 15 occurrences" is a decision input. "There are some handoff issues" is not.

### Step 5 — Three Gulfs diagnosis on the top 2–3 categories

For each top failure category, map it to the appropriate gulf (Yan):

| Gulf | What it means | Fix type |
|---|---|---|
| **Comprehension** | You still don't understand what's failing or why | Do more error analysis; talk to users |
| **Specification** | The prompt or instructions are ambiguous | Rewrite the prompt; update rubric |
| **Generalization** | Works in known cases but fails on edge cases | Expand eval set; add RAG; add examples |
| **Model Capability** | The model has hit a ceiling — cannot do this task reliably | Switch model; fine-tune |

One failure category maps to one gulf type. If a category could map to multiple gulfs, split the category.

### Step 6 — Fix sequencing: cheapest gulf first

Order fixes by cost, not by severity:

1. **Specification** — prompt rewrite; cheapest; often resolves 30–50% of failures
2. **Comprehension** — more analysis; not cheap in time, but no engineering cost
3. **Generalization** — data expansion, RAG, more examples; moderate cost
4. **Model Capability** — model switch or fine-tune; most expensive; only after the others

**Do not jump to Model Capability before working the list.** The most common mistake in AI diagnosis is treating everything as a model problem. Most production failures are Specification or Comprehension problems.

### Step 7 — Set the next error analysis date

Set a monthly cadence. New edge cases emerge as the product evolves — failure categories from launch are rarely the categories that matter a year later. Name the specific date.

### Step 8 — Offer the judge handoff

If ≥100 labeled traces now exist and the top error category is well-defined, offer the handoff to `validate-judge.md`. Don't auto-chain — the PM decides.

Offer only when:
- ≥100 labeled traces exist (the labeled sample from this session qualifies)
- The top failure category is scoped narrowly enough to write a judge around one behavior
- A domain expert is available

---

## Quality bar

Before finalizing the error journal entry:

- [ ] PM (not engineer) personally owns the trace review — *Error Analysis (Hamel/Shreya): "PMs own this — it requires product taste and user knowledge"*
- [ ] ≥30 traces (100 preferred) sampled before axial coding — *Error Analysis: theoretical saturation principle*
- [ ] Categories emerged from data via axial coding, not pre-set — *Error Analysis: "emergent categories, not predetermined taxonomy"*
- [ ] Each category specific enough for independent labeling without judgment calls — *Error Analysis*
- [ ] Failure mapped to gulf type before fix type chosen — *Three Gulfs (Yan): "don't skip to model capability without working the list"*
- [ ] Fix sequence follows gulf priority (cheapest first) — *Three Gulfs*
- [ ] Monthly cadence date set — *Error Analysis: "new edge cases emerge as the product evolves"*

---

## Tag propagation

- Fewer than 30 traces sampled → `insufficient-traces`
- PM delegated trace review to engineering → `pm-eval-ownership-gap`
- Three Gulfs diagnosis skipped → `gulfs-skipped`
- Fix sequencing jumped straight to model change → `capability-jump`

---

## Output

`.agentic-pm/evals/<feature>-error-journal.md`

One dated entry per session, accumulating over time. Each entry contains:
- Date and trace sample size
- Axial coding: categories proposed and refined
- Pivot table: count and percentage per category
- Three Gulfs diagnosis: gulf type for each top category
- Fix sequence: ordered list with cost tier and expected impact
- Next error analysis date
- Tags applied (if any)

---

## End every session with

- The single highest-frequency error category and the gulf type it maps to — that's the first fix.
- The fix that will have the most impact before the next review (usually a prompt rewrite for a Specification gulf).
- If ≥100 labeled traces exist and judge not built: "You have enough labeled data to build a judge. Walk `validate-judge.md` next: one domain expert, one behavior, binary scoring — budget 1–2 days."
- The date for the next error analysis pass.

---

## Handoffs

- **Comes from:** `write-rubric.md` (may have existing error categories to refine); any session where quality issues surface mid-arc.
- **Leads to (offer, not auto-chain):** `validate-judge.md` — after ≥100 labeled traces; builds automated detection for the top category.
