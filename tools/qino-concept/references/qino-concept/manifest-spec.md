# Qino Concept Agent — Manifest Specification  
*This document defines the canonical structure and semantics of `manifest.json` for the **Qino Concept Agent**.  
It is a technical specification and must remain stable and minimal.*

---

## 1. Purpose of `manifest.json`

`manifest.json` is the **ecosystem index** for a Qino-powered workspace.

It answers:

- Which concepts exist in this project?
- What are their stable ids and human-readable names?
- Where is the canonical `concept.md` file for each?
- What lightweight metadata is associated with each concept?

The Qino Concept Agent uses `manifest.json` to:

- list and review concepts
- resolve ids to file paths
- update timestamps when concepts change
- optionally work with tags or other small metadata

`manifest.json` does **not** store concept content.  
All conceptual content lives in `concepts/<id>/concept.md`.

---

## 2. Location of `manifest.json`

The manifest must be stored at the **root of the project workspace**:

```text
<project-root>/
  manifest.json
  concepts/
  .claude/
```

There is exactly one manifest.json per Qino workspace.

---

## 3. Top-Level Structure

The manifest is always a JSON object with both of these keys:

```json
{
  "version": 1,
  "concepts": [
    {
      "id": "example-concept",
      "name": "Example Concept",
      "path": "concepts/example-concept/concept.md",
      "tags": [],
      "last_touched": null
    }
  ]
}
```

### 3.1 version

- Type: integer
- Required: yes
- Current value: 1

Represents the schema version of the manifest.
Future changes to the schema, if any, will increment this value.

### 3.2 concepts

- Type: array of objects
- Required: yes

Each item in concepts describes one concept in the ecosystem.

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

The Qino agent resolves and opens concept files via this path.

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

The Qino agent updates `last_touched` whenever it performs a meaningful modification to the concept's `concept.md` file (e.g. refine, explore, organize).

---

## 5. Lifecycle Rules

### 5.1 Creation

When a new concept is seeded (e.g. via an init/ingest flow), the Qino agent must:

1. Create the folder and `concept.md` at the location given by `path`.
2. Add a new entry to `manifest.json` with:
   - `id` as chosen/confirmed by the user
   - `name` as chosen/confirmed by the user
   - `path` set to the canonical concept file
   - `tags` as `[]` unless the user specifies otherwise
   - `last_touched` as either:
     - `null`, or
     - the current timestamp if the agent has already written initial content

### 5.2 Update

Whenever the agent modifies `concept.md` in a meaningful way:

- It should update `last_touched` with the current timestamp.
- It may update `name` or `tags` only if the user has explicitly asked for this (e.g. renaming a concept or adding tags).

### 5.3 Deletion / Deactivation

The manifest does not define deletion semantics rigidly.
For now:

- The agent should not delete entries automatically.
- If a concept is removed, the agent may:
  - mark it via a tag (e.g. `"archived"`)
  - or remove the entry only after explicit user confirmation.

---

## 6. Responsibilities of the Qino Concept Agent

When reading `manifest-spec.md`, the agent must:

- treat this file as the authoritative schema for `manifest.json`
- validate that `manifest.json` matches the shape whenever it needs to use it
- create `manifest.json` as shown below if it does not exist yet and the user agrees:

```json
{
  "version": 1,
  "concepts": []
}
```

- ensure each concept entry contains all required fields
- never introduce additional fields unless the specification is extended

---

## 7. Example Minimal Manifest

The smallest valid manifest:

```json
{
  "version": 1,
  "concepts": []
}
```

Example manifest with two concepts:

```json
{
  "version": 1,
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
      "last_touched": null
    }
  ]
}
```

---

## 8. Future Extensions

Possible future fields (not currently in use):

- `status` (e.g. `"seed"`, `"growing"`, `"mature"`)
- cluster or group identifiers
- priority or energy markers

Until formally added here, the agent should not introduce or depend on these fields.
