# qino-claude

A Story-Driven Development environment that keeps developers connected to the user experience they're creating.

## Story-Driven Development

This environment uses Story-Driven Development to maintain connection between technical implementation and user experience.

## Getting Started

**📖 [Complete Getting Started Guide →](src/claude-config/GETTING_STARTED.md)**

### Quick Start
1. **Copy system**: Paste `src/claude-config/` into your project
2. **Write concept**: Create `my-idea.md` describing your project  
3. **Run init**: `/core:project-init my-idea.md`
4. **Experience onboarding**: 20-30 minute guided exploration
5. **Start building**: Use your generated `/myidea:*` commands

### First Time Setup
```bash
# 1. Copy the claude-config system to your project
cp -r src/claude-config/ /path/to/your-project/

# 2. Create your concept file (see getting started guide for examples)
# my-app.md

# 3. Initialize with Claude Code
claude
/core:project-init my-app.md

# 4. Experience the transformative onboarding
# 5. Start using your generated commands
/myapp:start
```

### Daily Development Flow
```bash
# Start your session
/[project]:start
# Analyzes context and suggests next steps

# Build features with vision alignment
/[project]:build "what you want to create"
# Implements with embedded vision protection

# Check alignment when needed
/[project]:review
# Code review with vision context

# Evolve your vision as you learn
/[project]:evolve
# Update understanding, includes creative catalyst when ready
```

## Core Commands

After initialization, you'll have 5 streamlined commands:

- `/project:start` - Intelligent context-aware guidance  
- `/project:build` - Vision-aware development with decision intelligence
- `/project:review` - Code review with alignment checking
- `/project:evolve` - Vision evolution & creative catalyst (permission-based)
- `/project:help` - Natural language interface and command routing

Each command:
1. Understands your project's vision
2. Provides contextual guidance
3. Protects alignment naturally
4. Evolves with your understanding

## Project Structure

After initialization, your project will have:

```
.claude/
├── concepts/
│   └── [project]-guide.md  # Complete vision and insights
├── commands/
│   └── [project]/          # Your 5 core commands
│       ├── start.md
│       ├── build.md
│       ├── check.md
│       ├── evolve.md
│       └── help.md
└── init-log.md             # Record of your exploration
```

## Philosophy

We build better when we remember we're creating experiences, not just features. This system ensures every line of code connects to the human moment it serves.
