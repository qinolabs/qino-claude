---
description: Write the next chapter of the chronicle
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(empty for next chapter) | from_ref to_ref"
---

# /qino-scribe:chapter

Write the next chronicle chapter through a staged two-agent architecture.

## Overview

Chapter creation flows through layers:

1. **Prep Agent** — Lens-first architecture with 2 steering checkpoints
   - Lens Layer → story direction (user chooses)
   - World Behavior → generated through lens (automatic)
   - Scene Layer → scene seeds (user chooses)
   - Beat → derived (automatic)
2. **Hard cut** — prep.md complete
3. **Prose Agent** — receives only prep.md, writes draft chapter
4. **Editorial Agent** — reviews draft in separate context, returns edits or approval
5. **Revision** (if needed) — prose agent applies specific edits
6. **Post-prose** — automatic (world update, arc update, snapshots, manifest)

User steers story direction and scene. World behavior and beat are derived.

---

## Arguments

Arguments: `$ARGUMENTS`

- **First argument** (`from_ref`): Git commit to start from — exclusive. Overrides manifest.
- **Second argument** (`to_ref`): Git commit to end at — inclusive. Defaults to HEAD.

---

## Before You Begin

### Locate the Chronicle

Find `chronicle/manifest.json` in the current project.

If no chronicle exists, this is the first chapter — see First Chapter Initialization below.

### Read Current State

```bash
cat chronicle/manifest.json
cat chronicle/world-seed.md
```

Get the last chapter's `git_ref_end` from the chapters array — this is where the git diff starts (unless overridden by arguments).

### Validate world-seed.md Frontmatter

Check if world-seed.md starts with `---`. If frontmatter is missing:

```
─────────────────────────────────────────────────────────────────
world-seed.md needs Setting Foundation

Image generation requires YAML frontmatter in world-seed.md with Setting Foundation fields.
This chronicle was created before frontmatter was required.

Would you like me to propose foundation fields based on your existing world seed?
(y/n)
─────────────────────────────────────────────────────────────────
```

If yes: Read the prose, propose fields using the checkpoint format from First Chapter Initialization (step 3), get user confirmation, then prepend frontmatter to world-seed.md.

---

## Initialize Process Log

Before spawning the prep agent, create the chapter **working directory**:

```bash
mkdir -p chronicle/chapters/NNN-wip
```

The `wip` suffix indicates work-in-progress. The directory will be renamed after the chapter title is known (see Phase 2.8).

Write the initial process.md:

```markdown
# Process Log — Chapter NNN

## Metadata
- **Created:** [ISO timestamp]
- **Git range:** [last_ref]..HEAD
- **Commits:** [count from git log]

---

## Prep Layer
```

This file will be appended to by the prep agent and editorial agent.

---

## Phase 1: Prep Agent

Spawn the prep agent to handle Lens, World Behavior, Scene, and Beat layers:

```
Use agent: scribe-prep
ultrathink: Synthesis work benefits from deliberation.

Pass to agent:
- The chapter directory path: chronicle/chapters/NNN-wip
- The git range: [last_ref]..HEAD
```

The prep agent handles four layers with two checkpoints:

**Lens Layer:**
- Read recent chapters, arcs.md, git diff (first-pass stats), world.md
- Assess chronicle position (early, mid-journey, approaching resolution)
- Consider both chronicle flow and diff resonance
- **Checkpoint 1:** Story direction → user chooses from 3 lenses
- Write Story Lens section to prep.md (with sensitivities and craft note)

**World Behavior (Automatic):**
- Read git diff in detail through chosen lens sensitivities
- Two passes: stats (shape) and messages (texture + keywords)
- Generate behavior that serves the story direction — through the lens
- Append World Behavior section to prep.md (no checkpoint)

**Scene Layer:**
- Read world.md, arcs.md, lens + world behavior
- Generate sensory palette, active pressures, world's strangeness
- **Checkpoint 2:** Scene seeds → user chooses
- Append Grounding section to prep.md

**Beat (Derived):**
- Discover territory from lens + scene + material
- Derive opening, characters, obstacle, stakes, what's unsaid
- Append Beat section to prep.md (no checkpoint)

**Completion:**
- Announce "prep.md complete — ready for prose agent"

---

## Phase 2: Hard Cut → Prose Agent

When prep.md is complete, spawn the prose agent:

```
Use agent: scribe-prose

The prose agent reads ONLY: chronicle/chapters/NNN-wip/prep.md
```

**Critical:** The prose agent receives ONLY prep.md. This constraint is the quality mechanism — it forces fresh invention, prevents recycling, makes the brief fully generative.

The prose agent will:
1. Inhabit the prep (sensory palette, world behavior, what characters want/protect)
2. Weave world behavior into background (characters experience as ordinary)
3. Write the chapter following voice.md craft
4. Present draft to orchestrator (no self-editing)

---

## Phase 2.5: Editorial Review

When the prose agent presents its draft, spawn the editorial agent in a **separate context**:

```
Use agent: scribe-editorial
ultrathink: Careful review benefits from deliberation.

Pass to agent:
- The path to the draft: chronicle/chapters/NNN-wip/chapter.md
- The path to process.md: chronicle/chapters/NNN-wip/process.md
- The pass number: 1 (or 2 for second pass)
- Do NOT pass prep.md, world.md, or arcs.md
```

**Critical:** The editorial agent sees ONLY the draft file. This separation is intentional — it evaluates execution without knowing the constraints that shaped it. The editorial agent logs its decisions to process.md.

The editorial agent will:
1. Read the draft chapter file
2. Check against voice.md patterns
3. Return either `APPROVED` or a list of specific line-level edits

---

## Phase 2.6: Revision Loop

**If APPROVED:** Proceed to Phase 3.

**If NEEDS REVISION returned:**

1. Editorial returns edits in format:
   ```
   NEEDS REVISION (N issues)

   Line 23: "She smiled warmly" → show warmth through action
   Line 45: dialogue needs beat between question and response
   Line 78: wanderer reflects instead of acts — convert to action
   ```

2. Pass edit list to prose agent with instruction:
   ```
   Apply these specific edits to chronicle/chapters/NNN-wip/chapter.md
   Do not rewrite sections not flagged.
   ```

3. Prose agent applies edits directly to chapter.md

4. **Log the revisions:** After prose agent completes, append "After" text to each issue in process.md:
   ```markdown
   > After: "[the revised text — quote the same scope as Before]"
   ```

   This creates a complete before/after record for each flagged issue.

5. **Second editorial pass:**
   - Send revised chapter.md to editorial agent (fresh context)
   - If APPROVED → proceed to Phase 3
   - If NEEDS REVISION with ≤5 issues → apply and proceed to Phase 3
   - If NEEDS REVISION with >5 issues → Catastrophic Failure (see below)

**Maximum 2 editorial passes per chapter.**

---

## Phase 2.7: Catastrophic Failure Recovery

If editorial flags 10+ issues on first pass, or >5 issues on second pass:

1. **Save artifacts:**
   ```bash
   mv chronicle/chapters/NNN-wip/chapter.md chronicle/chapters/NNN-wip/draft-failed.md
   ```

2. **Present user with options:**
   ```
   ─────────────────────────────────────────────────────────────────
   draft failed editorial review

     issues: [count]
     saved:  chronicle/chapters/NNN-wip/draft-failed.md

   ─────────────────────────────────────────────────────────────────
   options

     1 → restart from Beat Layer (same grounding, new direction)
     2 → restart from World Layer (new scene seeds)
     3 → manually edit draft-failed.md and continue
     4 → proceed anyway (override editorial)

   ─────────────────────────────────────────────────────────────────
   ```

3. **If restart chosen:**
   - Option 1: Return to Phase 1, Beat Layer checkpoint
   - Option 2: Return to Phase 1, World Layer checkpoint

4. **If manual edit chosen:**
   - User edits draft-failed.md
   - Rename to chapter.md when ready
   - Skip editorial, proceed to Phase 3

5. **If override chosen:**
   - Rename draft-failed.md to chapter.md
   - Proceed to Phase 2.8 with warning logged

---

## Phase 2.8: Finalize Directory

After editorial approval (or override), rename the working directory to match the chapter title:

1. **Extract title** from chapter.md (the `# Title` heading)
2. **Convert to kebab-case slug:** "The Counting Room" → "the-counting-room"
3. **Rename directory:**
   ```bash
   mv chronicle/chapters/NNN-wip chronicle/chapters/NNN-slug
   ```

**Example:**
- Working: `chronicle/chapters/002-wip/`
- Title extracted: "The Counting Room"
- Final: `chronicle/chapters/002-the-counting-room/`

This ensures the directory name always matches the chapter title. All subsequent Phase 3 operations use the final path.

---

## Phase 3: Post-Prose Updates (Automatic)

After chapter is written, apply updates automatically. No confirmation required — this is bookkeeping, not steering.

### World Update

Read the chapter and current world.md. Apply:
- Pressure released/building based on what happened
- Wanderer's new position and what they carry
- New characters/locations from World Tokens
- Update character perception (what they've now witnessed)

Write updates directly to `chronicle/world.md`.

### Arc Update

Read the chapter and current arcs.md. Apply:
- Arc advancement if the chapter moved something
- New arc if one began
- Arc completion if one resolved

Write updates directly to `chronicle/arcs.md`.

### Snapshots

Copy current state to chapter directory:
```bash
cp chronicle/world.md chronicle/chapters/NNN-slug/world.md
cp chronicle/arcs.md chronicle/chapters/NNN-slug/arcs.md
```

### Update Manifest

Update `chronicle/manifest.json`:
- Add new chapter to chapters array
- Set the new chapter's git_ref_end to current HEAD commit

### Log Post-Prose Updates

Append to `chronicle/chapters/NNN-slug/process.md`:

```markdown
---

## Post-Prose

**World updates:**
- [Added/Updated]: [what changed]

**Arc updates:**
- [Arc Name]: [what changed]
```

---

## First Chapter Initialization

When no chronicle exists:

1. **Get theme from user**
   Ask: "What world should this chronicle inhabit? Describe the atmosphere, tensions, materials."

2. **Create directory structure**
   ```bash
   mkdir -p chronicle/chapters
   ```

3. **Populate Setting Foundation** (required for image generation)

   Based on the theme prose, propose SettingFoundation fields to the user:

   ```
   ─────────────────────────────────────────────────────────────────
   setting foundation

   Based on your theme, here's how I'd characterize the world:

     genre         [science-fiction | fantasy | contemporary | horror | hybrid]
     subgenre      [tone + tradition, e.g., "contemplative space opera"]

     scale         [narrative scope]
     geography     [terrain, climate, sky]
     era           [visual time period]
     architecture  [built environment style]
     lighting      [dominant light quality]

     technology    [tech visual vocabulary]
     transport     [vehicle vocabulary — critical for image generation]

     flora         [plants/vegetation or "none — reason"]
     fauna         [animals/creatures or "none — reason"]

     inhabitants   [who populates this world]
     disposition   [hospitable | guarded | indifferent | hostile]

     magic         [how it looks, not what it does — or "none — reason"]

   ─────────────────────────────────────────────────────────────────
   ```

   User reviews and adjusts. This is a checkpoint — wait for confirmation.

   See `references/qino-scribe/foundation.md` for field details.

4. **Create world-seed.md with frontmatter**

   Write the foundation as YAML frontmatter, followed by the prose:

   ```markdown
   ---
   genre: [value]
   subgenre: [value]
   scale: [value]
   geography: [value]
   era: [value]
   architecture: [value]
   lighting: [value]
   technology: [value]
   transport: [value]
   flora: [value]
   fauna: [value]
   inhabitants: [value]
   disposition: [value]
   magic: [value]
   ---
   # World Seed

   [prose description of the world]
   ```

5. **Create manifest.json**
   ```json
   {
     "version": 1,
     "chapters": []
   }
   ```

6. **Create initial world.md**
   Use template from craft.md:
   - Empty Pressures section
   - World's Breath based on theme
   - Sparse Wanderer section (just arrived)
   - Unexplored locations from theme

7. **Create initial arcs.md**
   ```markdown
   # Arcs

   *No arcs yet. The first chapter will begin them.*
   ```

8. **Proceed with chapter creation**
   For first chapter, use recent commits as diff source.

---

## Git Diff Commands

The prep agent needs the ecosystem diff:

```bash
# Get last_ref from manifest.json (or use argument)
git log --oneline [last_ref]..HEAD
git diff [last_ref]..HEAD --stat -- . ':!*chronicle*'
git diff [last_ref]..HEAD -- . ':!*chronicle*'
```

**Important:** Exclude chronicle directory. The chronicle is output, not source material.

For first chapter (no last_ref):
```bash
git log --oneline HEAD~10..HEAD
git diff HEAD~10..HEAD --stat -- . ':!*chronicle*'
```

---

## Chapter Directory Structure

Each chapter gets its own directory:

```
chronicle/chapters/NNN-slug/
├── process.md       ← Process log (created at start, appended throughout)
├── prep.md          ← Built through checkpoints (kept as artifact)
├── chapter.md       ← From prose agent
├── world.md         ← Snapshot after updates
└── arcs.md          ← Snapshot after updates
```

**Naming:**
- NNN = 3-digit chapter number, zero-padded (001, 002, ...)
- During prep/prose/editorial: `NNN-wip` (work-in-progress)
- After Phase 2.8: `NNN-slug` where slug = kebab-case of chapter title

**Example lifecycle:**
1. Created as `002-wip` at prep start
2. Renamed to `002-the-counting-room` after editorial approval
3. All post-prose operations use the final name

---

## Checkpoint Summary

| Layer | Type | User Action |
|-------|------|-------------|
| Lens | **Interactive** | Choose story direction (1-3) or describe own |
| World Behavior | Automatic | None — generated through lens |
| Scene | **Interactive** | Choose scene seed (1-3) or describe own |
| Beat | Automatic | None — derived from above |

Two interactive checkpoints. Each shows "certainty" (what's derived so far) to inspire user intuition.

Post-prose updates (world, arcs, snapshots, manifest) are automatic — no confirmation required.

---

## User Interaction at Checkpoints

At interactive checkpoints, user can:
- **Pick:** "2" — proceed with that option
- **Combine:** "like 1 but with the tension from 3"
- **Adjust:** "more intimate, less dramatic"
- **Ask:** "tell me more about 2"
- **Reject:** "none of these" — regenerate

Options are vocabulary. Even rejected options help articulate what's wanted.

---

## Reference Documents

Consult during execution:
- `references/qino-scribe/layers.md` — Lens-first architecture, checkpoints, prep.md structure
- `references/qino-scribe/story-lenses.md` — The twelve lenses, sensitivities, diff resonance
- `references/qino-scribe/disturbance.md` — How to read git diffs for shape and texture
- `references/qino-scribe/craft.md` — Chapter format, world.md structure, arc shapes
- `references/qino-scribe/voice.md` — Prose craft and patterns (used by prose and editorial agents)
- `references/qino-scribe/principles.md` — Relational principles embedded in layers

---

## Completion

When done, announce:
```
─────────────────────────────────────────────────────────────────
chapter NNN — [Title]

  [One or two lines: what happened in the chapter]

  The wanderer was last seen [where/doing what]

─────────────────────────────────────────────────────────────────
updated

  world    [what changed — pressures, locations, characters]
  arcs     [Arc Name] (begun/advanced/completed)

─────────────────────────────────────────────────────────────────
                                                      [word count]
```

The summary shows what was applied automatically. User can review world.md/arcs.md if they want to adjust.

---

## Guardrails

These commonly fail. Keep visible:

- Wanderer does something, not just witnesses
- World acts, not just contains
- Something at stake between people, not just for them
- One explanatory exchange maximum
- Every noun arises from story world, not source material
- "The wanderer" is narrative voice, never spoken
- Not everyone speaks wisdom — vary character registers
- Pressures section not empty when you finish
- At least one moment of mutual revealing
