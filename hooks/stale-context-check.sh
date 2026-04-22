#!/bin/bash
# stale-context-check.sh — Warn when context files haven't been updated in
# 30+ days. Stale context is one of the top reasons PM tooling stops working.

CONTEXT_DIR="${AGENTIC_PM_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null)}/context"

if [ ! -d "$CONTEXT_DIR" ]; then
  exit 0
fi

STALE_FILES=""
NOW=$(date +%s)
THRESHOLD=$((30 * 86400))

for file in "$CONTEXT_DIR"/*.md; do
  [ "$file" = "$CONTEXT_DIR/README.md" ] && continue
  [ ! -f "$file" ] && continue

  if [ "$(uname)" = "Darwin" ]; then
    MOD=$(stat -f %m "$file")
  else
    MOD=$(stat -c %Y "$file")
  fi

  AGE=$(( NOW - MOD ))
  if [ "$AGE" -gt "$THRESHOLD" ]; then
    DAYS=$(( AGE / 86400 ))
    STALE_FILES="$STALE_FILES\n  $(basename "$file") — ${DAYS} days old"
  fi
done

if [ -n "$STALE_FILES" ]; then
  echo "---"
  echo "STALE CONTEXT WARNING"
  echo -e "These context files haven't been updated in 30+ days:$STALE_FILES"
  echo ""
  echo "Run /agentic-pm:start to refresh them."
  echo "---"
fi
