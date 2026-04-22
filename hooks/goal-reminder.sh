#!/bin/bash
# goal-reminder.sh — After context files are read, print the team's current
# cycle goal and guardrails so every skill session starts with priorities visible.

GOALS_FILE="${AGENTIC_PM_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null)}/context/GOALS.md"

if [ ! -f "$GOALS_FILE" ]; then
  exit 0
fi

# Skip if still the template (contains angle-bracket placeholders)
if grep -q '^<' "$GOALS_FILE"; then
  exit 0
fi

CYCLE_GOAL=$(sed -n '/^## My team'\''s goal this cycle/,/^##/{ /^##/!p; }' "$GOALS_FILE" | sed '/^$/d' | head -3)
GUARDRAILS=$(sed -n '/^## Guardrails/,/^##/{ /^##/!p; }' "$GOALS_FILE" | sed '/^$/d' | head -3)

if [ -n "$CYCLE_GOAL" ] || [ -n "$GUARDRAILS" ]; then
  echo "---"
  echo "CYCLE GOAL: $CYCLE_GOAL"
  [ -n "$GUARDRAILS" ] && echo "GUARDRAILS: $GUARDRAILS"
  echo "---"
fi
