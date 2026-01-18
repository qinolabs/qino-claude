# Research Setup Workflow

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** research

---

## Task

One-time workspace scaffolding for research.

If workspace name is provided, create in that subdirectory.
If not, initialize in current directory.

If within a qino workspace, register this repo in workspace-manifest.

---

## Flow

### 1. Determine Target Directory

- If workspace name provided: create and enter that directory
- If not: use current directory

### 2. Detect Workspace Context

Check if we're inside a qino workspace:
- Look for `../workspace-manifest.json` (one level up)
- Look for `../workspace-config.json`

If found: **Workspace mode** (will register after creation)
If not: **Standalone mode** (independent research repo)

### 3. Create Structure

Copy entire template from `plugins/qino/references/templates/research/`:

```
[research-workspace]/
├── manifest.json
├── inquiries/.gitkeep
├── qualities/.gitkeep
├── arcs/.gitkeep
├── .claude/
│   ├── qino-config.json
│   └── references/
│       └── research/
│           ├── arc-spec.md
│           └── research-spec.md
└── README.md
```

**Template source:** `plugins/qino/references/templates/research/`

**Copy strategy:**
- Use recursive copy preserving directory structure
- Create parent directories before copying
- Ensure all reference docs copied correctly

### 4. Initialize Git (Optional)

Prompt user:

```
Initialize git repo? (recommended)

[Y/n]
```

If yes: `git init && git add . && git commit -m "Initialize research workspace"`
If no: Skip (user can initialize later)

### 5. Register in Workspace (if in workspace mode)

If workspace detected, update `../workspace-manifest.json`:

```json
{
  "repos": [
    {
      "id": "research-repo",
      "type": "research",
      "path": "research-repo",
      "purpose": "Research and investigations",
      "status": "active",
      "contains": ["inquiries", "qualities", "arcs"]
    }
  ]
}
```

And update `../workspace-config.json`:

```json
{
  "repos": {
    "research": "./research-repo"
  }
}
```

Use actual directory name, not hardcoded "research-repo".

### 6. Welcome

**If standalone:**
```
Your research workspace is ready.

inquiries/ — where threads live
qualities/ — where aesthetics refine
arcs/ — where emergence accumulates

─────

from here

  begin an inquiry, calibrate a quality, or open an arc

    /qino begin inquiry [topic]
    /qino attune [quality-name]
    /qino begin arc
```

**If in workspace:**
```
Research workspace created and registered.

workspace-manifest updated — research-repo added

─────

from here

  begin an inquiry, calibrate a quality, or open an arc

    /qino begin inquiry [topic]
    /qino attune [quality-name]
    /qino begin arc
```

---

## Edge Cases

**Directory already exists:**
- Check if it contains qino structure (.claude/qino-config.json)
- If yes: offer to enhance (add missing directories/files)
- If no and contains files: warn about conflicts, ask to choose different name
- If empty: proceed with template copy

**Workspace registration:**
- Don't modify workspace files if not in workspace context
- If workspace-manifest.json is malformed: warn and skip registration
- Always use relative paths from workspace root

---

## Do NOT

- Overwrite existing files without asking
- Initialize git without user consent
- Modify workspace files when in standalone mode
- Use excited language or emojis
- Create example inquiries or qualities (empty structure only)

---

## Technical Notes

**Template source:** `plugins/qino/references/templates/research/`

**Workspace detection:**
- Check parent directory for workspace-manifest.json
- Validate it's a qino workspace (has "workspaceType" field)
- Fail gracefully if workspace files are malformed

**Reference docs:**
- arc-spec.md — Complete arc format and ecology structure
- research-spec.md — Inquiry and quality patterns

**Manifest structure:**
- Version 1 format
- Empty arrays for inquiries, qualities, arcs
- Will be populated as research progresses
