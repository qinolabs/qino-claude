# Iteration 02: Workspace Setup Workflow

Add skill-based scaffolding to create qino workspace structure programmatically, complementing the template repository approach.

## Scope

Build the integrated setup experience: users can initialize workspace structure via qino skill commands instead of (or in addition to) forking template repos.

**What's included:**
- New workflow: `workspace-init.md` for creating workspace structure
- Enhancement to existing workflows: `dev-setup`, `concept-setup`, `research-setup`
- Detection of existing structure (offer enhancement, not overwrite)
- Template content stored in qino-claude `references/templates/`
- Guided prompts for workspace type selection

**What's deferred:**
- Advanced validation beyond basic structure checking (iteration 03)
- Migration tooling when structure evolves (future)
- Multi-workspace management (not needed yet)

## Goals

- [ ] Create `references/templates/` directory in qino-claude
- [ ] Populate templates with reference content for each repo type
- [ ] Build `workspace-init.md` workflow (spawned agent)
- [ ] Enhance existing setup workflows to use templates
- [ ] Support progressive setup (minimal → standard → full)
- [ ] Detect existing qino structure and offer enhancement

## Architecture Decisions

### Decision: Template Storage in qino-claude

**Structure:**
```
qino-claude/
  references/
    templates/
      workspace/
        .gitignore
        workspace-manifest.json
        workspace-config.json
        qino-config.json
        README.md
      concepts/
        manifest.json
        notes-archive.json
        qino-config.json
        references/           # Reference docs for concepts repos
          manifest-project-spec.md
          revisions-guide.md
        README.md
      research/
        manifest.json
        qino-config.json
        references/           # Reference docs for research repos
          arc-pattern.md
        README.md
      implementation/
        manifest.json
        qino-config.json
        references/           # Reference docs for implementation repos
          repo-conventions.md
          template-guidance.md
          home-pattern.md
          templates/
            implementation-template.md
            iteration-template.md
            app-command-template.md
        README.md
```

**Rationale:**
- Single source of truth for all template content
- Versioned with skill releases (atomic updates)
- Workflows can copy directly from references
- Same content used for GitHub templates and skill scaffolding

### Decision: Workspace Type Selection

**User flow:**
```
(user)  /qino init workspace my-ecosystem

(qino)  What kind of workspace?

        → minimal (concepts only)
        → standard (concepts + implementations)
        → full (concepts + research + implementations)
        → custom (you choose components)

(user)  standard

(qino)  Creating standard workspace...

        my-ecosystem/
          ├── concepts-repo/        # from template
          └── implementations-repo/ # from template

        Your workspace is ready.
```

**Progressive setup supported:**
- Start with minimal (just concepts)
- Later add research: `/qino add research-repo`
- Later add implementations: `/qino add implementation-repo`
- Workspace config updated automatically

### Decision: Existing Structure Detection

**Behavior when qino structure already exists:**

1. **Detect qino-config.json**
   - If found: recognize repo type, offer to enhance
   - If not found: offer to initialize fresh

2. **Enhancement vs overwrite**
   - NEVER overwrite existing files
   - Offer to add missing directories
   - Offer to update config (show diff first)
   - User approves each change

3. **Example flow:**
   ```
   (qino)  Found existing concepts repo (missing references/).

           Want to:
             → add references — add missing reference docs
             → update config — show what would change
             → leave as-is — continue without changes
   ```

**Safety principle:** Detect and enhance, never assume and overwrite.

## Workflow Specifications

### workspace-init.md

**Execution:** spawn
**Voice:** Minimal scaffolding. Create the space and step back.
**Agent:** dev (has filesystem permissions, understands structure)

**Flow:**
1. Prompt for workspace type (minimal/standard/full/custom)
2. Prompt for workspace name (or use current directory)
3. Create workspace root structure (workspace-manifest, workspace-config, .claude/)
4. Based on type, create constituent repos:
   - minimal: concepts-repo/
   - standard: concepts-repo/ + implementations-repo/
   - full: concepts-repo/ + research-repo/ + implementations-repo/
   - custom: prompt for each repo type
5. Copy template content from `references/templates/` into each repo
6. Update workspace-config.json with relative paths
7. Initialize git repos (optional, prompt user)
8. Show welcome message with next steps

**Key considerations:**
- Check if workspace already exists (offer enhancement)
- Use relative paths in workspace-config
- Don't nest git repos (workspace coordinates, doesn't contain)
- Respect user's decision to skip git init

### Enhancement to dev-setup.md

**Changes:**
- Add detection for workspace context (is this inside a workspace?)
- If workspace detected, register in workspace-manifest
- Copy templates from `references/templates/implementation/`
- Link to concepts repo if workspace has one
- Preserve existing behavior for standalone usage

### Enhancement to concept-setup.md

**Changes:**
- Add detection for workspace context
- If workspace detected, register in workspace-manifest
- Copy templates from `references/templates/concepts/`
- Preserve existing behavior for standalone usage

### New: research-setup.md

**New workflow for research repo initialization:**
- Copy templates from `references/templates/research/`
- Create inquiries/, qualities/, arcs/ directories
- Initialize manifest.json
- Create qino-config.json with repoType: "research"
- Copy reference docs

**Not included in iteration 01** because research template didn't exist yet.

## Implementation Steps

### Phase 1: Template Content Preparation
1. Create `references/templates/` directory structure
2. Extract current setup logic from existing workflows
3. Create template files for each repo type
4. Write reference docs (arc-pattern.md, workspace-coordination.md)
5. Ensure templates match iteration 01 GitHub templates

### Phase 2: Build workspace-init Workflow
1. Create `workflows/workspace-init.md`
2. Implement workspace type selection
3. Implement repo creation from templates
4. Implement workspace-config linking
5. Add existing structure detection
6. Test progressive setup (minimal → standard → full)

### Phase 3: Enhance Existing Workflows
1. Update dev-setup.md (workspace awareness)
2. Update concept-setup.md (workspace awareness)
3. Create research-setup.md (new)
4. Test each workflow standalone
5. Test each workflow within workspace context

### Phase 4: Integration & Testing
1. Test full workflow: init workspace → create concept → implement → research
2. Test progressive: init minimal → add implementation → add research
3. Test enhancement: existing structure → add missing pieces
4. Verify workspace-manifest stays synchronized
5. Verify relative paths resolve correctly

## File Structure Created

When user runs `/qino init workspace my-ecosystem --type standard`:

```
my-ecosystem/
├── .gitignore
├── workspace-manifest.json
├── workspace-config.json
├── .claude/
│   └── qino-config.json
├── README.md
├── concepts-repo/
│   ├── manifest.json
│   ├── notes-archive.json
│   ├── concepts/.gitkeep
│   ├── ecosystem/.gitkeep
│   ├── notes/.gitkeep
│   ├── .claude/
│   │   ├── qino-config.json
│   │   └── references/
│   │       └── concept/
│   │           ├── manifest-project-spec.md
│   │           └── revisions-guide.md
│   └── README.md
└── implementations-repo/
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

## Test Criteria

**Fresh workspace creation:**
- [ ] `/qino init workspace` prompts for type
- [ ] Creates all required directories
- [ ] Copies all template content correctly
- [ ] workspace-config.json has correct relative paths
- [ ] Each repo has valid qino-config.json
- [ ] Welcome message shows clear next steps

**Progressive setup:**
- [ ] Can start with minimal (concepts only)
- [ ] Can add implementation-repo later
- [ ] Can add research-repo later
- [ ] workspace-manifest updates correctly
- [ ] workspace-config updates correctly
- [ ] No duplicate directories created

**Existing structure enhancement:**
- [ ] Detects existing qino-config.json
- [ ] Identifies repo type correctly
- [ ] Offers to add missing directories
- [ ] Shows config diff before updating
- [ ] NEVER overwrites existing files
- [ ] User can decline all changes

**Workspace coordination:**
- [ ] workspace-manifest lists all repos
- [ ] workspace-config links concepts ↔ implementations
- [ ] Relative paths resolve correctly
- [ ] qino skill recognizes workspace context
- [ ] Commands route to correct repos

**Standalone still works:**
- [ ] dev-setup works outside workspace
- [ ] concept-setup works outside workspace
- [ ] research-setup works outside workspace
- [ ] No workspace required for basic usage

## Open Questions for This Iteration

**Q1: Git initialization?**
- Should workspace-init run `git init` in each repo?
- Option A: Always initialize git (opinionated)
- Option B: Prompt user (flexible)
- Option C: Never initialize (user's choice)
- **Decision needed before Phase 2**

**Q2: Workspace-level git repo?**
- Should workspace root be a git repo (like qino-root)?
- Or just coordination directory, no versioning?
- If yes, what gets committed? (manifest, config, README only)
- **Decision needed before Phase 2**

**Q3: Command naming?**
- `/qino init workspace` (noun)
- `/qino workspace init` (verb)
- `/qino setup workspace` (alternative)
- **Decision needed before Phase 2**

**Q4: Template update mechanism?**
- When qino-claude releases new template content, how do users update?
- `/qino update templates` command?
- Manual (documented in changelog)?
- Defer to iteration 03?
- **Can defer, but note for future**

## Deferred to Later Iterations

**Not in scope for iteration 02:**
- Validation beyond basic structure checking
- Migration when conventions change
- Template versioning strategy
- Multi-workspace management
- Cloud sync or backup

**Why deferred:**
- Need real-world usage to inform validation depth
- Migration needs accumulation of structure changes
- Validation is its own iteration (03)

## Learnings

### What Shifted

**Template consumption strategy**: Initially thought each workflow would recreate structure manually. Realized all workflows should copy from `plugins/qino/references/templates/` created in iteration 01. This eliminated code duplication and established single source of truth—same content powers both GitHub templates and skill scaffolding.

**Workspace detection pattern**: Started with idea of "knowing" if user is in workspace. Shifted to "detecting" parent workspace-manifest.json and adapting behavior. Workflows don't assume context—they discover it, then adjust. This keeps them usable standalone while enabling workspace coordination.

**Git initialization philosophy**: Moved from "should we always/never initialize git" to "prompt user with recommended default (Y/n)". Respects user autonomy while leaning toward best practice. Consistent across all workflows now.

**Setup workflow scope**: Originally thought workspace-init would be separate from repo-specific setup workflows. Realized they form a coherent system—workspace-init creates coordination layer, individual setup workflows register themselves. Progressive setup works: start anywhere, grow as needed.

### What Worked

**Dual-mode welcome messages**: Showing different messages for standalone vs workspace contexts immediately orients users to what just happened. "Your workspace is ready" vs "Workspace created and registered" — subtle but effective.

**Template source references**: Every workflow documents "Template source: plugins/qino/references/templates/[type]/" making maintenance obvious. When templates change, grep for this string to find what needs updating.

**Workspace registration logic**: Keeping registration separate from structure creation means workflows can fail gracefully if workspace files are malformed. Check workspace, create structure, then register—clear sequence.

**SKILL.md routing tables**: Multiple tables (spawn mode list, agent assignments, intent mapping, execution mode, subagent types) provide redundancy—easy to find what routes where. Adding workspace-init required updating 5 locations, but each table serves different lookup need.

**Consistent copy strategy**: All three setup workflows (dev, concept, research) plus workspace-init follow same pattern: detect context, copy from templates, prompt for git, register if workspace. Once pattern understood, implementing new workflows trivial.

### What Surprised Us

**Template repositories vs skill scaffolding convergence**: Thought these would be separate distribution channels with separate content. Discovered they should share content from `plugins/qino/references/templates/`—iteration 01 created templates, iteration 02 consumes them. Two ways to instantiate, one source of truth.

**Workspace awareness complexity**: Initially seemed complex to detect workspace and modify behavior. Actually quite simple—check for `../workspace-manifest.json`, read if exists, update if valid. The simplicity of the check belies the power of the pattern.

**Progressive setup viability**: Uncertain if users could start with partial workspace and add repos later. Testing the detection logic revealed it works naturally—if workspace exists but missing repos, offer to add. If standalone repo exists, offer to wrap in workspace. The flexibility emerged from the architecture, wasn't explicitly designed.

**Git submodule warnings during commit**: When we accidentally committed template repos into qino-claude, git warned about embedded repositories. This revealed the importance of .gitignore in workspace root—child repos must be ignored to prevent nesting. The error taught the pattern.

**SKILL.md as source of truth for routing**: Realized SKILL.md documents the complete routing logic—what routes where, which agent handles it, execution mode, subagent type. It's not just documentation, it's the specification. Changes to routing start here.

### Led To

**Iteration 03 scope refinement**: Seeing how workspace creation and setup workflows interact suggests validation should check:
- Workspace coordination files are valid JSON
- Registered repos actually exist at declared paths
- Repo paths are relative (not absolute)
- repoType in qino-config matches actual structure
More complex validation (link resolution, concept-impl matching) deferred until real-world usage patterns emerge.

**Missing template content discovered**: While implementing workspace-init, realized implementation template needs populated. Created TODO to finish implementation-repo-template with all reference docs from plugins/qino/references/dev/. (Completed in iteration 02 actually—repo-conventions.md, template-guidance.md, templates/ all copied.)

**Progressive workspace command hint**: Users might want `/qino add [repo-type]` to add repos to existing workspace. This would be enhancement mode for workspace-init—detect workspace, prompt for missing repo types, create and register. Deferred to post-iteration 03, but pattern is clear.

**Workspace validation command scope**: `/qino validate workspace` should check structure, not just files. Suggested checks:
- All repos in manifest exist at paths
- All repos have valid qino-config.json
- Workspace-config repos match manifest entries
- No absolute paths (only relative)
Iteration 03 will determine depth.

**Documentation pattern for workflows**: Adding Technical Notes section to all workflows proved valuable—template source, detection logic, reference docs, manifest structure all documented. Future workflows should follow this pattern.

**Open question answered**: Q1 (git initialization) → Prompt user (Y/n). Q2 (workspace-level git) → Yes, like qino-root. Q3 (command naming) → `/qino init workspace`. Q4 (template updates) → Deferred to iteration 03 (need real-world usage first).
