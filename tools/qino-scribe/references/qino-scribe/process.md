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

### 1.1 Inhabit the Theme's Atmosphere

Read `chronicle/theme.md` — not to extract locations, but to feel what kind of world this is.

**Don't ask:** "Which theme elements haven't been used?"

**Ask:**
- What textures, smells, sounds does this theme imply?
- What dangers live at the edges?
- What do people in this world worry about that they don't say?
- What's beautiful here? What's broken?

**Then — without consulting the theme again — write:**

> **This world feels like:** [your impression in 2-3 sentences — the atmosphere, not the inventory]
>
> **A pressure the theme holds but the chronicle hasn't explored:** [something building, not a location]
>
> **A character I'd like to meet here:** [not a role, but a person with contradictions — someone difficult, or surprising, or in motion]

Carry this forward. You'll use it in Phase 3 and show it in Phase 4.

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

**Also note — for variance:**
- What structure did the last chapter use? (arrival → encounter → departure? Journey? Crisis?)
- What character type appeared? (elder guide? peer? antagonist? group?)
- How did the wanderer enter? (arriving somewhere? mid-action? being sought out?)
- How did the wanderer section close? (sitting? walking? in company? at work?)

You will actively diverge from these in Phase 3.

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
# last_ref = manifest.last_chapter.git_ref (exclusive — not included in range)
git log --oneline [last_ref]..HEAD

# See what actually changed (exclude chronicle)
git diff [last_ref]..HEAD --stat -- . ':!*chronicle*'
git diff [last_ref]..HEAD -- . ':!*chronicle*'
```

The range `last_ref..HEAD` shows commits AFTER last_ref up to and including HEAD.

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

You have: a living world with pressures, and a change that disturbs it. Now find the chapter that would surprise you.

### First: What Must This Chapter Diverge From?

Return to what you noted in Phase 1.3. Name what you will NOT repeat:

> **Recent structure:** [what the last chapter used]
> **Recent character type:** [who appeared]
> **Recent wanderer entry:** [how they entered]
> **Recent closing:** [how the wanderer section ended]

This chapter must differ in at least two of these dimensions.

### Six Story Types

Each type is a different creative direction. The subtypes show range — they're possibilities, not templates.

**The Complication** — *What if the change creates a problem?*
- Someone disagrees with how it's being handled
- The wanderer tries to help and makes things worse
- An existing pressure finally breaks because of this
- Something goes wrong in transit, in translation, in understanding
- What seemed like a gift reveals its cost
- Someone is missing who should be here

**The Journey** — *What if this chapter leaves known ground?*
- A pressure calls outward — something glimpsed, needed, promised
- Companions who haven't traveled together set out
- The wanderer goes alone into territory the theme implies
- Something must be delivered, witnessed, or retrieved
- The destination matters less than what happens on the way

**The Confrontation** — *What if someone refuses, challenges, or pushes back?*
- A character who usually helps says no
- Someone questions what the wanderer is doing here
- Two characters who agree on everything disagree on this
- The wanderer is asked to choose sides
- Someone speaks what others have been afraid to say

**The Discovery** — *What if something hidden comes to light?*
- A location reveals what it's been holding
- A character's past surfaces unexpectedly
- The wanderer finds something they weren't looking for
- A pattern becomes visible that reframes what came before

**The Crisis** — *What if the pressure breaks now?*
- What's been building can no longer wait
- Someone must act before understanding fully
- A choice must be made with incomplete information
- Something breaks that cannot be repaired

**The Arrival** — *What if this chapter is about being received?*
- A warm welcome — being noticed, taken in, shown where to rest
- Invited deeper — into a space, role, or trust you weren't allowed before
- Returning changed — a familiar place sees you differently now, or you see it
- A character opens their world — where they work, what they tend, what they love
- Seen from outside — someone shares what they've noticed about the wanderer over time, revealing the wanderer to themselves
- Absorbing without understanding — details that hint at depth, warmth felt before meaning clear
- Quiet noticing — textures, rhythms, small things that will matter later
- Seeds planted — someone met in passing, something glimpsed, a question for another time

This type works when:
- The wanderer enters new territory
- A relationship shifts and someone receives you differently
- Recent chapters have been intense and the world needs to breathe
- The theme has richness that hasn't been shown
- Seeds need planting, not harvesting

### Remember: The World Has Been Watching

Time passes between chapters. Someone has been paying attention. When accumulated observation surfaces — someone sharing what they've noticed, challenging a pattern they've seen, acting on assumptions formed from watching — the wanderer gains depth and the world becomes a place that remembers.

(See the full principle in `qino-scribe-agent.md` → "The World Has Been Watching")

### For Each Type: Choose the Most Exciting Subtype

Don't choose abstractly. Connect to what you discovered in grounding.

For each of the six types, ask:
- Which subtype touches a pressure I identified?
- Which involves a character whose weight I felt?
- Which leads to a location I noted as unexplored?
- Which advances an arc that's ready to move?

A subtype is exciting when:
- It touches a pressure that's already building
- It involves characters whose relationships have weight
- It creates consequences that ripple forward — things that can't be undone
- It goes somewhere the chronicle hasn't been
- It reveals something about a character we thought we knew
- It connects threads that haven't yet met

Don't choose the subtype that fits most neatly. Choose the one that makes you want to see what happens.

### Resolution Check

Before finalizing, glance at Arcs in Motion:

- Is any arc at a scale where resolution is available?
- Does this chapter's situation offer a path toward resolution?
- Is an arc ready to complete — or should it build further?

An arc is ready when its question has been explored enough to rest, or when the story offers a natural moment of resolution.

### Choose the Most Alive

You now have six possibilities — one per type, each grounded in specifics.

Compare them. Ask:
- Which has the wanderer **taking action to change something**, not just reacting?
- Which **leaves the largest unresolved pressure** — fuel for future chapters?
- Which uses an **arc that's ready** (at scale, situation aligned)?
- Which **diverges most from recent chapters** while serving the theme?
- Which would **surprise you** if you saw it in the next chapter?

**Choose that one.**

If all six feel like tour-guide chapters, invert an assumption: What if the established character is wrong? What if the wanderer's help makes things worse? What if the journey begins here? What if someone refuses to help?

---

## Phase 4: Propose the Beat

Present to the user in three sections:

### Section 1: The World Right Now

A refresher that also sparks imagination:

```
the world right now

  pressures
    [what's building, what might break]

  arcs
    [what's in motion, at what scale, what could move them]

  characters
    [who has weight right now, what's shifting between them]

  the wanderer
    [where they are, what they carry, what's unspoken about them]

  unexplored
    [what the theme holds that hasn't been touched]
```

### Section 2: Six Directions

Present each of the six possibilities from Phase 3 — the chosen subtype, its connection to grounding, and what's at stake:

```
six directions

  The Complication: [chosen subtype]
    → [connection to specific pressure/character/location]
    → [what's at stake — what could be lost, strained, revealed]

  The Journey: [chosen subtype]
    → [connection]
    → [stakes]

  The Confrontation: [chosen subtype]
    → [connection]
    → [stakes]

  The Discovery: [chosen subtype]
    → [connection]
    → [stakes]

  The Crisis: [chosen subtype]
    → [connection]
    → [stakes]

  The Arrival: [chosen subtype]
    → [connection]
    → [what warmth or depth it would show, what seeds it plants]
```

### Section 3: What's Different

Help the user choose:

```
what's different

  [how each diverges from recent chapters]
  [which arcs could resolve vs build further]
  [which goes furthest from known ground]
```

**Only if there's genuine insight**, add a recommendation:

```
I'd choose: [the recommended direction]
  [why — what the agent sees that the user may not hold in mind:
   how this fits the rhythm of recent chapters,
   how well arcs and pressures can evolve naturally with this as the stage,
   what it opens for the chapters after]
```

Don't recommend just to recommend. If all directions are equally alive, or the choice is purely about user preference, skip the recommendation. It should only appear when there's a craft reason — rhythm, timing, arc readiness — that the user might not see.

Then close with: `which direction calls?`

### Dialogue

The user reacts:
- Chooses a direction → proceed to write that chapter
- "there's something more" → ask what's missing, adjust
- "combine these" → explore the hybrid
- "none of these" → dig deeper, ask what they're sensing
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
2. **Update manifest.json**:
   - Add chapter entry with `slug`, `title`, `written`, `git_ref_start`, `git_ref_end`
   - `git_ref_start` = previous chapter's `git_ref_end` (null for first chapter)
   - `git_ref_end` = current HEAD commit
   - Update `last_chapter` with new ref
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
