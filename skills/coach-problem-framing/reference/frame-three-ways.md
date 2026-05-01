---
name: frame-three-ways
description: Loaded by coach-problem-framing when the PM has a single framing on the table and needs divergence before convergence. Forces three competing framings of the same observed pain, runs a MECE check, evaluates each against behavioral evidence, and routes the strongest framing forward to compile-problem-statement. Loaded by the coach, not invoked directly.
---

# Frame-Three-Ways — Divergence before convergence on the problem

## Use case

The PM arrives with one framing of the problem. This is the default human move: we name the thing we see first and start building toward it. The one-framing funnel is as dangerous at the problem level as it is at the solution level — convergence on the wrong framing locks the team into solving the wrong thing.

This playbook forces the PM to hold the same observed pain up to three different lenses before picking which framing to compile. The framing that best accounts for behavioral evidence wins. The others are preserved as alternatives, because when the framing is wrong six weeks later, the team needs to know which alternatives were on the table.

### Precondition: upstream phases complete

This playbook assumes the PM has already run behavioral discovery (interview quotes, observed workflows, behavioral data) and has a diagnosis in hand from `diagnose-the-problem.md`. Framing without evidence is not framing — it is naming things you prefer to believe. If behavioral evidence is thin or absent, stop here: the unblock is fieldwork, not three framings of a hunch.

---

## Locate

Before walking the playbook, establish where the PM actually is:

1. **"Do you have a framing already, or are you still trying to name what's broken?"** — If they have one framing, proceed to Step 1 (State the leading framing). If they have zero framings, route them back to `diagnose-the-problem.md` first. If they have two or more already in hand, skip to Step 3 (MECE check) and use what they have as the starting material.

2. **"How much behavioral evidence is behind the framing you came in with?"** — Surface whether it is grounded in observed behavior (interview quotes, workflow observation, production data) or in stated preference and internal opinion. If stated preference only, name the gap before proceeding: framing derived entirely from stated preference is the one-framing funnel at its worst.

3. **"Has the problem already been tested for sharpness?"** — If `test-sharpness.md` has not run, consider whether framing divergence is the right next step or whether sharpness testing should come first. The sequence is not always strict, but framing a blunt problem three ways is still three wrong framings.

---

## Spine

The kill the one-idea funnel principle — applied here to problems, not solutions — demands that you hold any single candidate answer loosely until you have generated and compared alternatives. The Opportunity Solution Tree failure mode "only one solution per opportunity" is identically a failure mode at the problem level: a single framing prevents the team from seeing better angles. Generating three framings before evaluating any of them is the structural guard against this.

The MECE principle from Issue Tree work governs whether the three framings are genuinely distinct. Three framings that are rephrasings of the same framing are not three framings — they are one framing with different wording. The test is: if Framing A is true, can Framing B still be false? If not, they are the same branch.

---

## Sub-steps

### 1. State the leading framing

Ask: **"Finish this sentence: the problem is that [who] cannot [do what] because [what is actually broken or hard]. Give me the one sentence you came in with."**

Push for:
- A named actor (a specific user segment, operator, or company function — not "users" in the abstract)
- A named behavior or outcome that is not happening, or is happening with friction
- A named mechanism or cause — what specifically makes it hard

Flag if missing:
- The framing is aspirational: "we're not growing fast enough." That is not a diagnosis; it is a desire. The Strategy Kernel distinction: a good diagnosis names what is actually going on, quantifies the gap, and identifies what makes it hard. Push for numbers and a mechanism.
- The framing collapses actor and cause into vague language: "users are frustrated with the onboarding." Who, specifically? What behavior shows frustration? What is mechanically producing the friction?
- The framing is a solution in disguise: "the problem is we don't have a dashboard." A dashboard is a solution. Ask: "what decision does the person need to make, and what is stopping them from making it?"

Once the leading framing is sharpened to the one-sentence form, capture it and hold it. Do not evaluate it yet. Evaluation happens in Step 4.

---

### 2. Generate two more framings

This is the divergence move. The PM must produce two additional framings of the same observed pain. Same underlying signal, different naming of what is broken.

Ask: **"Given the same behavioral evidence you came in with — same interview quotes, same workflow observations, same data — give me two other ways to name what's broken. Different angle, not a restatement."**

Push for: genuine divergence. Offer axes only if the PM is stuck after a real attempt. Useful axes for generating distinct framings:

- **Different actor.** The same friction observed from the user side versus the operator side versus the company side often produces a completely different root cause. A user who cannot find the right content is an actor-level framing; an operator who cannot configure what content surfaces is a different actor-level framing; a company that cannot track whether content is reaching the right users is a third.
- **Different layer.** Surface symptom ("the step takes too long") versus mechanism ("the mechanism that makes it slow is manual hand-off across three tools") versus root cause ("the root cause is that the data model requires reconciliation after every save") are three genuinely different framings of the same user complaint.
- **Different category.** The same observed pain might be a trust problem, a discoverability problem, a workflow-fit problem, or a latency problem. These categories call for completely different interventions and name different things as the gap.
- **Different scope.** The problem might be real for one user segment but not the whole user base, or it might apply to an adjacent segment the team has not yet considered. A framing scoped to power users and a framing scoped to new users may both be true but imply different solutions and different urgencies.

Flag if missing:
- The PM produces three framings but two of them are synonyms. "Users can't find the feature" and "feature discoverability is low" are the same framing. Apply the MECE test in the next step.
- The PM starts generating solutions instead of framings. If they say "we should add a filter" or "we need to improve the onboarding flow," walk it back: "That is a solution shape. What would the problem be if we could not build anything? Name the broken state."
- The PM cannot generate alternatives at all and keeps restating the leading framing. This is the stuck-PM case — see the section on handling this below.

---

### 3. MECE check

Before comparing framings, verify they are genuinely distinct. Applying the MECE principle to framings: they should be mutually exclusive (each one names a different broken state, not the same state described differently) and together they should be collectively exhaustive of the plausible explanations for the observed pain.

Ask: **"If Framing A turned out to be exactly right — would that automatically mean Framings B and C are also right? Or could B and C still be wrong?"**

Push for: independent testability. A framing is genuinely distinct if you could imagine a world where it is true and the others are false. If that world is impossible to imagine, the framings are not distinct.

Flag if missing:
- Two framings that always rise and fall together. If Framing B can only be true when Framing A is true, B is a sub-branch of A, not an alternative.
- A framing that is so broad it contains the others. "Users are not getting value from the product" is not a framing — it is a meta-category that subsumes almost anything.
- Three framings that differ only in wording but imply the same intervention. If every one of the three framings points to the same fix, they are functionally the same framing.

If the framings fail the MECE check, force more divergence before proceeding. Name specifically which pair overlaps and ask the PM to replace one of the overlapping framings with a genuinely different angle. Use the divergence axes from Step 2 as scaffolding.

---

### 4. Compare against behavioral evidence

This is the convergence move. For each of the three framings, run the same two-part evidence test.

Ask for each framing in turn: **"Which specific interview quotes or behavioral observations support this framing? Which data point would you expect to find if this framing were true — and have you found it? Now: what evidence would contradict it, and have you looked for it?"**

Push for:
- Layer-3 causal evidence — the behavioral thread that explains what actually drove the observed pain, not just what people said they felt. Layer 1 is stated preference (what people say they want). Layer 2 is surface behavior (what they did last time). Layer 3 is causal reality (what actually drove the behavior). The framing that accounts for Layer-3 evidence is stronger than one that only accounts for Layer-1 or Layer-2 evidence.
- Contradicting evidence, not just supporting evidence. A framing that can only point to confirming quotes and has never been tested against contradicting data is a hypothesis the PM has decided to believe — not a finding.
- Behavioral data over stated data. Interview quotes that describe observed behavior ("she reopened the export three times before giving up") are stronger than quotes that describe stated preference ("she said she wants a simpler interface").

Flag if missing:
- The PM can only support one framing with evidence and has not tested the others. That is not evidence of the winning framing — it is evidence of which framing the PM has already decided is right. Force parity: look for evidence against the leading framing and evidence for the alternatives.
- All three framings are supported equally by the available evidence. This is a real outcome and it means the evidence is genuinely insufficient to discriminate — see the insufficient-evidence response below.
- The evidence is all stated preference. Name the gap: behavioral observation or production data is needed before the comparison is valid.

---

### 5. Pick the strongest framing and capture the alternatives

The PM commits to one framing — the one best supported by Layer-3 causal evidence, with the least contradicting data.

Ask: **"Given the evidence comparison, which framing is most defensible? Not which framing you find most interesting — which one the data supports most directly."**

Push for:
- A rationale that cites the specific evidence. Not "I think Framing B is right" — "Framing B is best supported because [specific interview moment / behavioral data point / production metric]. Framings A and C are possible but less well-evidenced because [specific reason]."
- An honest acknowledgment of what would change the choice. "Framing A would become stronger if we found [specific data]." This is not hedging — it is naming the falsification condition, which is required for a good diagnostic framing per the Hypothesis-Driven Problem Solving principle.

The alternatives are not discarded. They are captured in the artifact as named alternatives with their evidence state. When the framing turns out to be wrong — and it may — the team returns to this artifact and picks up where the comparison left off.

---

## Handling the PM who cannot generate alternatives

If the PM is stuck after a genuine attempt — restating the same framing in different words across all three slots — the likely cause is one of three things:

1. **The evidence base is too thin.** They have only heard one type of story, from one type of user, so they have only developed one framing. The fix is fieldwork: more interviews with a different segment, or with users at a different layer of the actor hierarchy (e.g., they have talked to end users but not operators). Name the fieldwork, stop the playbook, and do not substitute framework-walking for it.

2. **The PM is emotionally committed to a solution and is reverse-engineering a framing to fit it.** The solution is already decided; the framing exercise feels threatening. Name this directly: "It sounds like you have a solution in mind and are looking for the framing that supports it. That is the one-idea funnel applied to problems. We need to frame the problem before picking a solution — the framing decides which solutions are even relevant." If the PM cannot disengage from the solution, run the kill the one-idea funnel question: "What problem would we be solving if we could not build the solution you are thinking of?"

3. **The PM genuinely cannot see alternative angles.** In this case, offer the divergence axes from Step 2 as a structured prompt — not as a shortcut, but as scaffolding for a real thinking move. Walk one axis explicitly: "If we changed the actor — instead of framing this as an end-user problem, who else experiences this pain? What would it mean if this were primarily an operator problem?" Let the PM develop the alternative from there.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| Three framings exist and each names a different actor, layer, category, or scope | kill the one-idea funnel (Continuous Discovery Habits): "Force 3-5 solutions per opportunity before picking one" — the same principle applies to framings. A single framing is the one-idea funnel at the problem level. |
| The three framings pass the MECE test — each can be independently true or false | MECE (Issue Tree): "Mutually exclusive: no item fits into more than one category. Collectively exhaustive: the set is complete — no relevant item is missing." Framings that always rise and fall together are one framing, not three. |
| Each framing was tested against both supporting and contradicting behavioral evidence | Continuous Discovery: "Asking 'what did you do last time' produces data. Asking 'what would you want' produces hypotheticals that don't predict behavior." Evidence must be behavioral, not stated-preference. |
| The chosen framing cites Layer-3 causal evidence, not Layer-1 stated preference | Jobs To Be Done (coach-problem-framing SKILL.md operating principles): "Push past Layer 1 (fantasy) and Layer 2 (surface) to Layer 3 (causal reality)." |
| Alternatives are preserved in the artifact with their evidence state, not discarded | Issue Tree: "The branching is MECE at every level: no two branches should overlap, and together they should account for everything relevant." Dropping alternatives destroys the branch record. |
| No solution is named in any of the three framings | coach-problem-framing hard wall: "We are framing the problem. Solutions come later — and the framing decides which solutions are even relevant." |
| If the PM could not generate alternatives, fieldwork was named as the unblock rather than walking the framework | Continuous Discovery: "If the PM is stuck because they have not run a single behavioral interview, the unblock is fieldwork — not more whiteboarding." |

---

## Output

`.agentic-pm/framing/<feature>-three-framings.md` — a single file containing:

1. **Leading framing** (the one the PM arrived with, sharpened to one sentence with actor + behavior + mechanism)
2. **Framing B** (the alternative generated from a different actor, layer, category, or scope)
3. **Framing C** (a second alternative, genuinely distinct from both A and B, MECE-checked)
4. **Evidence table** — for each framing: supporting evidence (behavioral, with source), contradicting evidence (behavioral, with source), and evidence type tag (Layer 1 / Layer 2 / Layer 3)
5. **Chosen framing** — the one selected, with rationale citing specific evidence
6. **Alternatives held** — A brief note on what would change the choice: what evidence would elevate each alternative into the strongest framing
7. **Open questions** — what is genuinely not known that the chosen framing depends on; these become the inputs to the problem statement and any remaining fieldwork before compile-problem-statement runs

---

## Handoffs

- **Next:** `compile-problem-statement.md` — takes the chosen framing and the evidence table and compiles the PR-FAQ-style artifact.
- **If behavioral evidence is insufficient to discriminate between framings:** name fieldwork as the unblock and stop the session. Do not compile a problem statement from an unresolved framing competition.
- **If the PM's chosen framing turns out to be non-AI (computational problem or strategy question):** the routing test will catch this in `route-the-handoff.md`. The framing playbook is solution-agnostic; the framing itself does not determine the route.

End the session by naming the single open question the chosen framing depends on most — typically: which actor is the primary locus of the problem, which layer the mechanism lives at, or what behavioral data is missing that would settle the comparison. One concrete action in the next 48 hours: a specific interview, a workflow observation, or a production data pull that closes the most critical open question.
