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

The chapter's closing, before World Tokens. See `soul.md` → "Presence Through Aftermath" for the principle.

### Format

- **Third person** — the wanderer is witnessed, not confessing
- **A simple action** — sitting, walking back, standing at a threshold
- **Varying** — shaped by where the chapter left them, not by template

### Belongs

- Details that surface now — things that couldn't be noticed during story motion
- Casual questions that open possibility — small uncertainties unresolved
- Environment as presence — felt in passing, not rendered
- Places seen differently — same location, now empty or inhabited by someone else

### Doesn't Belong

- Processing what happened
- Naming what was learned
- Description for its own sake
- Conclusions or meanings

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

## Arc Shapes

When an arc begins, sense its shape. These are verbs, not categories.

### Something hidden

*Will reveal or deepen.*

Could be: a secret kept, a place avoided, an object never shown, a history the records omit, a feeling neither names, a memory that surfaces only in gesture. Could be held by one person or forgotten by everyone.

### Something in motion

*Will arrive, or transform the path.*

Could be: a message sent, a person traveling elsewhere, a season turning, a rumor spreading, a ship expected, a change moving through the world that hasn't reached here yet.

### Something building

*Will break or be built.*

Could be: tension between people, pressure on a structure, a pattern accumulating, trust slowly forming, resentment collecting, something being made that isn't finished yet.

### Something between people

*Will deepen or rupture.*

Could be: attraction unspoken, debt unpaid, recognition neither has risked, old wound reopened, loyalty untested, the question of what they are to each other.

### Something calling outward

*Will be undertaken, reached, or release the call.*

Could be: a glimpse that needs following, a place that needs reaching, something needed from elsewhere, a promise to keep, a companion's purpose shared, an unknown that pulls.

Journeys (this shape) often hold other shapes within them. A journey might reveal something hidden, or cause something between people to deepen.

---

**The shapes manifest through the theme.** Sense what each means in this world. What counts as "hidden" in a harbor town differs from what's hidden in a space station or a mythic underworld. The grammar is portable; the instances are yours to find.

### Arc Field Guidance

**Scale thresholds:**
- Quick = 1-2 chapters
- Has weight = 3-5 chapters
- Long = 6+ chapters

**Moves toward:** Update when the direction shifts, not every chapter. This is a compass, not a countdown.

**What it yielded (journal):** Name 1-3 concrete outcomes — what the world now has, knows, or lost.

---

## Chronicle Directory Structure

```
chronicle/
├── manifest.json      # Chronicle state and chapter index
├── theme.md           # The world's seed (required)
├── world.md           # Living world-state
├── journal.md         # Completed arcs (created when first arc completes)
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
    "id": "chapter-003",
    "written": "2025-12-07T18:00:00Z",
    "git_ref": "abc1234"
  },
  "chapters": [
    {
      "slug": "001-first-light",
      "title": "First Light",
      "written": "2025-11-30T10:00:00Z"
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

*What's building. What's calling.*

### [Pressure Name]
[What's happening, who's involved, what's at stake]

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
*Shape:* [hidden / motion / building / between / calling outward]
*Scale:* [quick / has weight / long]
*Holds:* [the question this arc is exploring]
*Moves toward:* [what might resolve it — direction, not script]

[Current state — what's happening now]

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

---

## journal.md Structure

The journal holds completed arcs — memory of what the chronicle has lived through. Created when the first arc completes.

```markdown
# Journal

*Memory of completed significance.*

---

## [Arc Name]

*Shape:* [which of the five]
*Chapters:* [which chapters it spanned]
*Resolved:* [how it ended — one line]

**What it yielded:**
[What the world now has, knows, or lost]

**What changed between people:**
[Relational shifts that persist]
```

Journeys naturally have more to say: companions who traveled, the route taken, what was discovered. This emerges from the shape, not a separate template.

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
