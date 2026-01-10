# Home Workflow

**Execution:** inject
**Voice:** Quiet arrival. The openings invite, they don't push.
**Agent:** concept

**Reference:** Read `references/qino-concept/design-philosophy.md` — Part I for universal principles, Part III (sections 10-11) for home-specific guidance.

---

## Task

Home is a place of arrival. Quiet. Receiving. What it shows depends on where you are.

---

## Context Handling

The SKILL has already detected workspace context and passed it to this workflow. Use `context.type` to determine behavior:

| context.type | Behavior |
|--------------|----------|
| `concepts` | Show concepts, notes, threads |
| `research` | Show explorations, calibrations, experiments |
| `implementation` | Show linked concept from conceptsRepo |
| `tool` | Show connected repos, adapter status |

---

## Implementation Context (Linked Concept)

**When `context.type === "implementation"`:**

### Single-concept repo (`context.linkedConcept` is string)

Treat as arriving at the linked concept automatically. Follow "With Concept-id (Arrive)" section below.

The user is in their implementation project. Show them their linked concept without asking.

### Monorepo (`context.linkedConcepts` is object)

When `linkedConcepts` is an object mapping app names to concept IDs:

1. **Detect current app context** by checking recent file activity:
   - Run `git diff --name-only HEAD~5 2>/dev/null | head -20` to see recently touched files
   - Look for patterns like `apps/[app-name]/` in the paths
   - If a single app dominates recent activity, use that app's linked concept

2. **If app detected and has a linked concept:**
   - Show the linked concept using "With Concept-id (Arrive)" section
   - Add context line: `(via [app-name])`

3. **If no app detected or multiple apps active, show monorepo overview:**

```
implementation space

apps

  [app-name] → [concept-name]
  [app-name] → [concept-name]
  [app-name] — no linked concept

─────

from here

  [observation about recent activity]
  [action suggestion]

                        "show me [concept]" to arrive at a concept
                        "explore [concept]" to work
```

4. **If argument provided** (e.g., user said "home qino-chronicles"):
   - Treat as concept ID, show that concept directly

---

## Research Context (Research Space)

**When `context.type === "research"`:**

**Reference:** Read `references/qino-research/research-spec.md` for research structure.

1. Read `manifest.json` to get explorations, calibrations, experiments, graduated.

2. Output the research view:

```
research space

[If active explorations exist:]
explorations

  [id] — [status], [thread count] threads
  [id] — [status]

[If calibrations exist:]
calibrations

  [quality] — [status]
  [quality] — [status]

[If experiments exist:]
experiments

  [id] — [status]

[If recent graduations exist:]
graduated (recent)

  [id] → [destination type]

─────

from here

  [observation line 1]
  [action line 1]

  [observation line 2]
  [action line 2]

                        "start research on [topic]" to begin inquiry
                        "run experiment" to test
                        "capture: [thought]" to hold a thought
                        "attune [quality]" to refine
                        "explore [concept]" in concepts-repo
```

**Section visibility:**
- `explorations` — only if explorations exist in manifest
- `calibrations` — only if calibrations exist
- `experiments` — only if experiments exist
- `graduated` — only if items graduated recently (last 7 days)
- `from here` — always shown (2-3 suggestions)

**Suggestion generation for research:**

Each suggestion has two lines:
- **Line 1 (observation)**: What you notice in the research space
- **Line 2 (action)**: What could happen next

---

## Tool Context (Tool Repository)

**When `context.type === "tool"`:**

1. Read `manifest.json` to get adapters and connected repos.

2. Output the tool view:

```
tool space

[If adapters exist:]
adapters

  [adapter-id] — [status]

[If connected repos exist:]
connected

  [repo-path] — [sync status]

─────

from here

  [observation about tool state]
  [action suggestion]

                        see connected repos for usage context
```

---

## Concepts Context (See the Whole)

**When `context.type === "concepts"` or no argument provided:**

**Purpose:** Show the whole — threads, concepts, what's waiting.

**Steps:**

1. Read `manifest.json` to get concepts and notes.

2. Output the whole view:

```
[If notes with 2+ references exist:]
threads between

  [note essence] — [concept-1], [concept-2]
  [note essence] — [concept-1], [concept-2], [concept-3]

─────

concepts

  [concept-name-1]
  [concept-name-2]
  [concept-name-3]

[If notes with empty references exist:]
─────

waiting

  [note essence 1]
  [note essence 2]

[If notes with ecology field exist:]
─────

noticed

  [ecology]: [concept] — [brief essence]
  [ecology]: quiet across all concepts

─────

from here

  [observation line 1]
  [action line 1]

  [observation line 2]
  [action line 2]

                        "show me [concept]" to arrive
                        "explore [concept]" to work
                        "capture: [thought]" to hold
                        "test [target]" to notice through ecology
                        "attune [quality]" to refine (research)
```

**Section visibility:**
- `threads between` — only shown when notes with 2+ references exist
- `concepts` — always shown
- `waiting` — only shown when notes with empty references exist
- `noticed` — only shown when notes have `ecology` field in references
- `from here` — always shown (2-4 suggestions)

---

## With Concept-id (Arrive)

**Purpose:** Arrive at one concept. See its state. Open to dialogue.

**Steps:**

1. Read the specified `concept.md` file fully.

2. Assess each section's state (not to display metrics, but to inform suggestions):
   - Which sections have substance?
   - Which are thin or empty?
   - What specific content stands out?
   - Are there notes connected to this concept?

3. Output the concept view:

```
[concept-name]

impulse — [brief essence from Real-World Impulse section]
surfaces — [brief summary of Primary Surfaces]
glow — [state indicator: thin, or brief essence if present]

─────

from here

  [observation line 1]
  [action line 1]

  [observation line 2]
  [action line 2]

                        just respond, or see what connects this to another
                        ("explore [id]", "explore [id] and [other-id]", "where am I")
```

**Conversational opener rules:**

Suggestions are NOT commands — they are dialogue starters. The user is already here. They just respond.

Each suggestion has two lines:
- **Line 1 (observation)**: Content-grounded, what you notice in this concept
- **Line 2 (action)**: Vocabulary-aligned, opens a door — can be a question or an action

**Voice:** Quiet arrival. The openings invite, they don't push. The user can respond or not. They can sit here. They can leave. Home receives.

---

## Do NOT:
- Display metrics or progress indicators
- Categorize concepts (rich/emerging/seed)
- Use hollow encouragements ("Great work!", "Nice progress!")
- Ask what the user wants to do
- Generate long overviews or summaries
- Modify any files
