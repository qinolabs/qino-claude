# Chronicle Craft

*Technical reference for chronicle structure and format.*

---

## Theme

The theme is atmosphere to inhabit, not inventory to extract.

**Form:**
- A paragraph or two. Brief enough to read once and carry.
- Prose that evokes. Implies materials and textures without listing them.
- Spacious (a realm, not a scene), tensioned (something at risk), atmospheric (feeling over features).

**What belongs elsewhere:**
- Specific locations → world.md Unexplored section
- Building layouts, system explanations → emerge through chapters
- Character roles, social structures → world.md or chapters

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

[The unwatched hour — purposeless action, not reflection]

---

## World Tokens

**[Token Name]**
[2-3 lines of presence]
```

---

## Chapter Length

**Target: 1,200–1,600 words** of narrative content (excluding World Tokens).

- **Narrative**: Opening through the Wanderer section — the story itself.
- **World Tokens**: Don't count toward the budget.

If significantly over (1,800+): Is there a scene that could be its own chapter?
If significantly under (1,000-): Does this chapter have stakes, or just motion?

---

## The Wanderer Section

Each chapter ends with the wanderer alone — after the story ends, when the world returns to its own time.

**Format:**
- Third person — the wanderer is witnessed, not confessing
- A simple action — but NOT the same action each chapter
- Continuous — must follow plausibly from where the narrative ended

**Belongs:**
- Details that surface now — things that couldn't be noticed during story motion
- Casual questions that open possibility — small uncertainties unresolved
- Environment as presence — felt in passing, not rendered

**Instead of** processing what happened:
→ Aftermath, not reflection. They walk, they hold something, they notice a detail.

**Instead of** naming what was learned:
→ Let it settle unnamed. The chapter showed it.

**Vary the closing:** If the last chapter closed with the wanderer sitting alone, this one should close differently — in motion, in company, at work, standing/watching, being sought.

---

## World Tokens

Crystallized presences — characters, locations, objects, phenomena. Write as evocative fragments, not plot summaries. The wanderer is never included in World Tokens.

**Sync to world.md:** Tokens that are characters or locations should also be added to world.md (see World Update in layers.md).

**Quality — Presence vs Function:**

Works:
> **Selin**
> Cartographer. Eyes like deep space. Holds her stylus like a conductor's baton.

Instead of summarizing what someone does:
→ Capture how they land in the senses. What would you recognize them by?

**Scale as Presence (Locations):**

When the wanderer experiences scale — arriving from a distance, being dwarfed by a space — the token should carry that.

Works:
> **The Observatory**
> A summit complex of domed buildings, visible from the shuttle's descent. Warm halls against the vast dark.

---

## Arc Shapes

When an arc begins, sense its shape:

**Something hidden** — Will reveal or deepen.
**Something in motion** — Will arrive, or transform the path.
**Something building** — Will break or be built.
**Something between people** — Will deepen or rupture.
**Something calling outward** — Will be undertaken, reached, or release the call.

### Arc Format in arcs.md

```markdown
## [Arc Name]

*Shape:* [hidden / motion / building / between / calling outward]
*Chapters:* N- (ongoing) or N-M (completed)

**In motion:**
*Holds:* [the question this arc is exploring]
*Moves toward:* [what might resolve it — direction, not script]

**Completed:** (if applicable)
*Resolved:* [how it ended — one line]
*Yielded:*
- [What the world now has, knows, or lost]
*Changed between people:*
- [Relational shifts that persist]
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

**What remains unspoken:**
[What others have sensed but not named — accumulating across chapters]

---

## Characters

### [Character Name]
First appeared: [chapter, circumstance]
[Who they are, what they notice, what stays with you about them]

*Voice:* [Speech pattern — direct/indirect, long/short, finishes thoughts/trails off]

**Has been watching:**
[What they've noticed about the wanderer or others — unspoken]

---

## Locations

### [Location Name]
First appeared: [chapter]
[Atmosphere, what happened there, the feel of it]

### Unexplored
[Places from the theme that haven't appeared yet]

---

## The Season

[The larger rhythm — what kind of time this is]
```

### Relational Fields

**`What remains unspoken`** (in Wanderer section): Tracks what others have sensed about the wanderer but not articulated. Accumulates across chapters.

**`Has been watching`** (in Character entries): Tracks what each character has noticed about the wanderer or others — perceptions they haven't spoken. This is the "World Has Been Watching" principle in action.

---

## Chronicle Directory Structure

```
chronicle/
├── manifest.json      # Chronicle state and chapter index
├── world-seed.md      # The world's seed (set once)
├── world.md           # Living world-state (current)
├── arcs.md            # All arcs (current)
└── chapters/
    └── NNN-slug/
        ├── chapter.md     # The chapter content
        ├── prep.md        # Prep artifact (for debugging)
        ├── world.md       # Snapshot at write time
        └── arcs.md        # Snapshot at write time
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
      "git_ref_end": "abc1234",
      "scribe_version": "1.0.0"
    }
  ]
}
```

**Git ref fields:**
- `git_ref_start`: Last commit of previous chapter (exclusive)
- `git_ref_end`: Last commit covered by this chapter (inclusive)

---

## First Chapter Initialization

When no chronicle exists:

1. Get theme from user
2. Create `chronicle/` directory
3. Create `chronicle/world-seed.md`
4. Create `chronicle/manifest.json` with empty chapters
5. Create `chronicle/world.md` with initial structure
6. Create `chronicle/arcs.md` with initial structure
7. Write first chapter

Initial world.md should include:
- Empty Pressures section (will populate after first chapter)
- World's Breath based on theme
- Sparse Wanderer section
- Unexplored locations from theme
