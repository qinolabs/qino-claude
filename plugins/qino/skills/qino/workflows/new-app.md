# New App Workflow

**Execution:** spawn
**Voice:** Grounded. Practical. Not heavy. This is the moment before building begins.
**Agent:** build + protocol-structure

**References:**
- `references/build/repo-conventions.md` — Implementation repo structure patterns
- `references/build/home-pattern.md` — Arrival pattern for generated commands
- `references/build/template-guidance.md` — How to capture learnings through colocation
- Check for `templates/CREATING_NEW_APP.md` in implementation repo (app scaffolding guide)

---

## Task

Create a new app in the implementation workspace. Two modes:

1. **From concept** (argument provided): Link to concepts-repo, run translation exploration
2. **Standalone** (no argument): Create app without concept link

Protocol version: generates node.json, story.md, content/ instead of legacy implementation.md, iterations/, manifest.json.

---

## Prerequisite Check

Verify `graph.json` exists at workspace root and has a `nodesDir` field. Read the nodesDir to know where implementation nodes live (typically `"implementations"`).

If no graph.json or nodesDir:

> "No protocol-compliant workspace found. Run 'setup implementation workspace' first."

Stop.

---

## Flow: From Concept

When argument contains a concept reference:

### 1. Resolve the Concept

Find the concept in the concepts repo:
- Resolve concept path from existing `"concept grounds"` edges in graph.json
- Read `{conceptsWorkspace}/nodes/{concept-id}/node.json` for metadata
- Read `{conceptsWorkspace}/nodes/{concept-id}/story.md` for the impulse

If markers found (story.md exists with content) → proceed with linked creation.
If not found → treat as a general input, extract what you can.

### 2. Extract Concept Metadata

From the resolution:
- `conceptId`: The concept id (directory name under nodes/)
- `conceptName`: From `node.json` title or story.md header

Generate a short app id (2-3 letters) from the concept name for the command.
Example: "board-games" → "bg"

### 3. Translation Exploration (~15 min)

The concept holds essence. Your job is to translate to technical reality.

**Phase 1: Read & Ground (2-3 min)**

Read the concept's story.md and scan content/ files. Output a grounding summary — this is the arrival surface:

```
┌─────────────────────────────────────────┐
│ [concept-name]                          │
│                                         │
│ essence                                 │
│ [1-2 sentences from story.md            │
│ — the why, what it's responding to]     │
│                                         │
│ surfaces                                │
│ [Key surfaces — where it lives,         │
│ how you interact with it]               │
│                                         │
│ smallest version                        │
│ [Scoped features — what the first       │
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

**`{nodesDir}/{app}/node.json`**

```json
{
  "title": "[App Name]",
  "type": "app",
  "status": "active",
  "created": "[ISO timestamp]"
}
```

**`{nodesDir}/{app}/story.md`**

Fill in from the translation exploration:
- Concept link (relative path to concept in concepts repo)
- Technical foundation (stack, complexity, architecture)
- Boundaries (approved, restricted, later)
- Flags (green, red)
- Related documentation links

```markdown
# [App Name]

## Concept

**Linked**: `{relative path to concept story.md}`
**Concept ID**: [concept-id]

For essence questions: `explore [concept-id]`

## Technical Foundation

[Stack, complexity budget, architecture patterns from translation exploration]

## Boundaries

**Approved**: [what's in scope]
**Restricted**: [what's explicitly out]
**Later**: [what to consider in future iterations]

## Flags

**Green**: [signals we're on track]
**Red**: [warning signs]
```

**`{nodesDir}/{app}/content/01-foundation.md`**

Fill in from the first iteration discussion:
- Scope
- Goals as checkboxes
- Test criteria
- Empty "Technical Decisions" and "Learnings" sections for capture during work

**Add `"concept grounds"` edge in graph.json:**

Add an edge linking the app node to its concept via cross-graph reference:
```json
{
  "source": "[app-id]",
  "target": "qino-concepts:[concept-id]",
  "label": "concept grounds"
}
```

No other graph.json update needed — the nodesDir auto-discovery picks up new node directories automatically.

**`.claude/commands/qino-dev/[short-id].md`**

Generate command file following the home pattern (see `references/build/home-pattern.md`).

Replace placeholders with:
- `{{APP_NAME}}`: Full app name
- `{{APP_ID}}`: App directory name
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

Create node.json, story.md, and first iteration in content/ — without concept link.

```json
{
  "title": "[App Name]",
  "type": "app",
  "status": "active",
  "created": "[ISO timestamp]"
}
```

Do NOT update qino-config.json with concept fields (no linked concept).

Generate the app command.

No graph.json update needed — auto-discovery handles it.

---

## App Scaffolding (When Building from Templates)

If the first iteration involves creating the actual app code from templates (common for new apps), follow this process after generating artifacts:

### 1. Read the Template Guide (if exists)

Check if `templates/CREATING_NEW_APP.md` exists in the implementation repository. If it does, read it for complete setup instructions.

Otherwise, proceed with the general scaffolding pattern below.

### 2. Allocate Ports

Check `docs/reference/worktree-port-configuration.md` or `docs/ports.md` for existing port allocations. Find the next available port pair:

```
Frontend: 30XX
Backend: 40XX
```

### 3. Create Environment Files (CRITICAL)

Apps will NOT work without these files. Create them immediately after copying templates:

**Backend** (`apps/<app>-backend/.dev.vars`):
```bash
WRANGLER_DEV_PORT=<allocated-backend-port>
CLERK_SECRET_KEY=<clerk-secret-key>
```

**Frontend** (`apps/<app>/.env.local`):
```bash
VITE_DEV_PORT=<allocated-frontend-port>
VITE_BACKEND_URL=http://localhost:<allocated-backend-port>
```

**Frontend** (`apps/<app>/.dev.vars`):
```bash
VITE_CLERK_PUBLISHABLE_KEY=<clerk-publishable-key>
```

### 4. Clerk Keys

**First, scan for existing keys** (recommended for ecosystem consistency):

```bash
grep -r "CLERK" apps/*/.dev.vars apps/*-backend/.dev.vars 2>/dev/null
```

If found, reuse the same keys.

If no existing keys found, **ask the user**:

> "This app uses Clerk authentication. I need your Clerk API keys:
>
> 1. Publishable Key (starts with `pk_test_` or `pk_live_`)
> 2. Secret Key (starts with `sk_test_` or `sk_live_`)
>
> You can find these at https://dashboard.clerk.com → API Keys"

**WAIT** for user to provide keys before proceeding.

### 5. Verify Setup

After creating environment files, verify the app starts:

```bash
pnpm -F @malao/<app>-backend -F @malao/<app> dev
```

Common errors if environment is missing:
- "Missing WRANGLER_DEV_PORT" → Backend `.dev.vars` not created
- "Failed to connect to backend" → Port mismatch in `VITE_BACKEND_URL`
- "Clerk authentication failed" → Missing or incorrect Clerk keys

---

## Do NOT:

- Generate without dialogue (the exploration matters)
- Skip the translation exploration
- Create overly complex iteration plans
- Fill story.md with placeholders — only include what was actually discussed
- Assume technical details — ask
- Skip environment file creation when scaffolding apps
- Proceed without Clerk keys if the template uses Clerk auth
- Look for `implementation.md`, `iterations/`, or `manifest.json` — use protocol paths
- Update graph.json with the new node — nodesDir auto-discovery handles it
