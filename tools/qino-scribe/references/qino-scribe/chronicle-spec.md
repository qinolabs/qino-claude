# Qino Scribe — Chronicle Specification

*Defines the canonical structure and semantics of the chronicle directory.*

---

## 1. Purpose

The chronicle is a **narrative record** of ecosystem evolution. It captures not just what changed, but what it meant — told from the ecosystem's perspective.

It serves:
- **Future self**: "What was alive when this idea emerged?"
- **Collaborators**: "Here's the journey so far"
- **The record**: Some evolutions deserve to be witnessed

The chronicle is a public artifact. It's meant to be shared and read.

---

## 2. Directory Structure

```
chronicle/
├── manifest.json              # Chronicle state and chapter index
├── world.md                   # Living world-state (characters, locations, arcs)
├── chapters/
│   ├── 001-first-light.md     # Chapter files
│   ├── 002-threads-converge.md
│   └── ...
└── voice.md                   # Optional: calibrated voice
```

The chronicle directory lives at the workspace root, alongside `concepts/` and `ecosystem/`.

---

## 3. manifest.json Structure

```json
{
  "version": 1,
  "last_chapter": {
    "id": "chapter-003",
    "written": "2025-12-07T18:00:00Z",
    "git_ref": "abc1234"
  },
  "chapters": [
    {
      "number": 1,
      "slug": "first-light",
      "title": "First Light",
      "written": "2025-11-30T10:00:00Z",
      "path": "chapters/001-first-light.md"
    }
  ]
}
```

### 3.1 version
- Type: integer
- Required: yes
- Current value: 1

### 3.2 last_chapter
- Type: object
- Required: yes (after first chapter)

Fields:
- `id`: Chapter identifier (e.g., "chapter-003")
- `written`: ISO-8601 timestamp when chapter was written
- `git_ref`: Git commit hash at time of writing

This enables the scribe to know where to start observing for the next chapter.

### 3.3 chapters
- Type: array of objects
- Required: yes

Each entry describes one chapter in the chronicle.

---

## 4. Chapter Entry Specification

```json
{
  "number": 1,
  "slug": "first-light",
  "title": "First Light",
  "written": "2025-11-30T10:00:00Z",
  "path": "chapters/001-first-light.md"
}
```

| Field | Type | Description |
|-------|------|-------------|
| number | integer | Sequential from 1, used for ordering and file naming |
| slug | string | Lowercase, hyphen-separated, derived from title |
| title | string | Evocative narrative title |
| written | string | ISO-8601 timestamp |
| path | string | Relative path from chronicle/ to chapter file |

---

## 5. world.md — The Living World

The chronicle is a fantasy world that emerges from ecosystem evolution. `world.md` tracks the living world-state, updated after each chapter.

**The scribe reads this first** to know where the story is before writing new chapters.

```markdown
# The World

*Last updated: Chapter 3*

## Characters

### The one who arrived with questions
First appeared at the threshold (ch. 1). Walked toward the weaving-room (ch. 2).
Not seen since — somewhere in the interior.

### The keeper of held threads
Appears when something waits. Speaks little. Seen at the edge of discovery-grid (ch. 3).

---

## Locations

### The Threshold
Where new things arrive. Always misty, always uncertain. Visited: ch. 1, 2

### The Weaving-Room
Warm, lamp-lit. Where connections form. Threads hang visible. Visited: ch. 2

### Discovery-Grid
Vast open space. Nodes like stars, paths between. First glimpsed ch. 3.

---

## Arcs in Motion

### The search for frame-holding
Began ch. 2. The wanderer heard the phrase but doesn't yet understand. Unresolved.

### Learning to listen
The wanderer's ongoing journey. Each chapter, a little more stillness.

---

## The Season

Early days. The world is still forming. More locations glimpsed than known.
A feeling of arrival, of things taking shape.
```

**Key principles:**
- Characters and locations emerge from what actually happens — no predetermined cast
- Each entry includes first appearance and last seen (for continuity)
- Arcs track tensions and journeys, not tasks
- The season captures the larger rhythm — what kind of time this is

---

## 6. voice.md (Optional)

If the wanderer has calibrated the scribe's voice, it's captured here:

```markdown
# Scribe Voice

*Calibrated 2025-12-07*

The scribe speaks with:
- [quality 1]
- [quality 2]
- [quality 3]

Example:
> [passage that captures the calibrated voice]
```

When present, the scribe reads this before writing chapters.

---

## 7. Lifecycle

### 7.1 Initialization

When first chapter is requested and no chronicle exists:
1. Create `chronicle/` directory
2. Create `chronicle/manifest.json` with empty state
3. Create `chronicle/chapters/` directory
4. Create `chronicle/world.md` with initial structure
5. Write first chapter
6. Update `world.md` with characters, locations, arcs from first chapter

### 7.2 Adding Chapters

When a new chapter is written:
1. Read `world.md` to know established characters, locations, arcs
2. Read last 1-2 chapters for voice continuity
3. Observe ecosystem changes (git, manifest, concepts)
4. Propose story beat — who appears, where, what happens
5. Dialogue with wanderer to refine
6. Create chapter file at `chronicle/chapters/NNN-slug.md`
7. Append to `chapters` array in manifest
8. Update `last_chapter` with new chapter info
9. Update `world.md` with new characters, locations, arc progress, season shift

### 7.3 Reading Chronicle

The scribe reads to understand:
- `manifest.json`: chapter count, timing, git ref to diff from
- `world.md`: the living world-state (characters, locations, arcs, season)
- Recent chapters: voice continuity and recent events
