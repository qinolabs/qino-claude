# Chapter Process

*The workflow. Read when executing `/world:chapter`.*

---

## Overview

The chapter process has six phases:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and identify what it disturbs
3. **Discover** — Find the story (generate options, choose the most alive)
4. **Propose** — Present the beat for approval
5. **Write** — Draft the chapter
6. **Update** — Evolve world.md with new pressures

The critical insight: **don't let the diff narrow your vision before you've inhabited the world.**

---

## Phase 1: Ground in the World

*Before looking at any changes.*

### 1.1 Read the Theme

Read `chronicle/theme.md`. Don't just read — interrogate.

**Grounding notes** (include in Phase 4 proposal):

> **Three places in this world I haven't taken the wanderer:**
> 1. [location from theme not yet visited]
> 2. [location from theme not yet visited]
> 3. [location from theme not yet visited]
>
> **What's calling outward from this theme that hasn't been answered?**
> [a journey the theme holds — companions, destination, purpose not yet emerged]
>
> **One character type the theme suggests who hasn't appeared:**
> 1. [role or figure implied by the world]

Carry these forward. You'll use them in Phase 3 and show them in Phase 4.

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

### 1.4 Check the Journal

If `chronicle/journal.md` exists, glance at it. Ask:

- Is a character appearing who lived through a completed arc?
- Is a location relevant that an arc touched?
- Is something resurfacing that was yielded by a completed arc?

If yes — read that entry for texture before proceeding.

### 1.5 The Grounding Check

**Do not proceed to Phase 2 until you can answer:**

> What is alive in this world right now that has nothing to do with what changed in the git diff?

If you can't answer this, you haven't grounded. Return to world.md. Trace the pressures. Find what's building.

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

### 2.3 Identify the Disturbance

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

**Generate four possible chapters:**

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

### Option D: The Journey

What if this chapter leaves known ground?

Check world.md:
- Is there a pressure that calls outward — something glimpsed, needed, or promised?
- Which characters have relationships ready for shared travel?
- What would they seek, deliver, witness, or create?

If no journey seed exists yet, return to Phase 1.1: what's calling outward from the theme? Could this chapter be where the call emerges — where companions decide to go?

The diff might surface during the journey — encountered far from home, understood differently because of distance.

### Resolution Check

Before choosing, glance at Arcs in Motion. Ask:

- Is any arc at a scale where resolution is available?
- Does this chapter's situation offer a path toward an arc's resolution?
- Is an arc ready to complete — or should it build further?

An arc is ready when its question has been explored enough to rest, or when the story offers a natural moment of resolution. Not every chapter resolves an arc. But every chapter should know which arcs *could* resolve.

### Choose the Most Alive

Compare your four options. Ask:

- Which has the wanderer **taking action to change something**, not just reacting?
- Which **leaves the largest unresolved pressure** — fuel for future chapters?
- Which uses an **arc that's ready** (at scale, situation aligned)?
- Which **surprises** — goes somewhere the chronicle hasn't been?

**Choose that one.**

If all four feel like tour-guide chapters, return to Option C or D and invert an assumption: What if the established character is wrong? What if the wanderer's help makes things worse? What if the journey begins here?

---

## Phase 4: Propose the Beat

Present to the user:

```
how I'm entering this world

  [grounding notes from Phase 1.1 — unexplored places,
   what's calling outward, character types waiting]

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

The user reacts:
- "that captures it" → proceed to write
- "there's something more" → ask what's missing
- "the tone feels off" → explore what voice fits
- "not now" → respect the pause

Listen for what they feel but couldn't articulate.

---

## Phase 5: Write the Chapter

Consult `craft.md` for format reference. Consult `voice-guide.md` for prose craft.

### Writing Checklist

As you write, hold in mind:

The wanderer does something, not just observes. Something is at stake. The world acts — it shapes, resists, offers, withholds. Someone perceives something about the wanderer; the world sees back. Characters complete each other's meaning — responses reach beyond what was said. At least one gap per scene where the reader contributes meaning. One explanatory exchange maximum — show the rest through action, environment, consequence.

These principles shape the prose; the checks below verify the result.

### Verification

Before finishing, check:

- [ ] **World acts**: Does the environment resist, offer, or withhold — not just contain?
- [ ] **Seen back**: Does another character perceive or react to the wanderer?
- [ ] **Strangeness restrained**: 1-2 moments maximum, none explained or named?
- [ ] **Aftermath**: Is the wanderer section purposeless action, not reflection?
- [ ] **Immersion**: Every noun arises from the story world, not source material? (See soul.md → The Immersion Test)
- [ ] **Anti-patterns clear**: No thematic echo, frictionless success, or paraphrase loops?

### The Editorial Pass

Before presenting, reread as editor:

**Does this world ask something of the reader?**

A world asks something when:
- A character's behavior creates a question, not an explanation
- The environment has opinions, not just atmosphere
- Someone's silence matters more than their speech
- Something costs the wanderer to notice

**LLM Anti-patterns Check**

Scan for these common failures:

*Thematic Echo* — If the story is *about* proving coincidences have meaning, it should not *say* "coincidences were the universe's grammar." The theme lives in action and image, not declaration.

*Frictionless Success* — Something should fail, be misunderstood, or exact a price before resolution. Cooperative worlds and helpful artifacts ("the journal explained exactly what to do") drain stakes.

*Paraphrase Loops* — If you've written "The stone was warm to the touch" — don't follow with "She realized warmth meant something was alive inside."

*Diagnostic Label-speak* — At the moment of highest pressure, prefer embodied sensation over named states. Not "luminous regret" — show the regret in what the body does.

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
- What journey seed appeared — something glimpsed, promised, or needed that could call characters outward?

**If the Pressures section is empty after this chapter, you haven't finished.**

Every chapter should leave at least one pressure building.

### Update the Wanderer

- What pulls at them now?
- What new thing do they carry?
- Where were they last seen?
- Did anyone sense their strangeness? Add to "What remains unspoken"

### Update Characters, Locations

- New characters with their textures
- New locations with their atmospheres
- Update Unexplored with what's still waiting

### Update Arcs

**If an arc began this chapter:**

Sense its shape (see craft.md → Arc Shapes):
- Is this something hidden? In motion? Building? Between people? Calling outward?
- What's its scale? (quick / has weight / long)
- What question does it hold?
- What might move it toward resolution?

Write it to Arcs in Motion with shape, scale, holds, moves toward.

**If an arc advanced this chapter:**

Update its current state. Has anything shifted in what it holds or where it's moving?

**If an arc completed this chapter:**

1. Remove from Arcs in Motion
2. Write to `chronicle/journal.md`:
   - Shape, chapters spanned, how it resolved
   - What it yielded (what the world now has, knows, or lost)
   - What changed between people

Create journal.md if this is the first completed arc.

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

### Step 4: Seed the World

After the first chapter, follow Phase 6 to update world.md. The first chapter plants the seeds:
- Initial pressures (what's building from the arrival)
- First characters and locations with their textures
- The wanderer's first pulls and what they carry
- Any arc that began (sense its shape)

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
