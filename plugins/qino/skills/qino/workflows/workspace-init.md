# Workspace Init Workflow

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** dev

---

## Task

Initialize a multi-repo qino workspace with coordination layer and chosen constituent repos.

The workspace versions **relationships**, not content. Each child repo maintains independent git history.

---

## Flow

### 1. Prompt for Workspace Type

Present options:

```
What kind of workspace?

→ minimal (concepts only)
→ standard (concepts + implementations)
→ full (concepts + research + implementations)
→ custom (you choose components)
```

Based on choice:
- **minimal**: Create `concepts-repo/`
- **standard**: Create `concepts-repo/` + `implementations-repo/`
- **full**: Create `concepts-repo/` + `research-repo/` + `implementations-repo/`
- **custom**: Prompt for each repo type individually

### 2. Determine Target Directory

- If workspace name provided as argument: create and enter that directory
- If not: use current directory

Check if directory already has qino structure:
- If `workspace-manifest.json` exists: offer to enhance existing workspace
- If `.claude/qino-config.json` exists but no manifest: offer to convert to workspace
- If neither: proceed with fresh initialization

### 3. Create Workspace Root Structure

```
[workspace]/
├── .gitignore                 # Ignores all child repos + machine-specific
├── workspace-manifest.json    # Empty registry
├── workspace-config.json      # Minimal config with relative path placeholders
├── .qino/
│   └── captures/              # Flat capture files — independent records
├── .claude/
│   └── qino-config.json      # repoType: "workspace"
└── README.md                  # Workspace coordination guide
```

**Copy from templates:**
- Copy entire `plugins/qino/references/templates/workspace/` directory contents
- Update `workspace-manifest.json` created date to today
- Update `.claude/qino-config.json` workspaceName if directory name provided

### 4. Create Chosen Child Repos

For each repo type selected, create subdirectory and copy template:

**For concepts-repo:**
```
concepts-repo/
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

**Copy from:** `plugins/qino/references/templates/concepts/`

**For research-repo:**
```
research-repo/
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

**Copy from:** `plugins/qino/references/templates/research/`

**For implementations-repo:**
```
implementations-repo/
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

**Copy from:** `plugins/qino/references/templates/implementation/`

### 5. Update Workspace Configuration

**workspace-manifest.json** — Add entry for each created repo:

```json
{
  "version": 1,
  "workspaceType": "qino-ecosystem",
  "created": "2025-01-18",
  "repos": [
    {
      "id": "concepts-repo",
      "type": "concepts",
      "path": "concepts-repo",
      "purpose": "Concept exploration and vision",
      "status": "active",
      "contains": ["concepts", "ecosystem", "notes"]
    }
    // ... add for each created repo
  ]
}
```

**workspace-config.json** — Add paths and link structure:

```json
{
  "version": 1,
  "workspaceType": "qino-ecosystem",

  "repos": {
    "concepts": "./concepts-repo",
    "implementations": "./implementations-repo",
    "research": "./research-repo"
  },

  "conceptLinks": {},

  "mcpServers": {}
}
```

Only include repos that were actually created.

### 6. Git Initialization (Optional)

Prompt user:

```
Initialize git repos? (recommended)

Each repo gets independent git history.
The workspace versions relationships between them.

[Y/n]
```

If yes:
1. **Workspace root:** `git init && git add . && git commit -m "Initialize qino workspace"`
2. **Each child repo:** `cd [repo] && git init && git add . && git commit -m "Initialize [repo-type] workspace"`

If no: Skip git initialization (user can do manually later)

### 7. Welcome Message

Show created structure and next steps:

```
Your qino workspace is ready.

[workspace-name]/
├── workspace-manifest.json    # coordinates repos
├── workspace-config.json      # links concepts ↔ implementations
├── concepts-repo/             # explore ideas
[├── research-repo/]           # [if created]
[└── implementations-repo/]    # [if created]

─────

from here

  create a concept, start building, or begin research

    /qino create concept [name]
    /qino dev init [concept-path]
    /qino begin inquiry [question]

  see workspace status

    /qino
```

Adapt message based on what was created (minimal/standard/full).

---

## Enhancement Detection

If workspace structure already exists:

### Existing workspace-manifest.json

```
Found existing qino workspace.

Current repos:
  - concepts-repo (active)

Want to:
  → add repos — add missing repo types
  → update config — show what would change
  → leave as-is — continue without changes
```

If user chooses "add repos":
- Prompt which repos to add
- Create only missing repos
- Update manifest and config
- Don't touch existing repos

### Existing qino-config.json but no manifest

```
Found qino-config with repoType: [type].

This looks like a single-repo workspace.
Want to convert to multi-repo workspace?

  → yes — create workspace coordination layer
  → no — leave as-is
```

If yes:
- Create workspace root files around existing repo
- Update paths to be workspace-relative
- Offer to add additional repos

---

## Edge Cases

**Current directory has files:**
- Check if conflicts with workspace structure
- If conflicts: warn and ask to choose different directory
- If no conflicts: proceed (workspace files coexist with existing content)

**Child repo directories already exist:**
- Check if they contain qino structure (.claude/qino-config.json)
- If yes: skip creation, add to manifest
- If no and contains files: warn about conflict, ask to rename or skip
- If empty: proceed with template copy

**Relative paths:**
- Always use relative paths (`./ prefix`) in workspace-config.json
- Paths resolve from workspace root
- This makes workspace portable (can move directory)

---

## Do NOT

- Overwrite existing workspace files without asking
- Initialize git repos without user consent
- Create nested git repos (workspace .gitignore prevents this)
- Use excited language or emojis
- Make assumptions about what user wants to build
- Create example content (templates are empty structure only)

---

## Technical Notes

**Template source:** `plugins/qino/references/templates/`

**Copy strategy:**
- Use recursive copy preserving directory structure
- Copy hidden files (.gitignore) explicitly
- Create parent directories before copying
- Verify all files copied successfully

**Git safety:**
- Child repos go in workspace .gitignore (prevents nesting)
- Each repo has independent .git directory
- Workspace commits coordination files only
- Never commit child repo content from workspace

**Progressive setup:**
- Workspace can start minimal and grow
- Add repos later with same process (enhancement detection)
- No migration pain when scaling up
- Each tier is fully functional on its own
