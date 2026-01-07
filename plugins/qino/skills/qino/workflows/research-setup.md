# Research Setup Workflow

**Voice:** Minimal scaffolding. Create the space and step back.

**Agent:** qino-research-agent

**Reference:** Read `references/qino-research/research-spec.md` for workspace structure.

---

## Task

One-time workspace scaffolding for research.

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
  manifest.json
  inquiries/
  qualities/
  arcs/
  .claude/
    qino-config.json
    references/
      qino-research/
        research-spec.md
```

### 3. Create Reference Files

Copy from tool source:
- research-spec.md

### 4. Initialize manifest.json

```json
{
  "version": 1,
  "type": "research",
  "inquiries": [],
  "qualities": [],
  "arcs": []
}
```

### 5. Initialize qino-config.json

```json
{
  "repoType": "research"
}
```

Note: `conceptsRepo` and `linkedConcepts` can be added later to connect to a concepts workspace.

### 6. Welcome

```
Your research workspace is ready.

inquiries/ — where threads live
qualities/ — where aesthetics refine
arcs/ — where patterns accumulate

─────

from here

  start an inquiry, or let a question find you

                    ("start research on [topic]")
```

---

## Do NOT:

- Overwrite existing files without asking
- Create complex initial structure
- Use excited language or emojis
