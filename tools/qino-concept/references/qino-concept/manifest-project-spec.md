# qino Concept Agent — Manifest Specification
*This document defines the canonical structure and semantics of `manifest.json` for the **qino Concept Agent**.
It is a technical specification and must remain stable and minimal.*

---

## 1. Purpose of `manifest.json`

`manifest.json` is the **unified index** for a qino-powered workspace.

It answers:

- Which concepts exist in this project?
- What are their stable ids and human-readable names?
- Where is the canonical `concept.md` file for each?
- What lightweight metadata is associated with each concept?
- Which notes have been captured?
- How do notes relate to concepts?

The qino Concept Agent uses `manifest.json` to:

- list and review concepts
- resolve ids to file paths
- update timestamps when concepts change
- optionally work with tags or other small metadata
- track notes and their multi-scope references
- surface relevant notes during concept exploration

`manifest.json` does **not** store concept or note content.
Concept content lives in `concepts/<id>/concept.md`.
Note content lives in `notes/<filename>.md`.

---

## 2. Location of `manifest.json`

The manifest must be stored at the **root of the project workspace**:

```text
<project-root>/
  manifest.json
  concepts/
  notes/
  .claude/
```

There is exactly one manifest.json per qino workspace.

---

## 3. Top-Level Structure

The manifest is always a JSON object with these keys:

```json
{
  "version": 2,
  "concepts": [
    {
      "id": "example-concept",
      "name": "Example Concept",
      "path": "concepts/example-concept/concept.md",
      "tags": [],
      "last_touched": null
    }
  ],
  "notes": [
    {
      "id": "example-note",
      "path": "notes/2024-12-07_example-note.md",
      "captured": "2024-12-07T14:30:00Z",
      "essence": "example essence — a thought distilled",
      "references": []
    }
  ]
}
```

### 3.1 version

- Type: integer
- Required: yes
- Current value: 2

Represents the schema version of the manifest.
Version 2 introduces unified notes structure.

### 3.2 concepts

- Type: array of objects
- Required: yes

Each item in concepts describes one concept in the ecosystem.

### 3.3 notes

- Type: array of objects
- Required: yes (may be empty `[]`)

Each item in notes describes one captured observation with its scope references.

---

## 4. Concept Entry Specification

Each concept entry must be an object with the following fields:

```json
{
  "id": "concept-id",
  "name": "Human Readable Name",
  "path": "concepts/concept-id/concept.md",
  "tags": [],
  "last_touched": null
}
```

### 4.1 id

- Type: string
- Required: yes
- Must be unique within the manifest.
- Used in commands and references (e.g. `/qino-concept:refine concept-id`).

Guidelines:

- lowercase
- hyphen-separated words (e.g. `moment-lens`, `story-graph`)
- stable over time (avoid renaming casually)

### 4.2 name

- Type: string
- Required: yes
- Human-readable name used in overviews and review outputs.

This is what the user sees when glancing at the ecosystem.

### 4.3 path

- Type: string
- Required: yes
- Path to the canonical concept file, relative to the project root.
- Must point to a concept.md file, typically:

```json
"path": "concepts/<id>/concept.md"
```

The qino agent resolves and opens concept files via this path.

### 4.4 tags

- Type: array of strings
- Required: yes (but may be empty `[]`)

Lightweight descriptors for:

- themes (e.g. `"reflection"`, `"visualization"`)
- modalities (e.g. `"sensory"`, `"journal"`)
- stages (e.g. `"seed"`, `"maturing"`)

Tags are optional in meaning but required in shape.
The agent must not rely on tags being present or meaningful.

### 4.5 last_touched

- Type: string or null
- Required: yes

Semantics:

- `null` → concept has never been modified since initial creation
- ISO-8601 timestamp string (UTC), e.g.: `"2025-11-30T13:20:00Z"`

The qino agent updates `last_touched` whenever it performs a meaningful modification to the concept's `concept.md` file (e.g. refine, explore, organize).

### 4.6 held_threads

- Type: array of strings
- Required: no (optional field)

Each string captures a theme or aspect from origin material that wasn't carried into the concept during `/qino:add-notes`.

Format: `"[theme] — [atmospheric sense]"`

Example:

```json
"held_threads": [
  "morning ritual tension — the friction before the day starts",
  "raw voice about anticipation — how it should feel, not what it does"
]
```

Semantics:

- Threads are added during `/qino:add-notes` when acknowledging what wasn't carried forward
- Threads accumulate across multiple add-notes sessions (append, don't replace)
- Threads are never removed — they are multi-dimensional, and integration captures facets, not the whole thread
- The agent uses held threads to offer specific bridges back to origin material when detecting gaps during exploration

---

## 5. Note Entry Specification

Each note entry must be an object with the following fields:

```json
{
  "id": "grid-as-pattern",
  "path": "notes/2024-12-07_grid-as-pattern.md",
  "captured": "2024-12-07T14:30:00Z",
  "essence": "grid as pattern — structure at different scales",
  "references": []
}
```

Notes start with an empty `references` array. They gain references during `/qino:explore` or `/qino:capture` — one reference connects to a concept, multiple references connect concepts together.

### 5.1 id

- Type: string
- Required: yes
- Must be unique within the notes array.

Guidelines:

- lowercase
- hyphen-separated words (e.g. `grid-as-pattern`, `moments-span-apps`)
- derived from the essence
- stable over time

### 5.2 path

- Type: string
- Required: yes
- Path to the note file, relative to project root.
- Must point to a markdown file, typically:

```json
"path": "notes/YYYY-MM-DD_note-id.md"
```

The qino agent resolves and opens note files via this path.

### 5.3 captured

- Type: string
- Required: yes
- ISO-8601 timestamp string (UTC), e.g.: `"2024-12-07T14:30:00Z"`

The moment the note was captured.

### 5.4 essence

- Type: string
- Required: yes
- The distilled essence of the note (5-10 words)

This is what the agent uses to recognize when a note might connect to an alive thread during exploration. It's also displayed when surfacing notes with empty references.

### 5.5 references

- Type: array of objects
- Required: yes (may be empty `[]`)
- Each reference records when the note was woven into a concept.

Notes are captured without references. References are added during `/qino:explore` when a note finds its place in a concept.

---

## 6. Reference Entry Specification

Each reference records when a note was woven into a concept during exploration:

```json
{
  "concept": "daily-rhythm",
  "woven": "2024-12-07T15:30:00Z",
  "context": "emerged while exploring rhythm structure"
}
```

### 6.1 concept

- Type: string
- Required: yes
- Must be a concept id that exists in the `concepts` array.

A note can reference multiple concepts. Notes with multiple references surface in `/qino:home` as entry points for relationship exploration.

### 6.2 woven

- Type: string
- Required: yes
- ISO-8601 timestamp string (UTC), e.g.: `"2024-12-07T15:30:00Z"`

The moment the note was woven into this concept during exploration.

### 6.3 context

- Type: string
- Required: yes
- Brief description of how this note connected during exploration.

Captures what was being explored when the note found its place. The same note may be woven into multiple concepts with different contexts.

---

## 7. Note File Format

Each note file should follow this structure:

```markdown
# [Title — this serves as the note's essence]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Content of the observation]
```

The title is the essence — no separate essence field is stored in the manifest. The agent reads the file to display the note's theme.

---

## 8. Lifecycle Rules

### 8.1 Concept Creation

When a new concept is seeded (e.g. via an init/import flow), the qino agent must:

1. Create the folder and `concept.md` at the location given by `path`.
2. Add a new entry to `manifest.json` with:
   - `id` as chosen/confirmed by the user
   - `name` as chosen/confirmed by the user
   - `path` set to the canonical concept file
   - `tags` as `[]` unless the user specifies otherwise
   - `last_touched` as either:
     - `null`, or
     - the current timestamp if the agent has already written initial content

### 8.2 Concept Update

Whenever the agent modifies `concept.md` in a meaningful way:

- It should update `last_touched` with the current timestamp.
- It may update `name` or `tags` only if the user has explicitly asked for this (e.g. renaming a concept or adding tags).

### 8.3 Note Capture

When capturing a note via `/qino:capture`:

1. Distill the observation to its essence
2. Create the note file at `notes/YYYY-MM-DD_note-id.md`
3. Offer concept connection: "does this connect to something?"
4. Add a new entry to the `notes` array with:
   - `id` derived from the essence
   - `path` set to the note file location
   - `captured` set to current timestamp
   - `essence` set to the distilled essence
   - `references` as either:
     - empty array `[]` if user lets it settle
     - array with references if user names concepts

Notes can start with empty references or with connections. Notes with empty references become connected during later `/qino:explore` sessions.

### 8.4 Note Connection During Explore

During `/qino:explore`, the agent surfaces notes when their essence echoes the alive thread:

- Check for notes with empty `references`
- Check for notes already connected to this concept
- Offer notes that might connect: "You captured something about [essence] — does that connect here?"

When a note is connected:

- Add a reference with `concept`, `woven` timestamp, and `context`
- The same note can connect to multiple concepts

### 8.5 Reference Removal

The agent can suggest removing references that no longer feel relevant:

- During explore: "This note no longer feels connected here — remove this reference?"
- Always require explicit user confirmation before removal
- If the last reference would be removed, the note returns to empty references (it'll surface again when it has warmth)

### 8.6 Deletion / Deactivation

The manifest does not define deletion semantics rigidly.
For now:

- The agent should not delete entries automatically.
- If a concept is removed, the agent may:
  - mark it via a tag (e.g. `"archived"`)
  - or remove the entry only after explicit user confirmation.
- Notes follow similar patterns — use status like `"dormant"` or `"archived"` rather than deletion.

---

## 9. Responsibilities of the qino Concept Agent

When reading `manifest-project-spec.md`, the agent must:

- treat this file as the authoritative schema for `manifest.json`
- validate that `manifest.json` matches the shape whenever it needs to use it
- create `manifest.json` as shown below if it does not exist yet and the user agrees:

```json
{
  "version": 2,
  "concepts": [],
  "notes": []
}
```

- ensure each concept entry contains all required fields
- ensure each note entry contains all required fields
- never introduce additional fields unless the specification is extended
- validate that note references use concept ids that exist in the `concepts` array

---

## 10. Example Manifests

### 10.1 Minimal Manifest

The smallest valid manifest:

```json
{
  "version": 2,
  "concepts": [],
  "notes": []
}
```

### 10.2 Manifest with Concepts and Notes

```json
{
  "version": 2,
  "concepts": [
    {
      "id": "moment-lens",
      "name": "Moment Lens",
      "path": "concepts/moment-lens/concept.md",
      "tags": ["reflection", "sensory"],
      "last_touched": "2025-11-30T10:15:00Z"
    },
    {
      "id": "story-graph",
      "name": "Story Graph",
      "path": "concepts/story-graph/concept.md",
      "tags": ["narrative", "visualization"],
      "last_touched": null,
      "held_threads": [
        "arc transitions — how stories connect across time"
      ]
    }
  ],
  "notes": [
    {
      "id": "moments-span-apps",
      "path": "notes/2024-12-08_moments-span-apps.md",
      "captured": "2024-12-08T10:15:00Z",
      "essence": "moments span apps — the same instant lives in multiple places",
      "references": [
        {
          "concept": "moment-lens",
          "woven": "2024-12-08T11:30:00Z",
          "context": "emerged during sensory exploration"
        },
        {
          "concept": "story-graph",
          "woven": "2024-12-09T14:00:00Z",
          "context": "moments as nodes in narrative structure"
        }
      ]
    },
    {
      "id": "theme-as-wanderers-journey",
      "path": "notes/2024-12-10_theme-as-wanderers-journey.md",
      "captured": "2024-12-10T09:00:00Z",
      "essence": "theme as wanderer's journey — world-building meets continuity",
      "references": []
    }
  ]
}
```

The second note (`theme-as-wanderers-journey`) has empty references — captured but not yet connected to any concept. It will surface during `/qino:explore` when its essence echoes an alive thread.

---

## 11. Future Extensions

Possible future fields (not currently in use):

- `status` on concepts (e.g. `"seed"`, `"growing"`, `"mature"`)
- cluster or group identifiers
- priority or energy markers

Until formally added here, the agent should not introduce or depend on these fields.
