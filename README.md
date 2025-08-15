# qino-claude

A Story-Driven Development environment that keeps developers connected to the user experience they're creating.

## Story-Driven Development

This environment uses Story-Driven Development to maintain connection between technical implementation and user experience.

## Getting Started

### First Time Setup
```bash
# 1. Initialize your project
claude
/core:project-init your-concept.md

# 2. Complete the 20-30 minute onboarding journey
# Claude will immediately guide you through focused exploration

# 3. Your first command will be provided at the end
/[your-project]:start
```

### Daily Development Flow
```bash
# Start your session
/[project]:start
# Analyzes context and suggests next steps

# Build features with vision
/[project]:build "what you want to create"
# Implements with embedded vision protection

# Check alignment when needed
/[project]:check
# Quick verification you're on track
```

## Core Commands

After initialization, you'll have 5 streamlined commands:

- `/project:start` - Intelligent context-aware guidance
- `/project:build` - Main development with embedded vision
- `/project:check` - Quick alignment verification
- `/project:evolve` - Creative vision exploration
- `/project:help` - Natural language fallback

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
