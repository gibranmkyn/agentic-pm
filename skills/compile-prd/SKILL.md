---
name: compile-prd
description: "Compile a stage-appropriate PRD (or one-pager pitch) from the section artifacts produced by upstream skills. Reads Work/ to find sharp vs thin sections, asks for target fidelity (Stage 1 one-pager / Stage 2 kickoff / Stage 3 full spec / Stage 4 launch / Stage 5 impact review), and emits the composed artifact. Not an authoring skill — if sections are thin, offers to invoke the sharpener skill first. The same artifact compiles at pitch fidelity for an exec ask OR full-PRD fidelity for engineering."
allowed-tools: Read Grep Glob Write Edit
---

# Compile-prd — Compose the PRD from section artifacts

The binding skill. PRDs and one-pagers are the *same content at different fidelities*; this skill scans `Work/` for each section's sharpener output and compiles at the requested stage. Absorbs the former `pitch` / `one-pager` / `design-agent-system` skills as compilation modes and add-on blocks.

---

## Context to load

- `context/COMPANY.md`
- `context/GOALS.md`
- `context/TEAM.md`
- `context/PRODUCTS.md`
- `context/CONSTRAINTS.md`

If any are template, **stop and invoke `/agentic-pm:setup-context` first**.

**Auto-scan for section artifacts (the whole point of this skill):**

Scan `Work/` for upstream section artifacts. For the feature in question, report which sections are sharp vs. thin:

| Section | Sharpener skill | Looks for |
|---|---|---|
| Problem | `/agentic-pm:map-opportunities` | `Work/discovery/<product>-ost.md` (target opportunity named) |
| Evidence | `/agentic-pm:synthesize-research` or OST snapshots | `Work/research/<topic>-report.md` or `Work/discovery/snapshots/` |
| Metrics | `/agentic-pm:define-metrics` | `Work/metrics/<product>-nsm.md` / `<product>-metric-tree.md` |
| Predicted impact | `/agentic-pm:size-impact` | `Work/metrics/<feature>-impact-sizing.md` |
| Risks & validation | `/agentic-pm:map-risks` | `Work/validation/<feature>-assumption-map.md` + `<feature>-validation-plan.md` |
| AI evals | `/agentic-pm:write-rubric` | `Work/evals/<feature>-eval-plan.md` |
| Stakeholders / GTM | `/agentic-pm:align-stakeholders` | `Work/stakeholders/<initiative>-alignment.md` |
| Decisions | `/agentic-pm:document-decision` | `Work/decisions/` entries related to this feature |
| Impact review (Stage 5) | `/agentic-pm:review-impact` | `Work/impact/YYYY-MM-DD-<feature>-impact.md` |

Report a **section freshness table** in the plan checkpoint: sharp (artifact exists, ≤60 days old), stale (artifact exists, > 60 days old), missing (no artifact).

Also read upstream PRD if it exists: `Work/prds/<feature>-prd.md` (this may be a recompile, not a fresh compile).

---

## Frameworks this skill loads

- `frameworks/modern-prd-lifecycle.md` — primary spine (5 stages, rolling checklist, 8/10 quality target)
- `frameworks/ai-prd.md` — AI-feature layer (7 AI metrics, Vibe Check, HiTL, risks)
- `frameworks/shape-up.md` — Shape Up Pitch spine (problem → appetite → solution sketch → rabbit holes → no-gos)
- `frameworks/appetite-vs-estimate.md` — for Shape Up's time-box framing
- `frameworks/snap-strategy.md` — one-pager pitch framing at Stage 1
- `frameworks/agent-architecture.md` — agentic-feature add-on block (absorbs former design-agent-system)

Read relevant frameworks based on detected work type.

---

## Speed-mode choice

> "Coach me through compilation (15–30 min — I'll reflect the freshness table, we'll discuss thin sections, you can sharpen them or accept tags) or fast-compile (3 min — I'll compile with whatever's in Work/ and tag thin sections)?"

Default to coach. Fast-compile applies `speed-mode-used` and surfaces thin-section tags prominently.

---

## Discovery interview

Read context + scan Work/ artifacts first. Don't ask what you can read. Push on these:

1. **"What fidelity do you need right now — Stage 1 one-pager for an exec ask, Stage 2 kickoff with mocks, Stage 3 full spec for engineering, Stage 4 launch-ready, or Stage 5 impact review?"** — Same sections, different depths. *(Modern PRD Lifecycle: "rolling checklist, not a fixed template.")*

2. **"Is this a Modern PRD (multi-week big-rock feature), a Shape Up Pitch (time-boxed bet, ≤6 weeks, scope-as-variable), or a one-pager pitch to unlock resources?"** — Spine choice. Don't use Modern PRD for a 2-week bet; don't use Shape Up for a multi-quarter platform feature.

3. **"Is this feature AI-powered? (check `PRODUCTS.md` AI surfaces)"** — Triggers the AI PRD layer (7 AI metrics, Vibe Check, HiTL, prompt-hacking + moderation risks, agent architecture if agentic).

4. **"I found [X] sharp sections and [Y] thin sections in Work/. Want to compile now and tag the thin ones, or sharpen the thin sections first before compiling?"** — The PM chooses. Fast movement sometimes beats completeness; sometimes the exec ask needs every section sharp.

5. **"Who's the audience for this compile? Exec / team / engineering / external stakeholder?"** — Changes emphasis. Exec reads the one-pager first; engineering reads rollout + tracking spec; external reads positioning. Same source, different weights.

6. **"Recompile: what changed since the last compile? Which sections need a refresh before we reassemble?"** — Avoids stale PRDs. A sharp section that's 2 months old in a shifted market is no longer sharp.

7. **"If Stage 5: do we have the actual-impact data from `review-impact`? If not, the compile will be speculative — worth it?"** — Stage 5 without `review-impact` is a self-serving narrative.

Interview until you can answer: Target stage? Spine (Modern / Shape Up / one-pager)? AI layer needed? Thin sections — sharpen now or tag?

---

## Plan checkpoint

Propose in one screen:

1. **"Here's what I heard"** — target stage, spine, audience, AI flag.
2. **"Section freshness table"** — for each section: sharp / stale / missing, with the source artifact path.
3. **"Here's the compile plan"** — which sections compile as-is, which need sharpening first (with the skill to invoke), which will be tagged thin, what add-on blocks apply.
4. **"Here are my concerns"** — false completeness risk, stale upstream, AI flag but no rubric, missing counter-metrics, stakeholders unaligned.

Ask: **"Sharpen thin sections first, or compile now and tag?"**

Do not compile until the PM confirms.

---

## Spine autoselect

| Signal | Spine | Wiki source |
|---|---|---|
| Default — multi-week big-rock feature | **Modern PRD Lifecycle** (5 stages, rolling checklist, 8/10 quality) | `Modern PRD Lifecycle` |
| AI / LLM-powered feature | **Modern PRD + AI PRD layer** (layered, not separate) | `AI PRD` |
| Time-boxed bet, scope-as-variable, ≤6 weeks | **Shape Up Pitch** | `Shape Up` + `Appetite vs. Estimate` |
| One-page exec pitch for resources (pre-decision) | **Stage 1 Modern PRD as pitch** (Snap Strategy framing) | Modern PRD Stage 1 + `Snap Strategy` |

---

## Situation-triggered add-on blocks

- **AI PRD layer** — appended when AI feature. Adds 7 AI metrics categories, Vibe Check threshold, HiTL pattern, Risks (Cost / Content / Prompt Hacking / Moderation), prompt-spec gap awareness.
- **Agent architecture block** — appended when AI feature is agentic (multi-step tool use, autonomy > single-call LLM). Covers: pattern choice, autonomy level (Sheridan scale), HiTL checkpoints, tool access & limits, failure modes & recovery. **Absorbs the former `design-agent-system` skill.**
- **Counter-metric block** — always appended at Stage 2+. *(Modern PRD: "missing counter-metrics" is top-5 mistake.)*
- **Positioning block** — appended when audience is external or GTM-coupled. Dunford's 5 steps.
- **Portfolio block** — appended when the feature sits inside an existing mature product with many surfaces.
- **Shape Up block** — overrides Modern PRD entirely when spine = Shape Up; appetite enforced as constraint, not estimate.

---

## Step-by-step flow

1. **Discovery interview + Work/ scan.**
2. **Plan checkpoint.** Reflect, show the freshness table, propose the compile plan, name concerns. Wait for PM confirmation.
3. **Thin-section loop (optional):** for each thin section the PM wants to sharpen, offer the handoff to the sharpener skill. When the sharpener completes, re-scan Work/ and return to the checkpoint.
4. **Select spine** — Modern PRD / Shape Up / one-pager (one-pager = Stage 1 Modern PRD).
5. **Compile at requested stage** — apply the rolling checklist; don't enforce later-stage sections early (false-completeness trap).

   **Stage 1 (Planning / one-pager):** Problem + Metrics target + Qualitative evidence (embedded, not linked-out) + Next steps. ≤1 page. Uses Snap Strategy framing if pitching for resources.

   **Stage 2 (Kickoff):** + Solution mock + NSM / secondary / guardrail metrics + Impact-sizing artifact or handoff.

   **Stage 3 (Solution Review):** + Edge cases + Rollout plan + XFN requirements + Tracking spec + GTM + Risks / mitigation.

   **Stage 4 (Launch Readiness):** Verify eng concerns addressed, design done, GTM enabled, financials cleared.

   **Stage 5 (Impact Review):** Link `review-impact` artifact; if none exists, flag.

   **Shape Up spine:** Problem (with raw appeal) + Appetite (2w / 6w) + Solution sketch (fat-marker, not pixel mocks) + Rabbit holes + No-gos. Appetite as constraint: if scope grows, cut scope, not extend time.

6. **Weave section content at target fidelity.** For each section: one-sentence version at Stage 1; full explanation at Stage 2–3; embed data/table/sketch at all stages. If a section artifact exceeds stage-appropriate depth, summarize rather than paste.
7. **Apply add-on blocks** per situation triggers.
8. **Self-validate** against the quality bar. Propagate tags for thin sections.
9. **Write the artifact** at `Work/prds/<feature>-prd.md`. If recompile, update in place (don't duplicate per stage). Update frontmatter to record latest stage + compile date.

---

## Quality bar

- [ ] Stage-appropriate sections only (rolling checklist, not full template) — *Modern PRD: "templates create false completeness"*
- [ ] User evidence embedded, not linked-out (at Stage 1) — *Modern PRD: top-5 mistake*
- [ ] Impact sizing present by Stage 2 (or `size-impact` handoff offered) — *Modern PRD: "most common quality gap"*
- [ ] Counter / guardrail metrics specified by Stage 2 — *Modern PRD: "missing counter-metrics"*
- [ ] Stage 5 recommended on every PRD at launch — *Modern PRD: "best PMs don't skip this"*
- [ ] 8/10 quality target unless explicitly the quarterly CEO-review feature — *Modern PRD*
- [ ] AI PRD: Vibe Check threshold defined before detailed AI metrics — *AI PRD*
- [ ] AI PRD: at least Accuracy + Speed + Cost + 1 Ethics metric — *AI PRD: 7-category framework*
- [ ] AI PRD: HiTL pattern named — *AI PRD*
- [ ] AI PRD: prompt-hacking + moderation risks named — *AI PRD*
- [ ] Agent architecture block: autonomy level named (Sheridan scale) — *Agent Architecture*
- [ ] Shape Up: appetite is constraint, scope is variable — *Shape Up + Appetite vs Estimate*
- [ ] Shape Up: rabbit holes + no-gos both populated — *Shape Up*
- [ ] Section freshness: no sharp-section artifact > 60 days old without re-check — *general hygiene*

---

## Tag propagation

Per section, if thin or declined:
- `discovery-unverified` — no upstream OST / target opportunity
- `evidence-thin` — no research report or snapshots
- `metrics-undefined` — no NSM / tree at Stage 2+
- `impact-unsized` — no sizing artifact at Stage 2+
- `risks-unmapped` — no assumption map at Stage 3+
- `evals-unplanned` — AI feature at Stage 3+ with no rubric
- `stakeholders-unaligned` — no alignment plan at Stage 3+
- `false-completeness-risk` — later-stage sections populated before earlier ones sharp
- `stale-upstream` — sharp section artifact > 60 days without re-check
- `agent-autonomy-unspecified` — agent feature with no Sheridan-scale level
- `speed-mode-used`

---

## Handoffs

**Upstream (what feeds the compile):**
- `/agentic-pm:map-opportunities` → Problem
- `/agentic-pm:synthesize-research` → Evidence
- `/agentic-pm:define-metrics` → Metrics
- `/agentic-pm:size-impact` → Impact
- `/agentic-pm:map-risks` → Risks + Solution
- `/agentic-pm:write-rubric` → AI Evals
- `/agentic-pm:align-stakeholders` → Stakeholders / GTM
- `/agentic-pm:document-decision` → embedded decisions
- `/agentic-pm:review-impact` → Stage 5

**Downstream (offered when the compile lands):**
- `/agentic-pm:plan-roadmap` — once Stage 2+ firm, slot into the roadmap
- `/agentic-pm:align-stakeholders` — if friction surfaces during compile
- `/agentic-pm:review-impact` — scheduled Stage 5 reminder N weeks post-launch

---

## Output

`Work/prds/<feature>-prd.md` — one living file per feature. Updated in place across stages. Frontmatter records latest stage + compile date.

For pitch / one-pager mode: Stage 1 compile can optionally snapshot to `Work/pitches/YYYY-MM-DD-<feature>-pitch.md` — useful when the PM wants to preserve the exact ask that was made.

---

## End every session with

- The current stage + the next stage's entry gate.
- Thin-section tags surfaced prominently with the sharpener skill named for each.
- If AI feature past Stage 2 with no rubric: *"Run `/agentic-pm:write-rubric` before Stage 3."*
- If Stage 4/5 with no alignment plan: *"Run `/agentic-pm:align-stakeholders`."*

---

## Completion status

- **DONE** — PRD compiled at requested stage, all quality checks passed, no thin-section tags
- **DONE_WITH_CONCERNS** — PRD compiled but thin-section tags applied (list each + name the sharpener for each)
- **BLOCKED** — context files are template, or no section artifacts exist (fresh start requires upstream skills first)
- **NEEDS_CONTEXT** — feature identity unclear; PM must name the feature before scan is meaningful

Escalation: if a Stage 3+ compile is requested but Problem or Metrics sections are missing/thin, refuse to compile and surface the sharpener skills. A PRD without a problem statement is fiction; a PRD without metrics is a wish list.
