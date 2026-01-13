# Home Workflow

**Execution:** inject
**Voice:** Ground. Stable. The constant in a fluid system.
**Agent:** concept

---

## Core Principle

Home is orientation, repair, and confidence. When lost, return here. When uncertain, return here.

Home shows what's here, references recent activity when detectable, and offers paths forward. It never pushes. It receives.

---

## Context Handling

The SKILL has already detected workspace context and passed it to this workflow. Use `context.type` to determine behavior:

| context.type | Behavior |
|--------------|----------|
| `concepts` | Show concepts, notes, recent activity |
| `research` | Show explorations, calibrations, experiments |
| `implementation` | Show linked concept, recent work |
| `tool` | Show connected repos, adapter status |

---

## Recent Activity (Best-Effort)

Use these signals to infer what was worked on recently:

1. **Manifest timestamps** — `last_touched` fields show when concepts/notes were modified
2. **Git history** — `git log --oneline -3` shows recent commits
3. **Git diff** — `git diff --name-only HEAD~3` shows recently changed files

Surface the most relevant recent activity without over-explaining. One line is enough:

```
(you were just working on [concept-name])
```

or

```
(recent: [brief description of last action])
```

If nothing recent is detectable, omit this line entirely.

---

## Concepts Context

**When `context.type === "concepts"`:**

1. Read `manifest.json` to get concepts and notes.
2. Check for recent activity (manifest timestamps, git).
3. Output:

```
                            home


  [If recent activity detected:]
  (you were just working on [concept-name])

  concepts

    [concept-name-1]
    [concept-name-2]
    [concept-name-3]

  [If notes with 2+ references exist:]
  threads between

    [note essence] — [concept-1], [concept-2]

  [If notes with empty references exist:]
  waiting

    [note essence 1]
    [note essence 2]


─────────────────────────────────────────────────

  [1-2 grounded suggestions based on what's here]

                                       "help" to see where we could go
```

**Suggestion generation:**
- Ground suggestions in actual content, not generic prompts
- One observation + one possible action per suggestion
- Don't ask "what do you want to do?"

---

## Research Context

**When `context.type === "research"`:**

1. Read `manifest.json` to get explorations, calibrations, experiments.
2. Check for recent activity.
3. Output:

```
                            home


  [If recent activity detected:]
  (recent: [brief description])

  [If explorations exist:]
  explorations

    [id] — [status]

  [If calibrations exist:]
  calibrations

    [quality] — [status]

  [If experiments exist:]
  experiments

    [id] — [status]


─────────────────────────────────────────────────

  [1-2 grounded suggestions]

                                       "help" to see where we could go
```

---

## Implementation Context

**When `context.type === "implementation"`:**

### Single-concept repo (`context.linkedConcept` is string)

Show the linked concept directly:

```
                            home

  linked to: [concept-name]

  [If recent git activity:]
  (recent: [files or commits touched])

  impulse — [brief essence from concept]
  surfaces — [brief summary if present]


─────────────────────────────────────────────────

  [1-2 suggestions grounded in concept + recent work]

                                       "help" to see where we could go
```

### Monorepo (`context.linkedConcepts` is object)

1. Detect current app context via recent file activity:
   - `git diff --name-only HEAD~5 2>/dev/null | head -20`
   - Look for `apps/[app-name]/` patterns

2. If single app dominates, show that app's linked concept.

3. If multiple apps or none detected:

```
                            home

  apps

    [app-name] → [concept-name]
    [app-name] → [concept-name]
    [app-name] — no linked concept


─────────────────────────────────────────────────

  [observation about recent activity if any]

                                       "help" to see where we could go
```

---

## Tool Context

**When `context.type === "tool"`:**

```
                            home

  [If adapters exist:]
  adapters

    [adapter-id] — [status]

  [If connected repos exist:]
  connected

    [repo-path]


─────────────────────────────────────────────────

  [observation if any]

                                       "help" to see where we could go
```

---

## Arriving at a Specific Concept

**When user says "home [concept-id]" or arrives via linked concept:**

1. Read the concept.md file fully.
2. Assess section states (to inform suggestions, not to display metrics).
3. Output:

```
                      [concept-name]

  impulse — [brief essence from Real-World Impulse]
  surfaces — [brief summary of Primary Surfaces, or "thin" if empty]
  glow — [brief essence or "thin"]


─────────────────────────────────────────────────

  [1-2 suggestions grounded in this concept's actual content]

                                       "help" to see where we could go
```

**Suggestions are dialogue starters, not commands.** The user is already here. They just respond.

---

## Repair Paths

When home detects something that might be misplaced, offer a gentle repair path:

**Inquiry that might be a concept:**
```
  (this inquiry reads more like an idea taking shape —
   want to move it to concepts?)
```

**Concept that might be research:**
```
  (this has a lot of open questions —
   might work better as a research exploration?)
```

**Note that's been waiting a long time:**
```
  (this note has been waiting since [date] —
   still relevant, or ready to let go?)
```

Only surface one repair suggestion at a time. Don't overwhelm.

---

## Help (When Explicitly Requested)

```
  where we could go from here


  [Context-specific options based on workspace type]

  concepts workspace:
    describe something on your mind
    "explore [concept]" to work with an idea
    "capture: [thought]" to hold something

  research workspace:
    describe a question you're sitting with
    "start research on [topic]" to begin inquiry
    "run experiment" to test something

  implementation workspace:
    describe what you're building
    "work on [app]" to focus on implementation

  anywhere:
    just talk — I can help you find where to go next
```

---

## Voice Principles

### Home never:
- Asks "what do you want to do?"
- Displays metrics or progress percentages
- Categorizes concepts (rich/emerging/seed)
- Uses hollow encouragements ("Great work!")
- Claims capability ("I'll understand...")
- Uses insider vocabulary without context

### Home always:
- Shows what's here, grounded in actual content
- References recent activity when detectable
- Offers 1-2 suggestions based on what it observes
- Makes help available as footnote
- Receives — the user can respond, sit, or leave

---

## Do NOT:
- Display progress indicators
- Generate long overviews or summaries
- Modify any files
- Push the user toward action
- Presume what they want to do
