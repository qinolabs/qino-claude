# Explore Workflow

**Execution:** inject
**Voice:** Active work, but still companion-like. "Let's look at this together."
**Agent:** concept

**Reference:** Read `references/concept/design-philosophy.md` — Part I for universal principles (especially sections 1-2). Read `references/concept/manifest-project-spec.md` — Sections 5-6 for note structure and reference specification.

---

## Task

Explore is where active work happens. This is inside the concept, working.

**Mode detection:**
- If 1 concept argument → Single-concept mode
- If 2+ concept arguments → Relationship mode

---

## Context Handling

**If `context.type === "research"`:**

This is a research workspace, not a concepts workspace. Gracefully redirect:

> "This is a research space — concept exploration happens in your concepts-repo."
>
> "Use 'start research on [topic]' to begin or continue an exploration here."

Do not proceed with explore.

**If `context.type === "implementation"`:**

Use `context.conceptsRepo` path and work with concepts there.

**Otherwise:**

Proceed normally in the current workspace.

---

## Draft Detection (Before Concept Work)

Before beginning any concept exploration, check for an existing draft:

1. **Glob for draft file:** `concepts/[concept-id]/concept-draft-*.md`

2. **If draft exists:**
   - Note the date from the `Draft started:` field in the draft header
   - Show: `(draft in progress from [date])`
   - Ask: "Continue with existing draft, or start fresh?"
   - **If continue:** Work with the draft file for all subsequent updates
   - **If fresh:** Move old draft to `concepts/[concept-id]/drafts-archive/`, create new draft

3. **If no draft exists:**
   - Proceed normally — draft created when substantial work begins (see "Draft-Aware Updates" below)

---

## Draft-Aware Updates

When making changes to a concept during exploration:

**Create draft when:**
- User wants to significantly revise a section
- Multiple sections will change
- Exploration is open-ended ("let's explore this concept")
- User explicitly requests draft mode

**Work directly when:**
- Small, targeted edits (typo, single sentence)
- Adding to Held Threads / Open Questions only
- User explicitly requests direct edit

**When uncertain, ask:**
> "This looks like substantial work — want me to create a draft so we can compare with the original?"

**If creating draft:**
1. Create `concept-draft-YYYYMMDD-HHMMSS.md` as copy of current concept.md
2. Add header:
   ```markdown
   # [Concept Name] — Draft

   **Draft started:** YYYY-MM-DD
   **From:** concept.md (original preserved)

   ---
   ```
3. Inform user: `(created draft — original preserved)`
4. All subsequent changes go to the draft

**If draft already exists:**
- All changes go to the draft file
- Never touch the main `concept.md`
- The original is preserved for comparison

---

## Settling (After Substantial Draft Work)

When exploration reaches a natural pause, or user signals done:

> "This draft has taken shape. What would you like to do?"
>
> → **Create revision** — saves current state, updates concept.md
> → **Save for later** — keeps draft, original unchanged
> → **Keep exploring** — continue working

**If "Create revision":**
1. Show summary of what changed (not full diff, just key changes)
2. Ask for revision title
3. Archive current concept.md:
   - Create `revisions/` directory if needed
   - Glob for `revisions/YYYY-MM-DD-*.md` to find next index
   - Copy concept.md to `revisions/YYYY-MM-DD-NNN.md`
4. Replace concept.md with draft content (stripping draft header and Draft Notes section)
5. Prepend entry to revisions.md:
   ```markdown
   ## YYYY-MM-DD: [Revision Title]

   [Brief summary of what changed]

   → [revisions/YYYY-MM-DD-NNN.md](revisions/YYYY-MM-DD-NNN.md)

   ---
   ```
6. Delete the draft file
7. Update `last_touched` in manifest.json

**If "Save for later":**
- Keep draft file as-is
- Original remains unchanged
- User can return anytime — draft detection will find it

---

## Cross-Concept Signals (applies to all modes)

During any explore session, the user may signal that something reaches beyond the current concept(s). Recognize these signals:

- "that's bigger than [concept]"
- "this connects to [other-concept] too"
- "that reaches beyond just [concept]"
- "this applies to [concept-a] and [concept-b]"
- "hold that across concepts"

**When you recognize a cross-concept signal:**

1. **Acknowledge** with "∴" + distilled essence:
   ```
   ∴ Grid as a pattern that exists at different frame-holding levels
   ```

2. **Ask which concepts it touches:**
   ```
   connecting to [current-concept] and [mentioned-concept]?
   or does it touch others too?
   ```

3. **WAIT** for confirmation/addition.

4. **Create notes directory** if it doesn't exist.

5. **Create note file** at `notes/YYYY-MM-DD_note-id.md`:
   ```markdown
   # [Theme — in user's words]

   **Captured:** YYYY-MM-DDTHH:MM:SSZ

   [User's observation, exactly as they said it]
   ```

6. **Add note entry** to `manifest.json` notes array with multi-concept references:
   ```json
   {
     "id": "note-id",
     "path": "notes/YYYY-MM-DD_note-id.md",
     "captured": "YYYY-MM-DDTHH:MM:SSZ",
     "essence": "[distilled essence]",
     "references": [
       {
         "concept": "[current-concept-id]",
         "woven": "YYYY-MM-DDTHH:MM:SSZ",
         "context": "emerged during exploration"
       },
       {
         "concept": "[other-concept-id]",
         "woven": "YYYY-MM-DDTHH:MM:SSZ",
         "context": "connection recognized"
       }
     ]
   }
   ```

7. **Confirm:** `connected across [concept-1] and [concept-2]`

8. **Continue naturally** with explore work — the capture is seamless.

9. **After significant cross-concept patterns emerge**, suggest relationship exploration:
   ```
   something is taking shape between these concepts
   "explore [concept-1] and [concept-2]" to see the threads
   ```

---

## Single-Concept Mode

**Purpose:** Work with one concept — deepen, expand, restructure, or inhabit as needed.

### Momentum Check (First)

Before following the standard flow, check your prompt for momentum:

**If MOMENTUM block exists or prompt contains rich, specific vision:**

1. Read the concept file (steps 1-2 below)
2. **Skip the arrival surface and alive-thread question**
3. Acknowledge briefly what the user has surfaced
4. Go directly to proposing integration:
   - How does their vision connect to what's already in the concept?
   - What sections would this update or expand?
   - Propose concrete changes
5. **WAIT** for response, then continue with normal workflow (confirmations, edits)

**Example momentum flow:**
```
[After reading concept.md]

The terminal playground vision — this lands in several places:

Primary Surfaces could grow a new entry:
  "Interactive /tools page — terminal simulation with guided steps,
   demonstrating the ecology in action"

This also touches Glowing Connections — the idea that process
becomes artifact, that working itself is publishable.

Want me to draft these additions?
```

**If NO momentum** — follow the standard flow below.

---

If no concept id is provided:

1. Check `manifest.json` for notes with empty `references` array
2. If such notes exist, offer them as entry points:

   > "There are thoughts waiting to find their place:"
   >
   > - [essence 1]
   > - [essence 2]
   >
   > "Any of these feel alive? Or which concept would you like to explore?"

3. If user picks a note, ask which concept it might touch, then continue with that concept (the note becomes the starting alive thread)
4. If no such notes, simply ask: "Which concept would you like to explore?"

**Steps:**

1. Open `manifest.json` and find the concept by `id`.

2. Read the full `concept.md` using the `path` field.

3. Assess the concept's state:
   - **Thin**: Fewer than 3 sections have substance → likely needs expanding
   - **Uneven**: Some sections rich, others empty → likely needs deepening
   - **Cluttered**: All sections have content but feel disorganized → likely needs restructuring
   - **Has held threads**: Check manifest for `held_threads` array — material from origins that wasn't carried forward
   - **Has notes**: Check manifest `notes` array for entries where any `reference.scope` = this concept id and status suggests active (not "integrated", not "dormant")

4. Output an arrival surface — this is **visible output** showing where we're starting:

```
┌─────────────────────────────────────────┐
│ [concept-name]                          │
│                                         │
│ impulse                                 │
│ [1-2 sentences from Real-World Impulse] │
│                                         │
│ state                                   │
│ [what's here — e.g., "surfaces defined, │
│ tone still quiet, 3 held threads"]      │
│                                         │
│ held threads (if any)                   │
│ · [thread 1 theme]                      │
│ · [thread 2 theme]                      │
│                                         │
│ connected notes (if any)                │
│ · [note essence]                        │
│                                         │
└─────────────────────────────────────────┘

What part of this feels most alive right now?
```

The arrival surface grounds both of you — you see where things stand before deciding where to go.

5. **WAIT** for the user's response.

6. After the user responds, assess whether held threads could bridge a gap (if `held_threads` exists for this concept).

### If held threads might help

**CRITICAL BOUNDARY:** The `held_threads` index is designed so you can *offer* without *reading* origin files. You have the theme — that's enough to ask whether it still has warmth. **Do NOT read origin files to "prepare" or "understand the held thread better."** Only read origins after the user explicitly engages.

**Trigger conditions (any of):**
- User's response points toward something not captured in concept.md
- User expresses being stuck: "nothing feels alive," "I'm not sure"
- User's alive thread relates to a thin section, and held threads touch that area
- User's language echoes a held thread

**If triggered, offer specifically:**

> "There's something held in your origins — about [specific held thread theme]."
> "Does that still have warmth, or has the concept moved past it?"

Use the theme from `held_threads` directly — do NOT read the origin file yet.

**If user engages (says yes, expresses interest):**
- NOW read the relevant origin file from `concepts/<id>/origins/`
- Surface the specific material related to that thread
- Work with it using normal expand/deepen modes
- Held thread remains in the list — threads are multi-dimensional, and integration may only capture one facet

**If user declines or concept has moved past:**
- Acknowledge lightly: "Makes sense — things shift."
- Continue with normal explore flow
- Thread remains held — it may have other dimensions that become alive later

### If notes might help

Check `manifest.json` for notes that might connect:
- Notes with empty `references` — thoughts waiting to find their place
- Notes already connected to this concept — may have more to give

**Trigger conditions (any of):**
- User's alive thread echoes a note's essence (language, theme, or direction)
- User expresses uncertainty and relevant notes exist
- User's response points toward something a captured note touches

**If triggered, offer specifically:**

For notes with empty references:
> "You captured something about [essence] — does that connect here?"

For notes already connected:
> "There's a note here about [essence] — does it still have warmth?"

**If user engages:**
- Read the note file via its path
- Surface the content
- Work with it using normal expand/deepen modes
- **For notes with empty references:** Add a reference when connected
- **For connected notes:** Update status to reflect engagement

**If user declines:**
- Acknowledge lightly
- Continue with normal explore flow
- Leave notes without references as they are — they'll surface again when they have warmth

### Reference removal

During exploration, if a note no longer feels relevant to this concept:

> "This note about [title] — does it still connect here, or has the concept moved past it?"

**If user confirms removal:**
- Remove that reference from the note's references array
- If no references remain, ask: "This was the last anchor — archive the note, or keep it for now?"
- Confirm before any changes

7. Based on their response, work in the appropriate mode:

### If expanding (opening possibilities):
- Propose 2-3 grounded directions the concept could take
- For each: what might change, why it's interesting
- Ask which feels most alive
- WAIT for selection
- Suggest concrete updates to relevant sections

### If deepening (focusing on a section):
- Focus on the section related to what the user said feels alive
- Ask 1-2 questions to clarify that section
- WAIT for response
- Propose a rewrite of ONLY that section
- Show the proposed change, ask for confirmation

### If restructuring (bringing coherence):
- Identify what drifts from the alive essence
- Propose a gentle reorganization
- Present the new structure as an outline
- Ask: apply reorganization, or just reorder?
- WAIT for confirmation

### If inhabiting (discovering voice and tone):

**Trigger signals:** User mentions tone, voice, "how it feels," "what it would say," or explicitly asks to "step into a moment."

**Also offer inhabit when:** Tone & Communication section is thin after other work.

**The inhabit flow:**

1. **Choose a moment.** Surface 2-3 scenarios from Primary Surfaces, or let user name one:
   ```
   A few moments we could step into:

     you open the app after a week away
     your friend just pinned a game you've been wanting to play
     a session ended with unresolved tension

   Which draws you? Or name another.
   ```
   WAIT for response.

2. **Set the scene and voice the concept.** Ground briefly, then draft what the concept might say:
   ```
   You're here. A week has passed. You open the app.

   The concept might say:

     "Two sessions happened while you were away.
      Your friends missed you at the Dune game."

   Quiet, factual, with a thread of warmth. No guilt.
   ```
   The user reacts: "That feels right" / "Too much" / "More playful"
   WAIT for response. Refine based on reaction.

3. **Explore variations.** Surface character through contrast:
   ```
   What if you'd been away for a month instead of a week?
   Would the tone shift?

     "It's been quiet. When you're ready, here's what's waiting."

   Or would it stay the same?
   ```
   WAIT for response.

4. **Capture the moment.** Before moving on, crystallize:
   ```
   So in this moment — returning after absence — the concept:
     speaks: quietly, factually, with warmth underneath
     withholds: guilt, urgency, "you missed out"
     rhythm: immediate but not demanding
   ```
   Ask: "Does this capture it?"
   WAIT for confirmation.

5. **Another moment or step back:**
   ```
   another moment, or step back and see what patterns are emerging
   ```
   If stepping back → synthesize patterns. If another moment → return to step 1.

6. **See the patterns.** After 2-3 moments:
   ```
   Across these moments, a voice is taking shape:

     [observation about tone]
     [observation about rhythm]
     [observation about restraint]

   Does this feel like the concept's character?
   ```
   WAIT for response.

7. **Capture in Tone & Communication.** Propose scenario-based content:
   ```
   Here's what might go in Tone & Communication:

   ---
   **Returning after absence**
     "Two sessions happened while you were away."
     Quiet, factual, warmth underneath. No guilt, no urgency.

   **Friend pins something you love**
     "Marcus pinned Dune. You're already on the list."
     Playful assumption of your interest. Respects your autonomy.
   ---

   Should I apply this?
   ```
   WAIT for confirmation. The section becomes a collection of moments — each one a window into the concept's voice.

7. After any proposed changes, ask:
   > "Should I apply this?"

8. **WAIT** for explicit confirmation. If approved:
   - Use Edit/Write to update `concept.md`
   - Preserve all existing content (move, don't delete)
   - Update `last_touched` in `manifest.json`

9. After significant work, offer:
   ```
   keep going, or step back and see where things stand
   ("explore [concept]", "show me [concept]")
   ```

   **If Tone & Communication is still thin after expanding/deepening/restructuring**, add:
   ```
   the voice is still quiet — want to step into a moment and see what it would say?
   ```

---

## Relationship Mode (2+ concepts)

**Purpose:** Explore what lives between concepts. Find connections.

If fewer than 2 concept ids provided, ask: "Which concepts would you like to explore together?"

**Steps:**

1. Open `manifest.json` and resolve each concept id.

2. Read each `concept.md`, focusing on:
   - Real-World Impulse
   - Glowing Connections
   - Ecosystem Integration (if present)

3. Begin with:
   > "Let's see what lives between these..."

   Then surface initial observations:
   - Shared impulses or themes
   - Complementary surfaces
   - Possible flows between them

4. Ask:
   > "When you think of these together, what feels connected?"

5. **WAIT** for the user's response.

6. Generate a relational understanding (not a formal map, just clear observations):
   - How they might support each other
   - Where they overlap or complement
   - Potential integration points

7. Propose updates to each concept's "Glowing Connections" section:
   - Reference the other concept(s)
   - Describe the relationship in grounded terms

8. Ask:
   > "Should I add these connections to the concept files?"

9. **WAIT** for confirmation. If approved:
   - Update "Glowing Connections" sections in each concept
   - Update `last_touched` in `manifest.json`

10. After significant work, offer:
    ```
    keep going, or step back and see where things stand
    ("explore [concept]", "show me [concept]", "where am I")
    ```

    **If patterns emerged that reach beyond these concepts**, also offer:
    ```
    something is taking shape between these concepts — "explore [concept-1] and [concept-2]" to see the threads
    ```

---

## Do NOT:
- Force a mode — let the alive-thread question guide
- Generate overwhelming options (2-3 max)
- Rewrite entire files without explicit permission
- Delete content — move it if reorganizing
- Rush through multiple changes without confirmation
- Demand completeness or full definitions
- **Read origin files** (`concepts/<id>/origins/`) unless user explicitly engages with a held thread offering — the index is enough to offer, and origins may be outdated
- **Update concept.md directly when a draft exists** — all changes go to the draft file
- **Settle implicitly** — always ask user whether to create revision or save for later
