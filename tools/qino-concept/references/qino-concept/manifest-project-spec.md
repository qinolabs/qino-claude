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
- How do notes relate to concepts and the ecosystem?

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
  ecosystem.md          # woven patterns (created when needed)
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
      "references": [
        {
          "scope": "example-concept",
          "context": "emerged during exploration",
          "status": "captured, feels relevant to morning section"
        }
      ]
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
  "references": [
    {
      "scope": "daily-rhythm",
      "context": "emerged while exploring rhythm structure",
      "status": "surfaced once, feels adjacent to morning section"
    },
    {
      "scope": "ecosystem",
      "context": "pattern spanning visual and temporal concepts",
      "status": "captured, not yet woven"
    }
  ]
}
```

### 5.1 id

- Type: string
- Required: yes
- Must be unique within the notes array.

Guidelines:

- lowercase
- hyphen-separated words (e.g. `grid-as-pattern`, `moments-span-apps`)
- derived from the theme of the note
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

### 5.4 references

- Type: array of objects
- Required: yes (must have at least one reference)
- Each reference anchors the note to a scope with context.

Notes must be anchored before saving. The agent guides the user to establish at least one reference during capture.

---

## 6. Reference Entry Specification

Each reference within a note describes how that note relates to a particular scope:

```json
{
  "scope": "daily-rhythm",
  "context": "emerged while exploring rhythm structure",
  "status": "surfaced once, feels adjacent to morning section"
}
```

### 6.1 scope

- Type: string
- Required: yes
- Either a concept id or the reserved value `"ecosystem"`.

Reserved scopes:

- `"ecosystem"` — note relates to cross-concept patterns

All other values are interpreted as concept ids and must exist in the `concepts` array.

### 6.2 context

- Type: string
- Required: yes
- Brief description of how this note relates to this scope.

Captures the perspective from which this note is relevant. The same note may have different contexts for different scopes.

### 6.3 status

- Type: string
- Required: yes
- Descriptive status guiding agent behavior.

Status is natural language, not an enum. The agent interprets status contextually. This leverages language permeability — the agent reads intent from description.

**Status vocabulary patterns (guidance, not enforcement):**

Lifecycle markers:
- `captured` — freshly noted, not yet integrated
- `integrated` — woven into concept.md or ecosystem.md
- `dormant` — touched but no resonance in recent sessions

Relationship markers:
- `adjacent to` — feels related but not central
- `emerged from` — direct origin during exploration
- `bridges` — connects multiple areas

Energy markers:
- `alive` — currently resonating
- `cooling` — less active than before

**Examples:**
- `"captured, not yet woven"`
- `"surfaced during rhythm work, feels unfinished"`
- `"integrated into section 3"`
- `"dormant — touched once, no resonance since"`

The agent updates status meaningfully during interactions, not mechanically.

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

### 8.3 Note Creation

When capturing a note (via `/qino:note` or ecosystem signals during explore):

1. Guide user to anchor the note to at least one scope
2. Create the note file at `notes/YYYY-MM-DD_note-id.md`
3. Add a new entry to the `notes` array with:
   - `id` derived from the note's theme
   - `path` set to the note file location
   - `captured` set to current timestamp
   - `references` with at least one entry

### 8.4 Note Reference Updates

The agent may update note references during exploration:

- Add new references when a note becomes relevant to another scope
- Update status descriptively when a note is surfaced or integrated
- Remove stale references with user confirmation

### 8.5 Reference Removal

The agent can suggest removing references that no longer feel relevant:

- During explore: "This note no longer feels connected here — remove this reference?"
- Always require explicit user confirmation before removal
- If the last reference would be removed, the note itself may be archived or deleted (with confirmation)

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
- ensure each note entry contains all required fields with at least one reference
- never introduce additional fields unless the specification is extended
- validate that note scopes reference existing concept ids or `"ecosystem"`

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
      "references": [
        {
          "scope": "moment-lens",
          "context": "emerged during sensory exploration",
          "status": "captured, feels central"
        },
        {
          "scope": "story-graph",
          "context": "moments as nodes in narrative structure",
          "status": "adjacent, worth exploring"
        },
        {
          "scope": "ecosystem",
          "context": "pattern spanning reflection and narrative",
          "status": "captured, not yet woven"
        }
      ]
    }
  ]
}
```

---

## 11. Future Extensions

Possible future fields (not currently in use):

- `status` on concepts (e.g. `"seed"`, `"growing"`, `"mature"`)
- cluster or group identifiers
- priority or energy markers

Until formally added here, the agent should not introduce or depend on these fields.
