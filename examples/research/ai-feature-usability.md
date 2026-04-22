---
mode: AI Feature Usability
method: Think-aloud usability + post-session debrief
when_to_use: Run this when an AI feature has launched (or is in beta) and you need to understand where it fails users from the user's perspective — not what the error logs say, but what the user experiences and concludes. Most useful 2–6 weeks after launch before error analysis has been completed.
session_length: 50 minutes (30 min live observation + 20 min debrief)
participant_criteria: Real users who have access to the AI feature; mix of users who have tried it and users who haven't; for "haven't tried" participants, observe their first use
---

# Research Questions: AI Feature Usability

## Goal
Identify where AI output fails users — from the user's perspective, not the system's — including failures they don't recognize as failures and places where the AI gets in the way of what they were trying to do.

## Screener criteria
- Has access to the AI feature (no waitlist, no beta gating)
- Uses the surrounding product regularly (at least weekly) — this is about the AI feature specifically, not onboarding to the whole product
- Include a mix: some who've tried the AI feature, some who haven't
- Exclude ML engineers and data scientists — they interact with AI outputs differently from typical users (they're more likely to diagnose than react)

## Opening (5 min)

1. How do you use [product] day to day — what do you mainly use it for?
2. Have you come across or tried [AI feature name]? If yes — what was that like? If no — have you heard about it at all?
3. I'm going to ask you to use [product] today to [relevant task]. Please think out loud as you go — say what you're looking at, what you're trying to do, and what you're thinking.

*Purpose: set a real task context. The task should be something they'd actually need to do — not a made-up scenario.*

## Core questions (during live observation — probes only, 30 min)

*These are prompts for when you need to draw out thinking. Don't interrupt the flow:*

4. What were you expecting to happen there?
5. Does that output look right to you?
6. What would you do with that?
7. Is that what you were looking for?
8. What are you thinking right now?

*Watch for:*
- Moments of hesitation or re-reading
- Ignoring or immediately editing/discarding AI output
- Confusion about what the AI did or why
- Unexpected delight (also signal worth capturing)
- Over-reliance: accepting wrong AI output without checking

*If they produce or receive AI output that seems wrong to you: don't correct them. Let them finish and note the moment.*

## Debrief questions (20 min)

### The output
9. Looking at the output [the AI] gave you — does it look right to you?

   *Probe: Is there anything in there you'd change, remove, or double-check before using it?*

10. Was the output what you expected, or was it different from what you had in mind?

    *Probe: What was different? Is that a problem for you, or just different?*

11. Would you actually use what [the AI] gave you, as-is? Or would you edit it first?

    *Probe: What would you change? Is the editing more or less work than doing it yourself?*

### Trust
12. How confident are you that what [the AI] produced is accurate?

    *Probe: What would make you more or less confident?*

13. Have you had a situation where [the AI] gave you something wrong or unhelpful? What happened?

    *Probe: Did you catch it, or did you use it before you realized? What did you do?*

14. Is there any type of output from [the AI] that you automatically check before using, vs. output you'd trust and use without checking?

    *Probe: What's the difference between those categories?*

### The fit
15. Was there a moment in the session where [the AI] got in the way — where it made something harder or slower?

    *Probe: What happened? What would you have preferred?*

16. Is there something you tried to do today where you thought [the AI] would help and it didn't?

    *Probe: What were you hoping for? What happened instead?*

17. Is there something you tried to do without using [the AI] because you thought it wouldn't be useful — but in hindsight, it might have helped?

## Closing (5 min)

18. If you were explaining [AI feature] to a colleague — what would you say it does well, and what would you warn them about?

19. What's the one thing that would make you trust [the AI]'s output more?

## What to code for
- **Unrecognized failures:** Moments when the AI output was wrong and the user didn't catch it — this is the highest-severity finding
- **Silent rejection:** Output that the user discarded or heavily edited without commenting — the AI failed without the user naming it as a failure
- **Trust calibration:** Is the user appropriately skeptical, over-trusting, or so skeptical they won't use the feature at all?
- **Effort comparison:** Does using the AI feature save effort vs. doing the task manually? Where does it add effort instead?
- **Unexpected behavior:** Moments where the AI did something the user didn't expect — both in ways that confused them and ways that delighted them

## Common mistake with this guide
Evaluating AI feature quality by asking users to rate the output on a scale. Users rate AI outputs generously in research contexts because they don't want to seem critical. Behavioral observation — watching whether they actually use the output, edit it, or discard it — is the real signal. A user who rates an output 4/5 and then immediately rewrites it has told you the truth with their hands, not their words. Watch what they do, not what they say.
