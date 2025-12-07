# Qino Concept Agent — Ecosystem Manifest Specification

*This document defines the canonical structure and semantics of `ecosystem/manifest.json` for the **Qino Concept Agent**.
It is a technical specification and must remain stable and minimal.*

---

## 1. Purpose of `ecosystem/manifest.json`

`ecosystem/manifest.json` is the **index for ecosystem-level notes** — thoughts that emerged during concept work but reach beyond any single concept.

It answers:

- Which ecosystem notes exist in this workspace?
- Where did each note originate (which concept)?
- When was each note captured?
- Where is the note file?

The Qino Concept Agent uses `ecosystem/manifest.json` to:

- List accumulated ecosystem notes
- Resolve note ids to file paths
- Surface notes during ecosystem dialogue
- Track note origins for bridging back to concepts

`ecosystem/manifest.json` does **not** store note content.
All note content lives in `ecosystem/notes/<filename>.md`.

**Relationship to app-level manifest:**
The ecosystem manifest is sovereign in its space. App-level `manifest.json` tracks concepts only. The agent bridges spaces through awareness, reading from `ecosystem/` when relevant — not through data coupling.

---

## 2. Location of `ecosystem/manifest.json`

The ecosystem manifest must be stored at:

```text
<project-root>/
  ecosystem/
    manifest.json
    notes/
    ecosystem.md
```

There is exactly one ecosystem manifest per Qino workspace. It lives within the `ecosystem/` directory, not at project root.

---

## 3. Top-Level Structure

The manifest is always a JSON object with both of these keys:

```json
{
  "version": 1,
  "notes": []
}
```

### 3.1 version

- Type: integer
- Required: yes
- Current value: 1

Represents the schema version of the ecosystem manifest.
Future changes to the schema, if any, will increment this value.

### 3.2 notes

- Type: array of objects
- Required: yes

Each item in notes describes one ecosystem note that was captured.

---

## 4. Note Entry Specification

Each note entry must be an object with the following fields:

```json
{
  "id": "cards-native",
  "source": "qino-lens",
  "captured": "2024-12-07T14:30:00Z",
  "path": "notes/2024-12-07_cards-native.md",
  "essence": "Cards as shared language for holding moments"
}
```

### 4.1 id

- Type: string
- Required: yes
- Must be unique within the manifest.

Guidelines:

- lowercase
- hyphen-separated words (e.g. `cards-native`, `moments-span-apps`)
- derived from the theme of the note
- stable over time

### 4.2 source

- Type: string
- Required: yes
- The concept id where this note originated.

This tracks which concept the user was exploring when the ecosystem thought emerged. Used for bridging back to concepts during ecosystem dialogue.

### 4.3 captured

- Type: string
- Required: yes
- ISO-8601 timestamp string (UTC), e.g.: `"2024-12-07T14:30:00Z"`

The moment the ecosystem note was captured.

### 4.4 path

- Type: string
- Required: yes
- Path to the note file, relative to `ecosystem/`.
- Must point to a markdown file, typically:

```json
"path": "notes/YYYY-MM-DD_note-id.md"
```

The Qino agent resolves and opens note files via this path.

### 4.5 essence

- Type: string
- Required: yes
- The distilled essence shown in the "∴" acknowledgment.

This captures how the agent understood the note from the originating concept's point of view. Concise — typically one short phrase.

---

## 5. Lifecycle Rules

### 5.1 Creation

When an ecosystem note is captured during concept exploration:

1. Create the note file at `ecosystem/notes/YYYY-MM-DD_note-id.md`
2. Add a new entry to `ecosystem/manifest.json` with:
   - `id` derived from the theme
   - `source` set to the current concept id
   - `captured` set to current timestamp
   - `path` set to the note file location
   - `essence` set to the distilled acknowledgment shown to user

### 5.2 Reading

During ecosystem dialogue (`/qino:ecosystem`):

- Read the manifest to get all accumulated notes
- Use `path` to read note content
- Use `source` to understand origin context
- Use `essence` for quick surfacing without reading full files

### 5.3 Weaving

When patterns emerge and get woven into `ecosystem.md`:

- Notes remain in manifest (they are residue, accumulating)
- No "processed" flag needed — notes are multi-dimensional
- The ecosystem.md grows through dialogue, referencing notes as source material

---

## 6. Responsibilities of the Qino Concept Agent

When reading `ecosystem-manifest-spec.md`, the agent must:

- Treat this file as the authoritative schema for `ecosystem/manifest.json`
- Validate that the manifest matches the shape whenever it needs to use it
- Create `ecosystem/manifest.json` if it does not exist:

```json
{
  "version": 1,
  "notes": []
}
```

- Ensure each note entry contains all required fields
- Never introduce additional fields unless the specification is extended

---

## 7. Example Minimal Manifest

The smallest valid ecosystem manifest:

```json
{
  "version": 1,
  "notes": []
}
```

Example manifest with two notes:

```json
{
  "version": 1,
  "notes": [
    {
      "id": "cards-native",
      "source": "qino-lens",
      "captured": "2024-12-07T14:30:00Z",
      "path": "notes/2024-12-07_cards-native.md",
      "essence": "Cards as shared language for holding moments"
    },
    {
      "id": "moments-span-apps",
      "source": "qino-journal",
      "captured": "2024-12-08T10:15:00Z",
      "path": "notes/2024-12-08_moments-span-apps.md",
      "essence": "Moments want to flow between lens, journal, ritual"
    }
  ]
}
```

---

## 8. Future Extensions

Possible future fields (not currently in use):

- `woven_into` — reference to where in ecosystem.md this note contributed
- `related_notes` — connections between ecosystem notes
- `tags` — lightweight descriptors

Until formally added here, the agent should not introduce or depend on these fields.
