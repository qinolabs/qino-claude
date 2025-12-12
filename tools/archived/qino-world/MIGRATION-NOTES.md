# Migration Notes: qino-scribe → qino-world

This document tracks what was migrated, what was intentionally left out, and what may need to be reintegrated.

---

## What Was Migrated

### From voice-guide.md → soul.md
- The author's mind (how to think about diffs as story material)
- The wanderer (strangeness, traveler not hero, vulnerability, person not camera)
- Voice spectrums (formality, distance, rhythm)
- Dialogue guidance (people not concepts)
- Complete transformation principle
- Meaning through many channels

### From chapter-format.md + chronicle-spec.md → craft.md
- Chapter format structure
- The wanderer section (unwatched hour)
- World tokens guidance
- manifest.json structure
- world.md structure (enhanced with Pressures)
- Update procedures

### From chapter.md command → process.md + chapter.md
- Git observation workflow
- Story beat proposal format
- Editorial pass
- First chapter flow
- No-changes handling

---

## What Was Intentionally Not Migrated

### 1. Theme Generation Suggestions (from theme-guide.md)

**What it was:** Detailed prompts for generating 8 world-seed suggestions across 15 genre categories.

**Why not migrated:** The extensive genre spectrum (ancient/mythic, silkpunk, lunarpunk, etc.) and detailed "good seeds vs bad seeds" examples are valuable but add significant length. For testing, the process.md mentions genre categories briefly and asks the user what kind of world they want. If theme generation needs more guidance, this can be reintegrated.

**Reintegration path:** Create a separate `theme-generation.md` reference that process.md can point to for first-chapter scenarios.

### 2. Detailed Examples of Ecosystem Events → Story (from voice-guide.md Section 10)

**What it was:** 8 detailed examples showing how different types of ecosystem events (new concept, pattern emerges, feature deepens, something goes dormant, etc.) become narrative.

**Why not migrated:** These examples are helpful but risk becoming templates. The new architecture emphasizes generating options rather than following patterns. The examples in the original also skew toward observation rather than action.

**Reintegration path:** If the agent needs more concrete examples, create examples that show the three-option pattern (expected, unexpected location, complication) rather than single transformations.

### 3. Collective Characters Guidance (from voice-guide.md Section 8)

**What it was:** Specific guidance on making groups feel like individuals, not "philosophy having a meeting."

**Why not migrated:** This is good craft advice but is more specific than the soul.md scope. It's relevant when writing groups like "The Sevenfold" but not universally needed.

**Reintegration path:** Add to craft.md under a "Character Craft" section if group-writing becomes problematic.

### 4. Reading Back for Depth (from voice-guide.md Section 12)

**What it was:** Guidance on when to read origin chapters for characters/locations returning after many chapters.

**Why not migrated:** This is a nuanced workflow consideration that adds complexity. The process.md focuses on the core six-phase flow.

**Reintegration path:** Add as an optional step in Phase 1 (Ground) if needed: "If a character or location is returning after several chapters, consider reading their origin chapter."

### 5. Weaving Forward Section (from voice-guide.md Section 11)

**What it was:** Principles about continuity — characters don't reset, locations have history, arcs build across chapters.

**Why not migrated:** These principles are implicit in the world.md structure (tracking characters, locations, arcs, pressures). Making them explicit again might be redundant.

**Reintegration path:** If continuity becomes an issue, add a brief section to soul.md about the accumulating world.

### 6. Detailed world.md Examples (from chronicle-spec.md)

**What it was:** Full example world.md showing a coastal trading post theme with specific characters (Lantern-Keeper, Seven Voices), locations (Harbor, Pier), etc.

**Why not migrated:** The craft.md includes a structural template. Theme-specific examples might bias the agent toward that imagery.

**Reintegration path:** If agents struggle to initialize world.md, create example files for different theme types.

### 7. qino-scribe-agent.md

**What it was:** Agent definition file with permissions, description, and workflow overview.

**Why not migrated:** The new architecture uses command + references instead of a separate agent definition. The command entry point (`chapter.md`) serves this purpose.

**Reintegration path:** If Claude Code requires an agent definition file, create `agents/qino-world-agent.md` that points to the references.

### 8. Voice Calibration / voice.md (from chronicle-spec.md)

**What it was:** Optional file for storing calibrated voice adjustments per chronicle.

**Why not migrated:** This is a useful feature but adds complexity. The core flow works without it.

**Reintegration path:** Add optional `chronicle/voice.md` support if voice drift becomes an issue across chapters.

---

## Structural Changes

### File Consolidation

| qino-scribe | qino-world | Notes |
|-------------|------------|-------|
| voice-guide.md (600 lines) | soul.md (~200 lines) | Essence only |
| chapter-format.md | craft.md | Combined with spec |
| chronicle-spec.md | craft.md | Combined with format |
| theme-guide.md | process.md (partial) | Theme flow simplified |
| chapter.md command (400 lines) | chapter.md (50 lines) + process.md (300 lines) | Separated entry from workflow |

### New Concepts

**Pressures** — Added to world.md. This is the primary architectural change. Pressures track what's building, providing fuel for future chapters.

**Three Options Pattern** — Process requires generating Expected, Unexpected Location, and Complication before choosing. This forces exploration of alternatives.

**Grounding Check** — Process requires answering "What is alive in this world independent of the diff?" before observing changes.

**Theme Interrogation** — Process requires identifying unexplored places, implied dangers, and missing character types from the theme.

---

## Testing Considerations

When testing qino-world, watch for:

1. **Does the three-options step actually produce variety?** Or does the agent collapse to Option A (expected)?

2. **Do Pressures accumulate meaningfully?** Are they specific enough to create story fuel?

3. **Does the wanderer act?** Or does the one-explanatory-exchange limit just shift explanation to narration?

4. **Is the theme territory explored?** Do chapters venture into unexplored locations?

5. **Is the grounding step happening?** Or is the agent jumping to diff observation?

---

## Potential Reintegration Priority

If testing reveals gaps:

1. **High priority:** Theme generation guidance (if first chapters lack direction)
2. **Medium priority:** Collective character guidance (if groups feel abstract)
3. **Medium priority:** Example transformations (if options lack variety)
4. **Low priority:** Voice calibration, reading-back guidance (refinements)
