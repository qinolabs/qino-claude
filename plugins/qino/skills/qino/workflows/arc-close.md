# Arc Close Workflow

**Execution:** inject
**Voice:** Transitional. Moving from active tracking to retrospective capture.
**Agent:** concept

---

## Task

Closes an active arc, triggering the retrospective capture flow with accumulated context.

This is the bridge between:
- **Active arc** (minimal container with sessions and pointers)
- **Captured arc** (full retrospective trace with structure)

The accumulated context enriches the capture:
- `beginning` provides a settling point hint
- `sessions` provides transcripts to scan
- `pointers` indicates territory touched

---

## Triggers

- "close arc", "close [arc-title]"
- "capture this arc"
- "ready to capture [arc]"
- "finish [arc]"

---

## Context Handling

Find the research workspace:

1. If `context.type === "research"` → use current directory
2. If `context.researchRepo` exists → use that path
3. If neither → check common locations
4. If still not found → error: "no research workspace found"

---

## Flow

### 1. Identify Arc to Close

If user specified an arc title:
- Match by title (case-insensitive, partial match okay)
- Verify status is "active"

If no arc specified:
- Check how many active arcs exist
- If exactly one: proceed with that arc
- If multiple: ask which to close

> "which arc? [list active arc titles]"

**WAIT** for response if needed.

### 2. Gather Accumulated Context

Read the arc entry from manifest:

```json
{
  "id": "arc-id",
  "title": "Provisional Title",
  "status": "active",
  "opened": "2026-01-16T...",
  "beginning": "What's surfacing...",
  "sessions": ["session-1", "session-2", ...],
  "pointers": [
    { "type": "inquiry", "ref": "ecosystem-language" },
    { "type": "concept", "ref": "qino-drops" }
  ]
}
```

This context will be passed to the retrospective capture.

### 3. Surface Context for Capture

Brief summary of what accumulated:

```
closing [arc title]

sessions: [count] linked
pointers: [list refs or "none"]
beginning: "[beginning text]"

starting capture...
```

### 4. Invoke Retrospective Capture

Now execute the retrospective capture flow from `arc.md`, but with enriched context.

**Context to carry forward:**

```
PRE-CAPTURE CONTEXT (from active arc):

Arc: [title]
Beginning: "[beginning statement]"
Sessions: [list of session IDs with paths]
Pointers: [list of pointer refs]

Use this to:
- Start from beginning statement (already a settling point)
- Scan linked session transcripts for material
- Reference pointers when tracing the thread
```

The retrospective capture flow (from `arc.md`) proceeds with these enrichments:
- **Propose Starting Point (step 3)**: The `beginning` is already a settling point hint — confirm with user rather than searching
- **Scan (step 2)**: Focus on the linked `sessions` array for transcript scanning
- **Offer Thread (step 4)**: `pointers` indicate what territory was touched

### 5. After Capture Completes

Once the retrospective flow creates the arc document and entry, update the manifest entry:

**Transform from active to captured:**

```json
{
  "id": "arc-id",
  "title": "Final Title",           // may change during capture
  "status": "captured",             // was "active"
  "opened": "2026-01-16T...",       // preserved
  "closed": "2026-01-16T...",       // added
  "beginning": "...",               // preserved
  "sessions": [...],                // preserved
  "pointers": [...],                // preserved
  "path": "arcs/YYYY-MM-DD_arc-id.md",  // added
  "span": {                         // added
    "start": "YYYY-MM-DD",
    "end": "YYYY-MM-DD"
  },
  "repos": ["repo-1", "repo-2"],    // added
  "stillOpen": 3                    // added
}
```

**Key additions at closure:**
- `status`: "active" → "captured"
- `closed`: timestamp when captured
- `path`: path to the arc document
- `span`: date range of the arc
- `repos`: repositories touched
- `stillOpen`: count of open questions

**Preserved from active phase:**
- `opened`: when the arc was first opened
- `beginning`: the initial surfacing
- `sessions`: all linked sessions
- `pointers`: accumulated territory references

### 6. Confirm Closure

Use the standard capture confirmation from `arc.md`:

```
∴ [arc title]

[essence — one sentence, honoring what's open]

still-open: [count] questions remain
seeds: [count] threads for future inquiry

                        "where am I" to see research landscape
```

The arc is now captured. The ⟡ becomes ∴.

---

## What If Capture Is Deferred?

If the user says "not ready to capture yet":

> "keeping [arc] active. close when ready."

The arc remains active with its accumulated context.

---

## Do NOT:

- Force capture if user isn't ready
- Lose the accumulated sessions/pointers
- Skip the retrospective tracing — active accumulation enriches, doesn't replace

## DO:

- Carry forward all accumulated context
- Let the beginning inform the settling point
- Preserve both active metadata and captured metadata
- Transition cleanly from ⟡ to ∴
