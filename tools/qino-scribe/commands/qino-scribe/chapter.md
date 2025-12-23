---
description: Write the next chapter of the chronicle
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(empty for next chapter) | from_ref to_ref"
---

# /qino-scribe:chapter

Write the next chronicle chapter through a staged two-agent architecture.

## Overview

Chapter creation flows through layers:

1. **Prep Agent** — World, Disturbance, Beat layers with 3 steering checkpoints
2. **Hard cut** — prep.md complete
3. **Prose Agent** — receives only prep.md, writes the chapter
4. **Post-prose** — automatic (world update, arc update, snapshots, manifest)

User steers creative direction. Bookkeeping is automatic.

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
```

Get `last_chapter.git_ref` — this is where the git diff starts (unless overridden by arguments).

---

## Phase 1: Prep Agent

Spawn the prep agent to handle World, Disturbance, and Beat layers:

```
Use agent: scribe-prep
```

The prep agent will:

**World Layer:**
- Read theme.md, world.md, arcs.md, recent chapters
- Generate sensory palette, active pressures, scene seeds
- **Checkpoint 1:** Scene seeds → user chooses
- Write Grounding section to prep.md

**Disturbance Layer:**
- Read git diff (from last_ref or argument)
- Two passes: stats for shape, messages for texture + keywords
- Synthesize: Shape + Texture (e.g., "Transformation — clarifying")
- Ask: What would the world DO if it felt this way?
- Draw from domains: material, spatial, temporal, creature, object, human background
- **Checkpoint 2:** World behavior options (from different domains) → user chooses
- Append World Behavior section to prep.md

**Beat Layer:**
- Read the pressure that's moving
- Generate story types with opening situations, characters with wants/protecting, stakes
- **Checkpoint 3:** Directions (each includes its opening situation) → user chooses
- Append Beat section to prep.md

**Completion:**
- Announce "prep.md complete — ready for prose agent"

---

## Phase 2: Hard Cut → Prose Agent

When prep.md is complete, spawn the prose agent:

```
Use agent: scribe-prose

The prose agent reads ONLY: chronicle/chapters/NNN-slug/prep.md
```

**Critical:** The prose agent receives ONLY prep.md. This constraint is the quality mechanism — it forces fresh invention, prevents recycling, makes the brief fully generative.

The prose agent will:
1. Inhabit the prep (sensory palette, world behavior, what characters want/protect)
2. Weave world behavior into background (characters experience as ordinary)
3. Write the chapter following voice.md craft
4. Verify against checks (stakes, vividness, dialogue variety, reader gap, narration trusts dialogue, immersion)
5. Write chapter.md

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
- Update last_chapter with new chapter info
- Set git_ref_end to current HEAD commit

---

## First Chapter Initialization

When no chronicle exists:

1. **Get theme from user**
   Ask: "What world should this chronicle inhabit? Describe the atmosphere, tensions, materials."

2. **Create directory structure**
   ```bash
   mkdir -p chronicle/chapters
   ```

3. **Create theme.md**
   Write the theme as evocative prose — brief enough to read once and carry.

4. **Create manifest.json**
   ```json
   {
     "version": 1,
     "last_chapter": null,
     "chapters": []
   }
   ```

5. **Create initial world.md**
   Use template from craft.md:
   - Empty Pressures section
   - World's Breath based on theme
   - Sparse Wanderer section (just arrived)
   - Unexplored locations from theme

6. **Create initial arcs.md**
   ```markdown
   # Arcs

   *No arcs yet. The first chapter will begin them.*
   ```

7. **Proceed with chapter creation**
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
├── prep.md          ← Built through checkpoints
├── chapter.md       ← From prose agent
├── world.md         ← Snapshot after updates
└── arcs.md          ← Snapshot after updates
```

**Naming:**
- NNN = 3-digit chapter number, zero-padded (001, 002, ...)
- slug = kebab-case of chapter title

---

## Checkpoint Summary

| Checkpoint | Type | User Action |
|------------|------|-------------|
| Scene Seeds | Interactive | Choose or skip |
| World Behavior | Interactive | Choose from different domains |
| Directions | Interactive | Choose or skip |

**Interactive:** Present 3 options (from different domains for World Behavior). User chooses, combines, adjusts, or skips (`>` to auto-pick).

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
- `references/layers.md` — Layer definitions, checkpoint formats, prep.md structure
- `references/disturbance.md` — How to read git diffs for shape and find the rhyme
- `references/craft.md` — Chapter format, world.md structure, arc shapes
- `references/voice.md` — Prose craft (for prose agent)
- `references/principles.md` — Relational principles embedded in layers

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
