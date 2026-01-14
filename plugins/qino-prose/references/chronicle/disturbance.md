# Reading the Disturbance

*How git diffs become world behavior.*

---

## The Interpretation

The diff doesn't become story content. It becomes **world behavior** — how the world acts today, what it does differently, what's happening in the background of the story. Characters experience this as natural. The reader who knows the source perceives the rhyme.

```
Diff
  ↓
Shape + Texture (observed)
  ↓
World Behavior (what the world does)
  ↓
Characters live in it; Reader perceives pattern
```

This is interpretation, not translation. Translation is mechanical mapping. Interpretation finds what *rhymes* — what carries the same quality in this world's specific vocabulary.

The generative question is not "What weather matches this shape?" but **"What would the world DO if it felt this way?"**

---

## Two Passes

### Pass 1: Stats (Structural Shape)

```bash
git diff --stat [range]
git log --oneline [range]
```

Observe without reading code:

| Signal | What it shows |
|--------|---------------|
| **Density** | Few files (concentrated) vs many (diffuse) |
| **Flow** | Net insertions (growth) vs deletions (release) |
| **Location** | Core files vs edges, logic vs config |
| **New/Existing** | Files appearing, disappearing, or only modified |
| **Rhythm** | Many small commits (incremental) vs few large (punctuated) |

### Pass 2: Messages (Texture + Keywords)

Read commit messages with project understanding. Extract:

**Texture** — the quality of the gesture (freely inferred, no fixed list):
- clarifying, tentative, completing, discovering, releasing, preparing...

**Keywords** — concrete nouns and domain terms:
- Functional: point to domain (parser, config, auth, navigation)
- Resonant: carry metaphorical weight (chronicle, memory, threshold, seed, mirror)

---

## Shape + Texture

The abstract shapes remain. Texture qualifies them.

| Shape | The movement |
|-------|--------------|
| **Appearance** | Something exists that didn't |
| **Disappearance** | Something no longer exists |
| **Transformation** | Something became other than it was |
| **Connection** | Separate things now touch |
| **Separation** | Joined things now apart |
| **Accumulation** | More of what was building |
| **Release** | What was held is now free |

Texture makes the shape specific:
- "Transformation — clarifying at the core"
- "Appearance — tentative, at the edges"
- "Release — after long pressure"

---

## Keywords

**Functional keywords** point to domain — help locate where in story-world the conditions manifest, which characters might be sensitive.

**Resonant keywords** carry metaphorical weight — their quality can inform the texture of world conditions without the word itself appearing.

| Resonant keyword | Quality it carries |
|------------------|-------------------|
| chronicle, scribe, record | Being observed, mattering enough to hold |
| memory, cache | Persistence, what refuses to leave |
| threshold, gate | Boundaries, who may pass |
| seed, initial | Beginning, not yet what it will become |
| mirror, reflect | Self-seeing, recursion |
| bridge, connect | Spanning, things finding each other |

The word never travels. Its essence might.

---

## Domains of World Behavior

The world is not just weather. Every domain can express a quality:

| Domain | What it includes |
|--------|------------------|
| **Material** | How substances respond — wood swells, metal sings, water refuses to settle, ink runs |
| **Spatial** | How distances feel — sounds carry, the far shore visible, a door you've never noticed |
| **Temporal** | How time moves — morning that won't end, night that comes early, something late |
| **Creature** | What animals do — migration starting, unusual stillness, something in the water |
| **Object** | What cooperates or resists — stuck drawer opens, rope frays, tools find hands |
| **Human background** | What unnamed people do — quiet industry, debts settled, someone cleaning who never cleans |

The diff quality leaks into how the world *behaves*, not just how it looks. Weather is one domain. There are many others.

---

## Shape + Texture → World Behavior

The question: **What would the world DO if it felt this way?**

Draw from any domain. Be specific to this world's vocabulary.

### Transformation — clarifying

| Domain | World behavior |
|--------|----------------|
| Weather | Light sharper than yesterday *(easy reach — try others first)* |
| Material | The grain in driftwood suddenly legible. Patterns in the floor you've walked over a hundred times. |
| Object | The stuck drawer opens. The tangled rope unknots under your hands. |
| Human | Quiet industry everywhere. People organizing shelves, settling accounts, finally writing the letter. |

### Appearance — tentative

| Domain | World behavior |
|--------|----------------|
| Weather | Morning mist, might burn off *(easy reach)* |
| Spatial | A path visible at low tide that wasn't there yesterday. A door in the warehouse wall you've never noticed. |
| Creature | A bird that hasn't been seen this season. Waiting on the piling. Not announcing itself. |
| Human | A stranger in town. Hasn't introduced themselves. The innkeeper doesn't know what to make of them. |

### Release — after pressure

| Domain | World behavior |
|--------|----------------|
| Weather | Rain finally falling *(easy reach)* |
| Material | The timber that's been swelling for weeks finally cracks. You hear it from across the harbor. |
| Creature | Migration beginning. The birds that were waiting have finally left. The sky feels empty. |
| Human | Conversations that were held are finally happening. Two people who haven't spoken in months, sitting together. |

### The principle

Every domain can express the quality. The agent's job is to find where it wants to leak through *in this specific world* — using the theme's vocabulary, materials, creatures, and rhythms.

Resonant keywords add texture without appearing literally:
- "chronicle" → sense of being observed, things mattering enough to hold
- "memory" → persistence, what refuses to leave, stillness
- "threshold" → boundaries felt, edges that matter

---

## What Travels Forward

The prep.md receives:

```markdown
## World Behavior
**Shape:** [Transformation — clarifying]
**The world does:** [The stuck drawer in the chart room finally opens. People settling small debts. The grain in old wood suddenly legible.]
**Points toward:** [understanding, interpretation — characters who make sense of things]
```

The prose agent weaves this into background behavior. Characters experience it as ordinary. They don't know why today feels different — but it does.

---

## The Matrix Dimension

The reader perceives what characters don't:
- World behavior rhymes with something outside
- The world responds to invisible forces
- Characters live naturally in a patterned world

This creates layers of knowing:
- **Reader**: sees the pattern clearly (knows the diff)
- **Wanderer**: senses something, can't name it (meta-perception)
- **World characters**: experience the world as ordinary

The wanderer's otherworldliness is grounded here — they have some access to the meta-layer that others don't.

---

## Process

1. **Get stats**: `git diff --stat`, observe structure
2. **Read messages**: infer texture, extract keywords
3. **Synthesize**: Shape + Texture
4. **Ask**: What would the world DO if it felt this way?
5. **Draw from domains**: Material, spatial, temporal, creature, object, human background
6. **Be specific**: Use this world's vocabulary from the theme
7. **Note pointers**: Which domain? Which characters might be sensitive?

Output options that span domains:

```
Shape: Transformation — clarifying

1 → The stuck drawer in the chart room finally opens. Old debts being settled at the trading post.
    points toward: the record-keepers, the accountants of memory

2 → The grain in driftwood suddenly legible. Patterns in stone you've walked over a hundred times.
    points toward: those who read surfaces, who notice what's always been there

3 → Sounds carrying further than usual. The far shore visible. Conversations audible across the water.
    points toward: listeners, those at edges
```

---

## The Test

**Standalone:** Someone who's never seen the source experiences a coherent, living world.

**Rhyme:** Someone who knows the source recognizes the pattern — the connection between what changed and what the world did.

Both must pass. The world is the interpretation layer.

---

## What to Filter

Not all changes carry world-energy. Filter:

**Ignore:** Version bumps, lockfiles, formatting, config tweaks
**Notice:** New files appearing, significant refactors, new connections, patterns shifting

When the diff is mostly maintenance, the world might behave ordinarily — and the chapter's energy comes from pressure alone.

---

## The Deeper Principle

The continuous substrate (what the diff touches, what shifts in the system) leaks into discrete world-experience through behavior. Characters live in the named world. But qualities seep through — in what materials do, in what creatures notice, in what objects resist or cooperate, in what unnamed people are suddenly doing.

The wanderer feels these leaks. The reader sees them clearly. The world acts in response to what it cannot know.
