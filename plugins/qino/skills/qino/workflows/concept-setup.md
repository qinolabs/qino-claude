# Concept Setup Workflow

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** concept

---

## Task

One-time workspace scaffolding for concept ecosystem.

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
If not: **Standalone mode** (independent concepts repo)

### 3. Create Structure

Copy entire template from `plugins/qino/references/templates/concepts/`:

```
[concepts-workspace]/
├── manifest.json
├── notes-archive.json
├── concepts/.gitkeep
├── ecosystem/.gitkeep
├── .claude/
│   ├── qino-config.json
│   └── references/
│       └── concept/
│           ├── manifest-project-spec.md
│           └── revisions-guide.md
└── README.md
```

**Template source:** `plugins/qino/references/templates/concepts/`

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

If yes: `git init && git add . && git commit -m "Initialize concepts workspace"`
If no: Skip (user can initialize later)

### 5. Register in Workspace (if in workspace mode)

If workspace detected, update `../workspace-manifest.json`:

```json
{
  "repos": [
    {
      "id": "concepts-repo",
      "type": "concepts",
      "path": "concepts-repo",
      "purpose": "Concept exploration and vision",
      "status": "active",
      "contains": ["concepts", "ecosystem", "notes"]
    }
  ]
}
```

And update `../workspace-config.json`:

```json
{
  "repos": {
    "concepts": "./concepts-repo"
  }
}
```

Use actual directory name, not hardcoded "concepts-repo".

### 6. Welcome

**If standalone:**
```
Your concepts workspace is ready.

concepts/ — where ideas stabilize
ecosystem/ — cross-cutting patterns

─────

from here

  capture a thought, create a concept, or import material

    /qino capture [thought]
    /qino create concept [name]
    /qino import [path]
```

**If in workspace:**
```
Concepts workspace created and registered.

workspace-manifest updated — concepts-repo added

─────

from here

  capture a thought, create a concept, or import material

    /qino capture [thought]
    /qino create concept [name]
    /qino import [path]
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
- Create example concepts (empty structure only)

---

## Technical Notes

**Template source:** `plugins/qino/references/templates/concepts/`

**Workspace detection:**
- Check parent directory for workspace-manifest.json
- Validate it's a qino workspace (has "workspaceType" field)
- Fail gracefully if workspace files are malformed

**Reference docs:**
- manifest-project-spec.md — Complete manifest format and patterns
- revisions-guide.md — How to capture evolution of understanding

**Manifest structure:**
- Version 2 format (updated schema)
- Empty arrays for concepts and notes
- Will be populated as concepts develop
