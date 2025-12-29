---
description: Guided workflow for adding a new command with optional agent scaffolding
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "[tool-name] [command-name]"
---

# Add Command

Automate the complete workflow of adding a new command to a qino tool.

---

## Task

When a tool author wants to add a new command, this workflow ensures all the right files are created and updated:
1. Command file with proper YAML frontmatter
2. Optional agent file
3. README.md updated with new command
4. Manifest synced
5. Version optionally bumped

---

## Flow

### 1. Parse Arguments

Extract from arguments:
- `tool-name` — which tool to add to (e.g., "qino-concept", "qino-universal")
- `command-name` — the new command name (e.g., "explore", "capture")

If arguments missing, ask:
> "which tool should this command belong to?"

Then:
> "what should the command be called?"

### 2. Validate Tool Exists

Check that `tools/{tool-name}/` exists.

If not found:
> "tool '{tool-name}' not found in tools/. available tools: [list active tools]"

Stop.

### 3. Determine Namespace

Look at existing commands in `tools/{tool-name}/commands/`:
- If commands are in a subdirectory (e.g., `commands/qino/`), use that namespace
- If commands are at root (e.g., `commands/design-adventure.md`), use root

This determines where the new command file goes.

### 4. Check for Existing Command

Check if command already exists at the determined path.

If exists:
> "command already exists at {path}. proceed anyway? (yes/no)"

If no, stop.

### 5. Gather Command Info

Ask conversationally (not as a form):

> "describe what this command does in one line"

Wait for response → this becomes `description`.

> "which tools does it need? (Read, Write, Edit, Glob, Bash, WebSearch, etc.)"

Wait for response → this becomes `allowed-tools`.

> "does it take arguments? if so, what format? (e.g., '[concept-id]', '[path-a] [path-b]', or leave empty)"

Wait for response → this becomes `argument-hint`.

> "does this command need a dedicated agent, or can it work inline?"

Wait for response → determines agent scaffolding.

### 6. Scaffold Command File

Read `references/qino-util/command-template.md` for structure reference.

Create command file at `tools/{tool-name}/commands/{namespace}/{command-name}.md`:

```markdown
---
description: {gathered description}
allowed-tools: {gathered tools}
argument-hint: "{gathered hint}"
---

# {Command Title}

{If agent: "You are the **{agent-name}**."}
{If inline: Brief description of inline behavior}

---

## Task

[To be filled in by author]

---

## Flow

### 1. [First step]

[To be filled in]

### 2. [Next step]

[To be filled in]

---

## Do NOT:

- [Add guardrails]
```

### 7. Scaffold Agent File (if requested)

If agent was requested:

> "what should the agent be called? (e.g., 'qino-concept-agent')"

Wait for response.

> "describe what this agent does in one line"

Wait for response.

Read `references/qino-util/agent-template.md` for structure reference.

Create agent file at `tools/{tool-name}/agents/{agent-name}.md`:

```markdown
---
name: {agent-name}
description: {agent description}
tools: {same as command tools}
permissionMode: acceptEdits
---

# {Agent Title}

[To be filled in by author]

---

## Philosophy

[To be filled in]

---

## Approach

[To be filled in]

---

## Do NOT:

- [Add guardrails]
```

### 8. Update README.md

Read `tools/{tool-name}/README.md`.

Find the Commands table (pattern: `| Command | What it does |`).

Insert a new row in alphabetical order by command name:
```
| `/{namespace}:{command-name}` | {description} |
```

Write updated README.

### 9. Sync Manifest

Run:
```bash
./scripts/sync-manifest.sh --write
```

Capture output to report what files were added.

### 10. Version Bump (optional)

Ask:
> "bump version? (patch/minor/skip)"

If patch or minor:
- Read `tools/{tool-name}/references/{tool-name}/version.json`
- Increment version appropriately
- Write updated version.json

### 11. Confirm

Report what was done:

```
✓ created: tools/{tool}/commands/{namespace}/{name}.md
✓ created: tools/{tool}/agents/{agent-name}.md (if applicable)
✓ updated: tools/{tool}/README.md
✓ synced: tools/manifest.json
✓ bumped: version → {new-version} (if applicable)

test with /{namespace}:{name}
```

---

## Do NOT:

- Create files outside the tools/ directory
- Overwrite existing files without confirmation
- Skip the manifest sync step
- Add commands to archived tools
- Guess at tool structure — always check what exists
