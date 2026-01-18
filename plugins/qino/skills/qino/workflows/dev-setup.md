# Dev Setup Workflow

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** dev

---

## Task

One-time workspace scaffolding for implementation projects.

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
If not: **Standalone mode** (independent implementation repo)

### 3. Create Structure

Copy entire template from `plugins/qino/references/templates/implementation/`:

```
[implementation-workspace]/
├── implementations/
│   ├── docs/
│   │   └── README.md
│   └── manifest.json
├── .claude/
│   ├── qino-config.json
│   └── references/
│       └── dev/
│           ├── repo-conventions.md
│           ├── template-guidance.md
│           ├── home-pattern.md
│           └── templates/
│               ├── implementation-template.md
│               ├── iteration-template.md
│               └── app-command-template.md
└── README.md
```

**Template source:** `plugins/qino/references/templates/implementation/`

**Copy strategy:**
- Use recursive copy preserving directory structure
- Create parent directories before copying
- Ensure all reference docs and templates copied correctly

### 4. Initialize Git (Optional)

Prompt user:

```
Initialize git repo? (recommended)

[Y/n]
```

If yes: `git init && git add . && git commit -m "Initialize implementation workspace"`
If no: Skip (user can initialize later)

### 5. Register in Workspace (if in workspace mode)

If workspace detected, update `../workspace-manifest.json`:

```json
{
  "repos": [
    {
      "id": "implementations-repo",
      "type": "implementation",
      "path": "implementations-repo",
      "purpose": "Building from concepts",
      "status": "active",
      "contains": ["implementations"]
    }
  ]
}
```

And update `../workspace-config.json`:

```json
{
  "repos": {
    "implementation": "./implementations-repo"
  }
}
```

Use actual directory name, not hardcoded "implementations-repo".

If concepts-repo also exists in workspace, add link hint in config:

```json
{
  "conceptLinks": {
    "_comment": "Link concepts to implementations here as they're created"
  }
}
```

### 6. Welcome

**If standalone:**
```
Your implementation workspace is ready.

implementations/ — where apps live
implementations/docs/ — cross-app architecture

─────

from here

  link a concept, or start building standalone

    /qino implement [concept-path]
    /qino dev init [app-name]
```

**If in workspace:**
```
Implementation workspace created and registered.

workspace-manifest updated — implementations-repo added

─────

from here

  implement a concept, or start building

    /qino implement [concept-name]
    /qino dev init [app-name]
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
- Detect concepts-repo and hint at linking in conceptLinks

---

## Do NOT

- Overwrite existing files without asking
- Initialize git without user consent
- Modify workspace files when in standalone mode
- Use excited language or emojis
- Create example apps (empty structure only)
- Ask about linking concepts yet (that's for dev-init)

---

## Technical Notes

**Template source:** `plugins/qino/references/templates/implementation/`

**Workspace detection:**
- Check parent directory for workspace-manifest.json
- Validate it's a qino workspace (has "workspaceType" field)
- Fail gracefully if workspace files are malformed
- Detect sibling concepts-repo for linking hints

**Reference docs:**
- repo-conventions.md — Implementation repo structure patterns
- template-guidance.md — How to capture learnings through colocation
- home-pattern.md — Arrival pattern for generated commands

**Templates:**
- implementation-template.md — App technical context template
- iteration-template.md — Iteration planning template
- app-command-template.md — Home command for apps

**Manifest structure:**
- Version 1 format
- Empty apps array
- Will be populated as apps are created with dev-init
