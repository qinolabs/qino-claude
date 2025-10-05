# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository implements a Story-Driven Development system that generates immersive, narrative-based commands for software projects. It uses a unique approach where development commands are tied to user experiences and emotional journeys rather than just technical functions.

## Architecture

The codebase is organized around templates and commands that create a living development environment:

### Core Components

1. **Init Command** (`src/claude-config/commands/core/project-init.md`)
   - The primary entry point for new projects
   - Creates streamlined development environments through focused exploration
   - Generates just 5 core commands with progressive disclosure

2. **Instruction System** (`src/claude-config/instructions/`)
   - `exploration-behavior.md`: How Claude should conduct the exploration experience
   - Communication patterns, synthesis techniques, conversation flow

3. **Template System** (`src/claude-config/templates/`)
   - `exploration-process.md`: Complete 20-30 minute exploration process
   - `commands-template.md`: Generates the 5 essential commands
   - `guide-template.md`: Single consolidated guide
   - `intelligence-library.md`: Architectural intelligence library
   - `iteration-framework-template.md`: Development roadmap framework

4. **Generated Output Structure**
   ```
   .claude/
   ├── concepts/
   │   └── [project]-guide.md   # Single comprehensive guide per project
   ├── commands/[project]/      # Just 5 core commands per project
   ├── iterations/              # Development roadmaps (created separately)
   │   └── [project]-iterations.md
   └── init-logs/
       └── [project]-init.md    # Exploration record per project
   ```

## Development Commands

Since this is a command generation system rather than a traditional codebase, there are no standard build/test commands. Instead:

### Running Init
```bash
claude
/core:project-init your-concept.md
```

### Creating Iteration Plan
```bash
/core:iteration-plan your-project-name
```

### Key Concepts

1. **Streamlined Commands**: Just 5 core commands (start, build, review, evolve, help) with intelligent context awareness

2. **Separate Planning Phase**: Iteration planning happens after exploration when users are ready for structured development

3. **Progressive Disclosure**: Start simple, reveal complexity only when needed

4. **Focused Exploration**: ~15-20 minute guided session that captures essentials without overwhelm

5. **Graceful Iteration Planning**: Development roadmaps created when needed, enabling validation and adjustment between phases

## Working with Templates

When modifying templates:
- Templates provide structure, not content
- Init fills templates with concept-specific insights
- Each template maps to specific output artifacts
- Changes to templates affect all future init runs

## Philosophy

This system believes that developers build better when they stay connected to the user experience they're creating. Vision protection happens naturally through intelligent tooling, not through rituals or interruptions.