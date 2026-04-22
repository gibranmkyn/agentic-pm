---
product_type: AI Assistant / LLM-Powered Product
nsm: Weekly Tasks Completed (WTC)
core_action: A user submitting a prompt and taking action on the AI's output (using it, saving it, sending it)
stage: growth
---

# Metrics: AI Assistant / LLM-Powered Product — Weekly Tasks Completed

## North Star Metric
**Weekly Tasks Completed (WTC)** — Prompt volume is a vanity metric for AI assistants. What matters is whether users did something with the output — they used it, saved it, edited it, sent it. A task completed means the AI saved the user real time or produced something they couldn't have produced as easily themselves. This metric is the difference between an AI assistant that's a novelty (high prompts, low completion) and one that's a tool (high completion relative to prompts).

Core action: **Taking action on the AI's output** — Copying, saving, sending, or applying an AI output signals that the user judged it good enough to use. It's a revealed preference, not a stated satisfaction score. For most AI assistants, this is the closest proxy to "value delivered" that doesn't require a survey.

## Metric tree

Weekly Tasks Completed (WTC)
├── Discovery & activation
│   ├── % of new users who complete ≥1 task in first session
│   ├── Prompt-to-completion rate (% of prompts that result in user action on output)
│   └── Time-to-first-completed-task (median, new cohort)
├── Engagement
│   ├── Tasks completed per active user per week
│   ├── Task type breadth (# of distinct task categories a user engages with)
│   └── Prompt iteration rate (% of tasks requiring ≥3 follow-up prompts — signals struggle or complexity)
└── Retention
    ├── Week-4 retention (% still completing tasks in week 4)
    ├── Workflow integration rate (% using the tool inside an existing workflow vs. standalone)
    └── Power user definition: users completing ≥5 tasks/week (track this cohort separately)

## Guardrail metrics
- Output rejection rate (% of outputs that users delete, discard, or explicitly regenerate) — guards against optimizing for task count when users are going through the motions on bad output
- User-reported hallucination rate (errors flagged via thumbs-down or explicit feedback) — guards against completion rate growth driven by users who don't know the output is wrong

## What to watch at each stage
- **Pre-PMF:** Find users who complete tasks multiple times per week without any nudge. Run the Sean Ellis Test question adapted for AI tools: "How would you feel if you couldn't use this assistant anymore?" If fewer than 40% say "very disappointed," the core task quality isn't there yet — adding features won't fix it.
- **Growth:** Prompt-to-completion rate. If this is below 40%, users are frustrated with output quality — they're prompting but not using the results. This is the most important signal to fix before scaling acquisition.
- **Mature:** Workflow integration rate. AI tools that get embedded into a user's existing workflow (inside their email client, their code editor, their CRM) are 5–10x more retained than tools used in a separate tab. At maturity, the roadmap should prioritize integration points, not standalone features.

## Common mistake for this product type
Measuring daily active users (DAU) as the primary engagement metric. AI assistants don't need to be used daily to be valuable — a user who completes a complex task once a week and saves 2 hours is more valuable than one who generates 15 casual prompts that they never act on. DAU conflates "used it" with "got value from it." Track tasks completed, not sessions started.
