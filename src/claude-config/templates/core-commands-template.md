# Core Commands Template

*This template generates the minimal command set after Beginning process.*

## Command Set Structure

After onboarding, generate exactly these commands:

### 1. /[project]:start

The intelligent entry point that reads context and suggests next steps.

```markdown
# Start: Your Development Guide

I'll analyze your current context and suggest the best next step.

## What I Check
- Git status and recent commits
- Current file changes
- Project stage based on existing code
- Time since last activity
- Any detected drift from vision

## How to Use
Just run: `/[project]:start`

I'll tell you exactly what to do next and why.
```

### 2. /[project]:build

The main development command with embedded vision guidance.

```markdown
# Build: Create with Vision

Tell me what you want to build, and I'll help you do it right.

## Usage
`/[project]:build "what you want to create"`

## What I Do
1. Understand your intent
2. Check alignment with [project] vision
3. Suggest approach based on your architecture
4. Build it with you
5. Ensure quality and consistency

## Examples
- `/[project]:build "user authentication"`
- `/[project]:build "improve landing page"`
- `/[project]:build "add payment flow"`
```

### 3. /[project]:check

Quick vision alignment when you need reassurance.

```markdown
# Check: Vision Alignment

A quick way to ensure you're still building the right thing.

## When to Use
- After major changes
- When something feels off
- Before big decisions
- When `/start` suggests it

## What It Does
- Reviews recent changes
- Compares to original vision
- Identifies any drift
- Suggests corrections if needed
```

### 4. /[project]:evolve

For creative exploration of vision evolution.

```markdown
# Evolve: Explore Your Vision's Growth

Enter a creative dialogue to explore how your vision wants to evolve.

## Usage
- `/[project]:evolve` - Open-ended exploration
- `/[project]:evolve "specific insight or tension"` - Focused exploration

## What Happens
- Explore tension between current and emerging vision
- Generate possibilities without forcing decisions  
- Find synthesis paths that honor both
- End with concrete next steps when ready

## This is for
- When something feels different
- New ideas that create tension
- Learning that shifts perspective
- Natural growth and evolution
```

### 5. /[project]:help

Natural language fallback for everything else.

```markdown
# Help: Find Your Way

Not sure which command to use? Just ask naturally.

## Usage
`/[project]:help "what you want to do"`

## Examples
- `/[project]:help "how do I add a new feature"`
- `/[project]:help "something seems wrong with the UI"`
- `/[project]:help "I want to refactor the auth system"`

I'll figure out what you need and guide you to the right command.
```

## Implementation Notes

When Beginning generates these commands:

1. **Fill with project-specific details** from onboarding insights
2. **Embed vision checks** naturally into workflows
3. **Make examples concrete** using actual project concepts
4. **Keep language simple** and action-oriented
5. **Hide complexity** behind intelligent defaults

## Progressive Disclosure

Start only shows these 5 commands. As developers use them:
- Build command learns patterns
- Check command tracks drift tendencies
- Help command builds knowledge base

## No Separate Workflows

Vision protection happens through:
- Smart suggestions in `/start`
- Embedded checks in `/build`
- Natural evolution in `/evolve`
- No interrupting rituals