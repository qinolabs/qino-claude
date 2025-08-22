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

## Template Architecture

The system uses 4 focused templates with clear dependencies:

### Core Templates
1. **`/templates/onboarding-flow.md`** - Complete 20-30 minute exploration process
2. **`/templates/command-generation.md`** - Creates 5 intelligent commands  
3. **`/templates/project-guide.md`** - Consolidated project reference
4. **`/templates/decision-patterns.md`** - Architectural intelligence library

### Supporting Instructions
- **`/instructions/onboarding-behavior.md`** - Communication patterns and synthesis techniques

## Process

### Phase 1: Pattern Recognition & Opening Synthesis (2-3 minutes)

After reading the concept file(s), immediately begin with bold pattern recognition using `/templates/onboarding-flow.md`:

1. **Communication Style Calibration**: Determine how developer prefers to process information
2. **Bold Pattern Recognition**: Generate immediate excitement through authentic AI synthesis
3. **Energy Calibration**: Adjust approach based on developer response patterns

### Phase 2: 5-Chapter Exploration (20-25 minutes)

**BEGIN IMMEDIATELY**: Conduct the complete conversational exploration using `/templates/onboarding-flow.md`. Integrate decision intelligence from `/templates/decision-patterns.md` throughout:

**Chapter Structure**:
1. **First Contact** → Identity & Entry transformation (4-5 min)
2. **Core Experience Loop** → Value & system dynamics (4-5 min)  
3. **Social Fabric** → Community & connection patterns (4-5 min)
4. **Evolution & Growth** → Scaling & progression (4-5 min)
5. **Technical Philosophy** → Architecture & boundaries (4-5 min)

**Communication Guidelines**: Follow `/instructions/onboarding-behavior.md` for authentic AI synthesis with connection-making phrases and failure recovery patterns.

### Phase 3: Command Generation (2-3 minutes)

Generate the 5 intelligent commands using `/templates/command-generation.md`:

**Command Intelligence Features**:
- **Contextual awareness**: Commands read project state and development patterns
- **Vision alignment**: Each command embeds project vision into daily decisions
- **Personality adaptation**: Commands adapt to established communication preferences
- **Progressive disclosure**: Start simple, reveal complexity when needed

**Generated Commands**:
```
.claude/commands/[project]/
├── start.md          # Intelligent context-aware guidance
├── build.md          # Vision-aware development with decision intelligence  
├── review.md         # Code review with alignment checking
├── evolve.md         # Structured vision evolution and learning integration
└── help.md           # Natural language interface and command routing
```

### Phase 4: Project Guide Generation (1-2 minutes)

Create consolidated project reference using `/templates/project-guide.md`:

**Guide Contents**:
- **Vision summary**: One-line truth and core value proposition
- **Technical foundation**: Stack, complexity budget, architectural principles  
- **Development workflow**: How to use the 5 commands effectively
- **Vision protection**: Green flags, red flags, and course correction guidance
- **Growth strategy**: Natural evolution paths and scaling considerations
- **Communication preferences**: Established working style and accessibility features

## Unified Output Structure

Always creates the same scalable structure, identical for 1 or N concepts:

```
.claude/
├── concepts/
│   └── [namespace]-guide.md  # Complete project guide per concept
├── commands/
│   └── [namespace]/          # 5 intelligent commands per concept
│       ├── start.md         # Context-aware guidance
│       ├── build.md         # Vision-aware development  
│       ├── review.md        # Code review with alignment
│       ├── evolve.md        # Vision evolution support
│       └── help.md          # Natural language interface
└── init-logs/
    └── [namespace]-init.md   # Exploration record per concept
```

**Scalability**: Single project can seamlessly grow into monorepo without restructuring.

**Single concept example:**
```
.claude/
├── concepts/dashboard-guide.md
├── commands/dashboard/[5 commands]  
└── init-logs/dashboard-init.md
# Usage: /dashboard:start, /dashboard:build
```

**Multiple concepts example:**
```
.claude/
├── concepts/[auth-guide.md, dashboard-guide.md, payment-guide.md]
├── commands/[auth/, dashboard/, payment/]
└── init-logs/[auth-init.md, dashboard-init.md, payment-init.md]  
# Usage: /auth:build, /dashboard:build, /payment:build
```

## Next Steps for Developer

After initialization completes:

### Immediate Start
```bash
/[namespace]:start

# This intelligent command will:
# - Analyze your current context (git status, files, etc.)
# - Suggest the perfect first step based on project stage  
# - Guide you naturally into productive development
# - Direct you to appropriate specialized commands
```

### Development Flow
1. **Daily guidance**: `/[namespace]:start` for context-aware direction
2. **Feature development**: `/[namespace]:build "what you want to create"`  
3. **Alignment checking**: `/[namespace]:review` after significant changes
4. **Vision evolution**: `/[namespace]:evolve "new insight"` when learning emerges
5. **General help**: `/[namespace]:help "any question"` for natural language support

### Intelligence Features
- **Embedded vision protection**: Commands detect drift and guide alignment naturally
- **Contextual awareness**: System understands project stage, recent work, and patterns  
- **Personality adaptation**: Commands remember communication preferences from onboarding
- **Progressive complexity**: Start simple, reveal advanced features when appropriate
- **Natural evolution**: Vision grows through building, not separate planning sessions

### System Growth
The generated commands become more intelligent over time:
- Learn from your development patterns and preferences
- Adapt suggestions based on project evolution
- Maintain vision alignment as project grows and changes
- Support seamless scaling from prototype to production

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