# Concept Init Workflow

**Voice:** Grounded. Minimal. The concept is just beginning — don't overwhelm it.

**Agent:** concept-agent

**Reference:** Read `references/qino-concept/concept-spec.md` for concept structure.

---

## Task

Create a new concept in the ecosystem.

---

## Flow

### 1. Parse Argument

User provides concept name or impulse.

If no argument provided:
> "What's the concept? Give me a name or describe the impulse."

**WAIT** for response.

### 2. Generate Concept ID

From the name:
- Lowercase, hyphenated
- Apply appropriate prefix based on type (see concept-spec.md Section 2):
  - `qino-` for core ecosystem apps
  - `app-` for standalone apps
  - `cli-` for CLI tools
  - `tech-` for technologies
  - `sys-` for systems

If the type isn't clear from the name, ask:
> "What kind of concept is this? (app, tool, technology, system, or something else)"

**WAIT** for response.

### 3. Check for Existing

Check if `concepts/[id]/` already exists.

If exists:
> "[id] already exists. Want to explore it instead?"

**WAIT** for response.

### 4. Surface the Impulse

> "What's the real-world impulse here — the lived experience this responds to?"

**WAIT** for response.

This becomes the seed for Section 1 (Real-World Impulse).

### 5. Create Concept

Create folder structure:
```
concepts/[id]/
├── concept.md
└── origins/
```

Initialize concept.md with the 7-section structure from concept-spec.md:
- Fill Section 1 (Real-World Impulse) with what the user said
- Leave other sections with minimal placeholder content

### 6. Update Manifest

Add entry to manifest.json `concepts` array:
```json
{
  "id": "[id]",
  "name": "[Human Readable Name]",
  "path": "concepts/[id]/concept.md",
  "status": "seed",
  "created": "[timestamp]",
  "last_touched": "[timestamp]"
}
```

### 7. Confirm

```
∴ [concept name] created

the impulse is planted. from here:

  "explore [id]" — follow what's alive
  "capture: [thought]" — catch a passing thought

```

---

## Do NOT:

- Fill sections with placeholder text like "[to be determined]"
- Ask too many questions at once
- Push toward feature lists
- Use excited language or emojis
