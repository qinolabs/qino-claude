# Tools Overview

This guide helps you choose the right tool for your needs.

## Quick Comparison

| Aspect | Dev Assistant | Design Sprint |
|--------|-------------------------|---------------|
| **Purpose** | Transform concepts into living dev environments | Explore complex design challenges |
| **Duration** | 20-30 minute guided session | Single invocation (generates 40-50 exchanges) |
| **Output** | 5 personalized commands + guide + roadmap | 7-11 files organized by emergent questions |
| **Best For** | Starting new projects | Making design decisions |
| **Ongoing Use** | Daily development workflow | One-off explorations |
| **Approach** | Vision-aligned implementation | Multi-perspective dialogue |

## Dev Assistant

### What It Is
A guided exploration system that transforms app concepts into personalized development environments with vision-aligned commands.

### When to Use
- ✅ Starting a new project
- ✅ Need ongoing development support
- ✅ Want commands that understand your vision
- ✅ Building features over time
- ✅ Need roadmap and iteration planning

### What You Get
**5 Core Commands:**
- `/[project]:start` - Context-aware guidance
- `/[project]:build` - Vision-aware feature development
- `/[project]:review` - Alignment checking
- `/[project]:evolve` - Vision evolution
- `/[project]:help` - Natural language interface

**Supporting Files:**
- Project guide (`.claude/concepts/[project]-guide.md`)
- Iteration roadmap (`.claude/iterations/[project]-iterations.md`)
- Exploration log (`.claude/init-logs/[project]-init.md`)

### Process
1. Write concept file describing your app
2. Run `/core:project-init concept.md`
3. Experience 20-30 minute guided exploration
4. Use generated commands for daily development
5. Create iteration plan when ready with `/core:iteration-plan`

### Example Use Case
> "I want to build a recipe sharing app focused on family stories. I need ongoing development support with commands that keep me aligned to the warm, personal vibe."

→ Use Dev Assistant

## Design Sprint

### What It Is
A multi-perspective design exploration tool that runs dialogue between six personas and organizes discoveries around domain-specific questions.

### When to Use
- ✅ Facing a complex design decision
- ✅ Need multiple perspectives on a problem
- ✅ Exploring tensions and trade-offs
- ✅ Want domain-specific questions (not generic templates)
- ✅ Need to think before implementing

### What You Get
**7-11 Files per Sprint:**
- `__enter-here.md` - Atmospheric navigation map
- `__the-room.md` - Environmental storytelling artifact
- `dialogue.md` - Full 40-50 exchange conversation
- `q-[domain-question].md` (5-7 files) - Question-oriented analysis
- `synthesis.md` - Paths forward

**Six Personas:**
- The Skeptic (pressure-tests ideas)
- The Synthesizer (finds patterns)
- The Embodied Thinker (felt sense)
- The User Advocate (user needs)
- The Architect (system implications)
- The Explorer (creative reframes)

### Process
1. Identify design challenge
2. Run `/design-sprint Your challenge here`
3. Receive 7-11 files with emergent questions
4. Navigate by question or read full dialogue
5. Choose path forward from synthesis

### Example Use Case
> "I'm stuck on how to handle real-time collaboration UX. Should presence be always-visible or contextual? How do we avoid overwhelming users? I need to explore this tension before building."

→ Use Design Sprint

## Key Differences

### Scope
- **Story-Driven Dev**: Full project lifecycle
- **Design Sprint**: Single design challenge

### Output Nature
- **Story-Driven Dev**: Executable commands for ongoing use
- **Design Sprint**: Exploration artifacts for decision-making

### Interaction Model
- **Story-Driven Dev**: Conversational, iterative, guided by Claude
- **Design Sprint**: Single invocation, generates complete dialogue

### Questions Generated
- **Story-Driven Dev**: Exploration questions during 20-30 min session
- **Design Sprint**: 5-7 domain-specific questions that emerge from dialogue

### Time Investment
- **Story-Driven Dev**: 20-30 minutes exploration + ongoing command use
- **Design Sprint**: 5-10 minutes reading generated outputs

## When to Use Both

These tools complement each other:

1. **Start with Story-Driven Dev** to create your development environment
2. **Use Design Sprint** when facing complex design decisions during development
3. **Feed Sprint insights back** into vision evolution via `/[project]:evolve`

### Example Workflow

```bash
# 1. Initialize project
/core:project-init recipe-app.md
# → 20-30 min exploration
# → Get /recipe:* commands

# 2. Start development
/recipe:start
/recipe:build "user profiles"

# 3. Hit design challenge
/design-sprint How should recipe visibility work - public/private/circles?
# → Get 7-11 files exploring the tension

# 4. Integrate insights
/recipe:evolve
# → Update vision with sprint discoveries

# 5. Continue building
/recipe:build "implement privacy model from sprint insights"
```

## Choosing the Right Tool

### Choose Dev Assistant if you need:
- A complete development environment
- Ongoing vision-aligned support
- Personalized project commands
- Iteration planning and roadmaps
- Long-term project guidance

### Choose Design Sprint if you need:
- Multi-perspective exploration
- Domain-specific questions
- Design decision support
- Tension and trade-off analysis
- Pre-implementation thinking

### Use Both if you want:
- Vision-aligned development environment (Story-Driven)
- Deep exploration of specific challenges (Design Sprint)
- Integrated workflow where insights feed back into vision

## Installation

Both tools can be installed independently:

**Dev Assistant:**
```bash
cp -r tools/dev-assistant/ /path/to/project/.claude/
```

**Design Sprint:**
```bash
cp tools/design-sprint/commands/design-sprint.md /path/to/project/.claude/commands/
cp tools/design-sprint/agents/design-sprint.md /path/to/project/.claude/agents/
```

## Philosophy

Both tools share a belief: **we build better when we stay connected to what matters.**

- **Dev Assistant** maintains that connection through vision-aware commands and contextual intelligence
- **Design Sprint** maintains it through multi-perspective dialogue and emergent questions

Together, they create a development environment where thoughtful exploration and aligned implementation reinforce each other.
