---
name: document-decision
description: "Structure a decision so it doesn't get relitigated. Use when you have a pending decision that needs options documented, an approver named, and reasoning made durable — or when a team behavior problem needs diagnosis."
allowed-tools: Read Grep Glob Write Edit
---

# Decisions — Make Decisions Durable

Produces a SPIDER decision document or mini-SPIDER — the artifact that replaces meetings as the primary decision medium. Decisions made in meetings get relitigated; decisions in documented artifacts don't.

---

## Context to load

Before doing anything, read the context files:
- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are still the template, **stop and invoke `/agentic-pm:setup-context` first**.

Scan `context/people/` for people files matching SPIDER roles (approver, input-givers). If they exist, use known positions and communication preferences to inform the Ideas section framing.

Also read:
- `Work/decisions/` (scan for related past decisions — context matters)

---

## Frameworks this skill loads

- `frameworks/one-way-two-way-door-decisions.md` — reversibility filter (first)
- `frameworks/spider-decision-framework.md` — primary document structure
- `frameworks/five-cause-management-diagnostic.md` — alternate spine for behavior/execution problems
- `frameworks/decision-first-research.md` — handoff when research could change the decision

Read these before running the session.

---

## Speed-mode choice

Before the interview, ask once:

> "Coach me to clarity (15–30 min Socratic — we'll pressure-test the reasoning against the frameworks together) or draft-then-edit (5 min — I'll produce a draft with assumptions flagged for you to fix)?"

Default to coach. If the PM picks draft mode, skip the full discovery interview, infer situation from context + request, produce a draft with assumptions flagged at the top, and apply the `speed-mode-used` tag.

---

## Discovery interview

Before producing anything, interview the PM. Read all 5 context files first — don't ask what you can read. The goal is to determine whether this is actually a decision, who really makes it, and whether it needs to be made at all.

Push on these questions (adapt based on context; follow up on vague answers):

1. **"Is this actually a decision, or is it a preference being dressed up as one? What are the real trade-offs?"** A decision has genuine trade-offs — choosing one option means losing something from another. If there's an obviously correct answer, this might not need a SPIDER doc; it needs someone to just do it. *(SPIDER: the framework exists to make hard decisions durable, not to bureaucratize easy ones.)*

2. **"Who is the real decision-maker? Not who should be — who will actually make this call?"** Surfaces political reality. The stated approver and the actual decision-maker are often different people. If the CEO will override whatever is decided, name the CEO as the approver and design the document accordingly. *(SPIDER: "Approver cannot be skipped.")*

3. **"What happens if no decision is made? Is the status quo actually an option, or is inaction a decision by default?"** Many teams default to the status quo without realizing it's a choice. If doing nothing has consequences, "no decision" is itself a decision — and it should be listed as an option in the Ideas section.

4. **"Is this decision being relitigated? If so — is that because the last decision wasn't documented, or because genuinely new information arrived?"** *(SPIDER: "Decisions made in meetings get relitigated; decisions in documented artifacts don't.")* If it's a documentation failure, the fix is to document the existing decision, not re-decide. If new information arrived, name what changed.

5. **"Could you undo this in under a week if it turned out to be wrong?"** *(One-Way vs. Two-Way Door: "most teams treat two-way doors as one-way — applying heavyweight process to easily reversible decisions.")* If yes, this is a two-way door and a mini-SPIDER may be sufficient. If no, the full SPIDER process is warranted. Push back if the PM is applying one-way-door rigor to a two-way-door decision.

6. **"Whose idea is missing from the options list? If someone's preferred option isn't represented, they'll relitigate regardless of how well the decision is documented."** *(SPIDER: "if their idea is absent, they will relitigate regardless.")* Surfaces the political landmines before the document is written.

7. **"Is there information you don't have that would meaningfully change this decision? If so, should we be doing research first?"** Catches premature decisions. If the decision hinges on unknown data, offer the Decision-First Research handoff to `/agentic-pm:plan-research` before documenting a decision built on guesses.

Interview until you can answer: Is this a real decision? Who actually makes it? Is it reversible? Is it being relitigated, and if so, why? Are all options represented?

---

## Plan checkpoint

After the interview, propose a plan in one screen:

1. **"Here's what I heard"** — reflect the PM's situation in 2–3 sentences. Name the actual decision, the real approver, the reversibility classification, and any political dynamics.
2. **"Here's the approach"** — which spine (full SPIDER, mini-SPIDER, or 5-Cause Diagnostic) and why. Whether research is needed first.
3. **"Here are my concerns"** — missing stakeholders, options not yet represented, relitigation risk, information gaps that could change the outcome.

Ask: **"Want to adjust before I start documenting?"**

Do not produce any artifact until the PM confirms.

---

## Spine autoselect

Ask:
1. What is the decision? (One sentence.)
2. Is this reversible? (Could we undo this in under a week if it turned out to be wrong?)
3. Is this about "why isn't something getting done?" rather than "which option to choose?"
4. Is there information we don't have that would meaningfully change the decision?

Pick spine:
- **Any significant decision** → Reversibility filter first (one-way vs. two-way door), then calibrate depth
- **One-way or significant two-way door** → Full SPIDER (Situation / People / Ideas / Decision / Explanation / Rollout)
- **Team-level / day-to-day** → Mini-SPIDER (2–3 sentences: "We're deciding between X and Y; we chose Z because…")
- **"Why isn't X getting done?"** → 5-Cause Management Diagnostic (communication → training → deadline → motivation → blockers); work the list in order, stop at first "no"
- **Research could change this** → Before proceeding, offer a Decision-First Research handoff to `/agentic-pm:plan-research`

---

## Step-by-step flow

1. **Discovery interview.** Read context files. Interview the PM using the questions above. Push on vague answers. Follow up. Minimum 5 questions before proposing a plan.
2. **Plan checkpoint.** Propose: what you heard, the spine you'd pick, reversibility classification, concerns. Wait for PM approval before producing anything.
3. **Classify reversibility.** Determine one-way vs. two-way door. Use this to set process depth (full SPIDER, mini-SPIDER, or diagnostic).
4. **If 5-Cause Diagnostic:** walk the list in order (communication → training → deadline → motivation → blockers). Stop at the first "no." Name the cause and the fix. Do not continue down the list.
5. **If full SPIDER:**
   - Write **Situation**: context someone unfamiliar with the project can read.
   - Complete **People**: name Advocate, Approver (cannot be blank), Input-givers (who must be consulted before finalizing), Aligned (informed after).
   - List **Ideas**: ALL options under consideration — including ones the advocate opposes. List each neutrally with pros and cons. Do not advocate in this section.
   - **Decision**: advocate's recommendation (or leave blank in high-politics situations — let the approver fill in).
   - **Explanation**: brief, objective rationale for the chosen option.
   - **Rollout**: implementation owner and next steps per function with timelines.
6. **Stakeholder gap check.** For each SPIDER role: is anyone important missing? If Input-givers aren't consulted before the decision is finalized, pause and note the gap.
7. **Date stamp the decision.** This is the most overlooked field; enforce it.
8. **Self-validate.** Before presenting the artifact, run every check in the quality bar against your draft. Fix failures you can fix without changing the PM's intent. Flag failures you can't fix — include the framework citation and what the PM needs to provide. Present the validation summary (✅/⚠️ per check) alongside the artifact.
9. **Save the artifact** to `Work/decisions/YYYY-MM-DD-<decision-slug>.md`. Add to the decision journal.

---

## Quality bar

Before finalizing the artifact:

- [ ] Reversibility classified before depth decision — *One-Way vs. Two-Way Door: "most teams treat two-way door as if one-way"*
- [ ] Ideas section includes ALL options, including ones the advocate dislikes — *SPIDER: "if their idea is absent, they will relitigate regardless"*
- [ ] Ideas section is neutral (pros/cons, no advocacy) — *SPIDER: "Stay completely neutral... Do not advocate"*
- [ ] Approver is explicitly named — *SPIDER: "approver cannot be skipped"*
- [ ] Decision date is captured — *SPIDER: "the most overlooked field — constant reopener"*
- [ ] Input-givers are consulted before Decision field is filled — *SPIDER: "pause and consult first"*
- [ ] Document is saved to a shareable location — *SPIDER: "meetings have no memory"*
- [ ] If 5-Cause: list worked in order, stopped at first "no" — *5-Cause: "Don't jump to motivation if the cause is communication"*

---

## Tag propagation

- Input-givers not yet consulted at time of writing → tag `stakeholders-pending`
- Decision date not captured → tag `date-missing`
- Reversibility not classified → tag `reversibility-unassessed`

---

## Handoffs

- **Upstream:** `/agentic-pm:plan-research` (if research would change the decision — invoke before finalizing)
- **Downstream:** None — the SPIDER doc is the output. Other skills (e.g., PRD) may reference it.

---

## Output

`Work/decisions/YYYY-MM-DD-<decision-slug>.md` — accumulates into a decision journal over time.

The journal is more valuable than any single decision document. Over time, it answers "why did we decide that?" automatically, prevents repeated debates, and onboards new team members into team reasoning.

---

## End every session with

- The named next action: who takes the decision to the approver, and by when.
- If Input-givers haven't been consulted: "Don't finalize until [name] has been consulted — skipping this is how decisions get relitigated."
- If the SPIDER process revealed a stakeholder's position on this decision, offer to log it in their people file at `context/people/<name>.md` — one line in the Session log section.

---

## Completion status

Report exactly one of at close:
- **DONE** — decision document written, approver named, all quality checks passed, no tags propagated
- **DONE_WITH_CONCERNS** — document written but tags applied (list each: `stakeholders-pending`, `date-missing`, `reversibility-unassessed`)
- **BLOCKED** — decision cannot be structured; state what is unresolved
- **NEEDS_CONTEXT** — decision too vague to document; ask the one question that unblocks it

Escalation: if an Approver cannot be named, stop. A SPIDER document without an approver has no mechanism for the decision to actually be made.
