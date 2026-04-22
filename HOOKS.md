# Hooks — How agentic-pm compounds

Skills are what you do. Hooks are how you compound. Every skill session starts fresh — Claude Code doesn't remember what mattered last time. Hooks fix that by injecting context automatically: your team's current goal, stale-file warnings, stakeholder nudges, open-tag summaries. You configure them once. They run every time.

> "Skills are what you do. MCP is how you connect. Hooks are how you compound." — Dave Killeen

---

## What hooks are

Claude Code hooks are shell commands that fire automatically in response to events — before a tool runs, after a tool runs, when the agent stops. They're configured in `.claude/settings.local.json` (per-user, never committed) and execute without you remembering to invoke them.

**Hook types:**

| Type | When it fires | Use case |
|---|---|---|
| `PreToolUse` | Before a tool is called | Block or modify tool inputs |
| `PostToolUse` | After a tool is called | React to what just happened |
| `Notification` | When a notification is sent | External alerts |
| `Stop` | When the agent finishes | Quality gates, session summaries |

Each hook has a `matcher` (regex pattern matching the tool name) and one or more commands to run.

---

## The four hooks agentic-pm recommends

These are not required. agentic-pm works without them. But each one addresses a real failure mode — the kind where a PM's tooling quietly degrades because nothing forces the right information into view.

### 1. Goal reminder (PostToolUse)

**What:** After any context file is read, print your team's cycle goal and guardrails.

**Why:** Every skill reads context files at session start. Without this hook, the goal lives in `GOALS.md` but never surfaces as a visible reminder. You end up producing artifacts that drift from the team's actual priority because the goal was loaded but not front-of-mind.

**Script:** `hooks/goal-reminder.sh`

Reads `context/GOALS.md`, extracts "My team's goal this cycle" and "Guardrails," prints them as a short block. If GOALS.md doesn't exist or is still the template, does nothing.

### 2. Stale context warning (PostToolUse)

**What:** When context files are read, check their modification dates. If any are older than 30 days, print a warning.

**Why:** Context rot is silent. Your `COMPANY.md` still says "pre-PMF" three months after your Series A closes. Your `TEAM.md` still lists a designer who left. Skills produce output grounded in stale reality, and you don't notice until the artifact feels off. This hook makes staleness visible.

**Script:** `hooks/stale-context-check.sh`

Checks each file in `context/` (except README.md). If any haven't been modified in 30+ days, prints their names and suggests running `/agentic-pm:start` to refresh.

### 3. People file prompt (PostToolUse)

**What:** After writing a decision doc or strategy doc to `Work/`, remind you to update stakeholder people files.

**Why:** Decision and strategy sessions consistently surface new information about stakeholders — what they care about, how they react, where they'll push back. That information is valuable for future sessions but only if it gets written down. This nudge makes write-back a habit instead of an afterthought.

**Script:** `hooks/people-file-prompt.sh`

One-line reminder after any write to `Work/decisions/` or `Work/strategy/`. Points to `context/people/` if it exists, suggests creating it if not.

### 4. Tag summary (Stop)

**What:** When a skill session ends, scan any artifacts written to `Work/` in the last 10 minutes for warning tags (`feasibility-unverified`, `discovery-unlinked`, `impact-unsized`, etc.). Print a summary of open tags.

**Why:** agentic-pm's autonomy principle means skills never refuse when you skip a recommended practice — they tag the output instead. Those tags matter because downstream skills read them and adjust. But tags buried in frontmatter are easy to miss. This hook puts them in your face at session end.

**Script:** `hooks/tag-summary.sh`

Scans recently-modified `Work/*.md` files for known warning tags. If any are found, lists them by file.

---

## Setup (5 minutes)

### Step 1 — Make the scripts executable

```bash
chmod +x hooks/*.sh
```

### Step 2 — Set the repo root

The scripts use `AGENTIC_PM_ROOT` to find context and Work directories. Set it in your environment or let the scripts fall back to `git rev-parse --show-toplevel`.

For explicit control, export it in your shell profile:

```bash
export AGENTIC_PM_ROOT="/path/to/your/agentic-pm"
```

### Step 3 — Add hooks to your local settings

Open `.claude/settings.local.json` and add the `hooks` key. This file is per-user and should not be committed.

Here is the full configuration — copy it and merge it into your existing settings:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Read",
        "hooks": [
          {
            "type": "command",
            "command": "./hooks/goal-reminder.sh",
            "timeout": 5000
          },
          {
            "type": "command",
            "command": "./hooks/stale-context-check.sh",
            "timeout": 5000
          }
        ]
      },
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "./hooks/people-file-prompt.sh",
            "timeout": 5000
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": ".*",
        "hooks": [
          {
            "type": "command",
            "command": "./hooks/tag-summary.sh",
            "timeout": 10000
          }
        ]
      }
    ]
  }
}
```

If you already have content in `.claude/settings.local.json` (permissions, etc.), merge the `hooks` key into your existing object. Don't replace the whole file.

### Step 4 — Verify

Run any agentic-pm skill. You should see the goal reminder print after context files load, and the tag summary print at session end.

---

## How to customize

**Change the staleness threshold.** In `hooks/stale-context-check.sh`, change `THRESHOLD=$((30 * 86400))` to your preferred number of days times 86400.

**Scope the people-file prompt.** The Write matcher fires on all writes. To limit it to decision and strategy docs only, change the matcher to a regex:

```json
"matcher": "Write.*Work/(decisions|strategy)/.*"
```

**Add your own tags.** In `hooks/tag-summary.sh`, extend the `KNOWN_TAGS` variable with any custom tags your team uses.

**Disable a hook.** Remove its entry from the `hooks` array in settings. The scripts stay in `hooks/` — they just stop firing.

---

## What not to do with hooks

- **Don't use hooks to enforce process.** Hooks are nudges, not gates. If a hook starts blocking work, it'll get disabled and the compounding stops.
- **Don't put slow operations in hooks.** Each hook has a timeout (5s default). If a script takes too long, it gets killed and you lose trust in the system.
- **Don't commit hooks config to the repo.** Hook configuration goes in `.claude/settings.local.json` (per-user). The scripts themselves (`hooks/*.sh`) can be committed — they're inert without the config.

---

## How hooks connect to the rest of agentic-pm

```
context/          Skills read these files every session
    |
    v
hooks/            Fire automatically when context is read or artifacts are written
    |
    v
Work/             Artifacts accumulate here, tagged with skipped-check metadata
    |
    v
downstream skills Read tags from upstream artifacts and adjust
```

Hooks don't change what skills do. They change what's visible when skills run. That visibility is where compounding happens — you catch stale context before it poisons an artifact, you remember to write back stakeholder insights, you see open tags before closing the session.

---

*Hooks are optional infrastructure. agentic-pm works without them. But a PM who configures them once gets better output from every session after that — without remembering to do anything differently.*
