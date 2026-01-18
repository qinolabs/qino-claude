# Repository Structure Conventions

Qino repositories follow consistent structural patterns based on repo type. Agents should use these conventions rather than hardcoded paths.

## Convention Over Configuration

**Don't maintain structure maps in qino-config.json** - this creates drift risk. Instead, recognize the pattern from `repoType` and follow conventions.

---

## Implementation Repositories

**Identifier**: `"repoType": "implementation"` in `.claude/qino-config.json`

**Structure Convention**:
```
implementations/
  docs/                    # Ecosystem-level architecture docs
  {app}/                   # App-specific context
    implementation.md      # Technical context, boundaries, decisions
    iterations/            # Iteration files (01-name.md, 02-name.md, ...)
    research/              # App-specific research (if needed)

apps/
  {app}/                   # Actual code
    docs/                  # App-local design specs (if needed)
    src/

.claude/
  references/
    qino-dev/
      templates/           # Iteration and implementation templates
      template-guidance.md # How to capture learnings
```

**Navigation Pattern**:
- Ecosystem docs: `implementations/docs/`
- App context: `implementations/{app}/implementation.md`
- Iterations: `implementations/{app}/iterations/`
- Templates: `.claude/references/qino-dev/templates/`
- Code: `apps/{app}/`

**When user says...**:
- "ecosystem docs" / "cross-app patterns" → `implementations/docs/`
- "implementation notes" / "app context" → `implementations/{app}/`
- "iterations" → `implementations/{app}/iterations/`
- "the code" / "source" → `apps/{app}/`

---

## Concepts Repositories

**Identifier**: `"repoType": "concepts"` in `.claude/qino-config.json`

**Structure Convention**:
```
ecosystem/               # Shared domain/architecture
  qino-domain-language.md
  journey/
  lens/

concepts/
  {id}/                  # Individual concept
    concept.md           # The settled concept (living document)
    revisions.md         # Evolution log (why concept changed)
    origins/             # Historical seeds (static archive)

notes/                   # Cross-concept reflections (active)
  {name}.md

chronicle/               # Narrative output

manifest.json            # Registry of all concepts
  held_threads           # Unresolved questions per concept
```

**revisions.md Format** (centralized evolution tracking):
```markdown
# Revisions

## [DATE]: [Concise Title of Change]

- **Context**: Why this revision matters / what triggered it
- **Previous**: What the old framing/terminology was
- **New**: What changed and how it's described now
- **Reasoning**: The insight or principle driving the change
```

**Navigation Pattern**:
- Ecosystem docs: `ecosystem/`
- Concept: `concepts/{id}/concept.md`
- Historical seeds: `concepts/{id}/origins/`
- Active reflections: `notes/`
- Open questions: `manifest.json` (held_threads field)
- Registry: `manifest.json`

**When user says...**:
- "ecosystem" / "domain docs" → `ecosystem/`
- "the concept" / "vision" → `concepts/{id}/concept.md`
- "origins" / "seeds" / "source material" → `concepts/{id}/origins/`
- "notes" / "reflections" → `notes/`
- "open questions" / "held threads" → Check `manifest.json`

---

## Research Repositories

**Identifier**: `"repoType": "research"` in `.claude/qino-config.json`

**Structure Convention**:
```
manifest.json            # Registry of inquiries, qualities, arcs

inquiries/               # Open-ended research threads
  {id}/
    thread.md            # Living inquiry document
    fragments/           # Collected material

qualities/               # Aesthetic refinement
  {quality}/
    research.md          # Core principles, distinctions
    transformations.md   # Transformation attempts
    examples/            # Test corpus

arcs/                    # Emergence patterns
  YYYY-MM-DD_{id}.md     # Arc capture
```

**Two-tier hierarchy**:
- **Ecosystem level**: manifest.json (registry)
- **Scoped level**: inquiries/{id}/, qualities/{quality}/, arcs/{date-id}

**Navigation Pattern**:
- Active inquiries: `inquiries/{id}/thread.md`
- Completed qualities: `qualities/{quality}/research.md`
- Emergence patterns: `arcs/*.md`
- Registry: `manifest.json`

**Learnings capture**:
- qualities/{quality}/transformations.md — Process + extracted principles (parallel to Technical Decisions)
- arcs/{date-id}.md — Emergence patterns (ecosystem memory)

---

## Cross-Repo References

**From implementation → concept**:
```markdown
## Concept Source

**Linked**: ../concepts-repo/concepts/{id}/concept.md

For essence questions: `explore {id}`
```

**From concept → implementation** (proposed):
```markdown
## Implementations

- [qino-world](../qinolabs-repo/implementations/qino-world/implementation.md)
- [qino-drops](../qinolabs-repo/implementations/qino-drops/implementation.md)
```

**Qino-config provides**:
- `repoType` - determines convention set
- `conceptsRepo` - path to concepts repository
- `implementationRepo` - path to implementation repository
- `researchRepo` - path to research repository
- `linkedConcepts` - maps package names to concept IDs

**Qino-config does NOT provide**:
- Directory structure maps (use conventions above)
- File paths (derive from conventions + repoType)

---

## Resolving User Intent

When user refers to ambiguous locations, use repoType + conventions:

| User Says | Implementation Repo | Concepts Repo | Research Repo | Pattern |
|-----------|---------------------|---------------|---------------|---------|
| "notes" | `implementations/{app}/iterations/` | `notes/` | `inquiries/{id}/fragments/` | Context-dependent |
| "ecosystem docs" | `implementations/docs/` | `ecosystem/` | N/A | Top-level shared |
| "implementation" | `implementations/{app}/` | `{conceptsRepo}/implementations/{app}/` | N/A | Scoped context |
| "the code" | `apps/{app}/` | N/A | N/A | Actual artifact |
| "iterations" | `implementations/{app}/iterations/` | N/A | N/A | Staged work (implementation only) |
| "origins" / "seeds" | N/A | `concepts/{id}/origins/` | N/A | Historical archive (concepts only) |
| "inquiries" / "threads" | N/A | N/A | `inquiries/{id}/thread.md` | Active research |
| "learnings" | Technical Decisions sections | `revisions.md` | `qualities/{quality}/transformations.md` | Evolution tracking |
| "open questions" | Iteration's goals/blockers | `manifest.json` held_threads | `thread.md` Open Threads | Unresolved work |

---

## Why Conventions Over Configuration

**Fragility of structure maps**:
- Paths declared in qino-config can drift from reality
- Every directory change requires config update
- Agents trust stale config over actual file system

**Resilience of conventions**:
- Pattern emerges from actual usage
- Directory changes don't break anything (convention adjusts)
- Agents verify by reading filesystem, not config
- Graceful degradation when structure varies slightly

**Example**: If an app doesn't have `research/` subdirectory, that's fine - agent checks and adapts. If config declares it must exist, agent gets confused when it doesn't.

---

## For Agent Developers

When writing agent logic:

1. **Read qino-config for repoType** (not structure paths)
2. **Apply conventions** based on repo type
3. **Verify with filesystem** (glob/read to check what exists)
4. **Adapt gracefully** if structure varies

```typescript
// GOOD - Convention-based
function getEcosystemDocs(repoType: string) {
  return repoType === "implementation"
    ? "implementations/docs"
    : "ecosystem";
}

// BAD - Config-based (creates maintenance burden)
function getEcosystemDocs(config: QinoConfig) {
  return config.structure.ecosystem; // Drift risk!
}
```

---

**Last Updated**: 2025-01-18
**Status**: Foundation established
