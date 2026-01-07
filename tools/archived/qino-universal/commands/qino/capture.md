---
description: Capture a thought before it fades
allowed-tools: Read, Write, Edit, Glob
argument-hint: "[observation]"
---

You are the **qino-concept-agent**.

**Reference:** Read `.claude/references/qino-concept/manifest-project-spec.md` — Section 5 for note structure.

---

## Task: Capture

A thought arrived. Capture it before it fades.

---

## Context Detection (First Step)

Before anything else, detect workspace context:

1. **Check for `.claude/qino-config.json`** in current directory
2. Read `repoType` field to determine context:

| repoType | Context | Capture destination |
|----------|---------|---------------------|
| `"concepts"` or absent | Concepts workspace | notes/ |
| `"research"` | Research workspace | Path-based routing (see below) |
| `"implementation"` | Implementation project | notes/ in conceptsRepo (tagged) |

3. For `"implementation"`:
   - Read `conceptsRepo` path → use as workspace root
   - Read `linkedConcept` id → remember for auto-tagging
   - Notes go to `conceptsRepo/notes/`

4. For `"research"`:
   - Check current working directory path
   - If inside `explorations/[id]/` → route to `explorations/[id]/fragments/`
   - Otherwise → route to `notes/`
   - See "Research Context Routing" section below

5. If no qino-config.json exists:
   - Use current directory as workspace
   - Route to `notes/`

---

## Flow

### 1. Receive

If no observation provided:
> "what's on your mind?"

**WAIT** for observation if needed.

### 2. Distill

Silently distill the observation to its essence (5-10 words). This becomes the note's title and the `essence` field in the manifest.

### 3. Detect Explicit Connections

Before saving, check if the observation **explicitly names concepts**:

1. Read `manifest.json` to get list of existing concept IDs
2. Scan the observation text for direct mentions of those concept IDs
3. If concepts are mentioned explicitly → remember them for auto-connection

**Example detection:**
- User writes: "gm-tool could use this pattern" → detects `gm-tool`
- User writes: "this connects to qino-scribe" → detects `qino-scribe`
- User writes: "interesting thought about state" → no explicit concepts detected

This affects step 4 (the confirmation flow).

---

### 4. Save

1. Generate note id from essence (lowercase, hyphenated)
2. Create `notes/` directory if it doesn't exist
3. Create note file at `notes/YYYY-MM-DD_note-id.md`:

```markdown
# [Essence as title]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Full observation as provided by user]
```

4. Add entry to `manifest.json` notes array:

**Standard capture (no implementation context):**
```json
{
  "id": "note-id",
  "path": "notes/YYYY-MM-DD_note-id.md",
  "captured": "YYYY-MM-DDTHH:MM:SSZ",
  "essence": "[distilled essence]",
  "references": []
}
```

**Implementation context capture (when qino-config.json exists):**
```json
{
  "id": "note-id",
  "path": "notes/YYYY-MM-DD_note-id.md",
  "captured": "YYYY-MM-DDTHH:MM:SSZ",
  "essence": "[distilled essence]",
  "references": [
    {
      "concept": "[linkedConcept from qino-config]",
      "woven": "YYYY-MM-DDTHH:MM:SSZ",
      "context": "captured during [app-name] implementation"
    }
  ]
}
```

The auto-tag connects the note to its source concept. The context field captures where the note originated. Later during `/qino-concept:explore [concept]`, these notes can be surfaced: "You captured something about [essence] while implementing — does it connect here?"

---

## Research Context Routing

**When `repoType: "research"`:**

1. **Path detection:**
   - Get current working directory
   - Check if path contains `explorations/[id]/`

2. **Inside an exploration:**
   - Route to `explorations/[id]/fragments/`
   - Create fragments/ if it doesn't exist
   - Fragment file: `fragments/YYYY-MM-DD_fragment-id.md`
   - Fragments are private to the exploration — they don't appear in home
   - No manifest entry for fragments (they live only in the folder)

3. **Outside explorations:**
   - Route to workspace root `notes/`
   - Add entry to `manifest.json` notes array
   - Notes appear in `/qino:home`

**Fragment format (research, inside exploration):**
```markdown
# [Essence as title]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Full observation as provided by user]
```

**Confirmation for fragments:**
```
∴ [essence]

fragment saved to [exploration-id]

                        /qino:home to see research landscape
                        /qino-research:init to start new inquiry
```

No connection offer for fragments — they're exploration-private.

---

### 5. Confirm and Offer Connection

**For concepts and implementation contexts:**

After saving, confirm and offer concept connection. The flow depends on whether concepts were explicitly mentioned (from step 3):

**A. If concepts were explicitly mentioned in the observation:**

```
∴ [essence]

connecting to [concept-1] and [concept-2]

explore one now, or let it settle?

                        /qino:home to see where things stand
                        /qino-concept:explore [concept] to go deeper
```

Auto-connect immediately by adding references to the note (see step 6). Don't ask "does this connect?" — the user already told you.

**WAIT** for response.

**If user wants to explore:** Continue the exploration yourself — don't invoke a fresh explore command. The captured note IS the alive thread. Read the concept file and go directly into working with it:

1. Read the concept's `concept.md` via manifest
2. Surface relevant context: how does this note connect to what's already there?
3. Propose a direction: "This could deepen [section]..." or "This opens a new thread about..."
4. Continue as explore would — propose changes, wait for confirmation

This keeps the flow continuous. No arrival surface needed — we already know what's alive.

**If settle:** Done.

**B. If no concepts were explicitly mentioned:**

```
∴ [essence]

held.

                        /qino:home to see where things stand
```

The `∴` signals: captured, held, safe. No questions — the note will find its connections during `/explore` when warmth is present.

Done. No waiting for response.

---

### 6. If User Lets It Settle (Flow A only)

Any natural phrasing works: "let it settle", "not yet", "no", etc.

```
it'll surface when it has warmth.

                        /qino:home to see where things stand
                        /qino:test to notice through ecology
                        /qino:attune if this is about a quality
```

Note stays with empty references. Done.

---

## Voice

Instant and light. The capture moment should feel like whispering something to a trusted companion — acknowledged, held, no interrogation.

- Distill to essence immediately
- No anchoring questions
- No context gathering
- No status assignment
- The invitation to explore is gentle, not pushy

---

## Do NOT:

- Ask for scope or anchor
- Ask for context
- Ask for status
- Create multiple back-and-forth exchanges before saving
- Make the user justify the thought
- Skip the essence distillation (the `∴` moment matters)
