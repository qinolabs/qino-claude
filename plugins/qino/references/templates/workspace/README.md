# Qino Workspace

Multi-repo workspace coordination for your qino ecosystem.

## What This Is

This workspace **versions RELATIONSHIPS, not CONTENT**. It's a coordination layer that links your concept, research, and implementation repositories without containing them.

Think of it like `pnpm-workspace.yaml`—it declares which repos exist and how they relate, but doesn't version their content. Each child repo maintains its own git history independently.

## Structure

```
my-qino-workspace/
├── workspace-manifest.json    # Registry of all repos
├── workspace-config.json      # How repos relate to each other
├── .claude/
│   └── qino-config.json      # Workspace-level qino configuration
├── concepts-repo/            # Your concept exploration (separate git repo)
├── research-repo/            # Your research workspace (separate git repo)
└── implementations-repo/     # Your implementation projects (separate git repo)
```

**Critical**: The `.gitignore` file prevents child repos from being nested. Each repo is independently versioned.

## Getting Started

### Option A: Using Template Repositories (Recommended)

1. **Fork this template** → Your workspace coordination repo
2. **Fork child repo templates:**
   - [concepts-repo-template](https://github.com/qinolabs/concepts-repo-template)
   - [research-repo-template](https://github.com/qinolabs/research-repo-template)
   - [implementation-repo-template](https://github.com/qinolabs/implementation-repo-template)

3. **Clone into workspace:**
   ```bash
   cd my-qino-workspace
   git clone <your-concepts-repo-fork> concepts-repo
   git clone <your-research-repo-fork> research-repo
   git clone <your-implementations-repo-fork> implementations-repo
   ```

4. **Update workspace-manifest.json** with your repos
5. **Update workspace-config.json** with relative paths

### Option B: Using Qino Skill (Easier)

```bash
cd my-qino-workspace
/qino init workspace
```

The skill will:
- Detect this workspace structure
- Offer to create missing repos
- Set up all configurations automatically

## What Gets Versioned

**In this workspace repo:**
- ✅ `workspace-manifest.json` — Registry of repos
- ✅ `workspace-config.json` — Cross-repo links
- ✅ `.claude/qino-config.json` — Workspace config
- ✅ `README.md` — This file
- ❌ Child repos (they're .gitignored)

**Why?**
- Changes to how repos relate → commit here
- Changes to content within repos → commit in those repos
- This keeps relationship changes separate from content changes

## Workspace Configuration

### workspace-manifest.json

Registry of all repos in your workspace:

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
      "status": "active"
    }
  ]
}
```

### workspace-config.json

How repos relate and link to each other:

```json
{
  "version": 1,
  "workspaceType": "qino-ecosystem",

  "repos": {
    "concepts": "./concepts-repo",
    "research": "./research-repo",
    "implementation": "./implementations-repo"
  },

  "conceptLinks": {
    "my-app": {
      "concept": "concepts-repo/concepts/my-app",
      "implementation": "implementations-repo/implementations/my-app"
    }
  }
}
```

### .claude/qino-config.json

Tells qino skill this is a workspace:

```json
{
  "repoType": "workspace",
  "workspaceName": "my-qino-workspace",
  "repos": {
    "concepts": "./concepts-repo",
    "research": "./research-repo",
    "implementation": "./implementations-repo"
  }
}
```

## Progressive Setup

You don't need all repos at once:

**Start minimal** (concepts only):
```
my-workspace/
└── concepts-repo/
```

**Add implementation later**:
```bash
cd my-workspace
/qino add implementation-repo
```

**Add research later**:
```bash
/qino add research-repo
```

The workspace grows with your needs.

## Working in the Workspace

The qino skill is workspace-aware. Commands route to the correct repo:

```bash
cd my-workspace

# Create a concept → goes to concepts-repo
/qino create concept my-idea

# Implement it → creates in implementations-repo, links to concept
/qino implement my-idea

# Research something → goes to research-repo
/qino begin inquiry design-patterns
```

## Maintenance

### Adding a New Repo

1. Create or clone the repo into workspace
2. Update `workspace-manifest.json` (add entry)
3. Update `workspace-config.json` (add path)
4. Update `.claude/qino-config.json` if needed
5. Commit workspace changes

### Linking Concept ↔ Implementation

In `workspace-config.json`:

```json
"conceptLinks": {
  "my-app": {
    "concept": "concepts-repo/concepts/my-app",
    "implementation": "implementations-repo/implementations/my-app"
  }
}
```

The qino skill uses these links for drift detection and context.

### Removing a Repo

1. Remove repo directory
2. Remove from `workspace-manifest.json`
3. Remove from `workspace-config.json`
4. Remove from `.claude/qino-config.json`
5. Commit workspace changes

## Child Repository Structure

Each child repo has its own structure:

- **concepts-repo** — `concepts/`, `ecosystem/`, `notes/`, `manifest.json`
- **research-repo** — `inquiries/`, `qualities/`, `arcs/`, `manifest.json`
- **implementations-repo** — `implementations/{app}/`, `implementations/docs/`, `manifest.json`

See each repo's README for details.

## Relationship to Qino Skill

The [qino skill](https://github.com/qinolabs/qino-claude) recognizes workspaces via `.claude/qino-config.json`:

- Reads `repoType: "workspace"`
- Loads `workspace-config.json` for repo locations
- Routes commands to appropriate repos
- Maintains links between concepts and implementations

Install via Claude plugin marketplace:
```bash
/plugin marketplace add qinolabs/qino-claude
/plugin install qino@qinolabs/qino-claude
```

## Philosophy

This pattern comes from building [qinolabs](https://github.com/qinolabs/qino-root)—a multi-repo ecosystem for concept exploration, research, and implementation.

**Key insight**: Concepts, research, and implementation have different rhythms and tolerances for uncertainty. Separating them into repos lets each evolve independently while maintaining relationships.

- **Concepts** stabilize over time (medium tolerance for flux)
- **Research** welcomes uncertainty (high tolerance, may never conclude)
- **Implementations** ship iteratively (low tolerance, must deliver)

The workspace coordinates without collapsing these distinct ecologies into one.

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Free to use and adapt with attribution, non-commercial, share-alike.

## Further Reading

- [qino-claude](https://github.com/qinolabs/qino-claude) — The skill system
- [qino Domain Language](https://github.com/qinolabs/concepts-repo/blob/main/ecosystem/qino-domain-language.md) — The vocabulary
- [Chronicles](https://chronicles.qinolabs.com/) — See the system in action
- [Journal](https://journal.qinolabs.com/) — Research transmissions

---

_This workspace versions relationships, not content._
_Each repo evolves independently. The workspace shows how they connect._
