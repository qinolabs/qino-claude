# Chronicle Craft

*Technical reference. Consult during writing.*

---

## How to Use This Document

Examples are marked with `<example>` tags. These illustrate formats and principles — they are not templates to copy. When you see an example, absorb what makes it work, then create your own variation.

**If you find yourself writing words from an example verbatim, pause and diverge.**

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
git_ref_start: [previous chapter's git_ref_end, or null]
git_ref_end: [HEAD at time of writing]
concepts_touched: [list]
written: [ISO timestamp]

characters_appeared: [list]
locations_visited: [list]
arcs_advanced: [list]
arcs_begun: [list]
-->
```

---

## Chapter Length

**Target: 1,200–1,600 words** of narrative content (excluding World Tokens and metadata).

### Why This Range

- **Episodic rhythm**: Each chapter should feel complete in one sitting — long enough for atmosphere and stakes, short enough to finish on a commute or break.
- **New IP needs consistency**: Readers discovering an unfamiliar world need predictable commitment. Wide variance (900 words one chapter, 1,800 the next) erodes trust.
- **The prose style reads slow**: Contemplative, atmospheric writing takes longer to absorb than action. Shorter chapters respect that pace.

### What Counts

- **Narrative**: Opening through the Wanderer section — the story itself.
- **World Tokens**: Don't count toward the budget. These are reference material, not reading time.
- **Metadata**: Doesn't count.

### When to Check

Glance at length after drafting, before the editorial pass. If you're significantly over (1,800+), ask:
- Is there a scene that could be its own chapter?
- Are characters explaining what the story already showed?
- Is atmosphere doing work, or just existing?

If you're significantly under (1,000-), ask:
- Does this chapter have stakes, or just motion?
- Is something being rushed that deserves breath?

This is guidance, not a cap. A chapter that needs 1,700 words to land should take them. But consistent drift upward suggests the scribe is elaborating rather than discovering.

---

## The Wanderer Section

The chapter's closing, before World Tokens. The wanderer in aftermath — not reflecting, just present.

### Format

- **Third person** — the wanderer is witnessed, not confessing
- **A simple action** — but NOT the same action each chapter
- **Varying** — the closing must differ chapter to chapter. Check what the last chapter did and diverge.

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

### Vary the Closing

If the last chapter closed with the wanderer sitting alone, this one should close differently. Options include:

- **In motion:** walking somewhere, hands occupied with a task
- **In company:** still with someone, not speaking
- **At work:** doing something — mending, sorting, holding something for someone
- **Standing/watching:** at a window, at a threshold, at an edge
- **Being sought:** someone comes to find them

The examples below illustrate different closings. **Do not copy these verbatim** — absorb the principle (aftermath, not reflection; varying action) and create your own.

### Examples — showing variety

<example>
```markdown
## The Wanderer

The wanderer walked the long way back, hands in pockets.

The path had a fork they didn't remember. They took the one that looked more worn. Somewhere behind them, a door closed.
```
</example>

<example>
```markdown
## The Wanderer

The wanderer was still holding the rope when Selin found them.

"You can let go now." Selin was already reaching for the coil, making space.

They looked at their hands. The rope had left marks.
```
</example>

<example>
```markdown
## The Wanderer

The wanderer stood at the window they'd been given.

Down by the water, figures moved between lanterns. Too far to tell who. The glass was cold where their forehead touched it.
```
</example>

<example>
```markdown
## The Wanderer

The wanderer helped carry the last crate inside.

When the others went to eat, they stayed in the storeroom a moment longer. The smell of salt and cedar. Someone had written a name on one of the crates, then crossed it out.
```
</example>

---

## World Tokens

Crystallized presences — characters, locations, objects, phenomena. Write as evocative fragments, not plot summaries. **The wanderer is never included in World Tokens.**

### The Test

Could this description work without the chapter? Tokens should stand alone as evocative fragments.

### Good Tokens — presences with sensory detail

<example>
> **Selin**
> Cartographer. Eyes like deep space. Holds her stylus like a conductor's baton.
</example>

<example>
> **The Receiving Hall**
> Curved desks, luminous paper, a viewport facing the uncharted dark. Smells of ink and star-chart dust.
</example>

### Bad Tokens — summaries that describe function

<example>
> **Selin**
> A cartographer who handles arrivals at the outpost. She explained the three concepts to the wanderer.
</example>

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
├── world.md           # Living world-state (characters, locations, pressures)
├── arcs.md            # All arcs (in motion + completed) with chapter ranges
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
      "written": "2025-11-30T10:00:00Z",
      "git_ref_start": null,
      "git_ref_end": "abc1234"
    },
    {
      "slug": "002-the-weight-of-names",
      "title": "The Weight of Names",
      "written": "2025-12-05T14:00:00Z",
      "git_ref_start": "abc1234",
      "git_ref_end": "def5678"
    }
  ]
}
```

**Git ref fields:**
- `git_ref_start`: Last commit of previous chapter — **exclusive** (not included in this chapter's range). Null for first chapter.
- `git_ref_end`: Last commit covered by this chapter — **inclusive**.

**Constructing ranges:**
- Git command: `git diff git_ref_start..git_ref_end` (two dots)
- GitHub URL: `github.com/org/repo/compare/git_ref_start..git_ref_end`
- First chapter: Use repo's initial commit as start, or link to `git_ref_end` directly

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

(Arcs are tracked separately in arcs.md — see below.)

### Pressures Are Critical

If you don't track what's building, the story stalls. Future chapters need fuel. Pressures are that fuel.

After every chapter, ask:
- What tension exists now that didn't before?
- What's someone worried about that they weren't before?
- What's the wanderer carrying that they can't put down?

---

## arcs.md Structure

The arcs file tracks all narrative arcs — both in motion and completed — with chapter ranges for temporal display.

```markdown
# Arcs

*Narrative threads — in motion and complete.*

---

## [Arc Name]

*Shape:* [hidden / motion / building / between / calling outward]
*Chapters:* [start]-[end] or [start]- (ongoing)

**In motion:**
*Holds:* [the question this arc is exploring]
*Moves toward:* [what might resolve it — direction, not script]

**Completed:**
*Resolved:* [how it ended — one line]
*Yielded:*
- [What the world now has, knows, or lost]
*Changed between people:*
- [Relational shifts that persist]
```

### Chapter Range Syntax

- `*Chapters:* 2-5` — Arc completed (chapters 2 through 5)
- `*Chapters:* 6-` — Arc in motion (started chapter 6, ongoing)

### Arc Sections

**All arcs have:**
- Shape and chapter range
- **In motion** section with *Holds* and *Moves toward*

**Completed arcs also have:**
- **Completed** section with *Resolved*, *Yielded*, *Changed between people*

When an arc completes:
1. Change `X-` to `X-Y` where Y is the ending chapter
2. Add the **Completed** section
3. Keep the **In motion** section as historical context

---

## First Chapter Initialization

When no chronicle exists:

1. Create `chronicle/` directory
2. Get theme from user (see process.md)
3. Create `chronicle/theme.md` with user's theme
4. Create `chronicle/manifest.json` with empty chapters
5. Create `chronicle/world.md` with initial structure
6. Create `chronicle/arcs.md` with initial structure
7. Write first chapter

Initial world.md should include:
- Empty Pressures section (will populate after first chapter)
- The World's Breath based on theme
- Sparse Wanderer section (will grow)
- Unexplored locations from theme

Initial arcs.md should include:
- Title and description line
- Empty (arcs begin when the story creates them)
