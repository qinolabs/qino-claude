---
description: Transform your app concept into a focused development environment through guided exploration
argument-hint: <concept-file-or-text>
---

# Project Init: Create Your Development Environment

Read the app concept from: $ARGUMENTS

Then immediately begin the onboarding process to transform this concept into a complete development environment.

## Usage

```bash
/core:project-init your-concept.md
/core:project-init "pasted concept text"
/core:project-init concept1.md concept2.md  # multiple apps
```

## Input: Your App Concept

Describe your app idea in any format:

**File (`my-app.md`):**
```markdown
# Social Recipe Sharing App
An app where home cooks can share family recipes with stories and photos. 
Think Instagram but for recipes with your grandmother's secret ingredients.
The vibe should be warm and personal, not clinical like typical recipe sites.
```

**Pasted Text:**
```bash
/core:project-init "A simple todo app that feels calm and focused, 
unlike chaotic productivity tools. Clean design, natural language input, 
works offline-first."
```

**Concept Lists:**
```bash
/core:project-init todo-ideas.md  # File with multiple app ideas
```

## What Happens Next

1. **20-30 minute guided exploration** - I'll immediately start asking about your concept
2. **Complete development environment created** - 5 commands, roadmap, and project guide  
3. **Start building** - Use your new commands to develop with vision alignment

## Your Generated Commands

From `my-app.md` you get:
- `/myapp:start` - Contextual guidance and next steps
- `/myapp:build` - Build features aligned with your vision  
- `/myapp:review` - Check progress and roadmap alignment
- `/myapp:evolve` - Update vision based on learnings
- `/myapp:help` - Natural language assistance

## What Gets Created

```
.claude/
├── concepts/myapp-guide.md          # Complete project reference
├── commands/myapp/                  # Your 5 commands
│   ├── start.md
│   ├── build.md  
│   ├── review.md
│   ├── evolve.md
│   └── help.md
└── init-logs/myapp-init.md         # Onboarding record
```

## Key Benefits

- **Vision-aware development** - Commands protect your original vision while building
- **Contextual intelligence** - System reads project state and development patterns  
- **Ready for planning** - Set up for focused iteration planning when ready
- **Natural evolution** - Vision and roadmap adapt based on building discoveries

## Execution Instructions

**IMPORTANT**: The app concept is provided via $ARGUMENTS (either a file path or pasted text). After reading it, IMMEDIATELY begin the onboarding process. Start with opening synthesis and guide the developer through the conversational exploration.

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

### Phase 2: 4-Chapter Exploration (15-20 minutes)

**BEGIN IMMEDIATELY**: Conduct the complete conversational exploration using `/templates/exploration-process.md`. Integrate decision intelligence from `/templates/intelligence-library.md` throughout:

**Chapter Structure**:
1. **First Contact** → Identity & Entry transformation (4-5 min)
2. **Core Experience Loop** → Value & system dynamics (4-5 min)  
3. **Social Fabric** → Community & connection patterns (3-4 min)
4. **Technical Philosophy** → Architecture & boundaries (4-5 min)

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

### Phase 4: Project Guide Generation (2-3 minutes)

Create consolidated project reference using `/templates/guide-template.md`:

**Guide Contents**:
- **Vision summary**: One-line truth and core value proposition
- **Technical foundation**: Stack, complexity budget, architectural principles  
- **Development workflow**: How to use the 5 commands effectively
- **Vision protection**: Green flags, red flags, and course correction guidance
- **Growth strategy**: Natural evolution paths and scaling considerations
- **Communication preferences**: Established working style and accessibility features


## Output Structure

Creates your app's development environment:

```
.claude/
├── concepts/[appname]-guide.md        # Complete project guide
├── commands/[appname]/                # 5 intelligent commands
│   ├── start.md                      # Context-aware guidance
│   ├── build.md                      # Vision-aware development  
│   ├── review.md                     # Alignment checking
│   ├── evolve.md                     # Vision evolution
│   └── help.md                       # Natural language interface
└── init-logs/[appname]-init.md       # Exploration record
```

## Start Building

After initialization:

```bash
/myapp:start     # Get contextual guidance and next steps
/myapp:build     # Build features aligned with your roadmap
/myapp:review    # Check progress and phase alignment  
/myapp:evolve    # Update vision based on discoveries
/myapp:help      # Natural language assistance
```

## Template Updates

When command templates are improved:

```bash
/core:update-commands    # Regenerates all app commands with latest templates
                        # Preserves context files, updates command logic only
```

The system creates lightweight commands that read current context dynamically, solving both concept drift and template maintenance issues.