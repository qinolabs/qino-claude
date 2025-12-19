---
description: Write the next chapter of the chronicle
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(empty for next chapter) | from_ref to_ref"
---

# /qino-scribe:chapter

Write the next chronicle chapter through a staged two-agent architecture.

## Overview

Chapter creation flows through layers:

1. **Prep Agent** — World, Disturbance, Beat layers with user checkpoints
2. **Hard cut** — prep.md complete
3. **Prose Agent** — receives only prep.md, writes the chapter
4. **Post-prose** — world update, arc update, snapshots

The user steers at checkpoints. The constraint on prose agent creates quality.

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
- Present scene seeds checkpoint → user chooses
- Write Grounding section to prep.md

**Disturbance Layer:**
- Read git diff (from last_ref or argument)
- Read for shape: what quality of change? (appearance, transformation, connection, etc.)
- Find the resonance: where does this shape want to live in the story world?
- Present resonances checkpoint → user chooses
- Append Disturbance section to prep.md

**Beat Layer:**
- Read chosen angle
- Generate story types, opening image, characters, stakes
- Present directions checkpoint → user chooses
- Append Beat section (including relational fields) to prep.md

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
1. Inhabit the prep (sensory palette, voice notes, relational fields)
2. Write the chapter following voice.md craft
3. Verify against 6 checks (stakes, vividness, dialogue, reader, mutual seeing, response completes)
4. Write chapter.md

---

## Phase 3: Post-Prose Updates

After chapter is written, return to orchestration for updates.

### World Update

Read the chapter and current world.md. Consider:
- What pressure released? What's now building?
- What does the wanderer carry now? Where were they last seen?
- Any new characters or locations? (Check world tokens)
- What have characters been watching? (Track accumulated perception)
- What remains unspoken about the wanderer?

Present summary checkpoint:
```
─────────────────────────────────────────────────────────────────
world evolved

  pressures:
    released → [what resolved]
    building → [what's new]

  the wanderer:
    now carries → [new weight]
    last seen → [where/how]

  new in world:
    + [Character] — [brief texture]
    + [Location] — [brief atmosphere]

                                           looks right? (adjust)
```

User confirms or adjusts. Apply updates to `chronicle/world.md`.

### Arc Update

Read the chapter and current arcs.md. Consider:
- Did any arc advance? How?
- Did any arc begin? What's its shape?
- Did any arc complete? What did it yield?

Present summary checkpoint:
```
─────────────────────────────────────────────────────────────────
arcs

  advanced:
    [Arc Name] → [how it moved]

  begun:
    [New Arc] → [what question it holds]

  completed:
    [Arc Name] → [what it yielded]

                                           looks right? (adjust)
```

User confirms or adjusts. Apply updates to `chronicle/arcs.md`.

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
| Scene Seeds | Interactive | Must choose |
| Angles | Interactive | Must choose |
| Directions | Interactive | Must choose |
| World Update | Summary | Confirm or adjust |
| Arc Update | Summary | Confirm or adjust |

**Interactive:** Present 3 options, wait for choice.
**Summary:** Apply judgment, show summary, user confirms or intervenes.

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
  [optional: carrying what, in what state]

─────────────────────────────────────────────────────────────────
  what's building

    [Pressure 1 — narrative tension for next time]
    [Pressure 2 — atmospheric or relational tension]

─────────────────────────────────────────────────────────────────
  [word count]                              [Arc Name] (begun/advanced)
```

The top half is story — what happened, where the wanderer rests.
The middle is pressure — what's building, the world's breath.
The bottom is structure — word count, arc movement (quiet, present but not featured).

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
- At least one moment of mutual seeing
