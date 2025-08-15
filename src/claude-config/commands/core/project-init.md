# Project Init: Streamlined Development Environment

Transform your concept into a focused development environment through guided exploration, generating just the commands you need to build with vision.

## Usage

**One command handles everything:**

```bash
# Single concept - works anywhere
/core:project-init my-concept.md

# Multiple concepts - auto-detects monorepo intent  
/core:project-init concept1.md concept2.md concept3.md

# Folder of concepts
/core:project-init concepts/
```

**Always creates namespaced commands:**
- `auth-service.md` → `/auth:build`, `/auth:start`, etc.
- `user-dashboard.md` → `/dashboard:build`, `/dashboard:start`, etc.
- Works the same whether you have 1 concept or 10

## Execution Instructions

**IMPORTANT**: After reading the concept file(s), IMMEDIATELY begin the onboarding process. Do not wait for further instruction. Start with the opening synthesis and guide the developer through the conversational exploration described below.

## Process

### Phase 1: Pattern Recognition & Synthesis Preparation (5 minutes)

After reading the concept, immediately analyze it and prepare bold but digestible insights:

1. **Core Transformation Mapping**
   - Identify the user evolution you're creating
   - Recognize the technical-emotional architecture
   - Map system dynamics and interaction patterns
   - See the command structure emerging

2. **Synthesis Preparation**
   - Connect patterns across domains
   - Generate architectural possibilities
   - Prepare creative leaps and insights
   - Plan digestible presentation of big ideas

3. **Bold Opening Design**
   - Present compelling synthesis immediately
   - Show unexpected connections
   - Focus on one energizing aspect
   - Make them excited about possibilities

### Phase 2: Focused Exploration (20-30 minutes)

**BEGIN IMMEDIATELY**: Start the conversational onboarding now. Use the opening synthesis template to present your first insight, then guide through the 5 chapters. Follow the onboarding behavior instructions in `/instructions/onboarding-behavior.md` and synthesize the concept through architectural insights using the templates in `/templates/`:

1. **Synthesis-Driven Approach**
   - Present bold pattern recognition
   - Generate unexpected connections
   - Build architectural understanding incrementally
   - Focus on one insight at a time

2. **Chapter-Based System Building**
   We'll synthesize these architectural layers:
   - Chapter 1: First Contact → Identity formation & entry transformation
   - Chapter 2: Core Loop → Repeatable value & system dynamics  
   - Chapter 3: Social Fabric → Community architecture & behavioral patterns
   - Chapter 4: Evolution & Growth → Scaling challenges & growth vectors
   - Chapter 5: Technical Philosophy → Architecture serving experience goals

3. **Creative Synthesis Method**
   For each area:
   - Map the transformation happening
   - Connect technical & emotional architecture
   - Generate possibilities they haven't seen
   - Present one compelling insight per exchange

4. **Core Command Contextualization**
   Through synthesis:
   - The 5 core commands (start, build, check, evolve, help) are contextualized with insights
   - Command behavior connects to architectural understanding
   - Development flow serves the vision through the established commands

### Phase 3: Streamlined Artifact Generation

Generate a minimal, powerful development environment:

1. **Single Project Guide**
   Using simplified template:
   ```
   .claude/
   ├── [project]-guide.md      # Everything you need in one place
   └── commands/[project]/     # Just 5 core commands
   ```

2. **Core Command Set**
   Generate exactly 5 commands using `core-commands-template.md`:
   ```
   .claude/commands/[project]/
   ├── start.md          # Intelligent context-aware guide
   ├── build.md          # Main development with embedded vision
   ├── check.md          # Quick alignment when needed
   ├── evolve.md         # Vision growth and learning
   └── help.md           # Natural language fallback
   ```

3. **No Separate Workflows**
   Vision protection is embedded:
   - Build command includes alignment checks
   - Start command provides contextual guidance
   - No interrupting rituals or practices

### Phase 4: Unified Output Structure

Always creates the same structure, designed to scale from single project to monorepo:

```
.claude/
├── concepts/
│   └── [namespace]-guide.md  # One guide per concept/namespace
├── commands/
│   └── [namespace]/          # One folder per concept/namespace
│       ├── start.md
│       ├── build.md
│       ├── check.md
│       ├── evolve.md
│       └── help.md
└── init-logs/
    └── [namespace]-init.md   # One init log per concept/namespace
```

**IMPORTANT**: This structure is identical whether you have 1 concept or 100. A single project can seamlessly grow into a monorepo without restructuring.

**Single concept example:**
```
.claude/
├── concepts/
│   └── dashboard-guide.md
├── commands/
│   └── dashboard/
│       └── [5 commands]
└── init-logs/
    └── dashboard-init.md

# Usage: /dashboard:start, /dashboard:build
```

**Multiple concepts example:**
```
.claude/
├── concepts/
│   ├── auth-guide.md
│   ├── dashboard-guide.md
│   └── payment-guide.md
├── commands/
│   ├── auth/
│   ├── dashboard/
│   └── payment/
└── init-logs/
    ├── auth-init.md
    ├── dashboard-init.md
    └── payment-init.md

# Usage: /auth:build, /dashboard:build, /payment:build
```

**Key Principles:**
- Each concept gets its own init log in `init-logs/[namespace]-init.md`
- Structure is identical for 1 or N concepts
- Can start with one concept and add more without restructuring
- Everything stays organized in `.claude/` directory

### Phase 5: Clear Next Steps

1. **Command Calibration**
   Based on onboarding insights:
   - Customize the 5 core commands with project-specific context
   - Add specific implementation notes from discussions
   - Include warnings about discovered edge cases
   - Embed excitement from breakthrough moments

2. **Vision Crystallization**
   Create clear artifacts:
   - One-line truth about your product
   - Transformation promise for users
   - Technical principles serving experience
   - Red flags for vision drift

3. **Your Starting Point**
   ```bash
   /[namespace]:start
   
   # This intelligent command will:
   # - Analyze your context
   # - Suggest the perfect first step
   # - Guide you naturally forward
   # - Direct you to the right core command
   ```

### Phase 6: Intelligent Evolution

The system grows with you:

1. **Embedded Protection**
   - Build command detects drift naturally
   - Start command suggests when to check alignment
   - No manual tracking needed

2. **Natural Discovery**
   - Commands suggest features based on context
   - Help command learns your patterns
   - Complexity revealed progressively

3. **Continuous Learning**
   - System adapts to your development style
   - Vision evolves through actual building
   - No separate planning sessions

## Output Structure

Consistent, scalable structure for any number of concepts:

```
.claude/
├── concepts/
│   └── [namespace]-guide.md  # Complete vision per concept
├── commands/
│   └── [namespace]/          # Commands per concept
│       ├── start.md          # Intelligent guide
│       ├── build.md          # Development with vision
│       ├── check.md          # Alignment verification
│       ├── evolve.md         # Vision growth
│       └── help.md           # Natural language support
└── init-logs/
    └── [namespace]-init.md   # Exploration record per concept
```

## Usage Examples

```bash
# Single concept
/core:project-init dashboard.md
# → Creates /dashboard:start, /dashboard:build, etc.

# Multiple concepts  
/core:project-init auth.md dashboard.md orders.md
# → Creates /auth:build, /dashboard:build, /orders:build

# Works anywhere - standalone or monorepo
cd apps/my-new-app
/core:project-init my-app.md
# → Creates my-new-app/.claude/ with /myapp:build
```

## Success Metrics

The init process succeeds when:
- You know exactly where to start
- Commands feel natural, not poetic
- Vision protection is invisible but effective
- Building feels guided, not interrupted
- The system adapts to how you work

## Philosophy

**Less is More**: Start with 5 commands, not 50. Complexity emerges from use, not planning.

**Embedded Guidance**: Vision protection happens while building, not through separate rituals.

**Progressive Disclosure**: Show what's needed when it's needed, not everything at once.

**Natural Language**: When in doubt, just ask. The system understands intent, not just commands.