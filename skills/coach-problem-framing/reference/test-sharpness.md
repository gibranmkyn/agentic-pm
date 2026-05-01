---
name: test-sharpness
description: Use this playbook when the PM has a diagnosis (from diagnose-the-problem) and needs to decide whether the diagnosed problem is sharp enough to be worth solving. Loaded by coach-problem-framing, not invoked directly.
---

# Test-Sharpness — Does this problem pull the market?

## Use case

This playbook is for the PM who has a diagnosis and now needs to evaluate whether that diagnosis points to a sharp problem or a blunt one. Sharp problems create a tailwind — the market pulls you toward success even when you make mistakes. Blunt problems require perfect execution to matter. The job here is to surface that distinction before framing, not after.

This playbook also runs a lightweight order-of-magnitude impact gate — not rigorous sizing, just a sniff test to catch obviously trivial problems before the PM invests in a full problem statement. Rigorous impact sizing belongs to a separate dedicated skill.

---

## Locate

Confirm before proceeding:

1. **"Do you have a diagnosis — a named gap, with evidence, and a claim about what makes it hard?"** — if not, stop and route to `diagnose-the-problem` first.
2. **"Have you talked to anyone who currently lives with this problem — not someone who described it secondhand?"** — if behavioral evidence is entirely absent, name the gap and send the PM to fieldwork. Sharpness tests without behavioral evidence produce guesses.

If both hold — proceed.

---

## Sub-steps

### 1. Affected population and intensity

Ask: **"Who specifically has this problem? Name a role and a context — not a market segment. And: has anyone in that population actively sought a solution — paid for something, hired a workaround, complained when the workaround broke?"**

Push for: a role + a moment of pain ("a mid-market RevOps manager rebuilding attribution at fiscal close") plus at least one behavioral signal of active seeking. Intensity means the pain is significant enough that users do something about it — not that they said they'd like it fixed.

Flag if missing:
- The population is a segment or company type, not a named role + context.
- Intensity evidence is stated preference ("users want this") rather than observed behavior. Push: "What did someone *do* because of this problem?"

### 2. Frequency and status-quo inadequacy

Ask: **"How often does this fire for the population you named? And what are they doing today to manage it — is that workaround genuinely failing them, or just suboptimal?"**

Push for: a frequency estimate with a source (not "frequently" — a number), and an honest judgment on the workaround. Sharp problems are encountered regularly and current solutions are materially insufficient, not merely clunky.

Flag if missing:
- Frequency is quarterly or less — flag it; raises the intensity bar.
- The PM says "users don't have a workaround." That is rarely true. Push: "What do they do instead?"
- The workaround works well enough that users aren't bothered when it fails — signal the problem may be blunt.

### 3. Workflow compression test

Ask: **"Map the current workflow as a series of steps — one step per line. How many steps? Could a solution shrink that to 2–3x fewer steps?"**

Push for: a real step-count with each step named — what the user opens, does, decides, produces, and where it breaks. Then ask: does a world without this problem look materially shorter, or is it the same workflow with one step slightly smoother?

This tests the problem's sharpness, not the solution. If the workflow cannot be drawn 2–3x shorter with a solution, the improvement may be marginal.

Flag if missing:
- The PM describes workflow in vague phases ("plan, execute, review") without concrete steps. Not a workflow map — push to the step level.
- Compression argument is one step in a 40-step workflow. That is not 2–3x compression.

### 4. Recession test (+ whites-of-eyes signal)

Ask: **"If this user's company shrank its budget tomorrow, would they still pay to solve this problem? Why?"**

Push for: an honest yes/no with reasoning. Sharp problems survive recessions; nice-to-have solutions are the first line items eliminated. If the PM cannot make a credible case for budget survival, the problem is probably blunt.

If the PM has tested the framing live with a real user, ask: **"What happened when you described the problem to them face-to-face?"** The whites-of-eyes signal — eyes widening, involuntary nod, unprompted "yes, this is exactly it" — is qualitative confirmation the diagnosis named the real nerve. This is optional but powerful; absence does not block the playbook.

Flag if missing:
- The PM says "yes" to the recession test without reasoning. Push: "What does not solving this actually cost them?"
- The problem's cost is entirely soft with no downstream consequence.

### 5. Lightweight Fermi gate

Ask: **"Order of magnitude only: how many users in this population experience this per period? How often? What's a rough cost-per-instance — time, money, or downstream damage?"**

Push for: three numbers, each within an order of magnitude. If the answer is "tens of users, once a quarter, $50 of friction" — the framing should probably stop here. If it is "thousands of users, daily, an hour of wasted senior-IC time each" — the problem clears the gate.

This is a sniff test, not a model. Heavy sizing belongs in a separate dedicated skill. If the gate clears but rigorous sizing has not been done, tag the artifact `impact-unsized`.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Affected population is named as a role + context, not a segment | Sharp Problems: "A specific, identifiable set of people who have the problem and have tried and failed with the status quo." |
| Intensity is evidenced by active-seeking behavior, not stated preference | Sharp Problems: "The pain is significant enough that users actively seek solutions and will pay to resolve it." |
| Workflow compression test has been run with a real step count | Sharp Problems: "Map the customer's current workflow as horizontal lines. Can your solution be drawn as lines 2–3x shorter?" |
| Recession test has been answered with reasoning, not assertion | Sharp Problems: "Sharp problems survive recessions; nice-to-have solutions are the first line items eliminated." |
| Fermi gate produces three order-of-magnitude estimates (population × frequency × cost-per-instance) | Impact Sizing: the sniff test analog — order-of-magnitude before committing to a full sizing model. Tag artifact `impact-unsized` if rigorous sizing has not been done. |

If any check is unmet, name the gap and assign a concrete action — fieldwork, a real step-count exercise, or a named user conversation.

---

## Sharpness verdict

After all sub-steps, render an explicit verdict:

- **Sharp** — passes intensity, frequency, status-quo inadequacy, and at least one of the three named tests (workflow compression, whites-of-eyes, recession). Fermi gate clears. Proceed to `frame-three-ways.md`.
- **Conditionally sharp** — passes most tests but with thin evidence on one dimension. Name the gap. Proceed with a `framing-unvalidated` tag and assign fieldwork to close the gap.
- **Blunt** — fails all three named tests (workflow compression, whites-of-eyes, recession). The tailwind effect of Sharp Problems applies in reverse: working on blunt problems means every execution mistake matters. Recommend stopping here and returning to `diagnose-the-problem` or `surface-the-signal` with the sharpness findings as input. Name this as a "kill" recommendation, not a pause.

Do not soften the verdict. The PM is here for rigor.

---

## Output

`.agentic-pm/framing/<feature>-sharpness.md` — a single file containing:

1. **Affected population** (role + context, with evidence)
2. **Intensity evidence** (behavioral, not stated)
3. **Frequency estimate** (with source) and workaround adequacy judgment
4. **Workflow compression map** (step count before; compression argument)
5. **Recession test** (reasoning) and whites-of-eyes signal (if collected)
6. **Fermi gate** (three estimates + product; `impact-unsized` tag if applicable)
7. **Sharpness verdict** (Sharp / Conditionally sharp / Blunt) with one-line rationale

Tag the artifact `impact-unsized` unless rigorous sizing has been completed in a dedicated skill session.

---

## Handoffs

- **Next (if Sharp or Conditionally sharp):** `frame-three-ways.md` — produce three competing problem framings before converging on one.
- **If evidence is thin on intensity or frequency:** return to fieldwork. The concrete action is one behavioral interview with a named person who lives with this problem daily.
- **If Blunt verdict:** recommend stopping the current framing arc. Route back to `surface-the-signal.md` or `diagnose-the-problem.md` with the sharpness findings as input. Name it clearly: continuing from a blunt problem produces a problem statement no downstream coach can act on.

End the session by naming the single weakest sharpness signal and one concrete action in the next 48 hours — typically: watch one user do the workflow end-to-end, or ask a current workaround-user what happens when the workaround breaks.
