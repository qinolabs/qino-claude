# Visual Style

The Visual Style configuration captures your aesthetic vision for image generation. It lives in `chronicle/visual-style.md` as a hybrid of structured frontmatter and prose sections.

---

## Why This Matters

Without explicit visual direction:
- Genre defaults may not match your vision
- AI distillation guesses at aesthetic approach
- Images lack consistent artistic direction

With visual-style.md:
- You control the rendering approach
- Your references anchor the aesthetic
- Consistent style across all chapters

---

## File Format

```markdown
---
style: cinematic-concept-art
fidelity: high-detail
palette: warm-cold contrast
---

# Visual Direction

[Your prose description of the visual approach.
This goes directly into image prompts.]

## References
- Blade Runner 2049 (lighting, scale)
- Caspar David Friedrich (composition)
- [More references...]

## Avoid
- Photorealistic rendering
- Oversaturated colors
- [More items...]
```

---

## Frontmatter Fields

### style (required)

The primary rendering approach.

| Value | Description | Best For |
|-------|-------------|----------|
| `cinematic-concept-art` | Film-like production value, atmospheric depth | Sci-fi, epic fantasy, dramatic settings |
| `illustrated` | Hand-crafted quality, book illustration feel | Traditional fantasy, storybook worlds |
| `painterly` | Rich brushwork, visible texture | Artistic chronicles, fine art quality |
| `atmospheric` | Mood over detail, evocative | Mysterious settings, emotional scenes |
| `stylized` | Distinctive visual approach | Unique aesthetics, animated feel |

**Default if omitted:** Falls back to genre-based selection.

### fidelity (required)

How much detail rewards close attention.

| Value | Description | Best For |
|-------|-------------|----------|
| `high-detail` | Rich textures, intricate elements, layered depth | Crafted objects, architecture, technology |
| `balanced` | Detail where it matters, atmosphere elsewhere | Most chronicles |
| `stylized` | Forms over strict realism | Mythic, dreamlike quality |
| `impressionistic` | Mood over precision | Memory, emotion, suggestion |

### palette (optional)

Color philosophy or approach.

Examples:
- `warm-cold contrast` — interiors warm, exteriors cold
- `muted earth tones` — subdued natural palette
- `high contrast` — deep shadows, bright highlights
- `monochromatic tendency` — one color family dominates

---

## Prose Sections

### Visual Direction

Free-form prose describing your aesthetic vision. This text goes directly into image prompts, so write what you'd tell an artist.

**Good example:**
```markdown
# Visual Direction

Floodlit interiors against infinite dark exteriors. Wonder earned
through patience, not spectacle. Textures are weathered, lived-in —
nothing pristine. Light comes from practical sources: fires, lamps,
the glow of instruments. Scale suggests vastness without overwhelming
the human figures.
```

**Avoid:**
- Technical jargon the AI won't understand
- Negative instructions ("no bright colors")
- References to specific copyrighted characters

### References

List of films, artists, games, or other works that capture aspects of your vision.

Format: `Name (what aspect)`

```markdown
## References
- Blade Runner 2049 (lighting, scale, contemplative pacing)
- Caspar David Friedrich (figures dwarfed by landscape)
- Arrival (architectural awe, muted palette)
- Studio Ghibli (environmental detail, lived-in spaces)
```

References help anchor the aesthetic without copying — they're context for the AI, not templates.

### Avoid

Things that should NOT appear in images. Internally converted to positive guidance.

```markdown
## Avoid
- Photorealistic rendering
- Oversaturated colors
- Clean, sterile surfaces
- Generic fantasy tropes
- Anachronistic technology
```

---

## How the Backend Uses It

```
chronicle/visual-style.md
    ↓
GitHub workflow includes in publish payload
    ↓
Backend stores in R2 at {repoName}/visual-style.md
    ↓
Image generator reads visual-style.md
    ↓
Constructs visualLanguage from:
  • style description
  • fidelity description
  • palette (if set)
  • direction prose
    ↓
Used in all image prompts for this chronicle
```

**Priority:**
1. If visual-style.md exists → use it
2. If not → fall back to AI distillation from world-seed.md

---

## Relationship to Setting Foundation

Setting Foundation (world-seed.md frontmatter) defines **WHAT** the world contains:
- Genre, geography, architecture
- Technology, transport, flora/fauna
- Who inhabits it

Visual Style (visual-style.md) defines **HOW** to render it:
- Cinematic vs illustrated
- High-detail vs impressionistic
- Specific artistic references

Both work together. Setting Foundation prevents wrong content (no aircraft in space). Visual Style ensures consistent aesthetic.

---

## When to Create

Create visual-style.md:
- After first chapter (when you've seen the default images)
- When images don't match your vision
- When starting a chronicle with clear aesthetic goals

Use `/qino-scribe:visual-style` to create interactively.

---

## Examples

### Science Fiction Chronicle

```yaml
---
style: cinematic-concept-art
fidelity: high-detail
palette: warm-cold contrast
---
```

```markdown
# Visual Direction

Vast scales rendered intimate. Technology as sculpture —
functional beauty with weathered edges. Light as character:
warm interiors cocooned against cosmic cold. Contemplative
pacing in every frame. Wonder earned, not given.

## References
- Blade Runner 2049 (lighting, atmosphere)
- Arrival (architectural scale)
- Interstellar (cosmic loneliness)

## Avoid
- Clean, sterile surfaces
- Generic sci-fi chrome
- Busy, cluttered compositions
```

### Fantasy Chronicle

```yaml
---
style: illustrated
fidelity: balanced
palette: muted earth tones
---
```

```markdown
# Visual Direction

Book illustration quality — something you'd find in a
treasured volume. Textures invite touch: worn leather,
rough stone, soft cloth. Light from practical sources:
candles, hearths, windows. Intimacy over spectacle.
Lived-in, not pristine.

## References
- Alan Lee (Tolkien illustrations)
- Studio Ghibli (environmental detail)
- Dutch Golden Age interiors (light quality)

## Avoid
- Epic battle scenes
- Glowing magic effects
- Oversaturated fantasy colors
```

---

## Updating

To change visual style later:

```
/qino-scribe:visual-style update
```

This preserves what's working while changing specific elements.

**Note:** Existing images won't automatically regenerate. Use force-regenerate on the publish workflow to update images with new style.
