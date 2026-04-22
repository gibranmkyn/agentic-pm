# People Files — Compounding Stakeholder Context

Stakeholder dossiers that accumulate across sessions. Every skill that touches a stakeholder reads from here. Skills that learn something new about a stakeholder write back.

---

## How it works

Each person gets a file: `context/people/<firstname-lastname>.md`

Skills that interact with stakeholders (strategy, decisions, stakeholder, prd, roadmap) check this directory before starting. If a person file exists for a relevant stakeholder, the skill reads it for context — communication preferences, past positions, known objections, what motivates them.

After a session, if the skill learned something new about a stakeholder (from the PM's answers during the discovery interview), it appends to the person file. This means the second time you work with a stakeholder in agentic-pm, the skill already knows their context.

---

## File template

```markdown
---
name: <Full Name>
role: <Title — Role — Organization>
last_updated: <YYYY-MM-DD>
---

# <Full Name>

## Role and context
<What they do, what they own, how they relate to your product/team>

## What they care about
<Their priorities, incentives, what success looks like for them — be specific>

## Communication style
<How they prefer to receive information: data-heavy? narrative? short? detailed?>
<Meeting preferences: async? 1:1? group? written?>

## Known positions
<Stances they've taken on relevant decisions. Include date and context.>
- <YYYY-MM-DD>: <Position on topic> — <context for why>

## Relationship notes
<Trust level, history, any sensitivities>

## Session log
<Auto-appended by skills. One line per session.>
- <YYYY-MM-DD>: <skill name> — <what was learned>
```

---

## Rules

- **Names stay in people files, not in Work/ artifacts.** PRDs, decision docs, and strategy docs use roles ("the VP of Eng"), not names. People files are the only place names appear.
- **Update, don't duplicate.** If a person file exists, append to it. Don't create a second file.
- **Skills read before interviewing.** If the PM mentions a stakeholder during the discovery interview, check if a people file exists. Use it to ask better questions.
- **Skills write after learning.** If the discovery interview reveals something new about a stakeholder (objection, preference, position), append one line to the session log.
- **PM owns accuracy.** Skills can suggest updates; the PM confirms. Don't auto-write speculative inferences.

---

## Which skills read/write people files

| Skill | Reads | Writes |
|---|---|---|
| stakeholder | Always (maps stakeholder context) | Yes (objections, positions, communication preferences) |
| decisions | SPIDER roles (approver, input-givers) | Yes (positions taken during decision) |
| product-strategy | Audience identification | Rarely (only if PM names specific skeptic) |
| prd | XFN partners at Stage 3 | No |
| roadmap | Dependency owners | No |
| one-pager | Target reader identification | No |
| start | Initial setup (optional) | Yes (if PM names key stakeholders during context init) |
