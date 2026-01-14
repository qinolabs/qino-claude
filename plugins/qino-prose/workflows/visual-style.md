---
description: Create or update visual-style.md for image generation
allowed-tools: Read, Write, Edit, Glob
argument-hint: "(empty to create) | update"
---

# /qino-scribe:visual-style

Create the visual style configuration for your chronicle's image generation.

## Overview

Visual style defines HOW your chronicle's images look — the rendering approach, fidelity, and artistic direction. This replaces AI-distilled style with author-controlled aesthetics.

**Why this matters:**
- "Cinematic concept art" produces different results than "illustrated storybook"
- High-detail vs impressionistic dramatically affects fidelity
- Your references (films, artists) shape the AI's interpretation
- Without explicit direction, the system guesses based on genre

---

## Before You Begin

### Check for Existing Chronicle

```bash
cat chronicle/world-seed.md
```

If no chronicle exists, create one first with `/qino-scribe:chapter`.

Visual style builds on the Setting Foundation — it needs to know your genre, geography, and lighting before defining how to render them.

---

## Phase 1: Understand the World

Read the Setting Foundation from world-seed.md frontmatter:

- **genre / subgenre** — what tradition is this?
- **lighting** — what's the dominant light quality?
- **era** — what visual period?
- **architecture** — what built environment?

These inform the visual style choices.

---

## Phase 2: Gather Aesthetic Preferences

Present these questions to the user:

```
─────────────────────────────────────────────────────────────────
visual style — rendering approach

How should your chronicle's images feel?

  1  cinematic concept art
     High production value. Film-like composition.
     Think: Blade Runner 2049, Dune, Arrival

  2  illustrated
     Hand-crafted quality. Book illustration feel.
     Think: classic fantasy covers, storybook art

  3  painterly
     Rich brushwork and texture. Fine art quality.
     Think: oil paintings, concept art with visible strokes

  4  atmospheric
     Mood over detail. Evocative and suggestive.
     Think: Turner paintings, impressionistic scenes

  5  stylized
     Distinctive visual approach. Deliberate departure from realism.
     Think: animated films, graphic novel aesthetics

─────────────────────────────────────────────────────────────────
```

Wait for user choice.

```
─────────────────────────────────────────────────────────────────
visual style — fidelity

How much detail should reward close attention?

  1  high-detail
     Rich textures, intricate elements, layered depth.
     Best for: worlds with crafted objects, architectural detail

  2  balanced
     Detail where it matters, atmosphere where it doesn't.
     Best for: most chronicles

  3  stylized
     Forms over strict realism. Intentional simplification.
     Best for: worlds with mythic or dreamlike quality

  4  impressionistic
     Mood over precision. Suggestion over definition.
     Best for: memory sequences, emotional atmospheres

─────────────────────────────────────────────────────────────────
```

Wait for user choice.

```
─────────────────────────────────────────────────────────────────
visual style — color philosophy (optional)

Is there a dominant color approach?

Examples:
  • warm-cold contrast — interiors warm, exteriors cold
  • muted earth tones — subdued natural palette
  • high contrast — deep shadows, bright highlights
  • monochromatic tendency — one color family dominates

Enter a phrase, or press Enter to skip:
─────────────────────────────────────────────────────────────────
```

---

## Phase 3: Visual Direction (Prose)

Ask the user to describe their vision in prose:

```
─────────────────────────────────────────────────────────────────
visual direction

Describe how you want this world to FEEL visually.

This prose goes directly into image prompts. Write what you'd
tell an artist or cinematographer.

Examples:
  "Floodlit interiors against infinite dark exteriors.
   Wonder earned through patience, not spectacle."

  "Everything weathered, nothing pristine. Light comes from
   practical sources — fires, lamps, windows."

Your vision:
─────────────────────────────────────────────────────────────────
```

---

## Phase 4: References

Ask for reference works:

```
─────────────────────────────────────────────────────────────────
references

What films, artists, or games capture aspects of how this
world should look?

Format: Name (what aspect)

Examples:
  • Blade Runner 2049 (lighting, scale)
  • Caspar David Friedrich (figures in landscape)
  • Studio Ghibli (environmental detail)

Your references (one per line, empty line when done):
─────────────────────────────────────────────────────────────────
```

---

## Phase 5: What to Avoid

Ask what should be avoided:

```
─────────────────────────────────────────────────────────────────
avoid

What visual approaches should be avoided?

These help the system understand your aesthetic boundaries.
(Internally converted to positive guidance)

Examples:
  • Photorealistic rendering
  • Oversaturated colors
  • Clean, sterile surfaces
  • Generic fantasy tropes

What to avoid (one per line, empty line when done):
─────────────────────────────────────────────────────────────────
```

---

## Phase 6: Present Draft

Assemble and present the complete visual-style.md:

```
─────────────────────────────────────────────────────────────────
visual-style.md

---
style: [chosen style]
fidelity: [chosen fidelity]
palette: [if provided]
---

# Visual Direction

[user's prose direction]

## References
[formatted list]

## Avoid
[formatted list]

─────────────────────────────────────────────────────────────────
Does this capture your vision? (y to save, or describe changes)
─────────────────────────────────────────────────────────────────
```

---

## Phase 7: Save

On confirmation, write to `chronicle/visual-style.md`:

```bash
# Write the file
cat > chronicle/visual-style.md << 'EOF'
[assembled content]
EOF
```

---

## Update Mode

If argument is "update", read existing visual-style.md first and ask:

```
─────────────────────────────────────────────────────────────────
updating visual-style.md

Current settings:
  style:    [current]
  fidelity: [current]
  palette:  [current or "not set"]

What would you like to change?
  • "style" — change rendering approach
  • "fidelity" — change detail level
  • "direction" — rewrite the prose section
  • "references" — update reference list
  • "all" — start fresh

─────────────────────────────────────────────────────────────────
```

Only prompt for the sections being changed.

---

## Completion

```
─────────────────────────────────────────────────────────────────
visual-style.md saved

  style:    [value]
  fidelity: [value]
  palette:  [value or "—"]

This will be used for all future image generation.
To update later: /qino-scribe:visual-style update
─────────────────────────────────────────────────────────────────
```

---

## Field Reference

See `references/chronicle/visual-style.md` for detailed field documentation.

---

## Integration with Backend

When visual-style.md exists:
1. Publish workflow includes it in the payload
2. Backend reads it from R2
3. Image generation uses it instead of AI distillation
4. All images in the chronicle share consistent style

Without visual-style.md, the backend falls back to genre-based defaults.
