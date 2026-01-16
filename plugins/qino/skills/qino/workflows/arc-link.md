# Arc Link Workflow

**Execution:** inject
**Voice:** Brief. Acknowledgment, not ceremony.
**Agent:** concept

---

## Task

Links the current session to an active arc. This can happen:
- Automatically when an agent detects relevance on arrival
- Explicitly when the user requests it

The session becomes part of the arc's accumulation — its transcript will be available for retrospective tracing at closure.

---

## Triggers

**Explicit user request:**
- "link to [arc-title]"
- "add this to [arc]"
- "connect to [arc]"
- "this belongs with [arc]"

**Agent-initiated (from arrival awareness):**
- Clear topical relation detected → auto-link with confirmation
- Possible relation → offer with question

---

## Context Handling

Find the research workspace:

1. If `context.type === "research"` → use current directory
2. If `context.researchRepo` exists → use that path
3. If neither → check common locations
4. If still not found → error: "no research workspace found"

---

## Flow

### 1. Identify Arc

If user specified an arc:
- Match by title (case-insensitive, partial match okay if unambiguous)
- Verify status is "active"

If agent-initiated (from arrival):
- Arc already identified during arrival detection

If multiple active arcs exist and user didn't specify:
- Ask which arc: "link to which? [list active arc titles]"
- **WAIT** for response

### 2. Validate

Check that the arc exists and is active:

```json
{
  "status": "active"
}
```

If arc not found:
> "no active arc called '[name]'. active arcs: [list]"

If arc is already captured (status: "captured"):
> "[arc] is already captured. want to open a new arc?"

### 3. Determine Session ID

Same as arc-open:
- Session UUID from transcript path
- Or proxy: `[project-name]_[ISO-timestamp]`

### 4. Add Session to Arc

Update the arc entry in `manifest.json`:

```json
{
  "sessions": [...existing, "new-session-id"]
}
```

### 5. Optional: Add Pointer

If the user specifies what this session touched:

> "link to warming-attending — touched the ecosystem language work"

Create a pointer:

```json
{
  "pointers": [
    ...existing,
    { "type": "inquiry", "ref": "ecosystem-language" }
  ]
}
```

**Pointer types:**
- `inquiry` — research inquiry touched
- `concept` — concept explored or referenced
- `implementation` — app implementation work
- `calibration` — quality calibration
- `theme` — general thematic territory

If no specific reference mentioned, just link the session without a new pointer.

### 6. Confirm

Brief acknowledgment:

```
⟡ linked to [arc title]
```

Or if pointer added:

```
⟡ linked to [arc title] — [pointer ref]
```

Done. Work continues.

---

## Multiple Arc Linking

A session can link to multiple arcs if it touches multiple territories.

If user says "this touches both [arc-a] and [arc-b]":
- Link to both arcs
- Confirm: `⟡ linked to [arc-a] and [arc-b]`

If the user's work clearly relates to multiple active arcs:
- Offer: "this also touches [other-arc] — link there too?"
- **WAIT** for response before linking to additional arcs

---

## Do NOT:

- Require explanation of why the session relates
- Add ceremony to linking
- Auto-link to multiple arcs without asking

## DO:

- Accept brief input
- Match arc titles flexibly
- Confirm quickly
- Allow multiple arc linking when appropriate
