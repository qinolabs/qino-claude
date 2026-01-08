# Dev Setup Workflow

**Voice:** Minimal scaffolding. Create the space and step back.

**Agent:** dev

---

## Task

One-time workspace scaffolding for implementation projects.

If workspace name is provided, create in that subdirectory.
If not, initialize in current directory.

---

## Flow

### 1. Determine Target Directory

- If workspace name provided: create and enter that directory
- If not: use current directory

### 2. Create Structure

```
[workspace]/
  implementations/
  .claude/
    qino-config.json
    references/
      qino-dev/
        home-pattern.md
        templates/
          implementation-template.md
          iteration-template.md
          app-command-template.md
```

### 3. Create Reference Files

Copy from tool source:
- home-pattern.md
- implementation-template.md
- iteration-template.md
- app-command-template.md

### 4. Initialize qino-config.json

```json
{
  "repoType": "implementation"
}
```

Note: `conceptsRepo` and `linkedConcept` are added later by dev-init when linking to a concept.

### 5. Welcome

```
Your implementation workspace is ready.

implementations/ — where apps live

─────

from here

  link a concept, or start building standalone

                    ("implement [concept-path]" or "start building")
```

---

## Do NOT:

- Overwrite existing files without asking
- Create complex initial structure
- Ask about concepts yet (that's for dev-init)
- Use excited language or emojis
