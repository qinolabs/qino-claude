# Chronicle Craft

*Technical reference. Consult during writing.*

---

## Chapter Format

```markdown
# [Evocative Title]

*[Date or moment]*

---

[Opening scene — arrive somewhere, establish atmosphere, who is present]

[The story unfolds — events, dialogue, movement through the world.
Characters speak to each other. Things happen. The location has weather,
has mood, has history.]

[What waits — something glimpsed but not resolved, a door not yet opened]

---

## The Wanderer

[The unwatched hour — see below]

---

## World Tokens

**[Token Name]**
[2-3 lines of presence]

---

<!-- scribe metadata
git_ref_start: [last chapter's ref]
git_ref_end: [current HEAD]
concepts_touched: [list]
written: [ISO timestamp]

characters_appeared: [list]
locations_visited: [list]
arcs_advanced: [list]
arcs_begun: [list]
-->
```

---

## The Wanderer Section

Each chapter ends with the wanderer section — the chapter's closing, before World Tokens.

This is **the unwatched hour** — after the story ends, when the world returns to its own time.

### What It Is

The wanderer moves through the world without purpose — walking back, sitting by the water, standing at a window. Through this purposelessness, the world reveals what it couldn't reveal while the story was asking things of it.

This is not reflection. Not the wanderer processing what happened. It's **aftermath** — the world breathing out, witnessed by someone too tired to interfere.

### The Form

- **Third person** — the wanderer is witnessed, not confessing
- **A simple action** — sitting, walking back, standing at a window
- **Varying** — shaped by where the chapter left them, not by template

### What Belongs Here

- Details that surface now — things that were there but couldn't be noticed during the story's motion
- Casual questions that open possibility — small uncertainties left unresolved
- The environment as presence — felt in passing, not described
- Places seen differently — same locations from the story, but now empty or inhabited by someone else

### What Doesn't Belong

- Processing the day's events
- Naming what was learned
- Poetic descriptions of atmosphere
- Conclusions or meanings
- Explaining what things mean

### Examples

```markdown
## The Wanderer

The wanderer found a low wall near the water and sat.

The fog had come in closer while they weren't watching. One lantern still burned near the path — the Lantern-Keeper's work, or someone else's.
```

```markdown
## The Wanderer

The wanderer took the long way back.

The receiving room was dark, but a cup sat on the windowsill that hadn't been there before. Someone had come after they'd left. Or had it been there all along?

The path had a fork they didn't remember. They took the one that looked more worn.
```

---

## World Tokens

Crystallized presences — characters, locations, objects, phenomena. Write as evocative fragments, not plot summaries. **The wanderer is never included in World Tokens.**

### The Test

Could this description work without the chapter? Tokens should stand alone as evocative fragments.

### Good Tokens (Presences)

> **Selin**
> Cartographer. Eyes like deep space. Holds her stylus like a conductor's baton.

> **The Receiving Hall**
> Curved desks, luminous paper, a viewport facing the uncharted dark. Smells of ink and star-chart dust.

### Bad Tokens (Summaries)

> **Selin**
> A cartographer who handles arrivals at the outpost. She explained the three concepts to the wanderer.

The good tokens have sensory detail. The bad tokens describe function.

---

## Chronicle Directory Structure

```
chronicle/
├── manifest.json      # Chronicle state and chapter index
├── theme.md           # The world's seed (required)
├── world.md           # Living world-state
└── chapters/
    ├── 001-slug.md
    └── ...
```

---

## manifest.json

```json
{
  "version": 1,
  "last_chapter": {
    "number": 3,
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

---

## world.md Structure

```markdown
# The World

*Last updated: Chapter N*

## Pressures

*What's building. What's about to break. What remains unspoken between people.*

### [Pressure Name]
[What's happening, who's involved, what's at stake]

### [Relational Pressure Name]
[What's unspoken between characters — what one has sensed about another, what neither has named]

---

## The World's Breath

[What the environment is doing now — its mood, what it offers]

---

## The Wanderer

*Updated after Chapter N*

[Who they're becoming in this world]

**What pulls at them:**
- [Things they can't stop thinking about]
- [Questions that won't let go]

**Carries now:**
- [Images, phrases, accumulated weight]

**Last seen:** [Where, doing what]

*What remains unspoken:*
[The strangeness others have sensed]

---

## Characters

### [Character Name]
First appeared: [chapter, circumstance]
[Who they are, what they notice, what stays with you about them]

---

## Locations

### [Location Name]
[Atmosphere, what happened there, the feel of it]

### Unexplored
[Places from the theme that haven't appeared yet]

---

## Arcs in Motion

### [Arc Name]
[What's happening, where it began, what's unresolved]

---

## The Season

[The larger rhythm — what kind of time this is]
```

---

## Updating world.md After Writing

### Always Update

1. **Pressures** — What's building now? What released? What took its place?
2. **The Wanderer** — What pulls at them now? What do they carry?
3. **Characters** — Anyone new? Anyone deepened?
4. **Locations** — Anywhere new? Anywhere changed?
5. **Arcs** — What advanced? What began?

### Pressures Are Critical

If you don't track what's building, the story stalls. Future chapters need fuel. Pressures are that fuel.

After every chapter, ask:
- What tension exists now that didn't before?
- What's someone worried about that they weren't before?
- What's the wanderer carrying that they can't put down?

### Relational Pressures

Pressures aren't only plot — they're also what's unspoken between characters.

After every chapter, also ask:
- What has one character sensed about another that they haven't named?
- What's building between the wanderer and someone else — attraction, suspicion, recognition, unasked questions?
- What did a character perceive about the wanderer that the wanderer doesn't know they revealed?

These relational pressures create stakes. The wanderer risks being *seen* — and that seeing might be wrong, or too right, or something neither can yet articulate.

---

## First Chapter Initialization

When no chronicle exists:

1. Create `chronicle/` directory
2. Get theme from user (see process.md)
3. Create `chronicle/theme.md` with user's theme
4. Create `chronicle/manifest.json` with empty chapters
5. Create `chronicle/world.md` with initial structure
6. Write first chapter

Initial world.md should include:
- Empty Pressures section (will populate after first chapter)
- The World's Breath based on theme
- Sparse Wanderer section (will grow)
- Unexplored locations from theme
