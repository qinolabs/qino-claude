# Capture Workflow

**Voice:** Instant and light. Like whispering to a trusted companion — acknowledged, held, no interrogation.

**Agent:** concept

**Reference:** Read `references/qino-concept/manifest-project-spec.md` — Section 5 for note structure.

---

## Task

A thought arrived. Capture it before it fades.

---

## Context Handling

The SKILL has already detected workspace context. Use it to determine capture destination:

| context.type | Capture destination |
|--------------|---------------------|
| `concepts` | notes/ |
| `research` | Path-based routing (see below) |
| `implementation` | notes/ in conceptsRepo (tagged with linkedConcept) |

For `implementation`:
- Use `context.conceptsRepo` as workspace root
- Remember `context.linkedConcept` for auto-tagging

For `research`:
- Check current working directory path
- If inside `explorations/[id]/` → route to `explorations/[id]/fragments/`
- Otherwise → route to `notes/`

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

**Implementation context capture:**
```json
{
  "id": "note-id",
  "path": "notes/YYYY-MM-DD_note-id.md",
  "captured": "YYYY-MM-DDTHH:MM:SSZ",
  "essence": "[distilled essence]",
  "references": [
    {
      "concept": "[linkedConcept from context]",
      "woven": "YYYY-MM-DDTHH:MM:SSZ",
      "context": "captured during [app-name] implementation"
    }
  ]
}
```

---

## Research Context Routing

**When `context.type === "research"`:**

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
   - Notes appear in home

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

                        "where am I" to see research landscape
                        "start research on [topic]" to begin new inquiry
```

No connection offer for fragments — they're exploration-private.

---

### 5. Confirm and Offer Connection

**For concepts and implementation contexts:**

After saving, confirm and offer concept connection. The flow depends on whether concepts were explicitly mentioned:

**A. If concepts were explicitly mentioned in the observation:**

```
∴ [essence]

connecting to [concept-1] and [concept-2]

explore one now, or let it settle?

                        "where am I" to see where things stand
                        "explore [concept]" to go deeper
```

Auto-connect immediately by adding references to the note. Don't ask "does this connect?" — the user already told you.

**WAIT** for response.

**If user wants to explore:** Continue the exploration yourself — don't invoke a fresh explore command. The captured note IS the alive thread. Read the concept file and go directly into working with it:

1. Read the concept's `concept.md` via manifest
2. Surface relevant context: how does this note connect to what's already there?
3. Propose a direction: "This could deepen [section]..." or "This opens a new thread about..."
4. Continue as explore would — propose changes, wait for confirmation

**If settle:** Done.

**B. If no concepts were explicitly mentioned:**

```
∴ [essence]

held.

                        "where am I" to see where things stand
```

The `∴` signals: captured, held, safe. No questions — the note will find its connections during explore when warmth is present.

Done. No waiting for response.

---

### 6. If User Lets It Settle (Flow A only)

Any natural phrasing works: "let it settle", "not yet", "no", etc.

```
it'll surface when it has warmth.

                        "where am I" to see where things stand
                        "test [target]" to notice through ecology
                        "attune [quality]" if this is about a quality
```

Note stays with empty references. Done.

---

## Do NOT:

- Ask for scope or anchor
- Ask for context
- Ask for status
- Create multiple back-and-forth exchanges before saving
- Make the user justify the thought
- Skip the essence distillation (the `∴` moment matters)
