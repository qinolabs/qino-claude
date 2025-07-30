# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository implements a Story-Driven Development system that generates immersive, narrative-based commands for software projects. It uses a unique approach where development commands are tied to user experiences and emotional journeys rather than just technical functions.

## Architecture

The codebase is organized around templates and commands that create a living development environment:

### Core Components

1. **Beginning Command** (`src/claude-config/commands/core/project-beginning.md`)
   - The primary entry point for new projects
   - Creates complete story-driven development environments through interactive onboarding
   - Generates project-specific commands based on concept analysis

2. **Template System** (`src/claude-config/templates/`)
   - `onboarding-structure.md`: Chapter-based exploration framework for concepts
   - `command-story-template.md`: Structure for every generated command
   - `project-guide-template.md`: Living vision documentation
   - `workflow-template.md`: Daily development rhythm commands

3. **Generated Output Structure**
   ```
   .claude/
   ├── project-guide/      # Living vision documentation
   ├── commands/[project]/  # Story-driven commands
   ├── onboarding/         # Beginning journey records
   └── workflows/          # Development rhythm commands
   ```

## Development Commands

Since this is a command generation system rather than a traditional codebase, there are no standard build/test commands. Instead:

### Running Beginning
```bash
claude
/core:project-beginning your-concept.md
```

### Key Concepts

1. **Story-Driven Commands**: Commands are named and structured around user experiences (e.g., `/project:first-moment`, `/project:revelation`) rather than technical operations

2. **Project Guide**: Living documentation that captures the vision, experience architecture, and command narratives

3. **Vision Protection**: Built-in mechanisms to prevent drift from the original product vision

4. **Interactive Onboarding**: ~40-minute guided exploration that transforms concepts into development environments

## Working with Templates

When modifying templates:
- Templates provide structure, not content
- Beginning fills templates with concept-specific insights
- Each template maps to specific output artifacts
- Changes to templates affect all future Beginning runs

## Philosophy

This system believes that developers build better when they stay connected to the user experience they're creating. Every technical decision serves an emotional goal, and the tools themselves embed this connection.