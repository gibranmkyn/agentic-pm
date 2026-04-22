#!/bin/bash
# tag-summary.sh — At session end, scan recently-written Work/ artifacts for
# warning tags so they're visible, not buried in frontmatter.

WORK_DIR="${AGENTIC_PM_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null)}/Work"

if [ ! -d "$WORK_DIR" ]; then
  exit 0
fi

# Find files modified in the last 10 minutes (likely this session's output)
RECENT=$(find "$WORK_DIR" -name "*.md" -mmin -10 2>/dev/null)

if [ -z "$RECENT" ]; then
  exit 0
fi

TAGS=""
KNOWN_TAGS="feasibility-unverified|discovery-unlinked|impact-unsized|positioning-skipped|guardrails-unchecked|assumptions-untested|evidence-missing"

for file in $RECENT; do
  FOUND=$(grep -oE "$KNOWN_TAGS" "$file" 2>/dev/null | sort -u)
  if [ -n "$FOUND" ]; then
    TAGS="$TAGS\n  $(basename "$file"): $FOUND"
  fi
done

if [ -n "$TAGS" ]; then
  echo "---"
  echo "OPEN TAGS ON THIS SESSION'S ARTIFACTS"
  echo -e "$TAGS"
  echo ""
  echo "These tags flag skipped checks. Downstream skills will adjust,"
  echo "but the gaps are yours to close."
  echo "---"
fi
