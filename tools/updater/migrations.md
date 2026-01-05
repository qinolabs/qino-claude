# Migrations

This file documents breaking changes between versions. The update command reads this to guide users through migrations.

## Format

Each version section includes:
- **Summary**: What changed and why
- **Delete**: Files to remove (old names, deprecated)
- **Rename**: Files that moved locations
- **User action**: Changes needed in user-generated files

---

## v0.22.4 (Lean Journal Manifest + Prose-Only Frontmatter)

**Summary**: Journal manifest simplified to index-only format. Transmission frontmatter is now prose-only. Metadata (number, slug, title, date) moved to manifest. Manifest also tracks relay_version.

**Changed** (qino-relay):
- `journal/manifest.json` format changed from objects with prose to ID arrays
- Before: `"arcs": [{ "id": "...", "name": "...", "essence": "..." }]`
- After: `"arcs": ["arc-id-1", "arc-id-2"]`
- Same change applies to `threads` and `concepts` arrays
- Manifest now includes `relay_version` field

**Frontmatter changes**:
- Metadata (number, slug, title, date) removed from transmission.md frontmatter
- Frontmatter now contains prose only (arcs, threads, concepts with context)
- Metadata lives in manifest.json per-transmission entry

**Architecture**:
- Manifest answers "where does X appear?" (index + metadata)
- Transmission frontmatter answers "what does X mean here?" (prose only)
- concepts.md answers "what is X?" (stable shape)

**User action**:
- Update `journal/manifest.json` to lean format (IDs only, add relay_version)
- Remove metadata from transmission.md frontmatter (keep prose)
- Backend publish workflow updated to read prose from frontmatter, metadata from manifest

---

## v0.22.0 (Command Naming Standardization)

**Summary**: Standardized command naming across namespaces. Each namespace now has `:setup` (one-time workspace scaffolding) and `:init` (create new item). The old `:init` commands that created workspaces are now `:setup`, and `:init` creates new items within the workspace.

**Naming Pattern**:
- `<namespace>:setup` — One-time workspace scaffolding
- `<namespace>:init` — Create new item (concept, app, inquiry)

**Delete** (renamed commands):
- `.claude/commands/qino-concept/init.md` (was workspace setup, now `:setup`)
- `.claude/commands/qino-dev/init.md` (was workspace + app creation, now split)
- `.claude/commands/qino-research/begin.md` (renamed to `:init`)

**New**:
- `.claude/commands/qino-concept/setup.md` — workspace scaffolding
- `.claude/commands/qino-concept/init.md` — create new concept from impulse
- `.claude/commands/qino-dev/setup.md` — workspace scaffolding
- `.claude/commands/qino-dev/init.md` — create app from concept or standalone
- `.claude/commands/qino-research/setup.md` — workspace scaffolding
- `.claude/commands/qino-research/init.md` — create new inquiry

**Rename**:
- `/qino-concept:init` (workspace) → `/qino-concept:setup`
- `/qino-dev:init` (workspace + app) → `/qino-dev:setup` + `/qino-dev:init`
- `/qino-research:begin` → `/qino-research:init`

**User action**:
- Delete old command files before updating
- Use `/qino-concept:setup` to set up workspace (was `/qino-concept:init`)
- Use `/qino-concept:init` to create new concepts (new capability)
- Use `/qino-dev:setup` to set up workspace, then `/qino-dev:init` to create apps
- Use `/qino-research:setup` to set up workspace (new capability)
- Use `/qino-research:init` instead of `/qino-research:begin`

---

## v0.21.0 (qino-relay)

**Summary**: qino-journal renamed to qino-relay with evolved Student identity. The Student now walks alongside readers as a companion who has learned the material, rather than pretending uncertainty.

**Delete** (qino-journal):
- `.claude/agents/journal-editorial.md`
- `.claude/agents/journal-prose.md`
- `.claude/commands/qino-journal/transmit.md`
- `.claude/references/qino-journal/student-guide.md`
- `.claude/references/qino-journal/transmission-format.md`
- `.claude/references/qino-journal/version.json`
- `.claude/references/qino-journal/voice.md`

**New** (qino-relay):
- `.claude/agents/relay-editorial.md` — reviews voice integrity and reader-companionship
- `.claude/agents/relay-prose.md` — voices arc material through the Student
- `.claude/commands/qino-relay/transmit.md` — create research transmission
- `.claude/references/qino-relay/reader-journey-guide.md` — reader journey prep guide (new)
- `.claude/references/qino-relay/student-guide.md` — how the Student works
- `.claude/references/qino-relay/transmission-format.md` — format specification
- `.claude/references/qino-relay/version.json`
- `.claude/references/qino-relay/voice.md` — Student's voice patterns

**Rename**:
- `/qino-journal:transmit` → `/qino-relay:transmit`

**Changed** (Student identity):
- From "genuine uncertainty" to "reader companionship"
- Student has learned the material and walks alongside readers
- Remembers what it was like not to know, voices that for readers
- Creates bridge through questions, not gap through uncertainty

**User action**:
- Delete all qino-journal files before updating
- Use `/qino-relay:transmit` instead of `/qino-journal:transmit`
- Existing transmissions continue to work

---

## v0.19.0 (qino-scribe visual-style)

**Summary**: qino Scribe adds visual-style.md for author-controlled image aesthetics, replacing AI-distilled style guessing.

**New** (qino-scribe):
- `.claude/commands/qino-scribe/visual-style.md` — interactive visual style configuration
- `.claude/references/qino-scribe/visual-style.md` — format documentation and examples

**Integration**:
- `visual-style.md` stored in `chronicle/` alongside world-seed.md
- GitHub workflow publishes to qino-chronicles-backend
- Backend uses visual-style.md instead of AI distillation when present
- All images share consistent author-defined aesthetic

**User action**:
- Run `/qino-scribe:visual-style` to create visual-style.md for your chronicle
- Existing chronicles work — visual style is optional (falls back to genre defaults)
- Use `force: true` in publish workflow to regenerate images with new style

---

## v0.15.0 (Command Namespace + Context Sensitivity)

**Summary**: Unified command naming based on qino-command-map concept. Universal ecology commands get their own tool (`qino-universal`), concept-specific commands move to `qino-concept:`, and all other tools get full prefixes. Universal commands now detect workspace context via `repoType` and adapt behavior. Static hints system added for cross-space navigation.

**Naming Architecture**:
- `qino:` — universal commands (the ecology itself) — now in `qino-universal` tool
- `qino-concept:` — concept space commands
- `qino-research:` — research space commands
- `qino-scribe:` — narrative commands
- `qino-dev:` — implementation space commands

**Delete**:
- `.claude/commands/attune/` (merged into qino:)
- `.claude/commands/research/` (renamed to qino-research/)
- `.claude/commands/scribe/` (renamed to qino-scribe/)

**Rename** (commands):
- `/qino:explore` → `/qino-concept:explore`
- `/qino:import` → `/qino-concept:import`
- `/qino:init` → `/qino-concept:init`
- `/scribe:chapter` → `/qino-scribe:chapter`
- `/scribe:rewind` → `/qino-scribe:rewind`
- `/research:home` → `/qino-research:home`
- `/research:begin` → `/qino-research:begin`
- `/research:experiment` → `/qino-research:experiment`
- `/research:graduate` → `/qino-research:graduate`
- `/attune:calibrate` → `/qino:attune`
- `/attune:compare` → `/qino:compare`

**New** (qino-universal tool):
- `tools/qino-universal/` — new tool for universal commands
- `.claude/commands/qino/home.md` (moved from qino-concept)
- `.claude/commands/qino/capture.md` (moved from qino-concept)
- `.claude/commands/qino/test.md` (moved from qino-concept)
- `.claude/commands/qino/attune.md` (was attune:calibrate)
- `.claude/commands/qino/compare.md` (was attune:compare)
- `.claude/references/qino-attune/` (attune references)

**New** (qino-concept):
- `.claude/commands/qino-concept/explore.md`
- `.claude/commands/qino-concept/import.md`
- `.claude/commands/qino-concept/init.md`

**Context Detection**:

All universal commands now read `.claude/qino-config.json` and branch behavior based on `repoType`:
- `"concepts"` or absent → concepts workspace behavior
- `"research"` → research workspace behavior
- `"implementation"` → linked concept behavior (unchanged)
- `"tool"` → tool repository behavior (new)

**Delete** (additional):
- `.claude/commands/qino-research/home.md` (absorbed into qino:home)

**Changed** (qino-universal):
- `/qino:home` — now detects research context and shows explorations/calibrations/experiments
- `/qino:capture` — routes to `fragments/` when inside `explorations/[id]/` in research context
- `/qino:test` — target is now argument-driven (concept, exploration, file, or conversation context)
- `/qino:attune` — prompts for research-repo path when used outside research workspace
- `/qino:compare` — detects calibration context and offers to append to `transformations.md`

**Changed** (qino-concept):
- `/qino-concept:explore` — gracefully refuses in research context with redirect to `/qino-research:begin`

**Hints System**:

All commands now show static hints based on their type:
- **Universal/Confirmation commands** → cross-space hints (can navigate between spaces)
- **Space-specific commands** → in-space hints (stay within current space)

**User action**:
- Delete old command directories: `attune/`, `research/`, `scribe/`
- Delete `.claude/commands/qino-research/home.md` (absorbed into /qino:home)
- Create new command directories: `qino-concept/`, `qino-research/`, `qino-scribe/`
- Universal commands now come from `qino-universal` tool
- Ensure `repoType` is set in `.claude/qino-config.json` for correct context detection
- Update any scripts or documentation referencing old command names

---

## v0.14.0 (qino-scribe)

**Summary**: qino Scribe complete rewrite with two-agent staged architecture. Relational principles embedded as active constraints.

**Delete** (qino-scribe):
- `.claude/agents/qino-scribe-agent.md` (replaced by scribe-prep.md and scribe-prose.md)
- `.claude/references/qino-scribe/process.md` (replaced by layers.md)
- `.claude/references/qino-scribe/voice-guide.md` (replaced by voice.md)

**New** (qino-scribe):
- `.claude/agents/scribe-prep.md` — prep agent for World, Disturbance, Beat layers
- `.claude/agents/scribe-prose.md` — prose agent (receives only prep.md, constrained)
- `.claude/references/qino-scribe/layers.md` — layer flow, checkpoints, prep.md structure
- `.claude/references/qino-scribe/voice.md` — sentence-level prose craft
- `.claude/references/qino-scribe/principles.md` — ten relational principles (reusable)

**Changed** (qino-scribe):
- Two-agent architecture: prep agent builds prep.md through 3 checkpoints, prose agent writes from constraint
- 6 verification checks (was 4): added mutual seeing and response completes
- prep.md includes relational fields: The relationship, Mutual seeing, What's unsaid
- world.md tracks relational state: "Has been watching" for characters, "What remains unspoken" for wanderer

**User action**:
- Delete old files listed above before updating
- Existing chronicles work — new chapters use staged architecture
- Chapter creation flow now has 3 interactive checkpoints (scene seeds, angles, directions)

---

## v0.13.0

**Summary**: qino Attune replaces qino Eval with a cleaner operation model (compare and calibrate).

**Delete** (qino-eval):
- `.claude/commands/eval/compare.md`
- `.claude/commands/eval/progression.md`
- `.claude/references/qino-eval/version.json`
- `.claude/references/qino-eval/stance.md`
- `.claude/references/qino-eval/compare-framework.md`
- `.claude/references/qino-eval/compare-session.md`
- `.claude/references/qino-eval/progression-lens.md`
- `.claude/references/qino-eval/learning-log.md`

**New** (qino-attune):
- `.claude/agents/qino-attune-agent.md` — curious collaborator stance
- `.claude/commands/attune/compare.md` — place two artifacts side by side
- `.claude/commands/attune/calibrate.md` — refine vague qualities into concrete craft
- `.claude/references/qino-attune/version.json`
- `.claude/references/qino-attune/compare-session.md` — comparison facilitation
- `.claude/references/qino-attune/calibrate-process.md` — calibration workflow

**User action**:
- Delete qino-eval files before updating
- Use `/attune:compare` instead of `/eval:compare` for artifact comparison
- Use `/attune:calibrate` for refining aesthetic qualities (new capability)

---

## v0.11.0

**Summary**: qino Scribe adds chapter snapshots; qino Concept ecosystem commands removed (functionality absorbed into existing commands).

**Delete** (qino-concept):
- `.claude/commands/qino/ecosystem.md` (use `/qino:home` instead)
- `.claude/references/qino-concept/ecosystem-spec.md` (merged into other specs)
- `.claude/references/qino-concept/manifest-ecosystem-spec.md` (merged into manifest-project-spec.md)

**New** (qino-concept):
- `.claude/commands/qino/test.md` — ecology testing for concept coherence
- `.claude/references/qino-concept/ecology-tests.md` — test framework

**Changed** (qino-scribe):
- Chapters now live in directories (`NNN-slug/chapter.md`) with world.md and arcs.md snapshots
- Enables accurate retroactive image generation using chapter-time world state

**User action**:
- Delete removed qino-concept files before updating
- Existing chronicles work but new chapters use directory structure

---

## v0.10.0

**Summary**: qino Scribe adopts agent architecture — identity embodied, not loaded.

**Delete** (qino-scribe):
- `.claude/references/qino-scribe/soul.md` (now embodied in agent)

**New** (qino-scribe):
- `.claude/agents/qino-scribe-agent.md` — the scribe's embodied identity

**User action**:
- Delete `soul.md` before updating (identity now lives in agent file)
- Invocation unchanged: `/scribe:chapter`
- Existing chronicles continue to work

---

## v0.7.0

**Summary**: qino Scribe architecture overhaul — adventure over observation. qino Eval introduced for chapter evaluation.

**Delete** (qino-scribe):
- `.claude/agents/qino-scribe-agent.md` (replaced by reference files)
- `.claude/references/qino-scribe/voice-guide.md` (archived)
- `.claude/references/qino-scribe/chapter-format.md` (archived)
- `.claude/references/qino-scribe/chronicle-spec.md` (archived)
- `.claude/references/qino-scribe/theme-guide.md` (archived)

**New** (qino-scribe):
- `.claude/references/qino-scribe/soul.md` — who the scribe is
- `.claude/references/qino-scribe/craft.md` — format reference
- `.claude/references/qino-scribe/process.md` — six-phase workflow

**New** (qino-eval):
- `.claude/commands/eval/compare.md` — side-by-side chapter comparison
- `.claude/commands/eval/progression.md` — evaluate movement between chapters
- `.claude/references/qino-eval/stance.md` — evaluator stance
- `.claude/references/qino-eval/compare-framework.md` — 7-dimension framework
- `.claude/references/qino-eval/compare-session.md` — facilitation guide
- `.claude/references/qino-eval/progression-lens.md` — 6-dimension felt lens
- `.claude/references/qino-eval/learning-log.md` — capturing insights

**User action**:
- Delete old qino-scribe files listed above before updating
- Chronicles created with old scribe will still work; new chapters use new architecture
- Consider regenerating chronicles to benefit from adventure-over-observation approach

---

## v1.0.0

Initial release. No migrations needed.

**Tools included:**
- dev-assistant v1.0.0
- design-sprint v1.0.0
- design-adventure v1.0.0
- qino-concept v1.0.0

---

## v0.5.0

**Summary**: qino Concept refined capture workflow; qino Scribe introduced World Tokens for thematic continuity.

**Delete**:
- `.claude/commands/qino/note.md` (renamed to capture.md)

**Rename**:
- `/qino:note` → `/qino:capture`

**New**:
- `.claude/references/qino-scribe/theme-guide.md` — World Tokens seeding for chronicle initialization

**User action**:
- Use `/qino:capture` instead of `/qino:note` for quick observation capture

---

## v0.4.0

**Summary**: qino Concept unified notes system with multi-reference anchoring.

**Delete**:
- `.claude/commands/qino/add-notes.md` (renamed to import.md)
- `.claude/references/qino-concept/manifest-ecosystem-spec.md` (deprecated, merged into manifest-project-spec.md)

**Rename**:
- `/qino:add-notes` → `/qino:import`

**New**:
- `.claude/commands/qino/note.md` — quick observation capture
- `/qino:note` command for capturing thoughts without leaving current context

**User action**:
- Use `/qino:import` instead of `/qino:add-notes` for bringing external material into concepts
- Use `/qino:note` to capture quick observations anchored to concepts or ecosystem
- If you have existing ecosystem notes in `ecosystem/manifest.json`, migrate them to the unified `manifest.json` (see manifest-project-spec.md Section 5-6)

---

<!--
## v1.1.0 (template)

Example migration entry for future reference:

**Summary**: Reorganized qino-concept references.

**Delete**:
- `.claude/references/qino-concept/old-spec.md`

**Rename**:
- `.claude/commands/qino/start.md` → `.claude/commands/qino/home.md`

**User action**:
- If you have concept files with `start_command` references, update them to `home_command`
- Run `/qino:home` instead of `/qino:start`

---
-->
