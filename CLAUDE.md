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

2. **Template System** (`src/claude-config/templates/`)
   - `onboarding-structure.md`: Chapter-based exploration framework
   - `core-commands-template.md`: Generates the 5 essential commands
   - `smart-build-template.md`: Adaptive build command behavior
   - `project-guide-simplified.md`: Single consolidated guide

3. **Generated Output Structure**
   ```
   .claude/
   ├── [project]-guide.md   # Single comprehensive guide
   ├── commands/[project]/  # Just 5 core commands
   └── init-log.md         # Exploration record
   ```

## Development Commands

Since this is a command generation system rather than a traditional codebase, there are no standard build/test commands. Instead:

### Running Init
```bash
claude
/core:project-init your-concept.md
```

### Key Concepts

1. **Streamlined Commands**: Just 5 core commands (start, build, check, evolve, help) with intelligent context awareness

2. **Embedded Vision Protection**: Build command naturally integrates alignment checks without interrupting flow

3. **Progressive Disclosure**: Start simple, reveal complexity only when needed

4. **Focused Exploration**: ~20-30 minute guided session that captures essentials without overwhelm

## Working with Templates

When modifying templates:
- Templates provide structure, not content
- Init fills templates with concept-specific insights
- Each template maps to specific output artifacts
- Changes to templates affect all future init runs

## Philosophy

This system believes that developers build better when they stay connected to the user experience they're creating. Vision protection happens naturally through intelligent tooling, not through rituals or interruptions.