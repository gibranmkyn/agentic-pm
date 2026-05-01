---
name: diagnose-the-problem
description: Use this playbook when the PM has behavioral evidence (stories, observations, or data from listen-behaviorally) and now needs to articulate what is actually broken and why it is hard. Loaded by coach-problem-framing, not invoked directly.
---

# Diagnose-the-Problem — From behavioral evidence to a named, quantified diagnosis

## Use case

This playbook is for the PM who has stories and signals in hand and now needs to name what is actually going on. The job is to move from raw behavioral evidence to a specific, quantified diagnosis — one that names the gap, identifies the source of difficulty, names the crux, and structures competing hypotheses before converging on an answer.

This is the heart of the problem-framing arc. The Strategy Kernel is the spine: most organizational debates about strategy are actually debates about the diagnosis, not about what to do — the diagnosis must be resolved first.

### Precondition: behavioral evidence exists upstream

This playbook assumes `listen-behaviorally` (or equivalent fieldwork) has produced at least a handful of behavioral stories, observations, or production data. If the PM is trying to diagnose without evidence — reasoning from internal opinion, survey summaries, or nothing — stop and route back. Diagnosis without behavioral grounding produces a diagnosis that reflects the team's priors, not the user's reality.

---

## Locate

Before walking the playbook, ask:

1. **"What evidence do you have from behavioral fieldwork — observations, interview stories, production data?"** — if the answer is "not much" or "mainly what people told us they wanted," stop. Route back to `listen-behaviorally` and name fieldwork as the unblock. The diagnostic phase is not the place to substitute framework-walking for talking to users.
2. **"Have you already written down a diagnosis somewhere?"** — if yes, read it before going further. The playbook's job is to sharpen what exists, not to produce a duplicate. A diagnosis that already exists and is specific gets tested against the quality bar, not replaced.
3. **"What is the PM's current draft of what is going on?"** — surface the prior. Most PMs arrive with an implicit diagnosis. Externalizing it early is faster than pretending it doesn't exist.

If the PM has behavioral evidence, a starting hypothesis, and is genuinely open to that hypothesis being wrong — proceed. Otherwise fieldwork is the unblock.

---

## Spine

One spine: Strategy Kernel (diagnosis as the pivotal first move) threaded with Hypothesis-Driven Problem Solving (define → hypothesize → test → synthesize) and Issue Tree / MECE (structuring the hypothesis space). The crux principle applies at step 5: most teams name the broad challenge and stop there; the crux is what they avoid.

---

## Sub-steps

### 1. Locate: does the PM have evidence or are they trying to diagnose on prior?

Ask: **"Walk me through the strongest evidence you have. Not summaries — specific stories. What did you see, hear, or measure?"**

Push for: named users, observed behaviors, timestamps, data points. "Three users in last week's interviews..." or "we pulled the funnel data and step Y dropped from 40% to 18% last quarter."

Flag if missing:
- The PM is narrating from secondhand summaries ("the team says users are confused").
- The evidence is stated preference only — what users said they wanted, not what they did.
- There is no evidence — only internal intuition or competitive pressure.

If any of these surface, stop. The diagnosis will be a reflection of whoever has the loudest voice in the room. Name the gap and route back to `listen-behaviorally`. Do not keep walking the playbook.

### 2. Bad diagnosis vs. good diagnosis

Ask: **"What is your current working diagnosis — in one sentence?"**

Then apply the Strategy Kernel test immediately. Read their answer out loud (or reflect it back) and ask: **"Is that a desire, or is that what is actually happening?"**

The Strategy Kernel draws the line sharply:
- Bad diagnosis: "We're not growing fast enough." (A desire, not a diagnosis.)
- Good diagnosis: "Our growth is constrained because our onboarding conversion rate is 12% compared to the industry norm of 35%, and our qualitative research shows users are confused by step Y."

Push for: a statement that names what is actually going on, not what the PM wishes were happening.

Flag if the diagnosis:
- Begins with "we need to..." — that is a guiding policy, not a diagnosis.
- Contains only financial targets ("revenue is below plan") without naming the mechanism.
- Is a solution in disguise ("our problem is that we don't have X feature").
- Could have been written without talking to a single user.

Challenge directly: **"The Strategy Kernel would call that an aspiration, not a diagnosis. What is actually happening, as observed?"**

### 3. Quantify the gap

Ask: **"What is the current state? What is the desired or baseline state? What is the delta?"**

The Strategy Kernel requires that a good diagnosis quantifies the gap — "12% vs. industry norm of 35%." Without numbers, the diagnosis is still aspirational.

Push for: at minimum, current-state number, comparison baseline (industry norm, prior period, competing cohort), and a delta that makes the gap legible.

Flag if missing:
- The PM states a qualitative direction ("users are confused") without a quantitative signal.
- The comparison baseline is missing — "our conversion is low" is meaningless without knowing what low means.
- The numbers exist but have not been pulled. In that case, assign the pull as the immediate next action before proceeding.

If the PM cannot quantify the gap: ask "what would you need to look at to put a number on it?" Assign pulling that data as the 48-hour concrete action and mark this step incomplete. Incomplete step = incomplete diagnosis.

### 4. Name what makes it hard

Ask: **"Why hasn't this been fixed already? What is the source of difficulty?"**

This is the part of the Strategy Kernel that most teams skip. The diagnosis is not complete until the nature of the challenge is named — not just what is happening, but what is making it hard to address. Without this, any guiding policy will be generic.

Push for: a named mechanism. Examples: "the users who drop off are the ones with the most complex inputs, which our current flow doesn't support"; "the data is siloed across three systems and nobody owns the join"; "the team has tried two interventions in the last six months and both failed at step Y."

Flag if missing:
- The PM describes what is wrong but not why fixing it is non-trivial.
- The stated difficulty is organizational ("it's been deprioritized") rather than structural. Organizational reasons are real but they are usually symptoms of a deeper difficulty — push one level further.
- The difficulty is just "we haven't tried." That may be true but it's not a diagnosis of what makes it hard.

### 5. Identify the crux

Ask: **"Within everything you just named — what is the single hardest sub-problem? The one your team is most likely to avoid?"**

The crux principle: within any challenge, there is a pivotal difficulty where strategic energy must concentrate. Most teams name the broad challenge and stop; addressing the crux is what distinguishes real diagnosis from surface-level problem-naming.

Push for: a single, named sub-problem. Not a list. If the PM lists three or four candidates, ask: "Which one, if you solved it, would most change the others? Which one does the team find easiest to avoid talking about directly?"

Flag if missing:
- The PM returns a list — they haven't chosen yet. Push for one.
- The crux named is the easiest sub-problem, not the hardest. Ask: "Is that the one your team avoids, or the one they're comfortable talking about?"
- The crux is vague — "alignment" or "culture." Push: "What is the specific, concrete decision or structural fact that makes this hard?"

### 6. Build an issue tree — MECE hypotheses about what is going on

Ask: **"Let's structure what you know and what you don't. If you had to name the two or three MECE top-level hypotheses for why this is happening — what are they?"**

Hypothesis-Driven Problem Solving requires that before committing to a refined problem statement, the hypothesis space is made explicit and complete. The Issue Tree is the artifact that makes that space visible. MECE at every level: no two branches should overlap, and together they should account for everything relevant.

Walk the PM through a light version:

1. **Write the root question** — "Why is [problem] happening?" — as a single question.
2. **Generate top-level hypotheses** — two to four, MECE. Push for clean separation. If two hypotheses overlap, ask "could one be true and the other false? If not, they're not separate."
3. **For each branch: which does the evidence support?** — apply the top-down test (which branch is most likely given what you know?) and the bottom-up test (what does the data say?). Tag branches: confirmed / likely / uncertain / falsified.
4. **Prioritize the branch to test next** — by estimated impact, not by ease. Hypothesis-Driven Problem Solving: do targeted testing, starting with a few branches to check direction, not everything at once.

Push for: a tree where the PM can say, "we've confirmed branch A, we believe branch B is the crux, and we haven't tested branch C yet."

Flag if missing:
- The PM produces a flat list of symptoms, not a structured tree. Ask: "Which of those are causes and which are effects?"
- The branches overlap significantly — the MECE test fails. Name the overlap explicitly: "Both of those could be true for the same user. They're not mutually exclusive."
- The PM is testing the easiest branch first. Push: "Which branch, if confirmed, would most change what you'd do? Start there."

Note on issue tree mechanics: the Issue Tree wiki describes the structure and the MECE principle clearly; it does not prescribe specific branching heuristics for product problems. Apply MECE-adjacent discipline (clean separation, no gaps) without fabricating consulting-specific sub-frameworks.

### 7. Synthesize answer-first

Ask: **"If you had to state the diagnosis in one sentence — what is it? Current state, compared to what, mechanism, and what makes it hard — all in one sentence."**

Answer-first communication (from Hypothesis-Driven Problem Solving): the synthesis inverts the work order — start with the conclusion, then support it with evidence. The "answer-first" diagnosis is earned by the work in steps 1–6, not stated up front.

Push for: a single sentence a stakeholder could disagree with on the merits. Not a list of findings. Not a hedged summary. One sentence.

Test it:
- Could someone reasonable read this sentence and hold a different diagnosis? If not, it is too vague to be a diagnosis.
- Does it contain the quantified gap (step 3)? If not, it is still aspirational.
- Does it name the source of difficulty (step 4)? If not, it is still incomplete.
- Does it point at the crux (step 5)? If not, it doesn't yet tell you where to focus.

If the one-sentence synthesis cannot be written without hedging — the diagnosis is not done. Identify which of steps 2–6 is weakest and revisit it before proceeding to `test-sharpness`.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| PM has behavioral evidence before diagnosing — not stated preferences, internal opinion, or survey summaries | Hypothesis-Driven Problem Solving: "A dedicated diagnostic phase is an explicit period of bottom-up information gathering before committing to a refined problem statement." |
| Diagnosis names what is actually happening, not what the PM wishes were happening | Strategy Kernel: "Bad diagnosis: 'We're not growing fast enough.' (A desire, not a diagnosis.) Good diagnosis names what is actually going on." |
| Gap is quantified: current state + comparison baseline + delta | Strategy Kernel: "Good diagnosis: 'Our onboarding conversion rate is 12% compared to the industry norm of 35%.'" |
| Source of difficulty is named — not just what is wrong, but what makes it hard to fix | Strategy Kernel: "The diagnosis identifies the nature of the challenge and what is making it hard." |
| Crux is named — the single hardest sub-problem within the broader challenge | Strategy Kernel / the crux principle: "The pivotal difficulty where strategic energy must concentrate. Most organizations avoid the crux." |
| Issue tree has at least two MECE top-level hypotheses, each tagged by evidence status | Issue Tree: "An issue tree starts with a single root question and branches into top-level hypotheses. MECE at every level." MECE: "No item overlaps with another; the set covers all relevant possibilities." |
| Evidence tested top-down (which branch is most likely?) and bottom-up (what does the data say?) | Hypothesis-Driven Problem Solving: "The loop oscillates between top-down (abstract, high-level) and bottom-up (concrete, granular) modes." |
| Synthesis stated answer-first in one sentence: gap + mechanism + source of difficulty | Hypothesis-Driven Problem Solving: "Communicate answer-first — start with the conclusion, then support it with evidence." |

If any check is unmet, name the gap as the next concrete action — fieldwork, data pull, or revisiting the weakest sub-step — before advancing to `test-sharpness`.

---

## Output

`.agentic-pm/framing/<feature>-diagnosis.md` — a single file containing:

1. **Behavioral evidence summary** — the stories, observations, and data that ground the diagnosis (not a full transcript — a curated summary of what is load-bearing)
2. **Working diagnosis** (one sentence, answer-first: gap + mechanism + source of difficulty)
3. **Quantified gap** (current state, baseline, delta)
4. **Source of difficulty** (named mechanism)
5. **Crux** (the single hardest sub-problem)
6. **Issue tree** (root question + top-level MECE branches + evidence status per branch)
7. **Priority branch to test next** (the highest-impact unconfirmed hypothesis)
8. **Open assumptions** — beliefs embedded in the diagnosis that have not yet been tested; these propagate to `test-sharpness`

---

## Handoffs

- **Next:** `test-sharpness.md` — once the diagnosis is written and passes the quality bar, test whether the problem is worth solving (intensity / frequency / population / status quo cost).
- **Back to `listen-behaviorally.md`:** if the evidence is too thin to support the diagnosis — the branches of the issue tree are mostly uncertain or the quantified gap cannot be filled from existing data.
- **Insufficient-evidence loop:** if the PM has not done any behavioral observation at all, stop the session. Name fieldwork (watching one workflow end-to-end, or one behavioral interview with a switcher) as the 48-hour action. Do not substitute issue-tree construction for talking to users.

End the session with the single most uncertain branch in the issue tree and one concrete action in the next 48 hours — typically: pull the specific data that would confirm or falsify the priority branch, or run one targeted interview with a user who has experienced the problem at the crux.
