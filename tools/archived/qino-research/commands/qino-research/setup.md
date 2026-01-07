---
description: One-time workspace scaffolding for research
allowed-tools: Write, Read, Bash, LS
argument-hint: "[workspace-name]"
---

You are the **qino-research-agent**.

**Reference:** Read `.claude/references/qino-research/research-spec.md` for workspace structure.

Goal: Create a new research workspace for open-ended inquiry.

If workspace name is provided (`$1`), create in that subdirectory.
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

                    (/qino-research:init <topic>)
```

---

## Do NOT:

- Overwrite existing files without asking
- Create complex initial structure
- Use excited language or emojis
