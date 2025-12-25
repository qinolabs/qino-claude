# Setting Foundation

The Setting Foundation captures the visual and structural vocabulary of your chronicle's world. It lives in `world-seed.md` as YAML frontmatter, ensuring consistent image generation across all chapters.

---

## Why This Matters

Image generation models work best with explicit, positive descriptions. Without structured guidance:
- "Shuttle" might render as an airport shuttle instead of a spacecraft
- Sci-fi settings get generic Earth backgrounds
- Fantasy worlds lose their specific visual language

The foundation provides that structure — once, at chronicle creation.

---

## Frontmatter Format

world-seed.md with foundation:

```yaml
---
# Genre
genre: science-fiction
subgenre: contemplative space opera

# Physical Setting
scale: intimate within epic — personal moments against cosmic backdrop
geography: mountain peaks, thin atmosphere, alien starlight, rifts at the base
era: futuristic with weathered surfaces
architecture: curved metallic domes with embedded lighting, crystalline viewports
lighting: warm interior glow against vast cold exterior, alien starlight

# Technology
technology: spacecraft with swept wings, holographic interfaces, plasma engines
transport: spacecraft, orbital shuttles, landing platforms, docking arms

# Biological Life
flora: sparse alpine mosses, bioluminescent lichen on dark stone
fauna: distant silhouettes of large winged creatures, small scurrying things

# Cultural
inhabitants: scholars, explorers, scientists from across the galaxy

# Social
disposition: hospitable — warmth, curiosity, welcome

# Supernatural
magic: none — this is hard science fiction
---
# Theme

A mountain observatory on a planet on the outer edges of explored space...
```

---

## Field Reference

### Genre

| Field | Purpose | Examples |
|-------|---------|----------|
| genre | Primary classification | `science-fiction`, `fantasy`, `contemporary`, `horror`, `hybrid` |
| subgenre | Tone + tradition | `contemplative space opera`, `grimdark high fantasy`, `cozy mystery` |

### Physical Setting

| Field | Purpose | Examples |
|-------|---------|----------|
| scale | Narrative scope | `intimate and local`, `epic and cosmic`, `contained within one building` |
| geography | Terrain, climate, sky | `mountain peaks, thin atmosphere, alien starlight` |
| era | Visual time period | `futuristic with weathered surfaces`, `medieval stone and iron` |
| architecture | Built environment | `curved metallic domes, crystalline viewports`, `weathered stone towers` |
| lighting | Dominant light quality | `warm interior glow against cold exterior`, `perpetual twilight` |

### Technology

| Field | Purpose | Examples |
|-------|---------|----------|
| technology | Tech visual vocabulary | `spacecraft with swept wings, holographic interfaces` |
| transport | Vehicle vocabulary | `spacecraft, orbital shuttles` or `sailing ships, horse-drawn carts` |

**Critical:** Transport explicitly names what vehicles look like. This prevents "aircraft" appearing in space settings.

### Biological Life

| Field | Purpose | Examples |
|-------|---------|----------|
| flora | Plants, vegetation | `sparse alpine mosses, bioluminescent lichen` or `none — sterile station` |
| fauna | Animals, creatures | `large winged creatures, small scurrying things` or `none — lifeless world` |

### Cultural

| Field | Purpose | Examples |
|-------|---------|----------|
| inhabitants | Who populates the world | `scholars, explorers, scientists from across the galaxy` |

### Social

| Field | Purpose | Examples |
|-------|---------|----------|
| disposition | Default stance of inhabitants toward strangers | `hospitable — warmth, curiosity, welcome`, `guarded — suspicion, caution, earned trust`, `indifferent — preoccupied, distracted, neutral` |

**Disposition shapes how unnamed characters and first encounters default.** Major characters can deviate, but the baseline should be intentional:

- **hospitable:** Strangers are welcomed. People lean in when someone shares. Help is offered before asked.
- **guarded:** Strangers are assessed. Trust is earned. Questions are deflected until intentions are clear.
- **indifferent:** Strangers are tolerated. People are busy with their own concerns. Neither warm nor cold.
- **hostile:** Strangers are threats. Suspicion is the default. Safety comes first.

This is not a constraint on individual characters — it's the world's texture. A hospitable world can have a guarded character; their guardedness becomes notable. A hostile world can have a warm character; their warmth becomes precious.

### Supernatural

| Field | Purpose | Examples |
|-------|---------|----------|
| magic | How magic looks (not what it does) | `soft glows from hands, floating motes` or `none — hard science fiction` |

---

## All Fields Required

Every field must have a value. Use `none` for absent elements:

```yaml
flora: none — sterile orbital station
fauna: none — lifeless world
magic: none — hard science fiction
```

This removes ambiguity. Missing field = validation error, not "probably absent."

---

## Positive Descriptions Only

Image models ignore negative instructions. They cannot process "no propellers" or "don't include aircraft."

**Wrong:**
```yaml
transport: no conventional aircraft, avoid propellers
```

**Right:**
```yaml
transport: spacecraft with swept wings and heat-scarred hulls, orbital shuttles
```

Describe what SHOULD appear, not what shouldn't.

---

## When Foundation is Created

The foundation is populated during **first chapter creation**:

1. User provides theme prose
2. Prep agent proposes foundation fields based on theme
3. User reviews, adjusts, confirms
4. Foundation written to world-seed.md frontmatter
5. Chapter creation proceeds

After first chapter, the foundation travels with the chronicle. It's read by the backend during image generation.

---

## How the Backend Uses It

```
world-seed.md (with frontmatter)
    ↓
Backend parses frontmatter → SettingFoundation
    ↓
AI distillation uses foundation fields
    ↓
DistilledTheme (cached in manifest)
    ↓
Image prompts built with explicit genre/technology/transport vocabulary
```

The foundation ensures every image generation starts with the same structured facts about the world.
