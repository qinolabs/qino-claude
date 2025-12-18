# Chapter Process

*The workflow. Read when executing `/world:chapter`.*

---

## Overview

The chapter process has seven phases:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and identify what it disturbs
3. **Discover** — Find the story (generate options, choose the most alive)
4. **Propose** — Present the beat for approval
5. **Write** — Draft the chapter
6. **Update** — Evolve world.md and arcs.md with new pressures
7. **Snapshot** — Copy world.md and arcs.md to the chapter directory

The critical insight: **don't let the diff narrow your vision before you've inhabited the world.**

---

## Phase 1: Ground in the World

*Before looking at any changes.*

### 1.1 Inhabit the Theme's Atmosphere

Read `chronicle/theme.md` — not to extract locations, but to feel what kind of world this is. The sensory palette you generate below is your working tool during writing. Return to the theme to re-feel atmosphere, not to check coverage.

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
>
> **Sensory palette:** [5-8 concrete nouns that belong to this world — materials, foods, weathers, sounds. These anchor prose regardless of where recent chapters drifted.]

Carry the sensory palette forward. These words are your independent grounding — they come from the theme, not from accumulated chapter tone. When prose drifts abstract, return to this palette. What does the wanderer touch, taste, smell, hear?

### 1.2 Read the Living World

Read `chronicle/world.md`. Pay special attention to:

**Pressures** — What's building? What's about to break? This is your fuel.

**The Wanderer** — What pulls at them? What can't they stop thinking about?

**Characters and Their Relationships** — Who knows whom? Who has history with places ahead? These relationships are fuel for *scenes*, not just thematic depth.

**Unexplored Locations** — What places exist in the theme that haven't appeared?

Then read `chronicle/arcs.md`. Note:

**Arcs in Motion** — What's unresolved? What's been waiting for chapters? (Look for arcs with `*Chapters:* N-` format — these are ongoing.)

### 1.2.1 Find the Scene

For each relationship and arc you noted, ask: **How would this become a scene?**

- If Deren knows someone in the next village → How are they received at the dock? What's the greeting? Where are they led? What are they offered to eat?
- If there's tension in an arc → What objects change hands? What places are avoided? What do characters do with their bodies when the tension surfaces?
- If the wanderer carries something unresolved → What do they reach for? What do they notice that others don't?

**The wanderer doesn't need to understand.** Exchanges between other characters, glances the wanderer catches, customs they witness without explanation — these are richer than the wanderer's comprehension.

Sketch 2-3 scenes before proceeding. These become material in Phase 3.

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

### 1.4 Check Completed Arcs

Glance at completed arcs in `chronicle/arcs.md` (those with `*Chapters:* X-Y` format). Ask:

- Is a character appearing who lived through a completed arc?
- Is a location relevant that an arc touched?
- Is something resurfacing that was yielded by a completed arc?

If yes — read that arc's **Completed** section for texture before proceeding.

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

**OUTPUT NOTHING DURING THIS PHASE.**

Do the work below silently. Do not narrate. Do not show your exploration. Do not output "Let me think through..." or "Now I'll explore..." — output nothing at all.

When Phase 3 is complete, proceed directly to Phase 4 and output only the checkpoint.

You have: a living world with pressures, and a change that disturbs it. Now find the chapter that would surprise you.

### First: What Must This Chapter Diverge From?

Return to what you noted in Phase 1.3. Name what you will NOT repeat:

> **Recent structure:** [what the last chapter used]
> **Recent character type:** [who appeared]
> **Recent wanderer entry:** [how they entered]
> **Recent closing:** [how the wanderer section ended]

This chapter must differ in at least two of these dimensions.

### Ten Story Types

Each type is a different creative direction. The territories show range — thematic ground to explore, not situations to copy.

**The Complication** — *What if the change creates a problem?*

- Help that harms — good intentions making things worse
- The gift's cost — what seemed freely given reveals its price
- Misunderstanding that propagates — error becoming truth
- The break that was building — accumulated pressure finding its crack
- Absence felt — someone missing who should be here

This type works when: the ecosystem change introduces something that could go wrong; an existing pressure is ready to snap; the wanderer has been too successful and needs friction.

**The Journey** — *What if this chapter leaves known ground?*

- The call outward — something glimpsed, needed, promised elsewhere
- Companions discovering each other — people who haven't traveled together
- What the road reveals — the self that emerges in movement
- The stop that changes everything — a place along the way that won't let go
- Walking toward the unknown — destination less important than willingness

This type works when: pressures point beyond current location; relationships need the test of shared travel; the theme has places that haven't appeared.

Craft note: Journey chapters accumulate through stops. Each stop is its own small arrival. The journey's meaning emerges from what's encountered, not from reflection on traveling.

**The Confrontation** — *What if something must be faced?*

- The no that changes everything — refusal from someone who usually helps
- Speaking the unspeakable — what everyone knows but no one says
- The question that won't wait — being asked to account for yourself
- Choosing sides — forced into position when you wanted to stay between
- The mirror held up — someone showing you what you don't want to see

This type works when: tension has been avoided too long; the wanderer's role needs questioning; relationships have unspoken weight; someone has been watching and is ready to speak.

Craft note: Confrontations change relationships permanently. Show the aftermath — even briefly — before the chapter ends.

**The Discovery** — *What if something hidden comes to light?*

- The place that opens — a location revealing what it's been holding
- History surfacing — the past arriving uninvited in the present
- Pattern recognition — seeing what connects, what was always there
- The unwanted knowing — learning what you'd rather not have learned
- Finding without seeking — stumbling into significance

This type works when: arcs have hidden dimensions ready to surface; locations have depth not yet shown; the wanderer is ready to see differently.

Craft note: Discovery changes the discoverer. What shifts in them because of what they now know?

**The Crisis** — *What if the pressure breaks now?*

- Acting before understanding — no time left to know enough
- The irreversible moment — what happens cannot be undone
- Forced presence — being the one who's here when it happens
- The body deciding — action before thought, instinct as wisdom
- What breaks open — destruction revealing what was inside

This type works when: pressures have built across chapters; something has been deferred too long; the wanderer needs to be tested by urgency.

Craft note: Crisis chapters earn their weight through buildup. If nothing was building, crisis is melodrama. Check the pressures.

**The Arrival** — *What if this chapter is about being received?*

- Warmth before understanding — being taken in before you're known
- Invited deeper — access granted to what was closed before
- The world opening — a character showing where they live, what they tend
- Seen from outside — someone reflecting back who you've become
- Absorbing the new — texture, rhythm, detail that will matter later

This type works when: the wanderer enters new territory; a relationship shifts and someone receives you differently; recent chapters have been intense and the world needs to breathe; the theme has richness not yet shown.

Craft note: Arrival chapters are adventures in noticing. Cultural difference felt through concrete detail: how people greet, what they offer, where they look. The wanderer witnesses exchanges they don't fully understand.

**The Loss** — *What if something or someone departs?*

- The leaving that had to come — departure that was always approaching
- The sudden absence — what was here is no longer here
- Releasing what was held — choosing to let go
- The goodbye not given — departure without proper ending
- What remains after — the shape of presence in absence

This type works when: a character's arc reaches its end; the wanderer must leave somewhere that mattered; something the world relied on is no longer available; grief needs space.

Craft note: Loss chapters need the weight of what was. The reader must feel what's being lost, which means showing it alive before it goes.

**The Vigil** — *What if action is impossible and presence is all?*

- Waiting for what won't come faster — the patience that can't hurry
- Holding space — being there when being there is all you can do
- The long night — time stretched by what you're watching for
- Presence as gift — what it means to someone that you stayed
- What surfaces in stillness — what you notice when you can't move

This type works when: after crisis, before resolution; someone needs witnessing; the wanderer's doing has run out and their being is what's left; stillness would be more powerful than action.

Craft note: Vigil chapters resist the urge to make something happen. The story lives in what the wanderer notices, feels, remembers while waiting.

**The Return** — *What if we come back to where we've been?*

- The familiar made strange — seeing what was always there, now visible
- How they see you now — the place registering your change
- What didn't wait — discovering what moved while you were gone
- The self you left — meeting who you were before
- Completing the circle — return as arrival of a different kind

This type works when: the wanderer has changed significantly; a location from early chapters is ready to be revisited; an arc needs its ending to rhyme with its beginning; distance has created perspective.

Craft note: Return chapters work through contrast. The reader needs to feel both the familiarity and the strangeness — what's the same and what can never be the same.

**The Ritual** — *What if a cultural form holds the chapter?*

- The ceremony that reveals — what people show when they follow tradition
- The form and what escapes it — the unscripted moment within the script
- Marking transition — the community acknowledging change
- The outsider witnessing — seeing the culture from inside its most formal moment
- What the ritual holds — the meaning that lives in repeated action

This type works when: the theme implies ceremonies; a transition needs marking (death, union, initiation, season); the wanderer needs to witness the culture at its most itself; structure would serve the chapter.

Craft note: Ritual chapters borrow their structure. Follow the form — the story lives in what happens within it, around it, despite it.

### Remember: The World Has Been Watching

Time passes between chapters. Someone has been paying attention. When accumulated observation surfaces — someone sharing what they've noticed, challenging a pattern they've seen, acting on assumptions formed from watching — the wanderer gains depth and the world becomes a place that remembers.

(See the full principle in `qino-scribe-agent.md` → "The World Has Been Watching")

### Situation-First Selection

You have ten story types. Don't traverse them all. Let the situation guide you.

**Step 1: What does this moment call for?**

From your grounding, identify what the chapter needs:

- Is tension building that needs release? → Crisis, Confrontation
- Is something hidden ready to surface? → Discovery
- Does the world need to breathe? → Arrival, Vigil
- Is there a pull outward? → Journey
- Is someone or something departing? → Loss
- Is the wanderer returning to known ground? → Return
- Does a transition need marking? → Ritual
- Is something going wrong? → Complication

**Step 2: Select 3-5 types**

Based on what the moment calls for, select 3-5 types that could serve this chapter. Don't force-fit types that don't belong. Some chapters have only three live options; that's fine.

**Step 3: Explore those types**

For each selected type, ask:
- Which territory touches a pressure I identified?
- Which involves a character whose weight I felt?
- Which advances an arc that's ready to move?
- Which would surprise me?

**Step 4: Check arc readiness**

Glance at Arcs in Motion:
- Is any arc at a scale where resolution is available?
- Does this chapter's situation offer a path toward resolution?
- Is an arc ready to complete — or should it build further?

**Step 5: Choose the most alive**

From your 3-5 explored options, choose the one that:
- Creates consequences that ripple forward
- Diverges from recent chapters
- Makes you want to see what happens

**Test your choice:** Can you describe the first scene — the approach, the arrival, who's there, what they're doing? If you can only describe what it *means*, you've chosen a theme, not a story.

If all options feel like tour-guide chapters, invert an assumption: What if the established character is wrong? What if the wanderer's help makes things worse? What if someone refuses?

**Phase 3 complete. Now output only the checkpoint.**

---

## Phase 4: Propose the Beat

Present the choice cleanly. The user needs to choose a direction, not review your process.

### The Checkpoint

```
─────────────────────────────────────────────────────────────────

directions

  [Type 1] → [one phrase]
  [Type 2] → [one phrase]
  [Type 3] → [one phrase]
  [Type 4] → [one phrase]  (if applicable)
  [Type 5] → [one phrase]  (if applicable)

[optional: 2-3 sentence recommendation — only if there's genuine
craft insight about rhythm, arc readiness, or what this opens]

                                      which direction calls?
                                         (say more for depth)
```

**Format notes:**
- Show only the 3-5 types you explored, not all ten
- Each direction is one line — the essential image, not the stakes
- No "the world right now" section (available if user asks)
- Recommendation is brief and only when it adds something the user wouldn't see

### If the User Asks for More

If they want to understand the world state or compare options:

```
the world right now

  pressures
    [what's building, what might break]

  arcs
    [what's in motion, at what scale]

  the wanderer
    [where they are, what they carry]
```

Or expand a specific direction:

```
The Crisis — Seren appears at dawn
  → touches The Debt to Seren (quick arc, ready to resolve)
  → stakes: the confrontation avoided, goodbye as wound
  → diverges from: last two chapters were about choosing to go;
    this is about what leaving costs
```

But start slim. The checkpoint's job is to prompt a choice, not exhaustively document the options.

### Dialogue

The user reacts:
- Chooses a direction → proceed to write that chapter
- "tell me more" / "what's at stake?" → expand the direction(s) they're curious about
- "where are we?" / "remind me" → show "the world right now"
- "combine these" → explore the hybrid
- "none of these" → dig deeper, ask what they're sensing
- "not now" → respect the pause

Listen for what they feel but couldn't articulate.

---

## Phase 5: Write the Chapter

Consult `craft.md` for format reference. Consult `voice-guide.md` for prose craft.

### Fresh Start

**Each chapter regrounds itself.** World.md tracks pressures analytically — this informs *what happens*, not *how it sounds*. Don't write from that tone.

**Open in the world.** First paragraph grounds in place and action: weather, motion, what the wanderer encounters. Internal states surface later.

**After interiority, return to the world.** If the previous chapter was reflective, this one shifts outward. Don't deepen what's already deep.

**Use the sensory palette** from Phase 1.1 to anchor prose independent of recent chapter tone.

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
- [ ] **Continuity**: Does the Wanderer section follow plausibly from where the narrative ended? If location or time shifted, is it implied by the narrative's close?
- [ ] **Immersion**: Every noun arises from the story world, not source material? (See soul.md → The Immersion Test)
- [ ] **Anti-patterns clear**: No thematic echo, frictionless success, or paraphrase loops?
- [ ] **Length**: Narrative is 1,200–1,600 words? (See craft.md → Chapter Length)

**Grounding checks** (especially after reflective chapters):

- [ ] **Grounded opening**: First paragraph in place and action before interiority?
- [ ] **Sensory discovery**: New places reveal through concrete detail (architecture, food, custom)?
- [ ] **Interiority compressed**: Internal reflection in single sentences, grounded by action?

### The Strangeness Pass

After the draft, before editorial:

1. Look for pauses that already exist — where attention lands on the wanderer naturally
2. Ask: would someone noticing something here feel organic, or inserted?
3. If nothing feels right, don't add anything. Zero is better than forced.
4. Maximum one or two moments. The moment should feel discovered, not added.

See `qino-scribe-agent.md` → "The Strangeness" for what it is and what breaks it.

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

*Abstraction Drift* — Later chapters naturally pull toward philosophy as arcs deepen. Counter this: Is the opening grounded in place and action? Does dialogue discover or explain? If three consecutive paragraphs have no sensory detail, the prose has drifted.

### Write the Files

After editorial pass, write:

1. **Create chapter directory**: `chronicle/chapters/NNN-slug/`
2. **Chapter file**: `chronicle/chapters/NNN-slug/chapter.md`
3. **Update manifest.json**:
   - Add chapter entry with `slug`, `title`, `written`, `git_ref_start`, `git_ref_end`, `scribe_version`
   - `git_ref_start` = previous chapter's `git_ref_end` (null for first chapter)
   - `git_ref_end` = current HEAD commit
   - `scribe_version` = current version from `references/qino-scribe/version.json`
   - Update `last_chapter` with new ref
4. **Update world.md and arcs.md**: See Phase 6
5. **Create snapshots**: See Phase 7

Present the chapter with confirmation:

```
[full chapter content]

─────

chapter NNN written to chronicle/chapters/NNN-slug/
world updated
snapshots created
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

### Update The World's Breath (When Needed)

**The World's Breath captures environmental presence** — what's physically here, who's here, the immediate spatial context. It answers: "What am I looking at?"

**Update only when:**
- The sensory environment changes significantly (new location, major spatial shift)
- What's physically present changes (people arrive or depart, objects appear)
- The immediate atmospheric presence shifts noticeably

**Do NOT update for:**
- Routine chapter progressions within the same space
- Internal character developments
- Plot events that don't change the physical environment

**Why stability matters:** Image generation uses World's Breath to ground all images in consistent atmospheric context. If it changes every chapter, images lose coherence. Characters and objects encountered carry the atmosphere of when they were first discovered — this is the "gently chapter-contextual" quality that makes tokens feel situated rather than generic.

**Example — update needed:**
- Chapter moves from the observatory to the rift valley camps → Update
- A crowd gathers in a previously empty hall → Update

**Example — no update needed:**
- Wanderer has a conversation in the same location → No update
- Wanderer learns something new about a character → No update

### Update The Season (Rarely)

**The Season captures temporal quality** — time of year, how light behaves, the broader envelope of time. It answers: "When is this? How does light feel?"

**Update only when:**
- Significant time passes between chapters
- Seasons actually change
- The quality of light shifts noticeably (solstice, weather patterns)

The Season and World's Breath are **orthogonal dimensions**:
- World's Breath = WHERE/WHAT (environmental presence)
- The Season = WHEN/HOW (temporal envelope, light quality)

Both can be stable for many chapters. Neither should track routine progression.

### Sync World Tokens to Characters/Locations

**For each World Token written in this chapter:**

1. **Is this a character?** (a person, being, or entity with agency)
   - If yes and not already in `## Characters` → add with their texture
   - Use the token's presence as a starting point, expand to canonical description

2. **Is this a location?** (a place the wanderer can be in or travel to)
   - If yes and not already in `## Locations` → add with its atmosphere
   - Use the token's presence as a starting point, expand to canonical description

3. **Is this something else?** (object, concept, phenomenon)
   - No sync needed — these live only as World Tokens

**Why sync matters:** The app highlights entity names and shows hover cards. Entities in world.md get hover cards even in chapters where they don't have a token. Without sync, a location mentioned meaningfully in one chapter becomes invisible in future chapters.

**Example:**
- World Token: `**The Rift Valley**` → Is this a location? Yes → Add to Locations
- World Token: `**The Ring**` → Is this a location? No. Character? No. → Object, no sync
- World Token: `**The Crystals**` → Is this a location? Debatable (phenomenon) → Use judgment

### Update Characters, Locations

After syncing tokens:
- Add any additional characters not captured as tokens
- Add any additional locations not captured as tokens
- Update Unexplored with what's still waiting

### Update Arcs (in arcs.md)

**The wanderer's strangeness is not an arc.** Don't track it. Don't name it. It accumulates through external observation across chapters — others notice, no one connects it, the pattern builds in the reader's mind. The moment you make it an arc, it becomes a plot point to resolve instead of a constant that deepens.

**If an arc began this chapter:**

Sense its shape (see craft.md → Arc Shapes):
- Is this something hidden? In motion? Building? Between people? Calling outward?
- What question does it hold?
- What might move it toward resolution?

Add to `chronicle/arcs.md` with:
- Shape and `*Chapters:* N-` (chapter number followed by dash, indicating ongoing)
- **In motion** section with *Holds* and *Moves toward*

**If an arc advanced this chapter:**

Update its **In motion** section. Has anything shifted in what it holds or where it's moving?

**If an arc completed this chapter:**

1. Change `*Chapters:* X-` to `*Chapters:* X-Y` where Y is the ending chapter
2. Add the **Completed** section:
   - *Resolved:* (how it ended — one line)
   - *Yielded:* (what the world now has, knows, or lost)
   - *Changed between people:* (relational shifts that persist)
3. Keep the **In motion** section as historical context

---

## Phase 7: Create Snapshots

**After updating world.md and arcs.md, create snapshots for the chapter directory.**

Each chapter needs a snapshot of the world state at the time it was written. This enables accurate retroactive image generation — characters and locations are visualized using the world.md that existed when that chapter was written, not the current state.

### Create the Snapshots

Copy the current (just-updated) world.md and arcs.md to the chapter directory:

1. Copy `chronicle/world.md` → `chronicle/chapters/NNN-slug/world.md`
2. Copy `chronicle/arcs.md` → `chronicle/chapters/NNN-slug/arcs.md`

### Why After Phase 6?

The snapshots must be taken AFTER Phase 6 because:

- New characters introduced in this chapter are added to world.md in Phase 6
- New locations are documented in Phase 6
- The wanderer's updated state reflects this chapter
- Any arcs begun or completed are recorded in Phase 6

The snapshot captures the world state **including** this chapter's contributions — exactly what image generation needs.

### Verification

After creating snapshots, verify:

- [ ] `chronicle/chapters/NNN-slug/chapter.md` exists
- [ ] `chronicle/chapters/NNN-slug/world.md` exists (copy of current world.md)
- [ ] `chronicle/chapters/NNN-slug/arcs.md` exists (copy of current arcs.md)

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
2. Create `chronicle/theme.md` — if user provided detail, distill to essence (see craft.md → Theme). Extract implied locations to world.md's Unexplored section.
3. Create `chronicle/manifest.json` with empty chapters array
4. Create `chronicle/chapters/` directory (chapters will be subdirectories)
5. Create `chronicle/world.md` with initial structure
6. Create `chronicle/arcs.md` with initial structure

For initial world.md:
- Pressures section starts empty (will fill after first chapter)
- **World's Breath** drawn from theme — the immediate environmental presence (what's here, who's here, what's visible). This establishes atmospheric context for image generation.
- **The Season** drawn from theme — when is this, how does light behave
- Wanderer section sparse (will grow)
- Characters/Locations empty
- **Unexplored section populated from theme** — list places the theme implies

For initial arcs.md:
- Title and description line
- Empty (arcs begin when the story creates them)

### Step 3: Write First Chapter

Determine (yourself, based on theme):
- How the wanderer arrives
- Who they first encounter
- What tension exists in the arrival itself

The first chapter has special weight — it's the world's birth. Don't tour; arrive with stakes.

**First chapter qualities** (regardless of story type):

- **Grounding** — the reader is new here. Texture and atmosphere do heavy lifting. The world needs to be felt, not just shown.
- **Felt experience** — we're meeting the wanderer. Their inner life matters more than usual. How they move through the world reveals who they are.
- **Participation** — the wanderer should be IN the world, not passing through it. They drink, sit, touch, notice, feel. The world acts on them and they respond.
- **Seeds** — details that will matter later, planted without emphasis. The first chapter is generous with what it offers.

Whatever the story type, the wanderer's experience should land in the body — theirs and the reader's.

Write immediately after theme is given. The theme selection is the consent.

Create the chapter directory structure:
- `chronicle/chapters/001-slug/chapter.md` — the chapter content

### Step 4: Seed the World

After the first chapter, follow Phase 6 to update world.md and arcs.md. The first chapter plants the seeds:
- Initial pressures (what's building from the arrival)
- First characters and locations with their textures
- The wanderer's first pulls and what they carry
- Any arc that began (sense its shape)

Then follow Phase 7 to create snapshots:
- Copy world.md → `chronicle/chapters/001-slug/world.md`
- Copy arcs.md → `chronicle/chapters/001-slug/arcs.md`

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

## Instead Of

**Instead of** tour-guide chapters (wanderer visits, character explains, wanderer reflects):
→ The wanderer participates. They carry something, break something, are asked to do something. The character needs something from them — not just the opportunity to explain.

**Instead of** characters describing how things work:
→ Characters share from stake — what they've lost to this place, what they're watching for, why they stayed when others left. The reader learns the world through what it costs people.

**Instead of** atmosphere without stakes (beautiful descriptions with nothing at risk):
→ Beauty that someone might lose. Description that reveals what's fragile, contested, or changing.

**Instead of** wanderer as camera (observing without cost or participation):
→ Something costs the wanderer to notice. They're implicated in what they see. Their presence changes something.

**Instead of** empty pressures (ending a chapter with nothing building):
→ Every chapter leaves at least one tension accumulating. What's someone worried about now that they weren't before?

❌ **Diff-driven location**: "This changed, so we go to this room" — let the world's pressures determine where the story goes, not the git diff.

❌ **Ignoring the theme**: Using only observatory interiors when the theme promises wilderness — return to your sensory palette from Phase 1.
