# qino Scribe — Chapter Format

*The chronicle is a story world. Chapters are episodes in an ongoing story.*

---

## 1. The Fantasy Principle

Chapters are not observation with literary flair. They are **story**:
- Evocative descriptions of environments
- Characters appearing, interacting, speaking
- Events that unfold with tension and resolution
- Dark undercurrents forming before they're revealed
- A world that accumulates and deepens

The scribe is a fantasy author with constraints. The constraints: what actually changed in the ecosystem, what was established in previous chapters. The creativity: how to weave this into story.

---

## 2. Chapter Structure

Chapters are flexible — they're stories, not templates. But they share common elements:

```markdown
# [Evocative Title]

*[Date or moment]*

---

[Opening scene — location, atmosphere, who is present]

[The story unfolds — events, dialogue, movement through the world]

[What waits — something glimpsed but not resolved, a door not yet opened]

---

## The Wanderer

[Third person, the unwatched hour — the world continuing without the story.
A simple action, details that surface, casual questions left unresolved.]

---

## World Tokens

**[Character Name]**
[2-3 lines of essence. What they carried. How they moved.]

**[Location Name]**
[As encountered. Atmosphere. What waited there.]

---

<!-- scribe metadata
git_ref_start: abc1234
git_ref_end: def5678
written: 2025-12-07T18:00:00Z

characters_appeared: [the lantern-keeper, the seven voices]
locations_visited: [the harbor, the pier]
arcs_advanced: [the harbor's becoming]
arcs_begun: [the wanderer's hands]
-->
```

---

## 3. Storytelling Elements

### Opening Scene
Arrive somewhere. Establish atmosphere. Who is here? What does the air feel like?

> *The wanderer stood at the edge of Discovery-Grid. Nodes hung in the distance like scattered stars, paths between them faintly glowing. Something had shifted since last time — new lights pulsed at the periphery.*

### Characters
Characters emerge from ecosystem events. They speak, act, feel.

> *"You've been circling this place," said a figure at the threshold — the one who always waited there, though no one knew for how long. "What are you looking for?"*
>
> *The wanderer didn't answer immediately. The question felt larger than it sounded.*

### Locations
Concepts become places. Each has atmosphere, history, weather.

> *The Weaving-Room was warm, as always. Threads hung from the ceiling — some taut with recent work, others slack, waiting. The lamp in the corner cast long shadows that moved when no one else did.*

### Dialogue
Characters talk to each other. Not concepts explaining themselves — people encountering mystery together.

> *"You're early," she said, without looking up. "Or late. Depending on what you were expecting to find."*
>
> *The wanderer stepped onto the pier. "I wasn't expecting anything."*
>
> *"Good." She finally turned. "That's the only way to arrive here."*

### Events
What happens. Arrivals, departures, discoveries, confrontations, quiet moments.

> *The path appeared where no path had been — a narrow track of beaten light connecting Discovery-Grid to something beyond the mist. The wanderer hadn't made it. It had simply become.*

### What Waits
Every chapter leaves something unresolved. A door glimpsed, a rumor, tension held.

> *In the distance, past the new path, something moved. Too far to see clearly. The wanderer noted it, stored it somewhere below thought, and turned back toward the known.*

---

## 4. Walkable Abstraction

Any element from any level of abstraction can become any story element — character, location, weather, event, object, rumor. The scribe doesn't map one-to-one. The scribe weaves.

A specific feature might become a character. An ecosystem-wide pattern might become weather that affects multiple locations. A connection between concepts might become a shared object that belongs to both places.

See `voice-guide.md` section 10 for full examples of how different ecosystem events become story.

---

## 5. Metadata Fields

Hidden at the end of each chapter for scribe continuity:

| Field | Purpose |
|-------|---------|
| git_ref_start | Where observation began |
| git_ref_end | Current HEAD when written |
| concepts_touched | Which concepts this chapter covers |
| ecosystem_notes_added | Ecosystem notes since last chapter |
| written | When chapter was written |
| characters_appeared | Who appeared in this chapter |
| locations_visited | Which locations were visited |
| arcs_advanced | Which story arcs progressed |
| arcs_begun | Which new arcs opened |

This metadata is for the scribe, not the reader. It helps update `world.md` after writing.

---

## 6. The Wanderer Section

Each chapter ends with the wanderer section — the chapter's closing. This replaces the old "closing breath" concept with something more embodied.

This is **the unwatched hour** — after the story ends, when the world returns to its own time.

### The form

- **Third person** — the wanderer is witnessed, not confessing. The distance keeps them strange.
- **A simple action** — sitting, walking back, standing at a window. One activity, unhurried.
- **Varying** — shaped by where the chapter left them, not by template.

### What belongs here

- Details that surface now — things that couldn't be noticed during the story's motion
- Casual questions that open possibility — small uncertainties left unresolved
- Places seen differently — the same locations, now empty or revealing labor that was invisible before
- The environment as presence — felt in passing, not described

### What doesn't belong

- Processing what happened
- Naming what was learned
- Poetic descriptions of atmosphere
- The wanderer's feelings about events
- Explaining what things mean

### Examples

```markdown
## The Wanderer

The wanderer sat on the dock long after the others had gone to bed.

The fog had come in closer while they weren't watching. One lantern still burned where the pier met the land — the harbormaster's work, or someone else's.
```

```markdown
## The Wanderer

The wanderer took the long way back.

The receiving room was dark, but a cup sat on the windowsill that hadn't been there before. Someone had come after they'd left. Or had it been there all along?

The path had a fork they didn't remember. They took the one that looked more worn.
```

The section isn't long. Two or three short paragraphs. The world continuing without the story — details that say *you only saw a sliver*.

See `voice-guide.md` section 9.7 for the full philosophy.

---

## 7. World Tokens

Each chapter ends with tokens — crystallized presences from the story. Names and 2-3 lines of essence.

**The wanderer is never a World Token.** They have their own dedicated section above. World Tokens capture what the wanderer encountered — not the wanderer themselves.

```markdown
## World Tokens

**Arlen**
First appearance. Tests ground before stepping.

**The Shifting Paths**
Appeared where none had been. Invitation or trap?

**The Season**
Fog. Things half-seen.
```

Tokens should feel *embodied*:
- Characters who appeared, with what they carried
- Locations as they were encountered
- Objects that mattered
- Weather, season, time of day — phenomena the wanderer moved through
- Events that changed something

Abstract tokens belong only if they're native to the world — things inhabitants would name. Not universal principles, but the fabric of *this* place.

The app renders tokens visually but never changes the text. The scribe's words are the source.

---

## 8. Granularity

Chapters are as long as they need to be. A chapter might cover:
- A single session's deep work
- A week of gradual evolution
- A pivotal moment
- A quiet interlude where something small shifts

The scribe doesn't chronicle trivially. Minor fixes and typos don't warrant chapters. Chapters mark meaningful movement — when the world has something to say.
