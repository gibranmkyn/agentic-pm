---
name: listen-behaviorally
description: Use this playbook when the PM has stated preferences ("users want X") but no behavioral evidence — no observed behavior, no switch stories, no "tell me about the last time" data. Loaded by coach-problem-framing when the PM needs interview craft or switch-story extraction. Not invoked directly.
---

# Listen-Behaviorally — From stated preference to behavioral evidence

## Use case

This playbook is for the PM who has a signal — a complaint, a request, a survey result, a stakeholder claim — but whose evidence is entirely stated. No one has been interviewed with a behavioral entry move. No switch stories exist. No one has watched the workflow.

The job is to coach the PM through interview craft and switch-story extraction, or to name fieldwork as the unblock if no interviews have happened at all. Stated preferences fail in approximately 93% of cases (Jobs To Be Done). This playbook exists to interrupt that failure mode before it propagates into a framing.

---

## Locate

Before walking any sub-step, determine what the PM actually has. Ask:

1. **"What is the evidence you are working from? Quotes from interviews, survey responses, support tickets, something a stakeholder said, or your own hypothesis?"** — establish the evidence type.
2. **"Did you collect this yourself, or did it come secondhand?"** — secondhand summaries compound interpretation drift.
3. **"Have you conducted any interviews where you asked someone to walk you through a specific, recent experience — not what they would want, but what they actually did?"** — this is the Continuous Discovery entry test. If the answer is no, jump to the stop condition (sub-step 7) before proceeding further.
4. **"Are any of your sources people who have already switched to a new solution — or are about to?"** — Jobs To Be Done requires switchers; passive users cannot reliably reconstruct their causal decision.

If the PM has behavioral data from at least 2–3 interviews using the "tell me about the last time" entry move, and at least some sources are switchers — proceed through the sub-steps. Otherwise start at sub-step 7 and name fieldwork as the unblock.

---

## Spine

Two frameworks run in parallel, with a defined division of labor. Continuous Discovery governs product-trio discovery rhythm: weekly interviews, interview snapshots, OST integration, behavioral entry moves. Jobs To Be Done governs switch-story extraction: only interview switchers, apply the Four Forces, push past the three layers of language to causal reality. Do not mix their vocabularies mid-session.

---

## Sub-steps

### 1. Establish what layer the PM's evidence is at

Ask: **"Take one specific claim you are making about what users want. What is the source — a direct quote, a survey answer, a paraphrase, or your own synthesis?"**

Push for: the raw form of the evidence. A paraphrase is not a quote. A survey answer is not a behavioral story. Make the PM say, in plain terms, what a specific user actually said or did.

Flag if missing:
- The PM quotes themselves: "users basically said they want X." That is synthesis, not data.
- The PM cites a survey where the question was hypothetical ("how important is X to you?"). Hypothetical questions produce Layer 1 or Layer 2 answers; they cannot reach causal reality.
- Every piece of evidence is from the same channel (e.g., all support tickets, all sales calls). Single-channel evidence is systematically biased toward one user segment.

The three layers of language (Jobs To Be Done):
- **Layer 1 — Fantasy / nightmare.** Exaggerated, emotionally amplified. "I want everything in one place." "It's a nightmare." These quotes are signals pointing at a direction, not definitions of a job.
- **Layer 2 — Surface.** What the user consciously says and believes. "I want better search." "I need it to be faster." Honest but incomplete — surface desire, not causal driver.
- **Layer 3 — Causal reality.** What actually drove behavior. Revealed only through chronological story reconstruction, not direct questioning. This is the goal.

Name which layer the PM's evidence is at. If it is Layer 1 or Layer 2, the sub-steps below are how you move toward Layer 3.

### 2. Coach the behavioral entry move

Ask: **"The next time you speak with a user about this problem, what question will you open with?"**

Push for: the Continuous Discovery entry move — "Tell me about the last time you [did X]." Not "What would you want?" Not "How important is X to you?" A specific, past-tense, behavioral prompt that forces a real story.

Flag if missing:
- The PM plans to open with a hypothetical: "What would be ideal for you?" That question produces Layer 1 fantasy.
- The PM plans to open with a feature test: "What do you think of this idea?" That is usability testing, not discovery.
- The PM plans to show a prototype before hearing the story. Showing the prototype first contaminates the behavioral data — the user reacts to the artifact, not their lived experience.

The entry move is: "Tell me about the last time you [did X]." Then: "What happened first? What happened next?" Then: "Can you show me the email / tool / screen?" The artifact request grounds the story in physical evidence and prevents confabulation.

### 3. Push past the hypotheticals in the interview

Ask: **"When you heard this claim from a user, did you follow up by asking them to walk you through a specific recent episode — or did you move on?"**

Push for: evidence that the PM followed the causal thread. The interview discipline is: follow the story of what caused the person to say "today's the day I do something different." No rigid discussion guides — rigid guides prevent following the threads that reveal causation.

Flag if missing:
- The PM accepted the first answer and moved to the next question. First answers are almost always Layer 1 or Layer 2.
- The PM asked "why" directly. "Why" questions invite rationalization; "what happened next" questions reconstruct behavior.
- The conversation stayed in the abstract: "generally speaking, users tend to..." Generalization is the enemy of causal evidence.

The follow-up discipline: when the user gives a Layer 1 or Layer 2 answer, ask "Can you tell me about a specific time that happened?" Repeat until the story is concrete and chronological.

### 4. Identify and recruit switchers

Ask: **"Among the people you have spoken to — or plan to speak to — which ones have actually made a change? Moved from one tool to another, changed their workflow, tried a new approach, or are actively considering switching right now?"**

Push for: a named set of switchers. People who "plan to change someday" cannot reconstruct the causal story because no decision has been made. Only people who have recently switched — or are in the active moment of switching — can give Layer 3 data.

Flag if missing:
- All interviewees are existing, satisfied customers with no switch history. They will tell you why they stayed, not why someone would switch.
- The PM plans to interview prospects who have not yet made a decision. Prospects can express intent; they cannot reconstruct causal behavior that hasn't happened yet.
- The PM plans to interview users of a competitor who have not switched to their product. Useful for F1 and F2 signal but does not reveal F3 or F4 forces on the PM's product.

Two rounds of 12 is the recommended cadence (Jobs To Be Done): do 12 switcher interviews, identify patterns, then do 12 more with those patterns as hypotheses.

### 5. Apply the Four Forces to each switch story

When the PM has at least one switch story — someone who moved from a prior solution to the current one, or is actively considering switching — walk the Four Forces (Jobs To Be Done / Four Forces Model):

Ask for each story:

- **Push:** "What specifically was making the prior situation intolerable? Not 'it was slow' — what happened, in what specific moment, that made them say 'I can't keep doing this'?"
- **Pull:** "What did they imagine the new outcome looked like? What were they picturing when they made the move?"
- **Anxiety:** "What were they afraid of? What almost stopped them? What did they worry wouldn't work?"
- **Habit:** "What were they giving up? What felt comfortable about the old way that they were attached to?"

Push for: all four forces named for each story. A switch story that only has Push and Pull is incomplete — F3 and F4 reveal why adoption fails even when the product is good.

Flag if missing:
- The PM only has F1 and F2 data. That means they understand the problem and the aspiration but not the friction and the inertia. The feature will likely underperform on adoption even if it is well-built.
- All stories have the same F1 signal. That may be a real cluster — or it may be a recruiting bias. Ask: "Did you specifically recruit people who mentioned [F1 trigger], or did this emerge across different entry points?"
- F3 (anxiety) is absent. That almost never reflects reality — it reflects that the PM did not ask.

### 6. Capture the interview snapshot

For each interview that yielded behavioral evidence, capture a snapshot (Continuous Discovery interview snapshot template):

- **Experience map** — key moments from the user's story, in chronological sequence
- **Opportunities surfaced** — unmet needs that emerged from the story, in the user's language
- **Salient quote** — one verbatim line in the user's own words, ideally Layer 3
- **Segment facts** — role, context, tenure, behavioral profile of this person
- **Four Forces summary** — which forces were present, which were absent or weak

The artifact for this playbook is `./.agentic-pm/framing/<feature>-interview-snapshots.md`. Each interview gets one snapshot block appended to that file. Do not consolidate or synthesize across snapshots until at least 6 are collected — premature synthesis produces the same Layer 1/2 compression that interviews are designed to escape.

AI summaries of interview notes lose 20–40% of important detail (Continuous Discovery). Always reconstruct the snapshot from raw notes or transcript, not from a summary.

### 6b. VoC complement (optional sub-step)

If the PM's organization has a Voice of Customer program — systematic capture of support tickets, churn reasons, and sales-lost data with volume and dollar-value attached — name it as the complement, not the substitute, for discovery interviews.

Ask: **"Does your company have a VoC system that aggregates customer signals with volume counts and dollar values? If so, what does it say about this problem?"**

VoC is company-wide aggregate signal (Voice of Customer). Discovery interviews are product-trio behavioral signal. They answer different questions:
- VoC answers: how many customers mention this, how much revenue is at stake.
- Discovery interviews answer: what is actually happening behaviorally, what causal forces drive the switch.

Neither substitutes for the other. A high VoC volume count without behavioral interview data means you know the problem is widespread but not what is actually causing it. Behavioral interview data without VoC means you have a causal story but no scale signal.

Flag if missing:
- The PM is using VoC data as a substitute for discovery interviews. VoC produces quantified aggregate — it cannot reconstruct the causal story of a specific switching decision.
- The PM has no VoC system and their only scale signal is their own judgment. Recommend the PM identify at least one quantified source (support ticket volume, churn survey, sales-lost log) to complement the interview work.

### 7. Stop condition — name fieldwork as the unblock

If the PM has no behavioral interview data at all — no "tell me about the last time" interviews, no switch stories, no observed workflow — then no sub-step above is actionable. The unblock is fieldwork, not framework-walking.

Name it directly: **"You have stated-preference data, not behavioral evidence. The framing work cannot proceed until you have at least 6 behavioral interviews with people who have recently switched or are actively switching. That is the next concrete action — not more whiteboarding."**

Recommend a specific scope: 6–12 interviews with switchers or near-switchers. Minimum 2 must use the "tell me about the last time" entry move and follow the story to a specific chronological sequence. Minimum 2 must yield a Four Forces map.

End the session. Do not walk the remaining sub-steps. The playbook is premature when there is no behavioral data to work with.

---

## Quality bar (wiki-grounded)

| Check | Source |
|---|---|
| At least one quote in the PM's evidence is verbatim, not paraphrased | Continuous Discovery: "Entry question: 'Tell me about the last time you [did X]' — forces a specific, real event. Capture: One salient quote in the customer's own words." |
| Evidence has been labeled by layer: Layer 1, Layer 2, or Layer 3 | Jobs To Be Done: "Three layers of language: (1) fantasy/nightmare (exaggerated), (2) surface (what they consciously say), (3) causal reality (what actually drove them). Layer 3 is the goal." |
| At least one source is a person who has already switched or is actively switching | Jobs To Be Done: "Only interview people who have already switched. People who 'plan to' change can't assure their future behavior." |
| Interview entry move is behavioral, past-tense, and specific — not hypothetical | Continuous Discovery: "Entry question: 'Tell me about the last time you [did X]' — forces a specific, real event. Asking 'what would you want' produces hypotheticals that don't predict behavior." |
| At least one switch story has all four forces named: push, pull, anxiety, habit | Four Forces Model: "If F1 + F2 > F3 + F4, the person moves. If not, they stay. F3 (reducing anxiety) is frequently more powerful than adding features." |
| F3 (anxiety) and F4 (habit) are present in at least one story, not just F1 and F2 | Four Forces Model: "F4 (habit) is underestimated. People don't just buy rationally; they have to overcome the inertia of how they currently work." |
| Each interview snapshot captures: experience map, opportunities, salient quote, segment facts | Continuous Discovery: "Interview Snapshot Template: experience map, opportunities, quick facts, salient quote, miscellaneous insights." |
| VoC data, if cited as evidence, is named as aggregate-scale signal, not as a substitute for behavioral interviews | Voice of Customer: "Unlike real-time discovery databases (individual interview logs), VoC programs aggregate and quantify customer signals across all customer-facing functions." |
| If no behavioral data exists, the session ends with a named fieldwork recommendation, not continued framework-walking | Jobs To Be Done: "Don't trust stated preferences. In 93% of cases across one study, people said they wanted an Energy Star house; almost none actually bought for that reason. Revealed behavior > stated preference." |

If any check is unmet, name the gap as the next concrete action — a specific interview, a specific person to recruit, a specific follow-up to run.

---

## Output

`.agentic-pm/framing/<feature>-interview-snapshots.md` — one block per interview, appended as new interviews are completed. Each block contains:

1. **Interviewee** — role, context, switch status (recent switcher / near-switcher / non-switcher flag)
2. **Experience map** — chronological story reconstruction, key moments in sequence
3. **Opportunities surfaced** — unmet needs in the user's language
4. **Four Forces summary** — push / pull / anxiety / habit, with evidence for each
5. **Layer classification** — which layer each major quote sits at (1 / 2 / 3)
6. **Salient quote** — one verbatim line, Layer 3 preferred
7. **Segment facts** — behavioral profile of this person
8. **Open threads** — causal threads that were not followed and should be probed in the next interview

Do not produce a synthesized summary until at least 6 snapshots exist. Synthesis before sufficient data produces false clusters.

---

## Handoffs

- **Next (primary):** `diagnose-the-problem.md` — once 6+ behavioral snapshots exist with switch stories and Four Forces maps, the PM has enough raw material to diagnose what is actually broken and why it is hard.
- **If evidence is insufficient:** fieldwork loop — name the specific interview count, the recruitment criterion (switchers or near-switchers), and the entry-move discipline before the next session.
- **If the problem does not involve a switching decision** (e.g., internal workflow with no competitive alternative, habitual low-engagement behavior) — note that Jobs To Be Done switch-story methodology does not apply; use the Continuous Discovery behavioral entry move only, and flag the absence of Four Forces data in the snapshot.

End the session by naming the single riskiest evidence gap — which force is absent, which layer the PM is stuck at, or how many more interviews are needed before the diagnosis work can begin.
