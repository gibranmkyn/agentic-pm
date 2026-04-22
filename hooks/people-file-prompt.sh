#!/bin/bash
# people-file-prompt.sh — After writing a decision doc or strategy doc, nudge
# the PM to update people files if the session surfaced stakeholder insights.

PEOPLE_DIR="${AGENTIC_PM_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null)}/context/people"

echo "---"
echo "PEOPLE FILE REMINDER"
echo "Did this session surface anything new about a stakeholder —"
echo "their priorities, concerns, decision style, or influence?"
if [ -d "$PEOPLE_DIR" ]; then
  echo "Update their file in context/people/."
else
  echo "Consider creating context/people/ to track stakeholder notes."
fi
echo "---"
