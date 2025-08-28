# Project Init: Streamlined Development Environment

Transform your concept into a focused development environment through guided exploration, generating just the commands you need to build with vision.

## How to Use This System

### Step 1: Setup Your Project
1. **Copy claude-config**: Paste the entire `src/claude-config/` folder into your new project
2. **Write your concept**: Create a markdown file describing your project idea (see examples below)
3. **Run initialization**: Use Claude Code to run the init command

### Step 2: Create Your Concept File
Create a simple markdown file describing your project. Examples:

**Simple Project (`my-app.md`):**
```markdown
# Social Recipe Sharing App

An app where home cooks can share family recipes with stories and photos. 
Think Instagram but for recipes with your grandmother's secret ingredients.

Users can:
- Upload recipes with personal stories
- Follow favorite home cooks
- Save recipes to collections
- Rate and comment on dishes they've tried

The vibe should be warm and personal, not clinical like typical recipe sites.
```

**SaaS Project (`analytics-tool.md`):**
```markdown
# Privacy-First Analytics Dashboard

A simple analytics tool for small businesses who want to understand their customers without invasive tracking.

Core features:
- Website traffic insights without cookies
- Customer behavior patterns (respectful)
- Simple, actionable reports
- One-click compliance with privacy laws

Target: Small business owners who care about privacy but need data to make decisions.
```

### Step 3: Run Initialization

```bash
/core:project-init my-app.md
```

### Step 4: Experience the 20-30 Minute Onboarding
- Claude will immediately start a guided exploration
- No additional setup needed - just respond naturally
- The conversation will crystallize your concept into actionable development guidance

### Step 5: Use Your Generated Commands

**Your namespaced commands will be created:**
- `my-app.md` → `/myapp:start`, `/myapp:build`, `/myapp:review`, `/myapp:evolve`, `/myapp:help`
- Each command understands your specific project vision and constraints

**Daily development flow:**
1. `/myapp:start` - Get contextual guidance for where you are
2. `/myapp:build "feature"` - Build features with vision alignment
3. `/myapp:review` - Check alignment after changes
4. `/myapp:evolve` - Update vision as you learn (includes creative catalyst when ready)
5. `/myapp:help` - Natural language support for anything

## What Gets Created

**File structure after initialization:**
```
your-project/
├── src/claude-config/        # The system (you pasted this)
├── .claude/                  # Generated for your project
│   ├── concepts/
│   │   └── myapp-guide.md    # Complete project reference
│   ├── commands/
│   │   └── myapp/            # Your 5 intelligent commands
│   │       ├── start.md
│   │       ├── build.md
│   │       ├── review.md
│   │       ├── evolve.md
│   │       └── help.md
│   ├── iteration.md          # Current iteration focus (auto-created)
│   └── init-logs/
│       └── myapp-init.md     # Record of your onboarding session
```

## Key Benefits

**Vision-Aware Development**: Your commands understand and protect your original vision while you build

**Intelligent Context**: Commands read your project state, recent work, and development patterns

**Creative Catalyst**: When you're ready, the system can challenge assumptions and push creative boundaries (permission-based)

**Scales Seamlessly**: Works identically for single projects or complex monorepos

## Execution Instructions

**IMPORTANT**: After reading the concept file(s), IMMEDIATELY begin the onboarding process. Do not wait for further instruction. Start with the opening synthesis and guide the developer through the conversational exploration described below.

## Template Architecture

The system uses 4 focused templates with clear dependencies:

### Core Templates
1. **`/templates/exploration-process.md`** - Complete 20-30 minute exploration process
2. **`/templates/commands-template.md`** - Creates 5 intelligent commands  
3. **`/templates/guide-template.md`** - Consolidated project reference
4. **`/templates/intelligence-library.md`** - Architectural intelligence library

### Supporting Instructions
- **`/instructions/exploration-behavior.md`** - Communication patterns and synthesis techniques

## Process

### Phase 1: Pattern Recognition & Opening Synthesis (2-3 minutes)

After reading the concept file(s), immediately begin with bold pattern recognition using `/templates/exploration-process.md`:

1. **Communication Style Calibration**: Determine how developer prefers to process information
2. **Bold Pattern Recognition**: Generate immediate excitement through authentic AI synthesis
3. **Energy Calibration**: Adjust approach based on developer response patterns

### Phase 2: 5-Chapter Exploration (20-25 minutes)

**BEGIN IMMEDIATELY**: Conduct the complete conversational exploration using `/templates/exploration-process.md`. Integrate decision intelligence from `/templates/intelligence-library.md` throughout:

**Chapter Structure**:
1. **First Contact** → Identity & Entry transformation (4-5 min)
2. **Core Experience Loop** → Value & system dynamics (4-5 min)  
3. **Social Fabric** → Community & connection patterns (4-5 min)
4. **Evolution & Growth** → Scaling & progression (4-5 min)
5. **Technical Philosophy** → Architecture & boundaries (4-5 min)

**Communication Guidelines**: Follow `/instructions/exploration-behavior.md` for authentic AI synthesis with connection-making phrases and failure recovery patterns.

### Phase 3: Command Generation (2-3 minutes)

Generate the 5 intelligent commands using `/templates/commands-template.md`:

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

Create consolidated project reference using `/templates/guide-template.md`:

**Guide Contents**:
- **Vision summary**: One-line truth and core value proposition
- **Technical foundation**: Stack, complexity budget, architectural principles  
- **Development workflow**: How to use the 5 commands effectively
- **Vision protection**: Green flags, red flags, and course correction guidance
- **Growth strategy**: Natural evolution paths and scaling considerations
- **Communication preferences**: Established working style and accessibility features

## Unified Output Structure

Always creates the same consistent structure:

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

**Note**: For monorepos with multiple projects, run init separately for each project in its respective directory.

**Example output:**
```
.claude/
├── concepts/recipe-app-guide.md
├── commands/recipe-app/
│   ├── start.md
│   ├── build.md
│   ├── review.md
│   ├── evolve.md
│   └── help.md
└── init-logs/recipe-app-init.md

# Usage: /recipe-app:start, /recipe-app:build, etc.
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
- **Iteration intelligence**: Tracks development focus and suggests natural next steps
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
# Initialize a project
/core:project-init recipe-app.md
# → Creates /recipe-app:start, /recipe-app:build, etc.

# Works in any directory
cd apps/my-storefront
/core:project-init storefront.md
# → Creates .claude/ with /storefront:* commands
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

**Iterative by Default**: Development naturally flows through cycles of learning, building, and evolution. Commands recognize these rhythms without forcing process.

**Embedded Guidance**: Vision protection happens while building, not through separate rituals.

**Progressive Disclosure**: Show what's needed when it's needed, not everything at once.

**Natural Language**: When in doubt, just ask. The system understands intent, not just commands.