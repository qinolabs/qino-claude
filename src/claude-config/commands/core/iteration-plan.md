# Iteration Plan: Create Your Development Roadmap

Generate a focused, balanced iteration plan that enables effective AI-assisted development with clear validation points.

## Usage

```bash
/core:iteration-plan project-name
/core:iteration-plan                # Uses current project context
```

## Purpose

Creates a structured development roadmap that:
- **Balances scope** - Each iteration delivers testable value
- **Enables validation** - Clear success criteria and review points  
- **Supports AI development** - Focused features that AI can implement effectively
- **Allows graceful evolution** - Direction adjustments based on learnings
- **Maintains vision alignment** - Each iteration serves the core project vision

## What Gets Created

```
.claude/iterations/[project]-iterations.md
```

**Iteration Structure**:
- **2-4 focused iterations** - Manageable development phases
- **Clear feature boundaries** - Specific, testable deliverables per iteration
- **Validation checkpoints** - How to evaluate success before moving forward
- **Transition signals** - Natural indicators for moving between phases
- **Vision connection** - How each iteration serves the overall project vision
- **Learning integration** - Space for direction adjustments between iterations

## Prerequisites

This command requires:
- **Project guide** - `.claude/concepts/[project]-guide.md` must exist
- **Project vision** - Clear understanding of core value and technical approach

If these don't exist, run `/core:project-init` first.

## Execution Process

### Phase 1: Context Analysis (2-3 minutes)

Read and analyze existing project context:
- Project guide and vision
- Technical constraints and complexity budget
- Communication preferences and working style
- Any existing development progress

### Phase 2: Iteration Structure Design (5-7 minutes)

Design optimal iteration breakdown:
- **Identify natural feature boundaries** - What can be built and validated independently
- **Balance technical and user value** - Each iteration delivers both
- **Consider AI development patterns** - Features that AI can implement effectively
- **Plan validation approaches** - How success will be measured

### Phase 3: Detailed Planning (8-12 minutes) 

For each iteration, define:
- **Core deliverables** - Specific features and capabilities
- **Success criteria** - How to know the iteration succeeded
- **Technical requirements** - Key implementation components
- **Validation approach** - Testing and review strategy
- **Learning objectives** - What questions this iteration answers
- **Transition readiness** - Signals it's time for the next iteration

### Phase 4: Evolution Framework (2-3 minutes)

Establish ongoing adaptation:
- **Learning integration points** - When to adjust direction
- **Vision protection mechanisms** - How to stay aligned while evolving
- **Feedback loops** - How user/market input influences future iterations
- **Scope adjustment patterns** - How to handle discoveries that change requirements

## Generated Iteration Plan

Uses `/templates/iteration-framework-template.md` to create:

**Current Iteration Focus**:
- Immediate development priorities
- Specific deliverables and success criteria  
- Technical implementation roadmap
- Validation and review checkpoints

**Future Iteration Outline**:
- Progression of capabilities and complexity
- Vision alignment for each phase
- Natural transition points and readiness signals
- Scope boundaries and feature priorities

**Evolution Guidance**:
- How iterations adapt based on learnings
- Vision protection during development
- Direction adjustment opportunities
- Long-term growth considerations

## Integration with Commands

Once created, all project commands reference the iteration plan:

- **`/[project]:start`** - Uses current iteration context for guidance
- **`/[project]:build`** - Focuses on current iteration deliverables  
- **`/[project]:review`** - Checks progress against iteration goals
- **`/[project]:evolve`** - Updates vision and adjusts future iterations

## Key Principles

**Focused Development**: Each iteration has clear boundaries and deliverables that AI can implement effectively.

**Validation-Driven**: Every iteration includes specific success criteria and review points before progression.

**Graceful Evolution**: Plan adapts based on learnings while maintaining vision alignment.

**User Learning**: Developers can evaluate and adjust direction after each iteration.

**AI-Friendly Scope**: Features sized for effective AI development with clear implementation paths.

**Vision Protection**: All iterations serve the core project vision while allowing natural evolution.

This focused approach ensures development stays aligned with vision while adapting to discoveries and learnings throughout the process.