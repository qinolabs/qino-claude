# Arc Open Workflow

**Execution:** inject
**Voice:** Present. You are acknowledging emergence as it begins.
**Agent:** concept

---

## Task

Opens an arc when the user notices something emerging — before it crystallizes, before it has a name.

Unlike retrospective arc capture (`arc.md`), this creates a **live container** that will accumulate sessions and pointers over time. No forced naming. No crystallization yet. Structure comes at closure.

**The shift:** From "what emerged?" (past) to "something is emerging" (present).

---

## Triggers

User says things like:
- "begin arc", "start an arc", "open an arc"
- "start tracking", "track this"
- "something is emerging", "there's something here"
- "I want to follow this thread"

---

## Context Handling

Find the research workspace:

1. If `context.type === "research"` → use current directory
2. If `context.researchRepo` exists → use that path
3. If neither → check common locations (`../qino-research`, `../../qino-research`)
4. If still not found → error: "no research workspace found. create one or configure researchRepo in qino-config.json"

All file operations target the research workspace.

---

## Flow

### 1. Receive

Acknowledge the emergence. Don't interrogate — receive.

> "opening..."

### 2. Ask What's Surfacing

One simple question. Accept minimal answers — even wordlessness.

> "what's surfacing here?"

or if context already provides a hint:

> "is it [observed theme]? or something else?"

**WAIT** for response.

The response can be:
- A sentence or two
- A few words
- "I don't know yet" (valid — use session context to generate provisional title)
- Silence/skip (also valid — use conversation context)

### 3. Generate Provisional Title

From their response (or from conversation context if no response), generate a provisional title.

**Title qualities:**
- Short (2-5 words)
- Evocative, not definitive
- Lowercase, hyphenated for id
- Holds the direction without closing it

**Examples:**
- "warming-attending"
- "substrate-recognition"
- "figures-as-containers"
- "the-recursive-pattern"

If the user provided almost nothing, derive from recent conversation themes.

### 4. Determine Session ID

The current session needs to be linked. Session identification:

- Session UUID from Claude Code transcript path: `~/.claude/projects/[project-hash]/[session-id].jsonl`
- The session-id is the filename without `.jsonl`
- If not directly accessible, use a proxy: `[project-name]_[ISO-timestamp]`

### 5. Create Active Arc Entry

Add to research workspace `manifest.json` arcs array:

```json
{
  "id": "arc-id",
  "title": "Provisional Title",
  "status": "active",
  "opened": "ISO-8601-timestamp",
  "beginning": "What's surfacing (1-2 sentences, or empty if wordless)",
  "sessions": ["session-uuid-or-proxy"],
  "pointers": []
}
```

**Field notes:**
- `status`: "active" (not "captured" — that comes at closure)
- `opened`: when the arc was opened (distinct from `span.start` which comes at capture)
- `beginning`: the user's response to "what's surfacing" — provides a settling point hint for eventual capture
- `sessions`: array of session identifiers — starts with current session
- `pointers`: empty array — will accumulate `{ "type": "...", "ref": "..." }` entries as work touches things

### 6. Confirm

Output the confirmation with the active arc symbol:

```
⟡ [provisional title]

(arc active — linked sessions will accumulate here. say "close arc" when ready to capture.)
```

Brief. The arc is now open. Work continues naturally.

---

## Symbols

| Symbol | Meaning |
|--------|---------|
| ⟡ | Active arc (live connection) |
| ∴ | Captured arc (settled) |

---

## Do NOT:

- Demand a full description of what's emerging
- Force naming before the user is ready
- Create elaborate structure — active arcs are minimal
- Explain the arc system at length

## DO:

- Accept minimal input
- Generate provisional titles that hold direction without closing
- Confirm briefly
- Let work continue naturally

---

## What Happens Next

With an active arc open:

1. **On future session arrivals**: Agents surface active arcs and offer linking
2. **Manual linking**: User can say "link to [arc]" to add sessions explicitly
3. **Pointer accumulation**: Work that touches relevant territory can add pointers
4. **At closure**: User says "close arc" → triggers `arc-close.md` which hands accumulated context to the retrospective capture flow

The arc is a container. It accumulates. Structure comes later.
