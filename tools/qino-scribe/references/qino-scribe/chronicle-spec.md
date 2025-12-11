# qino Scribe — Chronicle Specification

*Defines the canonical structure and semantics of the chronicle directory.*

---

## 1. Purpose

The chronicle is a **narrative record** of ecosystem evolution. It captures not just what changed, but what it meant — told from the ecosystem's perspective.

It serves:
- **Future self**: "What was alive when this idea emerged?"
- **Collaborators**: "Here's the journey so far"
- **The record**: Some evolutions deserve to be witnessed

The chronicle is a public artifact. It's meant to be shared and read.

---

## 2. Directory Structure

```
chronicle/
├── manifest.json              # Chronicle state and chapter index
├── theme.md                   # The world's seed (required)
├── world.md                   # Living world-state (characters, locations, arcs)
├── chapters/
│   ├── 001-first-light.md     # Chapter files
│   ├── 002-threads-converge.md
│   └── ...
└── voice.md                   # Optional: calibrated voice
```

The chronicle directory lives at the workspace root, alongside `concepts/` and `ecosystem/`.

---

## 2.1 theme.md — The World's Seed

The theme defines what kind of world this chronicle inhabits. It's set once, before the first chapter, and shapes everything that follows.

```markdown
# Theme

Coastal trading post, age of sail.
```

One line. Maybe two if texture was given. The theme is a seed, not a blueprint — the world emerges through chapters, not from prescription.

See `theme-guide.md` for how themes are chosen and how they shape the scribe's voice.

---

## 3. manifest.json Structure

```json
{
  "version": 1,
  "last_chapter": {
    "id": "chapter-003",
    "written": "2025-12-07T18:00:00Z",
    "git_ref": "abc1234"
  },
  "chapters": [
    {
      "number": 1,
      "slug": "first-light",
      "title": "First Light",
      "written": "2025-11-30T10:00:00Z",
      "path": "chapters/001-first-light.md"
    }
  ]
}
```

### 3.1 version
- Type: integer
- Required: yes
- Current value: 1

### 3.2 last_chapter
- Type: object
- Required: yes (after first chapter)

Fields:
- `id`: Chapter identifier (e.g., "chapter-003")
- `written`: ISO-8601 timestamp when chapter was written
- `git_ref`: Git commit hash at time of writing

This enables the scribe to know where to start observing for the next chapter.

### 3.3 chapters
- Type: array of objects
- Required: yes

Each entry describes one chapter in the chronicle.

---

## 4. Chapter Entry Specification

```json
{
  "number": 1,
  "slug": "first-light",
  "title": "First Light",
  "written": "2025-11-30T10:00:00Z",
  "path": "chapters/001-first-light.md"
}
```

| Field | Type | Description |
|-------|------|-------------|
| number | integer | Sequential from 1, used for ordering and file naming |
| slug | string | Lowercase, hyphen-separated, derived from title |
| title | string | Evocative narrative title |
| written | string | ISO-8601 timestamp |
| path | string | Relative path from chronicle/ to chapter file |

---

## 5. world.md — The Living World

The chronicle is a story world that emerges from ecosystem evolution. `world.md` tracks the living world-state, updated after each chapter.

**The scribe reads this first** to know where the story is before writing new chapters.

```markdown
# The World

*Last updated: Chapter 3*

## The World's Breath

The harbor is quiet today. Low tide. The kind of stillness where you can hear the dock wood settling.

Fog sits heavy at the boundary — not threatening, just present. Waiting to see what arrives.

---

## The Wanderer

*Updated after Chapter 3*

Arrived by unnamed ship, three months of drift behind them. Something about how they hold documents — reaching before deciding, then pulling back. Selin noticed. Now there's a question between them neither has asked.

Learning the guild's rhythm: first listening, not first contact. The phrase stays with them.

**Carries now:**
- The image of translucent paper, writing they couldn't read
- The question of the third stack
- A growing comfort with the dark at the viewport
- The keeper's kindness, and the grief already forming underneath

**Last seen:** Quarters above the receiving room. Couldn't sleep. Watching the mountain peaks.

*What remains unspoken:*
They walked through the fog as if they'd walked through stranger. The keeper noticed but said nothing. Selin watches them sometimes when she thinks they don't see.

---

## Characters

### The Lantern-Keeper
First appeared at the pier's end (ch. 1). Tends flames that don't need tending — hands busy while the mind waits.
Eyes like someone who's spent years watching horizons. Not searching. Just watching.
*What stays with you*: the way she said "good" when the wanderer expected nothing

### The Seven Voices
First heard from the third ship (ch. 1). Three days arguing on deck when the wanderer arrived.
Not fighting — finding. One voice claims, another pushes back, a third reframes the whole question.
*What stays with you*: that single bright laugh that carried further than it should have

---

## Locations

### The Harbor
New-built, wood still pale from recent cutting. Ropes not yet salt-stiffened.
Three ships docked when the wanderer arrived. More shapes on the horizon.
*The feel of it*: a place becoming what it will be

### The Pier
Where the Lantern-Keeper waits. Wood that gives slightly underfoot, still learning how to hold weight.
Visited: ch. 1

### The Room Above the Lantern Station
Small, clean, a window facing the water. The bed had been slept in before, but not recently.
A chipped cup on the windowsill — left by whoever stayed here last.
Visited: ch. 1

---

## Tensions

None yet named. The harbor is too new for friction.

But: the heavy ship sits low with its papers and purpose. The quiet vessel keeps its lantern burning in daylight. The seven voices have been arguing for three days. These are different ways of being in the world. How they relate to each other — that hasn't been tested yet.

---

## Arcs in Motion

### The harbor's becoming
"This place is going to be something. I don't know what yet."
The Lantern-Keeper feels it in how the wind's been shifting. More shapes on the horizon.
Began ch. 1. Just starting.

### The wanderer's hands
They reached toward papers before catching themselves. Old habit. Some part of them has worked with documents before, in a place that has no name here.
Began ch. 1. Unresolved.

---

## The Season

Late summer, the year the harbor opened. Everything still becoming what it will be.
Fog at the edges. Shapes that might be sails, might be clouds that want to be.
```

**Key principles:**
- **The world's breath** — what the environment is doing now, its mood, what it offers
- **The wanderer** — tracked separately, the continuous thread across chapters
- **Characters and locations** emerge from what actually happens — no predetermined cast
- **What stays with you** — not what characters "notice" (too clinical), but what lingers: a gesture, a phrase, the way someone held something
- **Tensions** — between characters, between places, between what is and what wants to be
- **Arcs** track journeys and unresolved questions, not tasks
- **The season** captures the larger rhythm — what kind of time this is

These aren't categories to fill — they're containers that hold whatever wants to be held. The entries should sound like someone's memory of a place, not a character database.

---

### 5.1 The Wanderer Section

The wanderer is tracked separately from other characters. They are the continuous thread; others come and go.

The wanderer section includes:

| Element | Purpose |
|---------|---------|
| **What's emerged** | Habits, reactions, specific ways of being that have developed in this world |
| **Carries now** | Images, phrases, questions accumulated across chapters |
| **Last seen** | Where they were, how they left it — continuity for next chapter |
| **What remains unspoken** | The aura. What characters have sensed but not named. The strangeness. |

**Key principles:**

- **Character emerges** — the wanderer's personality isn't prescribed, it develops through chapters. This section tracks that emergence.
- **The strangeness** — "What remains unspoken" holds moments where characters sensed something about the wanderer they couldn't name. This accumulates across chapters, building the aura without explaining it.
- **Updated after each chapter** — like other sections, this is living documentation.

**First chapter initialization:**

When creating `world.md` for the first chapter, the wanderer section begins sparse:

```markdown
## The Wanderer

*Updated after Chapter 1*

Arrived [how they arrived, shaped by theme].

**Carries now:**
- [First impressions, first images]

**Last seen:** [Where the chapter left them]
```

The section grows as the chronicle grows. By chapter ten, it should feel like knowing someone.

---

## 6. voice.md (Optional)

If the wanderer has calibrated the scribe's voice, it's captured here:

```markdown
# Scribe Voice

*Calibrated 2025-12-07*

The scribe speaks with:
- [quality 1]
- [quality 2]
- [quality 3]

Example:
> [passage that captures the calibrated voice]
```

When present, the scribe reads this before writing chapters.

---

## 7. Lifecycle

### 7.1 Initialization

When first chapter is requested and no chronicle exists:
1. Create `chronicle/` directory
2. Create `chronicle/manifest.json` with empty state
3. Create `chronicle/chapters/` directory
4. Create `chronicle/world.md` with initial structure (including empty wanderer section)
5. Write first chapter (including wanderer section)
6. Update `world.md` with wanderer emergence, characters, locations, arcs from first chapter

### 7.2 Adding Chapters

When a new chapter is written:
1. Read `world.md` to know the wanderer's state, established characters, locations, arcs
2. Read last 1-2 chapters for voice continuity
3. Observe ecosystem changes (git, manifest, concepts)
4. Propose story beat — who appears, where, what happens
5. Dialogue with wanderer to refine
6. Create chapter file at `chronicle/chapters/NNN-slug.md` (including wanderer section)
7. Append to `chapters` array in manifest
8. Update `last_chapter` with new chapter info
9. Update `world.md`:
   - Update wanderer section (what emerged, what they carry, where last seen, what remains unspoken)
   - Add new characters, locations
   - Update tensions, arc progress, season shift

### 7.3 Reading Chronicle

The scribe reads to understand:
- `manifest.json`: chapter count, timing, git ref to diff from
- `world.md`: the wanderer's state, the living world-state (characters, locations, arcs, season)
- Recent chapters: voice continuity, recent events, and recent wanderer reflections
