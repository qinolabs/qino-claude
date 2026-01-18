# qino-os Implementation

Distribution and setup system enabling users to instantiate their own qino workspace ecosystem.

## Vision

Users who discover qino through chronicles, documentation, or GitHub should be able to:
1. Install the qino skill from the Claude plugin marketplace
2. Create their own qino workspace with empty structure (not qinolabs content)
3. Start using concept exploration, research workflows, and implementation patterns immediately
4. Scale progressively from single-repo to multi-repo as needs grow

**Not a goal**: Duplicate qinolabs content or apps. Users want the *structure and patterns*, not our specific concepts.

## Problem

Currently:
- qino skill works via plugin marketplace ✅
- But no clear path for users to create workspace structure
- Concepts, research, implementation repos are qinolabs-specific
- No template repos or scaffolding workflows exist
- Users would need to manually recreate directory structures

## User Tiers

**Tier 1: Single-repo explorers**
- Installed qino plugin, trying workflows in existing project
- Just need: single `qino-config.json` in their directory
- Don't need: multi-repo structure

**Tier 2: Concept → Implementation users**
- Building apps from concept work
- Need: concepts-repo + implementation repo, linked
- Don't need: research workflows, full workspace coordination

**Tier 3: Full qino-os users** (like qinolabs)
- Building across multiple modalities
- Need: complete workspace with concepts, research, implementations, archives
- This is the advanced use case

## Technical Approach

Three-layer distribution:

### Layer 1: Plugin Marketplace (existing)
No changes needed. Users install qino via `/plugin install`.

### Layer 2: Template Repositories (new)
GitHub template repos users can fork:
- `qino-workspace-template` — Workspace coordination layer
- `concepts-repo-template` — Concept workspace structure
- `research-repo-template` — Research workspace structure
- `implementation-repo-template` — Implementation workspace structure

Each template:
- Empty structure with no content
- Comprehensive README explaining setup
- Pre-configured `.claude/qino-config.json`
- Reference docs copied from qino-claude

### Layer 3: Skill Scaffolding (enhancement)
New qino skill workflow: `workspace-init`
- Prompts for workspace type (minimal/standard/full/custom)
- Creates directory structure
- Initializes configs with relative paths
- Links repos in workspace-config.json
- Uses templates from qino-claude references/

## Stack

**Distribution:**
- GitHub template repositories (fork + own)
- Claude plugin marketplace (already works)
- qino skill workflows (enhancement)

**Templates source:**
- Stored in qino-claude `references/templates/`
- Copied into user workspace by skill workflows
- Versioned alongside skill releases

**Scaffolding:**
- New workflow: `workspace-init.md` (spawned agent)
- Enhances existing: `dev-setup.md`, `concept-setup.md`, `research-setup.md`
- Detects existing structure, offers to enhance (not overwrite)

## Boundaries

**In scope:**
- Template repository creation and maintenance
- Workspace scaffolding workflow in qino skill
- Documentation for new users
- Validation tooling (`/qino validate workspace`)

**Out of scope (for now):**
- Cloud sync or central service (everything local, git-based)
- Migration tooling (future iteration when structure evolves)
- Video walkthroughs (medium priority)
- Complex workspace management (keep simple)

**Deferred decisions:**
- Exact template repo naming conventions
- Whether templates live in separate repos or single repo with branches
- Advanced validation beyond structure checking
- Workspace versioning strategy when conventions change

## Success Criteria

**Users can:**
1. Discover qino and understand the philosophy (README)
2. Install qino skill (`/plugin install`)
3. Initialize workspace structure (via skill OR template fork)
4. Start capturing, exploring, building (guided workflows)
5. Scale from simple to complex without migration pain

**Quality signals:**
- Setup takes <5 minutes from discovery to first capture
- No manual file creation needed
- Clear separation between qino patterns and user content
- Progressive complexity (simple works, complex available)

## Open Questions

1. **Template distribution**: Single repo with branches per template, or separate repos?
   - Pros of single: version consistency, atomic updates
   - Pros of separate: clearer discoverability, independent evolution
   - *Decision point: iteration 01*

2. **Workspace validation depth**: How much to validate?
   - Structure only (dirs exist, configs valid)?
   - Semantic validation (paths resolve, links valid)?
   - *Decision point: iteration 03*

3. **Migration strategy**: When structure evolves, how do users upgrade?
   - Manual docs?
   - `/qino migrate` command?
   - *Defer until post-iteration 03*

## Links

**Concept**: (to be created in concepts-repo if needed)
**Dependencies**: qino skill, existing setup workflows
**Related**: workspace-manifest pattern, qino-config patterns
