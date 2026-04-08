# Template Guidance

How to use iteration and implementation templates to capture learnings through colocation.

## Key Principle

**Learnings live where work happens** - no separate systems to maintain.

## Iteration Template Usage

### When to Use

Create a new iteration file when starting work on a significant feature or architectural change:

```bash
# Example
implementations/qino-world/iterations/07-crossing-visual-treatment.md
```

### How to Fill Sections

#### Scope
Brief overview (2-3 sentences) of what this iteration accomplishes.

#### Goals
Concrete checkboxes. Keep 3-5 goals max. Check them off as you complete.

#### Test Before Moving On
How do you know this iteration is done? Specific test criteria.

#### Technical Decisions
**This is where learning happens.** Document decisions with context:

```markdown
### Optional userId Parameter for seed()

**Problem discovered:** Arc needed to seed World while recording encounters in Journey, but World's `/seed` page needed local-only seeding without Journey overhead.

**What we tried:** Considered separate `seedLocal()` and `seedWithEncounters()` methods.

**Why optional parameter:** Single method serves both use cases. The optional parameter encodes the use-case branching without fragmenting the API.

**Generalizes to:** Services with both standalone and ecosystem modes can use optional parameters to encode context.

**Related:** See [Seeding Architecture](../../docs/seeding-architecture.md#rpc-method-signature-patterns)
```

**Key elements:**
- ✅ Discovery context (why this decision was needed)
- ✅ Alternatives tried (even if briefly)
- ✅ Reasoning (why chosen approach won)
- ✅ Pattern recognition (what this teaches us)
- ✅ Cross-links (where to learn more)

#### Learnings

**What Shifted:**
Understanding that changed during this iteration. Not just "we learned X" but "we thought Y, discovered Z, now understand X."

Example:
```markdown
### What Shifted
- Started thinking crossing needed real-time sync → realized mid-conversation snapshots work better
- Assumed seeding was simple data population → discovered it's actually a two-level architecture pattern
```

**What Worked:**
Approaches that proved effective. Useful for future iterations and other apps.

**What Surprised Us:**
Unexpected discoveries. Often reveals implicit assumptions or gap in understanding.

**Led To:**
Downstream effects - new documentation created, patterns recognized, design changes in other iterations.

Example:
```markdown
### Led To
- Created seeding-architecture.md to document the two-level pattern
- Realized Journey needs cascading cleanup (added to Arc's clearModality)
- Informed qino-walk seed design in iteration 03
```

### When to Update

**During the iteration:**
- Add Technical Decisions as they're made
- Update goals as you check them off

**At completion:**
- Fill in Learnings section (reflection on what changed)
- Update Status to "Complete"
- Cross-link from implementation.md if decision is significant

## Implementation.md Usage

### Technical Decisions Section

This section **grows over time** as significant decisions are made. Unlike iterations (which are finite), implementation.md is a living document.

**When to add a decision:**
- Major architectural choice
- Significant trade-off that affects design
- Pattern discovered that generalizes
- Decision that other apps should know about

**Format:**
```markdown
### Journey Encounter Cleanup (2025-01-18)

**Problem discovered:** When clearing a modality's database, orphaned Journey encounters created duplicate figures when re-seeding.

**What we tried:** Initially just cleared World database via `/seed` page clear button.

**Why cascade cleanup:** Arc's `clearModality()` must clear both database and Journey encounters in parallel to prevent orphaned references.

**Generalizes to:** Any cross-service state management - deletes must cascade.

**Related:** See [Iteration 04](./iterations/04-crossing-orchestration.md#learnings) for the duplicate figures bug discovery.
```

### Related Documentation Section

**Structure:**
```markdown
## Related Documentation

### App-Specific
- [Animation Guide](../../apps/qino-world/animation-guide.md)
- [Debugging Stuck Crossing](../../apps/qino-world-backend/DEBUGGING_STUCK_CROSSING.md)

### Research
- [Character Coherence Analysis](./research/character-coherence-analysis.md)
- [Drag & Drop Research](./research/qino-world-drag-drop-research.md)

### Testing
- [D1 Testing Guide](../../apps/qino-world-backend/test/D1-TESTING-GUIDE.md)

### Ecosystem Architecture
- [Seeding Architecture](../docs/seeding-architecture.md)
- [Seeding Conceptual Guide](../docs/seeding-conceptual-guide.md)
```

**Maintenance:**
- Add links as relevant documentation is created
- Don't link exhaustively - only what's directly relevant
- Use relative paths for portability

## Ecosystem Docs Pattern

When creating cross-app documentation in `implementations/docs/`, include discovery narrative in the Problem section:

```markdown
# Pattern Name

## Problem

**Initial confusion:** {{WHAT_SEEMED_WRONG}}

**First hypothesis:** {{INITIAL_SOLUTION_ATTEMPT}}

**What we discovered:** {{WHAT_ACTUALLY_HAPPENED}}

**The insight:** {{AHA_MOMENT}}

**Led to:** {{THE_SETTLED_PATTERN}}

## Solution
[The settled architecture...]
```

This transforms reference docs into teaching docs without changing structure.

## Navigation Through CLAUDE.md

### Hierarchy

```
/Users/picard/Code/qinolabs/CLAUDE.md
  → Workspace-level navigation (multi-repo)
  → Points to qinolabs-repo/CLAUDE.md

/Users/picard/Code/qinolabs/qinolabs-repo/CLAUDE.md
  → Monorepo-level navigation
  → Points to implementations/docs/ for architecture
  → Points to .claude/rules/ for conventions
  → Points to apps/{app}/CLAUDE.md for app context

apps/{app}/CLAUDE.md
  → App-level quick reference
  → Points to implementations/{app}/implementation.md
  → Points to app-specific docs/

implementations/{app}/implementation.md
  → Technical boundaries and accumulated decisions
  → Links to iterations/ and research/
  → Links to ecosystem docs in implementations/docs/
```

### CLAUDE.md as Entry Point

**CLAUDE.md files should:**
- ✅ Be short (200-400 lines max for monorepo level)
- ✅ Point to documentation, not duplicate it
- ✅ Provide quick reference and navigation
- ✅ Be context-appropriate (workspace vs repo vs app)

**CLAUDE.md files should NOT:**
- ❌ Contain full architecture documentation
- ❌ Duplicate information from other files
- ❌ Be the only place information lives

## Examples

### Good Technical Decision Entry

```markdown
### seed(userId?: string) - Journey Integration Pattern

**Problem discovered:** Arc needed to seed World while recording encounters in Journey, but World's `/seed` page needed local-only seeding without Journey overhead.

**What we tried:** Considered separate `seedLocal()` and `seedWithEncounters()` methods.

**Why optional parameter won:** Single method serves both use cases. The optional parameter encodes the use-case branching without fragmenting the API.

**Trade-off:** Dual-purpose function is less obvious, but prevents method proliferation.

**Generalizes to:** Services with both standalone and ecosystem modes can use optional parameters to encode context.

**Related:** See [seeding-architecture.md](../../docs/seeding-architecture.md#rpc-method-signature-patterns) for the two-level pattern this enabled.
```

### Good Learnings Section

```markdown
## Learnings

### What Shifted
- Started thinking seeding was simple test data → discovered it's actually a two-level architecture (local + ecosystem)
- Assumed one seed UI would suffice → realized different contexts need different tools
- Thought Journey cleanup was automatic → learned it requires explicit orchestration

### What Worked
- Optional userId parameter pattern for dual-use methods
- Pre-seeded conversation history for realistic crossing tests
- Parallel Promise.all() for modality + Journey cleanup

### What Surprised Us
- Test data creation took longer than UI implementation
- Crossing scenarios became a conceptual framework, not just fixtures
- The seven dimensions of seeding (substrate, facets, lenses...) emerged from practical need

### Led To
- Created seeding-architecture.md and seeding-conceptual-guide.md
- Influenced qino-walk and qino-drops seed design
- Established pattern: services with dual contexts use optional parameters
```

## Anti-Patterns

### ❌ Outcome-Only Decision

```markdown
### seed(userId)
Optional userId parameter enables Journey encounter recording.
```

**Problem:** No context, no learning, no pattern recognition.

### ❌ Separate Learnings File

```markdown
# LEARNINGS.md

## 2025-01-18
We learned that seeding needs userId...
```

**Problem:** Creates fragmentation. Agents don't know to look here. Drifts from context.

### ❌ Exhaustive Cross-Linking

```markdown
## Related Documentation
- [Every](./link) [possible](./related) [file](./in) [the](./repo)
```

**Problem:** Noise. Link only what's directly relevant.

---

## Summary

**Learnings through colocation:**
- Iterations capture what shifted during focused work
- Implementation.md accumulates major decisions over time
- Ecosystem docs include discovery narrative in Problem sections
- CLAUDE.md files provide navigation, not duplication

**Key principle:**
If you skip adding learnings, the doc still works - just less rich. This creates **resilience through colocation** rather than fragility through separate systems.

---

**Last Updated:** 2025-01-18
**Status:** Foundation established
