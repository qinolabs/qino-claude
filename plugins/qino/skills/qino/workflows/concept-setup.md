# Concept Setup Workflow

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** concept

---

## Task

One-time workspace scaffolding for concept ecosystem.

If workspace name is provided, create in that subdirectory.
If not, initialize in current directory.

---

## Steps

### 1. Determine target directory
- If workspace name provided: create and enter that directory
- If not: use current directory

### 2. Create structure

```
[workspace]/
  manifest.json
  concepts/
  notes/
  maps/
  .claude/
    qino-config.json
    references/
      qino-concept/
        concept-spec.md
        manifest-project-spec.md
        design-philosophy.md
```

### 3. Create qino-config.json

```json
{
  "repoType": "concepts"
}
```

### 4. Create reference files

Copy the specification files from tool source:
- concept-spec.md
- manifest-project-spec.md
- design-philosophy.md

### 5. Initialize manifest.json

Follow the schema defined in `references/qino-concept/manifest-project-spec.md`:
```json
{
  "version": 2,
  "concepts": [],
  "notes": []
}
```

### 6. Welcome

```
Your ecosystem is ready.

concepts/ — where ideas live
notes/ — where observations accumulate
manifest.json — keeps track

─────

from here

  capture a thought, bring in material, or create a concept

                        ("capture: [thought]", "import [path]", "create concept [name]")
```

---

## Do NOT:
- Overwrite existing files without asking
- Create complex initial structure
- Overwhelm with instructions
- Use excited language or emojis
