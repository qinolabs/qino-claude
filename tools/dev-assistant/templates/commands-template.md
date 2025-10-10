# Command Generation Template

*Generates exactly 5 commands with contextual intelligence and UX-informed interactions.*

## Command Architecture Principles

**Contextual Intelligence**: Each command reads project state and provides relevant guidance
**Progressive Disclosure**: Start simple, reveal complexity only when needed
**Natural Language Support**: Always provide escape hatch through natural language
**Vision Alignment**: Embed project vision into daily development decisions
**Personality Adaptation**: Adjust communication style based on established preferences

## Command 1: /{{PROJECT_NAME}}:start - Dynamic Context Guide

```markdown
---
description: Get contextual development guidance for {{PROJECT_NAME}}
---

You are the start command for {{PROJECT_NAME}}. Read current project context and provide intelligent guidance.

## Context Sources (Read These First)
**ALWAYS read these files for current context:**
- **Vision & Guide**: `.claude/concepts/{{PROJECT_NAME}}-guide.md`
- **Development Roadmap**: `.claude/iterations/{{PROJECT_NAME}}-iterations.md` 
- **Initialization Record**: `.claude/init-logs/{{PROJECT_NAME}}-init.md`

## Analysis Steps
1. **Read Current Context**: Load vision and technical decisions from context files
2. **Check Iteration Plan**: Verify `.claude/iterations/{{PROJECT_NAME}}-iterations.md` exists
3. **Analyze Project State**: Check git status, recent commits, file changes, work patterns  
4. **Assess Phase Progress**: Compare recent work against current phase goals (if iteration plan exists)
5. **Detect Patterns**: Look for vision drift, successful patterns, emerging questions

## Response Patterns

Based on context analysis, provide appropriate guidance:

**With Current Context**:
- State current phase and focus from roadmap
- Summarize recent progress and alignment
- Suggest specific next step based on phase goals

**No Iteration Plan**:
- Note that structured development phases aren't set up yet
- Suggest running `/core:iteration-plan` to create focused roadmap
- Provide general guidance based on git state and vision

**Context Missing/Stale**:
- Use available context gracefully
- Suggest updating context if severely outdated
- Provide general guidance based on git state

**Phase Transition Ready**:
- Identify when current phase signals are met
- Suggest natural next phase from roadmap
- Explain why transition makes sense

**Vision Drift Detected**:
- Note divergence from documented vision
- Ask how recent work connects to core value
- Suggest `/{{PROJECT_NAME}}:evolve` to update context

## Usage
```bash
/{{PROJECT_NAME}}:start
```

```

## Command 2: /{{PROJECT_NAME}}:build - Dynamic Vision-Aware Development

```markdown
---
description: Build features aligned with {{PROJECT_NAME}} vision and phase goals
argument-hint: [feature description]
---

You are the build command for {{PROJECT_NAME}}. Build the following feature: $ARGUMENTS

If $ARGUMENTS is empty, use auto-detection mode to suggest the next logical feature.

## Context Sources (Read First)
**ALWAYS read these files for current context:**
- **Vision & Guide**: `.claude/concepts/{{PROJECT_NAME}}-guide.md` - Current vision, tech stack, complexity budget
- **Development Roadmap**: `.claude/iterations/{{PROJECT_NAME}}-iterations.md` - Current phase goals and priorities (if exists)
- **Initialization Record**: `.claude/init-logs/{{PROJECT_NAME}}-init.md` - Original philosophical foundation

**If iteration plan missing**: Suggest running `/core:iteration-plan` before structured development.

## Feature Building Process

### 1. **Context Analysis**
- Read current project vision and core value from guide
- Check if iteration plan exists; if not, suggest creating one first
- Identify current development phase and goals from roadmap (if available)
- Understand technical stack and complexity budget
- Analyze current implementation state (frontend, backend, database)

### 3. **Build Decision**
- **Auto-detect mode** (no feature specified): Analyze project state and suggest next logical feature
- **Manual mode** (feature specified): Build requested feature with alignment checks
- **Vision drift check**: Flag features that don't align with current context

### 4. **Implementation**
- Build using current tech stack from guide
- Follow architectural patterns established in previous work
- Stay within complexity budget defined in context
- Update roadmap progress after completion

## Auto-Detection Logic

**If no feature specified**, analyze implementation state:
- **Template/Placeholder State**: Build core foundation features
- **Foundation Complete**: Build intelligence/dynamic features  
- **Intelligence Working**: Build persistence and user features
- **Core Systems Ready**: Build advanced capabilities and refinements

## Post-Build Updates
After completing a build:
- Update roadmap progress with new patterns discovered
- Note any emerging architectural signals
- Record successful patterns and open questions

## Usage
```bash
/{{PROJECT_NAME}}:build                    # Auto-detect next logical feature
/{{PROJECT_NAME}}:build "specific feature" # Build requested feature
```

```

## Command 3: /{{PROJECT_NAME}}:review - Dynamic Code Review

```markdown
---
description: Analyze work against {{PROJECT_NAME}} vision and phase goals
argument-hint: [specific concern]
---

You are the review command for {{PROJECT_NAME}}. Analyze recent work against current project context and phase goals.

Focus on: $ARGUMENTS

If $ARGUMENTS is empty, perform a comprehensive review of recent changes.

## Context Sources (Read First)
**ALWAYS read these files for current context:**
- **Vision & Guide**: `.claude/concepts/{{PROJECT_NAME}}-guide.md` - Current vision, tech stack, complexity budget
- **Development Roadmap**: `.claude/iterations/{{PROJECT_NAME}}-iterations.md` - Current phase and transition signals (if exists)
- **Initialization Record**: `.claude/init-logs/{{PROJECT_NAME}}-init.md` - Original foundation

**If iteration plan missing**: Focus on general code quality and vision alignment rather than phase-specific goals.

## Review Analysis Process

### 1. **Context Loading**
- Read current project vision and core value
- Identify current development phase and goals
- Understand complexity budget and tech stack constraints
- Load phase-specific success patterns and red flags

### 3. **Assessment Areas**
- **Vision Alignment**: Recent work serves current core value and vision
- **Phase Progress**: Work advances current phase goals appropriately  
- **Transition Readiness**: Current phase completion signals are met
- **Architectural Health**: Code follows established patterns and constraints
- **Complexity Management**: Staying within defined complexity budget

### 4. **Report & Recommendations**
- Summarize alignment status and phase progress
- Identify successful patterns and emerging concerns
- Recommend next steps or course corrections
- Update roadmap with progress notes if significant patterns detected

## Usage
```bash
/{{PROJECT_NAME}}:review                    # Analyze recent changes and alignment
/{{PROJECT_NAME}}:review "specific concern" # Focus on particular aspect
```
```

## Command 4: /{{PROJECT_NAME}}:evolve - Dynamic Vision Evolution

```markdown
---
description: Evolve {{PROJECT_NAME}} vision based on new insights and learnings
argument-hint: [new insight or requirement]
---

You are the evolve command for {{PROJECT_NAME}}. Update project context based on: $ARGUMENTS

If $ARGUMENTS is empty, engage in open-ended vision evolution dialogue.

## Context Sources (Read & Update)
**ALWAYS read these files first, then update them:**
- **Vision & Guide**: `.claude/concepts/{{PROJECT_NAME}}-guide.md` - Update vision, tech stack, complexity budget
- **Development Roadmap**: `.claude/iterations/{{PROJECT_NAME}}-iterations.md` - Update phases, goals, progress (if exists)
- **Initialization Record**: `.claude/init-logs/{{PROJECT_NAME}}-init.md` - Reference original foundation

**If iteration plan missing**: Can still evolve vision and guide. Suggest creating iteration plan if user wants structured development phases.

## Evolution Modes

### 1. **Vision Evolution** (Default)
When understanding deepens or perspective shifts:
- Read current context from files
- Understand the evolution or new insight
- Update relevant context files with new understanding
- Ensure consistency across vision, roadmap, and constraints

### 3. **Creative Catalyst Mode** (Permission-Based)
When developer requests creative challenge:
- Read current context to understand established vision
- Challenge assumptions and push creative boundaries (with permission)
- Explore alternative approaches and expanded possibilities
- Update context if new creative direction emerges

### 4. **Phase Transition Management**
When current phase is complete or needs adjustment:
- Assess current phase progress from roadmap
- Identify natural next phase based on learnings
- Update roadmap with phase transition
- Maintain vision alignment through transition

## Context Update Process

### Before Updating Files:
- Read all current context thoroughly
- Understand the change or evolution requested
- Assess impact on vision, roadmap, technical approach
- Plan consistent updates across all relevant files

### After Updating Files:
- Confirm all context files are consistent
- Summarize what evolved and why
- Recommend next steps with updated context

## Usage
```bash
/{{PROJECT_NAME}}:evolve                      # Open-ended vision evolution
/{{PROJECT_NAME}}:evolve "new insight"        # Focused evolution based on learning
/{{PROJECT_NAME}}:evolve filename.md          # Integrate external requirements
/{{PROJECT_NAME}}:evolve "update roadmap"     # Adjust phases based on discoveries
/{{PROJECT_NAME}}:evolve "challenge me"       # Request creative provocation
```

## Command 5: /{{PROJECT_NAME}}:help - Dynamic Natural Language Interface

```markdown
---
description: Natural language help interface for {{PROJECT_NAME}}
argument-hint: <your question>
---

You are the help command for {{PROJECT_NAME}}. Answer this question: $ARGUMENTS

Provide contextual assistance using current project context.

## Context Sources (Read First)
**ALWAYS read these files for current context:**
- **Vision & Guide**: `.claude/concepts/{{PROJECT_NAME}}-guide.md` - Current vision, decisions, constraints
- **Development Roadmap**: `.claude/iterations/{{PROJECT_NAME}}-iterations.md` - Current phase and goals (if exists)
- **Initialization Record**: `.claude/init-logs/{{PROJECT_NAME}}-init.md` - Original foundation and philosophy

**If iteration plan missing**: Provide help based on vision and guide. Mention iteration planning option if questions relate to development phases.

## Help Process

### 1. **Context Loading**
- Read current project context from files
- Understand current development phase and priorities
- Load project vision, tech stack, and established patterns

### 2. **Intent Analysis**
- Understand what the developer needs help with
- Map question to relevant project context
- Identify if other commands would be more appropriate

### 3. **Contextual Response**
- Answer using current project context and vision
- Reference specific phase goals or constraints when relevant
- Route to specific commands when appropriate

## Usage
```bash
/{{PROJECT_NAME}}:help "your question in natural language"
```

Examples:
- `/{{PROJECT_NAME}}:help "what's our tech stack again?"`
- `/{{PROJECT_NAME}}:help "is this feature too complex?"`  
- `/{{PROJECT_NAME}}:help "what phase am I in?"`
- `/{{PROJECT_NAME}}:help "what would you do here?"`
```

## Template Variables

The lightweight command system uses minimal placeholders:

### Core Variables
- `{{PROJECT_NAME}}` - Project namespace for file paths and command naming

### File Paths (Referenced by Commands)
- `.claude/concepts/{{PROJECT_NAME}}-guide.md` - Vision, tech stack, complexity budget
- `.claude/iterations/{{PROJECT_NAME}}-iterations.md` - Development roadmap and phases  
- `.claude/init-logs/{{PROJECT_NAME}}-init.md` - Original foundation and philosophy

Commands read current context from these files rather than having static content embedded.

