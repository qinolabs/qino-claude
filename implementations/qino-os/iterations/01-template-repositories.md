# Iteration 01: Template Repositories Foundation

Create GitHub template repositories that users can fork to instantiate their own qino workspace structure.

## Scope

Build the foundational distribution layer: empty template repositories with structure but no content.

**What's included:**
- Four template repositories on GitHub
- Each with empty structure matching qino conventions
- Pre-configured `.claude/qino-config.json` per repo type
- Reference documentation copied from qino-claude
- Comprehensive READMEs explaining setup and usage

**What's deferred:**
- Skill-based scaffolding workflows (iteration 02)
- Validation tooling (iteration 03)
- Migration strategies (future)

## Goals

- [ ] Create `qino-workspace-template` repository
- [ ] Create `concepts-repo-template` repository
- [ ] Create `research-repo-template` repository
- [ ] Create `implementation-repo-template` repository
- [ ] Each template has comprehensive README
- [ ] Templates are marked as GitHub template repos
- [ ] Templates link to qino-claude marketplace listing

## Architecture Decisions

### Decision: Template Distribution Strategy

**Question:** Single repo with branches per template, or separate repos?

**Options considered:**
1. **Single repo, multiple branches** (e.g., `workspace`, `concepts`, `research`, `implementation`)
   - Pros: Version consistency, atomic updates, simpler maintenance
   - Cons: Less discoverable, unusual GitHub pattern, harder to template

2. **Separate repositories** (e.g., `qino-workspace-template`, `concepts-repo-template`)
   - Pros: GitHub template feature works natively, clearer discovery, independent evolution
   - Cons: Version drift possible, more repos to maintain

**Decision:** Separate repositories
- GitHub's "Use this template" button works per-repo
- Users discover templates independently based on their tier
- Each template can evolve at its own pace
- Clear naming: `*-template` suffix signals intent

### Decision: Template Content Strategy

**What templates contain:**
- ✅ Directory structure (empty directories with `.gitkeep`)
- ✅ Configuration files (qino-config.json, manifest.json)
- ✅ Reference documentation (copied from qino-claude)
- ✅ Comprehensive README (setup, usage, links)
- ❌ Example content (users bring their own)
- ❌ Actual qinolabs concepts/research (separation of concerns)

**Rationale:** Templates provide structure and patterns, not content. Users want scaffolding, not someone else's thinking.

### Decision: Reference Documentation Source

**Question:** Where do reference docs live, and how do they get into templates?

**Answer:** Two-tier approach
1. **Source of truth:** qino-claude `references/templates/` directory
   - Versioned with skill releases
   - Single source for all template content
   - Updated when conventions evolve

2. **Copied into templates:** During template repo creation/update
   - Templates get frozen snapshot of references
   - Users fork stable versions
   - Can be updated when template repos are refreshed

**Update flow:**
```
qino-claude references/templates/
  ↓ (manual copy when releasing)
GitHub template repos
  ↓ (user forks via "Use this template")
User's workspace repos
```

## File Structure

### qino-workspace-template
```
qino-workspace/
├── .gitignore                   # Ignores all child repos + machine-specific
├── workspace-manifest.json      # Empty registry
├── workspace-config.json        # Minimal config with relative path placeholders
├── .claude/
│   └── qino-config.json        # repoType: "workspace"
└── README.md                    # Comprehensive setup guide
```

### concepts-repo-template
```
my-concepts/
├── manifest.json                # Empty registry
├── notes-archive.json           # Empty array
├── concepts/.gitkeep
├── ecosystem/.gitkeep
├── notes/.gitkeep
├── .claude/
│   ├── qino-config.json        # repoType: "concepts"
│   └── references/
│       └── concept/
│           ├── manifest-project-spec.md
│           └── revisions-guide.md
└── README.md
```

### research-repo-template
```
my-research/
├── manifest.json                # Empty registry
├── inquiries/.gitkeep
├── qualities/.gitkeep
├── arcs/.gitkeep
├── .claude/
│   ├── qino-config.json        # repoType: "research"
│   └── references/
│       └── research/
│           └── arc-pattern.md   # (to be created)
└── README.md
```

### implementation-repo-template
```
my-implementations/
├── implementations/
│   ├── docs/
│   │   └── README.md            # Cross-app architecture placeholder
│   └── manifest.json            # Empty registry
├── .claude/
│   ├── qino-config.json        # repoType: "implementation"
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

## Implementation Steps

### Phase 1: Prepare Reference Documentation
1. Review existing references in qino-claude
2. Identify what's needed for each template type
3. Create missing references (e.g., arc-pattern.md for research)
4. Place all in `references/templates/` directory in qino-claude

### Phase 2: Create Template Repos
For each template:
1. Create new GitHub repo under qinolabs org
2. Add directory structure with `.gitkeep` files
3. Copy reference docs from qino-claude
4. Write comprehensive README
5. Add LICENSE (CC BY-NC-SA 4.0)
6. Enable "Template repository" in GitHub settings
7. Tag initial release (v1.0.0)

### Phase 3: Documentation & Links
1. Update qino-claude README with template links
2. Add "Getting Started" section pointing to templates
3. Document user tiers and which templates they need
4. Create discovery path: README → templates → marketplace

## Test Criteria

**Template structure:**
- [ ] Each template has all required directories
- [ ] `.claude/qino-config.json` exists with correct `repoType`
- [ ] Reference docs copied correctly
- [ ] `.gitignore` appropriate for each template type

**User flow:**
- [ ] User can click "Use this template" on GitHub
- [ ] Cloned repo has working structure immediately
- [ ] qino skill recognizes repo type from config
- [ ] No manual file creation needed to start working

**Documentation quality:**
- [ ] README explains what this template is for
- [ ] README shows setup steps (clone → install skill → start)
- [ ] README links to qino-claude marketplace listing
- [ ] README explains relationship to other templates (workspace coordinates repos)

**GitHub template features:**
- [ ] "Template repository" enabled in settings
- [ ] Appears in template search
- [ ] "Use this template" button works
- [ ] Fork creates clean copy without template repo's history

## Open Questions for This Iteration

**Q1: Should templates include example workflows?**
- Option A: Include `.claude/commands/` with example commands
- Option B: Keep templates minimal, users add commands as needed
- **Decision needed before Phase 2**

**Q2: Template versioning strategy?**
- Git tags (v1.0.0)?
- Branch per version (v1, v2)?
- How do users know when to update?
- **Decision needed before Phase 2**

**Q3: Missing reference docs?**
- arc-pattern.md for research repos
- workspace-coordination.md for workspace repos
- Any others?
- **Audit needed in Phase 1**

## Learnings

### What Shifted

**Template content location:** Initially planned to create templates directly in GitHub repos. Realized templates should live in `plugins/qino/references/templates/` as single source of truth, then get copied to GitHub repos AND used by skill scaffolding workflows. This eliminates version drift—both distribution methods pull from same source.

**Hidden files in cp:** The `cp -r` command doesn't copy hidden files (like `.gitignore`) by default. Had to explicitly copy `.gitignore` with separate command. This revealed the importance of verification steps after file operations.

**Directory structure corrections:** Initially copied files flatly, then had to move them into correct subdirectories (`.claude/`, `implementations/`). Would be cleaner to create target structure first, then copy files into place.

### What Worked

**Comprehensive READMEs:** Each template README follows same pattern (What This Is, Structure, Getting Started, Philosophy) but adapts content to workspace type's distinct ecology. Users get immediate orientation plus philosophical depth.

**Reference doc copying:** Copying existing reference docs from `plugins/qino/references/` into templates ensures consistency and reduces maintenance. When qino-claude updates, templates can be refreshed from same source.

**GitHub template feature:** Using `gh api` to enable template repository setting works cleanly. The `is_template: true` flag makes repos appear in GitHub's template search and adds "Use this template" button.

**Progressive disclosure in Getting Started:** Three-tier user model (single-repo → concept+implementation → full workspace) lets users self-select complexity. Including "(Coming in iteration 02)" for skill scaffolding manages expectations transparently.

### What Surprised Us

**Speed of template creation:** Once reference content existed in `plugins/qino/references/templates/`, creating all four GitHub repos took <30 minutes. The bottleneck was designing comprehensive READMEs, not the mechanical repo creation.

**Template README depth:** Each README became 150-300 lines—much more substantial than expected. But this depth is valuable: templates need to be self-contained, explaining not just "what" but "why" and "how it relates to other repos."

**User tier clarity:** The three-tier model (single-repo / standard / full) emerged cleanly during Getting Started documentation. This wasn't explicitly planned but became obvious when describing user paths.

**No workspace-coordination.md needed:** Initially thought we'd need a separate `workspace-coordination.md` reference doc. The workspace template's README.md is comprehensive enough—no separate doc needed. Sometimes embedded documentation suffices.

### Led To

**Iteration 02 scoped:** Skill scaffolding workflows (`workspace-init.md`) can now copy from `plugins/qino/references/templates/` instead of recreating structure. Templates serve dual purpose: GitHub forkable + skill source.

**Open question resolved:** "Should templates include example workflows?" → No. Keep templates minimal. Users add commands as needed. Empty structure is better than opinionated starter content.

**Version strategy decided:** Template repos use git tags (`v1.0.0`). When qino-claude releases new template content, template repos get refreshed and tagged. Users can check template repo releases for updates.

**Documentation linking:** qino-claude README now has clear funnel: philosophy → installation → workspace setup → template links → depth in each template. Discovery path is: broad → focused → deep.

**Validation scope hint:** Seeing template structure firsthand suggests validation should check:
  - Required directories exist
  - Required files exist (.claude/qino-config.json, manifest.json)
  - Config files are valid JSON
  - repoType matches actual structure

More complex validation (paths resolve, links valid) can wait for iteration 03 after real-world usage.
