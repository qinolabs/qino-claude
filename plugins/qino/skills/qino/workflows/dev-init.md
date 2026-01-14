# Dev Init Workflow

**Execution:** spawn
**Voice:** Grounded. Practical. Not heavy. This is the moment before building begins.
**Agent:** dev

**Reference:** Read `references/dev/home-pattern.md` for the arrival pattern used in generated commands.

---

## Task

Create a new app in the implementation workspace. Two modes:

1. **From concept** (argument provided): Link to concepts-repo, run translation exploration
2. **Standalone** (no argument): Create app without concept link

---

## Prerequisite Check

Verify `implementations/` directory exists. If not:

> "No implementation workspace found. Run 'setup implementation workspace' first."

Stop.

---

## Flow: From Concept

When argument contains a path to a concept file:

### 1. Detect Concept Format

Read the file. Check for qino-concept markers:
- "## 1. Real-World Impulse"
- "## 2. Glowing Connections"
- "## 3. Primary Surfaces"

If markers found → proceed with linked creation.
If not found → treat as a general input file, extract what you can.

### 2. Extract Concept Metadata

From the file path, determine:
- `conceptsRepo`: Parent directory of `concepts/[id]/concept.md`
- `linkedConcept`: The concept id (directory name)
- `conceptName`: From the `# [Name]` header in the file

Generate a short app id (2-3 letters) from the concept name for the command.
Example: "board-games" → "bg"

### 3. Translation Exploration (~15 min)

The concept holds essence. Your job is to translate to technical reality.

**Phase 1: Read & Ground (2-3 min)**

Read the full concept.md. Output a grounding summary — this is the arrival surface:

```
┌─────────────────────────────────────────┐
│ [concept-name]                          │
│                                         │
│ essence                                 │
│ [1-2 sentences from Real-World Impulse  │
│ — the why, what it's responding to]     │
│                                         │
│ surfaces                                 │
│ [Primary Surfaces — where it lives,     │
│ how you interact with it]               │
│                                         │
│ smallest version                        │
│ [Scoped Features — what the first       │
│ living version includes]                │
│                                         │
└─────────────────────────────────────────┘

Has your understanding shifted since this was written?
```

This grounding is **visible output** — the user sees where we're starting from before any questions.

**WAIT** for response.

If understanding has shifted, note what's different — this is material for capture later.

**Phase 2: Technical Translation (10-12 min)**

Explore the technical reality through dialogue:

1. **Stack**: "Given this essence, what technologies feel right? What have you already decided?"

2. **Complexity**: "On a scale of 1-10, how complex should this be? What does that mean practically?"

3. **Architecture**: "What patterns serve this concept? Server-centric? Client-first? Something else?"

4. **Boundaries**: "What's explicitly in? Out? What should we consider later?"

5. **Flags**: "How will we know we're on track? What would be warning signs?"

**WAIT** after each question. This is dialogue, not a form.

**Phase 3: First Iteration (2-3 min)**

> "What's the first thing to build? What would make this feel real?"

Define the first iteration:
- Scope
- Goals (as checkboxes)
- How to test before moving on

### 4. Generate Artifacts

Create the following files:

**`implementations/[app]/implementation.md`**

Use `references/dev/templates/implementation-template.md` as structure.

Fill in from the translation exploration:
- Concept source (path to linked concept)
- Technical foundation (stack, complexity, architecture)
- Boundaries (approved, restricted, later)
- Flags (green, red)

**Include concept sync tracking** (enables drift detection on future arrivals):

```markdown
## Concept Sync

**Linked**: [path to concept.md]
**Last Check**: [current ISO timestamp]
**Concept Modified**: [concept's last_touched from manifest.json]

For essence questions: `explore [concept-id]`
```

Read the concept's `last_touched` from the concepts-repo manifest.json and record it here. This baseline enables comparing on future arrivals.

**`implementations/[app]/iterations/01-foundation.md`**

Use `references/dev/templates/iteration-template.md` as structure.

Fill in from the first iteration discussion.

**Update `.claude/qino-config.json`**

Add concept link:
```json
{
  "repoType": "implementation",
  "conceptsRepo": "[absolute path to concepts-repo]",
  "linkedConcept": "[concept-id]"
}
```

**`.claude/commands/qino-dev/[short-id].md`**

Use `references/dev/templates/app-command-template.md` as structure.

Replace placeholders with:
- `{{APP_NAME}}`: Full app name
- `{{APP_ID}}`: Concept id
- `{{SHORT_ID}}`: Short command id (e.g., "bg")

### 5. Confirm

After generating:

> "Your app is ready.
>
> `[short-id]` — arrive at your app
> 'capture: [thought]' — capture insights (goes to concepts-repo)
> 'explore [concept]' — check essence alignment
>
> The first iteration is defined. Ready to build."

---

## Flow: Standalone

When no concept path provided:

### 1. Ask What We're Building

> "What are we building? Give me a quick sense."

**WAIT** for response.

### 2. Quick Translation (~5 min)

Run a condensed version of the translation exploration:
- Stack and complexity
- First iteration scope

### 3. Generate Artifacts

Create implementation.md and first iteration without concept link.

Do NOT update qino-config.json with concept fields (no linked concept).

Generate the app command.

---

## Do NOT:

- Generate without dialogue (the exploration matters)
- Skip the translation exploration
- Create overly complex iteration plans
- Fill implementation.md with placeholders — only include what was actually discussed
- Assume technical details — ask
