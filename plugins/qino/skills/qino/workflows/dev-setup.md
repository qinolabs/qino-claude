# Dev Setup Workflow

**Execution:** spawn
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
    docs/                  # Ecosystem architecture documentation
    manifest.json          # Registry of apps
  .claude/
    qino-config.json
    references/
      qino-dev/
        repo-conventions.md       # Structure conventions
        template-guidance.md      # Learnings capture guide
        home-pattern.md
        templates/
          implementation-template.md
          iteration-template.md
          app-command-template.md
```

### 3. Create Reference Files

Copy from tool source:
- repo-conventions.md
- template-guidance.md
- home-pattern.md
- implementation-template.md
- iteration-template.md
- app-command-template.md

### 4. Initialize implementations/docs/

Create `implementations/docs/README.md`:

```markdown
# Technical Documentation

This directory contains settled technical architecture and implementation patterns for the ecosystem.

## Purpose

**For humans:** Deep technical reference for understanding system design and architectural decisions.

**For AI agents:** Starting point for technical exploration — context that enables accurate reasoning about system behavior.

## What Belongs Here

✅ Cross-app patterns (seeding, RPC, type sharing)
✅ Infrastructure patterns (service bindings, migrations)
✅ Integration contracts (how components communicate)
✅ Settled architecture (implemented and proven designs)

❌ App-specific implementation (belongs in `implementations/{app}/`)
❌ Ephemeral notes (belongs in `docs/generated/`)

## Getting Started

See the implementation repo's main documentation structure for conventions and patterns.
```

### 5. Initialize implementations/manifest.json

```json
{
  "version": 1,
  "apps": []
}
```

### 6. Initialize qino-config.json

```json
{
  "repoType": "implementation"
}
```

Note: `conceptsRepo` and `linkedConcept` are added later by dev-init when linking to a concept.

### 7. Welcome

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
