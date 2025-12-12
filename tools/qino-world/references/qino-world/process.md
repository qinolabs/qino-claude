# Chapter Process

*The workflow. Read when executing `/world:chapter`.*

---

## Overview

The chapter process has six phases:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and feel what it disturbs
3. **Discover** — Find the story (generate options, choose the most alive)
4. **Propose** — Present the beat to the wanderer
5. **Write** — Draft the chapter
6. **Update** — Evolve world.md with new pressures

The critical insight: **don't let the diff narrow your vision before you've inhabited the world.**

---

## Phase 1: Ground in the World

*Before looking at any changes.*

### 1.1 Read the Theme

Read `chronicle/theme.md`. Don't just read — interrogate.

**Write for yourself (not output):**

> **Three places in this world I haven't taken the wanderer:**
> 1. [location from theme not yet visited]
> 2. [location from theme not yet visited]
> 3. [location from theme not yet visited]
>
> **Two sources of danger or conflict the theme implies:**
> 1. [tension inherent in the theme]
> 2. [tension inherent in the theme]
>
> **One character type the theme suggests who hasn't appeared:**
> 1. [role or figure implied by the world]

Carry these forward. You'll use them in Phase 3.

### 1.2 Read the Living World

Read `chronicle/world.md`. Pay special attention to:

**Pressures** — What's building? What's about to break? This is your fuel.

**Arcs in Motion** — What's unresolved? What's been waiting for chapters?

**The Wanderer** — What pulls at them? What can't they stop thinking about?

**Unexplored Locations** — What places exist in the theme that haven't appeared?

### 1.3 Read Recent History

Read the last chapter (or last two) for:
- Voice continuity
- Where we left the wanderer
- What thread is dangling

### 1.4 The Grounding Check

**Do not proceed to Phase 2 until you can answer:**

> What is alive in this world right now that has nothing to do with what changed in the git diff?

If you can't answer this, you haven't grounded. Return to world.md. Feel the pressures. Find what's building.

---

## Phase 2: Observe What Changed

*Now — and only now — look at the changes.*

### 2.1 Gather the Diff

```bash
# Get last git ref from manifest
git log --oneline [last_ref]..HEAD

# See what actually changed (exclude chronicle)
git diff [last_ref]..HEAD --stat -- . ':!*chronicle*'
git diff [last_ref]..HEAD -- . ':!*chronicle*'
```

Read the diff as ground truth. Commit messages may be incomplete.

### 2.2 Read Changed Content

If concepts changed, read them. If ecosystem notes appeared, read them. Understand what arrived or deepened.

### 2.3 Feel the Disturbance

Don't ask: "Where do I show this change?"

Ask:
- **Who in this world would care about this?** Not who explains it — who is *affected*?
- **What pressure does this add or release?** Does it create tension or resolve it?
- **What might go wrong because of this?** What could someone lose, misunderstand, fight over?
- **How does this touch what's already building?** Does it accelerate a pressure? Complicate an arc?

---

## Phase 3: Discover the Story

*The critical phase. This is where adventure happens or doesn't.*

You have: a living world with pressures, and a change that disturbs it.

**Generate three possible chapters:**

### Option A: The Expected

Where would the change naturally surface? Who would naturally explain it?

Write it down. This is the tour-guide version — the wanderer visits a location, a character explains what arrived.

*Note it, then set it aside.*

### Option B: The Unexpected Location

Return to what you wrote in Phase 1 — the unexplored places, the dangers implied by the theme.

Could this change be discovered:
- In a location from the theme you haven't used?
- Away from the center of the world — at its edges?
- During a journey, not at a destination?
- Through someone affected by the change, not someone who manages it?

### Option C: The Complication

What if the change creates a *problem*?

- Someone disagrees with how it's being handled
- The wanderer tries to help and makes things worse
- An existing pressure finally breaks because of this
- Something the established characters believe is challenged
- Someone is missing who should be here
- Something goes wrong in transit, in translation, in understanding

### Choose the Most Alive

Compare your three options. Ask:

- Which creates the most interesting **action** (not observation)?
- Which makes something **at stake** (not just interesting)?
- Which lets the wanderer **do** something (not just witness)?
- Which uses the world's pressures as fuel?

**Choose that one.**

If all three feel like tour-guide chapters, return to Option C and push harder. What could go *wrong*? Who could *disagree*? What could the wanderer *attempt* that might not work?

---

## Phase 4: Propose the Beat

Present to the wanderer (the user):

```
what's building

  [the pressure or tension that's live]
  [what the change touches or disturbs]

the next chapter could be

  [where — prefer unexplored territory]
  [who — and what they want]
  [what happens — action, not observation]
  [what the wanderer does — not just witnesses]
  [what's at stake — what could go wrong]

                                        does this capture it?
```

### Dialogue

The wanderer reacts:
- "that captures it" → proceed to write
- "there's something more" → ask what's missing
- "the tone feels off" → explore what voice fits
- "not now" → respect the pause

Listen for what they feel but couldn't articulate.

---

## Phase 5: Write the Chapter

Consult `craft.md` for format reference.

### Writing Checklist

As you write, verify:

**Action & Stakes**
- [ ] The wanderer **does** something, not just observes
- [ ] Something is **at stake** — something could be lost or changed
- [ ] At least one moment **costs** the wanderer something to notice

**World & Atmosphere**
- [ ] The world **acts**, not just contains — it shapes, resists, offers, withholds
- [ ] The location has weather, mood, history — not just name
- [ ] **One explanatory exchange maximum** — show the rest through action, environment, consequence

**Relationship & Perception**
- [ ] Someone **perceives** something about the wanderer — the world sees back
- [ ] When characters move together, the world is filtered through their **relationship** (a companion's ties to place should be visible)
- [ ] Characters **complete each other's meaning** — responses reach beyond what was said
- [ ] Characters with faces, not functions — what do they want? what are they afraid of?

**Reader Entry**
- [ ] **Where does the reader contribute?** At least one gap per scene where meaning must be inferred
- [ ] A gesture, perception, or silence implies something the text doesn't explain

### The Editorial Pass

Before presenting, reread as editor:

**Does this world ask something of the reader?**

A world asks something when:
- A character's behavior creates a question, not an explanation
- The environment has opinions, not just atmosphere
- Someone's silence matters more than their speech
- Something costs the wanderer to notice

**Is the wanderer section the unwatched hour?**

If it reads like processing what happened or naming what was learned, return to aftermath. The world continuing without the story.

### Write the Files

After editorial pass, write:

1. **Chapter file**: `chronicle/chapters/NNN-slug.md`
2. **Update manifest.json**: Add chapter entry, update last_chapter
3. **Update world.md**: See Phase 6

Present the chapter with confirmation:

```
[full chapter content]

─────

chapter NNN written to the chronicle
world updated
```

---

## Phase 6: Update world.md

**This is not housekeeping. This is planting seeds for future chapters.**

### Update Pressures (Critical)

After writing, ask:

- What's building now that wasn't before?
- What pressure released? What took its place?
- What's someone worried about now?
- What question did this chapter create that hasn't been answered?

**If the Pressures section is empty after this chapter, you haven't finished.**

Every chapter should leave at least one pressure building.

### Update the Wanderer

- What pulls at them now?
- What new thing do they carry?
- Where were they last seen?
- Did anyone sense their strangeness? Add to "What remains unspoken"

### Update Characters, Locations, Arcs

- New characters with their textures
- New locations with their atmospheres
- Arcs advanced or begun
- Update Unexplored with what's still waiting

---

## First Chapter: No Chronicle Exists

If `chronicle/` doesn't exist:

### Step 1: Get the Theme

Ask the user what kind of world this is. You may offer suggestions drawn from the spectrum:

- Ancient/mythic, underwater/aquatic, age of sail
- Industrial/dieselpunk, silkpunk, solarpunk
- Lunarpunk/bioluminescent, near-future/intimate
- Far-future/frontier, new weird, climate/ecological
- Cosmic/quiet, fantasy noir, sentient landscapes

Good themes are spacious (a realm, not a scene) and have inherent tension.

Wait for their response.

### Step 2: Create Chronicle Structure

1. Create `chronicle/` directory
2. Create `chronicle/theme.md` with user's theme (exactly as given)
3. Create `chronicle/manifest.json` with empty chapters array
4. Create `chronicle/chapters/` directory
5. Create `chronicle/world.md` with initial structure

For initial world.md:
- Pressures section starts empty (will fill after first chapter)
- World's Breath drawn from theme
- Wanderer section sparse (will grow)
- Characters/Locations empty
- **Unexplored section populated from theme** — list places the theme implies

### Step 3: Write First Chapter

Determine (yourself, based on theme):
- How the wanderer arrives
- Who they first encounter
- What tension exists in the arrival itself

The first chapter has special weight — it's the world's birth. Don't tour; arrive with stakes.

Write immediately after theme is given. The theme selection is the consent.

---

## No Changes Since Last Chapter

If nothing changed:

```
the world rests

the wanderer sits at [last location]
[atmospheric detail of stillness]

nothing has moved since [last chapter title]
but stillness can be chapter-worthy

─────

                                        write a quiet chapter, or wait?
```

Even in stillness, pressures can build. A quiet chapter might:
- Return to an unresolved arc
- Let the wanderer notice something they'd missed
- Have a character seek them out
- Deepen a relationship through presence, not event

---

## What to Avoid

- **Tour-guide chapters**: Wanderer visits, character explains, wanderer reflects
- **Diff-driven location**: "This changed, so we go to this room"
- **Explanation as dialogue**: Characters describing how things work
- **Atmosphere without stakes**: Beautiful descriptions with nothing at risk
- **Wanderer as camera**: Observing without cost or participation
- **Empty pressures**: Ending a chapter with nothing building
- **Ignoring the theme**: Using only observatory interiors when the theme promises wilderness
