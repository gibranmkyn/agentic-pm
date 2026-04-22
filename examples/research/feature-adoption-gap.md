---
mode: Feature Adoption Gap
method: Contextual inquiry / behavioral interview
when_to_use: Run this when a feature has been live for at least 6 weeks and adoption is materially below target — users who are eligible for the feature are not using it. Don't run this before 6 weeks; early adoption curves are normal and interviews before that point surface noise.
session_length: 40 minutes
participant_criteria: Active users who are eligible for the feature but have never used it (or used it once and stopped); ideally split between "discovered it and chose not to use it" and "never found it"
---

# Research Questions: Feature Adoption Gap

## Goal
Determine whether low feature adoption is a discovery problem, a comprehension problem, a motivation problem, or a trust problem — these require different fixes and the wrong diagnosis is expensive.

## Screener criteria
- Active user of the product (used it in the last 30 days)
- Eligible for the feature being investigated (no paywalls, no permissions gaps)
- Has not used the feature in the last 30 days (or has used it only once)
- Exclude users who explicitly said in a survey they don't want the feature — they've already told you; interviews won't add much

## Opening (5 min)

1. How do you typically use [product] day to day — what are the main things you use it for?
2. What does a successful session with [product] look like for you?
3. Are there parts of [product] you don't use or have ignored? What made you decide to skip those?

*Purpose: establish their mental model of the product and which features they see as "for them."*

## Core questions (25–30 min)

### Discovery
4. Have you ever come across [feature name] in [product]?

   *If yes:* Where did you first notice it?
   *If no:* I'm going to show you where it lives — [show it]. What's your first reaction seeing this?

5. Can you tell me in your own words what you think [feature] does?

   *Probe: Does it seem like something that would be useful for what you're trying to do?*

### Motivation
6. Is there a task or situation in your work where you currently have a problem that this feature seems like it might help with?

   *Probe: Walk me through the last time you had that problem. What did you do?*

7. If [feature] works the way you think it does — would it actually change how you do that task?

   *Probe: What specifically would be different? Or what would stay the same even if you used it?*

### Barriers
8. Is there any reason you haven't tried it, even if it seemed potentially useful?

   *Probe: Was it concern about changing your workflow, not being sure it would work, not having time to figure it out, or something else?*

9. If you imagined trying [feature] for the first time — what would you be most worried about going wrong?

   *Probe: Has anything like that happened with other features you've tried?*

### Workflow fit
10. When in your day or week would [feature] need to fit to be useful? Is there a natural moment when you'd reach for it?

    *Probe: Does [product] surface it at that moment, or would you need to go looking for it?*

11. Is there something you're already doing — inside or outside [product] — that does this job well enough that trying a new thing isn't worth the switching cost?

    *Probe: What would [feature] need to do better than your current approach for you to switch?*

### What would get them to try it
12. What would need to be different — in the feature itself, in how it's explained, or in how it's shown to you — for you to actually try it?

    *Probe: Is it a matter of getting a better explanation, seeing someone else use it, or just needing a specific problem to arise?*

## Closing (5 min)

13. Is there a feature in [product] or another tool you use that you adopted almost immediately because it was obvious how to use and why it mattered? What was it about that experience?

14. Anything else about [feature] or your use of [product] that you think I should understand?

## What to code for
- **Discoverability failure:** Users who have never seen the feature (the problem is placement or surfacing)
- **Comprehension failure:** Users who see it but don't understand what it does (the problem is naming and description)
- **Motivation failure:** Users who understand it but don't see it solving a problem they have (the problem is positioning or the feature's scope)
- **Trust/risk barrier:** Users who understand and are interested but are worried about trying it (the problem is onboarding or reversibility perception)
- **Incumbent competitor:** Users who have a working solution already and the switch cost isn't worth it (the problem is differentiation or workflow integration)

## Common mistake with this guide
Showing the feature during the interview and asking "would you use this?" The answer is almost always yes in a research context — people are polite and the researcher's presence creates demand artifacts. The signal you want is behavioral: do they have a problem this feature solves, and do they have a reason not to use it? Get both before you show the feature, and treat "yes I would use this" as weak signal unless backed by a specific use case they named unprompted.
