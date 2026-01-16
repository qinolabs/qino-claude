# Arc Specification

Arcs capture emergence patterns — how inquiry moves through the ecosystem. This document specifies the arc system, including active arcs (live tracking) and captured arcs (retrospective trace).

---

## Arc Lifecycle

```
┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│   noticed    │ ──▶  │    active    │ ──▶  │   captured   │
│  emergence   │      │     ⟡        │      │      ∴       │
└──────────────┘      └──────────────┘      └──────────────┘
                         accumulates           retrospective
                         sessions              trace complete
```

### Three Phases

1. **Noticed emergence** — User recognizes something surfacing
2. **Active (⟡)** — Arc open, accumulating sessions and pointers
3. **Captured (∴)** — Arc closed, retrospective trace complete

---

## Manifest Schema

Arcs live in the research workspace's `manifest.json`:

### Active Arc Entry

```json
{
  "id": "arc-id",
  "title": "Provisional Title",
  "status": "active",
  "opened": "2026-01-16T10:30:00Z",
  "beginning": "What's surfacing (user's words)",
  "sessions": ["session-uuid-1", "session-uuid-2"],
  "pointers": [
    { "type": "inquiry", "ref": "ecosystem-language" },
    { "type": "concept", "ref": "qino-drops" },
    { "type": "implementation", "ref": "qino-world" }
  ]
}
```

### Captured Arc Entry

```json
{
  "id": "arc-id",
  "title": "Final Title",
  "status": "captured",
  "opened": "2026-01-16T10:30:00Z",
  "closed": "2026-01-20T15:45:00Z",
  "beginning": "What's surfacing (preserved)",
  "sessions": ["session-uuid-1", "session-uuid-2", "session-uuid-3"],
  "pointers": [...],
  "path": "arcs/2026-01-20_arc-id.md",
  "span": {
    "start": "2026-01-14",
    "end": "2026-01-20"
  },
  "repos": ["qinolabs-repo", "concepts-repo"],
  "stillOpen": 3
}
```

### Field Reference

| Field | Active | Captured | Description |
|-------|--------|----------|-------------|
| `id` | ✓ | ✓ | URL-safe identifier |
| `title` | ✓ | ✓ | Provisional → Final at capture |
| `status` | "active" | "captured" | Current lifecycle phase |
| `opened` | ✓ | ✓ | When arc was opened |
| `closed` | — | ✓ | When arc was captured |
| `beginning` | ✓ | ✓ | User's response to "what's surfacing" |
| `sessions` | ✓ | ✓ | Linked session IDs |
| `pointers` | ✓ | ✓ | References to territory touched |
| `path` | — | ✓ | Path to arc document |
| `span` | — | ✓ | Date range of arc material |
| `repos` | — | ✓ | Repositories touched |
| `stillOpen` | — | ✓ | Count of unresolved questions |

---

## Pointer Types

Pointers indicate what territory an arc touched during its active phase.

| Type | Meaning | Example ref |
|------|---------|-------------|
| `inquiry` | Research inquiry | "ecosystem-language" |
| `concept` | Concept explored | "qino-drops" |
| `implementation` | App/project work | "qino-world" |
| `calibration` | Quality calibration | "warmth" |
| `theme` | General thematic territory | "containers-and-holding" |

---

## Session Identification

Sessions are identified by UUID from Claude Code transcript paths:

```
~/.claude/projects/[project-hash]/[session-id].jsonl
```

The `session-id` is the filename without `.jsonl`.

**If not directly accessible**, use a proxy identifier:
```
[project-name]_[ISO-timestamp]
```

---

## Multiple Active Arcs

Several arcs can be active simultaneously. This is normal — different emergence patterns can run in parallel.

### Sessions Can Link to Multiple Arcs

A single session may relate to multiple active arcs:

```json
// Arc A
{ "sessions": ["session-1", "session-2", "session-3"] }

// Arc B
{ "sessions": ["session-2", "session-4"] }

// session-2 contributes to both arcs
```

### Lateral Movement

Work naturally moves between arc territories. When this happens:

1. **Agent notices crossing**: "this also touches [other-arc]"
2. **Offer to link**: "add to [other-arc] too?"
3. **No automatic merging** — arcs remain distinct entities

### Arc Convergence

When two arcs begin to overlap significantly:

1. Note the convergence as a pointer in both arcs:
   ```json
   { "type": "arc", "ref": "other-arc-id" }
   ```
2. At closure of either arc, acknowledge the other's contribution
3. Arcs may reference each other in their traces

### Arc Divergence

When a thread within an arc becomes its own arc:

1. Open new arc from the diverging thread
2. Add pointer in new arc to parent: `{ "type": "arc", "ref": "parent-arc-id" }`
3. Parent arc notes the branching in its seeds section at capture

---

## Symbols

| Symbol | Meaning | Context |
|--------|---------|---------|
| ⟡ | Active arc | Shown when surfacing, linking |
| ∴ | Captured arc | Shown at capture completion |

---

## Workflow Reference

| Workflow | Purpose |
|----------|---------|
| `arc-open.md` | Open a new arc when emergence noticed |
| `arc-link.md` | Link current session to active arc |
| `arc-close.md` | Close arc, trigger retrospective capture |
| `arc.md` | Retrospective capture (standalone or from closure) |

---

## Agent Arc Awareness

All agents check for active arcs on arrival:

**Concept agent:** Full awareness. Surfaces arcs related to concept work. Offers linking. Natural steward of conceptual emergence.

**Dev agent:** Focused awareness. Surfaces arcs related to linked concept or current project. Brief — doesn't interrupt implementation flow.

**Research agent:** Deep awareness. Research sessions are primary arc material. Attentive to new emergence. May suggest opening arcs when patterns surface.

---

## Architectural Position

Arcs shift research from "mode you enter" to "container that receives":

| Before | After |
|--------|-------|
| Research = mode | Research = workspace |
| Arcs captured after | Arcs opened when noticed |
| Single retrospective flow | Active + retrospective phases |

**The distinction:**
- **Inquiries**: Sustained longitudinal threads (weeks/months) — follow a question over time
- **Arcs**: Emergence patterns (sessions to days) — capture convergence across threads

Inquiries follow questions. Arcs capture what converges. Both live in the research workspace; both contribute to understanding. But their rhythms differ.
