# Builder-Validator Protocol

**Status:** cross-cutting design principle. Applies to every agentic-pm skill that produces an artifact.

**Origin:** Carl Vellotti's builder-validator pattern — have Claude check its own output against the skill's quality bar before presenting it. Every skill already has a wiki-grounded quality bar. The validator step makes Claude run those checks on its own work before the PM sees it.

---

## The principle

**Don't hand over unchecked work.**

After producing an artifact and before presenting it to the PM, Claude runs every quality bar checkbox against its own output. Failures get fixed inline when possible. Unfixable failures get flagged explicitly with the framework citation.

This replaces "hope the PM catches it" with "Claude catches it first, PM verifies."

---

## How it works in every skill

### Step: Self-validate (runs after artifact is drafted, before presenting)

For each quality bar checkbox in the skill:

1. **Check** — Does the artifact pass this specific check?
2. **If pass** — Mark ✅ silently.
3. **If fail and fixable** — Fix the artifact. Note what changed.
4. **If fail and not fixable** — Flag with the framework citation. Explain why it failed and what the PM needs to provide to fix it.

### Present the validation report alongside the artifact

After the artifact, show a compact validation summary:

```
## Validation

✅ Diagnosis is specific, not aspirational (Strategy Kernel)
✅ Guiding policy has ≤3 bets (Strategy Kernel)
⚠️ No explicit trade-off named — I couldn't identify one from your input.
   Strategy Kernel: "coherent actions force the resolution."
   → What are you willing to stop doing to fund this strategy?
✅ Actions are verbs, not adjectives (Strategy Kernel)
```

### Rules

- **Fix before flagging.** If you can fix the issue without changing the PM's intent, fix it. Don't flag problems you can solve.
- **Flag before hiding.** If you can't fix it, say so. Never pass a check you know fails.
- **Cite the framework.** Every flag includes the source concept so the PM understands why it matters.
- **Don't invent checks.** Only validate against the quality bar checkboxes in the skill. Don't add your own checks.
- **Tags propagate from failures.** If a quality check fails and the PM accepts the flag, the corresponding tag from the Tag propagation section gets applied to the artifact.

---

## What this is NOT

- **Not a gate.** The PM can override any flag. The validator informs; it doesn't block.
- **Not a second draft.** Don't rewrite the artifact to pass checks. Fix specific failures.
- **Not a grading rubric.** Don't score 7/10. Binary pass/fail per check, with clear remediation for failures.

---

## Implementation in skill files

Every skill's `## Step-by-step flow` includes a self-validation step as the second-to-last step (before "Produce the artifact"):

```
N. **Self-validate.** Run every quality bar check against the draft artifact.
   Fix what you can. Flag what you can't with the framework citation.
   Present the validation summary alongside the artifact.
```

The `## Quality bar` section remains unchanged — it serves double duty as both the self-validation checklist and the PM's review checklist.

---

*Don't hand over unchecked work. The PM's job is to verify and override — not to catch mistakes you could have caught yourself.*
