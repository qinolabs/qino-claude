# Iteration Framework Template

<!-- TEMPLATE: Creates and maintains development roadmap with phase tracking -->
<!-- USED BY: project-init.md Phase 5 (creates), commands (read/update) -->
<!-- REQUIRES: PROJECT_NAME, DATE, VISION_ONE_LINE, CORE_VALUE, ITERATION_COUNT, exploration session variables -->
<!-- LOCATION: .claude/iterations/{{PROJECT_NAME}}-iterations.md -->
<!-- INTEGRATES: Vision protection patterns and development philosophy -->

*Generates comprehensive iteration framework that structures project development phases while maintaining vision alignment.*

## Template Structure

```markdown
# {{PROJECT_NAME}} - Development Iterations

*Project initialized: {{DATE}}*  
*{{VISION_ONE_LINE}}*

## Iteration Framework

Based on the initialization session, {{PROJECT_NAME}} can be structured into **{{ITERATION_COUNT}} natural development phases** aligned with {{CORE_VALUE}}. 

**How to Use This Roadmap**:
- Follow natural development phases while building
- Commands use this roadmap to provide contextual guidance
- `/{{PROJECT_NAME}}:review` assesses progress and suggests transitions
- Roadmap evolves through `/{{PROJECT_NAME}}:evolve` as understanding deepens

## Iteration 1: {{FIRST_ITERATION_THEME}}
*Current Iteration - Started: {{DATE}}*

### Focus
{{FIRST_ITERATION_DESCRIPTION}}

### Vision Alignment
**Core Recognition**: {{VISION_ALIGNMENT_STATEMENT}}

**This Iteration Serves**: {{ITERATION_PURPOSE_STATEMENT}}

### Key Components (From Init Session)
{{ITERATION_1_COMPONENTS}}

### Implementation Priorities
{{ITERATION_1_PRIORITIES}}

### When You're Ready to Move On
{{ITERATION_1_READINESS_SIGNALS}}

### What's Working Well
{{CURRENT_STRENGTHS}}

### Currently Exploring
{{CURRENT_QUESTIONS}}

### Next Natural Steps
{{IMMEDIATE_NEXT_STEPS}}

### Scope Boundaries
**In Scope**: {{IN_SCOPE_FEATURES}}
**Future Iterations**: {{OUT_OF_SCOPE_FEATURES}}

### Red Flags to Avoid
{{PROJECT_SPECIFIC_RED_FLAGS}}

### Green Flags to Maintain
{{PROJECT_SPECIFIC_GREEN_FLAGS}}

{{FUTURE_ITERATIONS_SECTION}}

## Current State Assessment
**{{CURRENT_STATE_SUMMARY}}** - {{CURRENT_STATE_DESCRIPTION}}

### Next Immediate Steps
{{IMMEDIATE_DEVELOPMENT_STEPS}}

## Iteration Evolution Guidance

### When to Start Your First Iteration
- You have working project foundations
- You're ready to focus development work on specific goals
- You want structure for your development process

### Signs It's Time for a New Iteration
- Current work feels complete or natural stopping point reached
- New insights suggest different development direction
- External requirements change development priorities  
- You want to tackle fundamentally different types of work

### How Iterations Evolve Naturally
- **Scope Discovery**: Real building reveals what matters most
- **Pattern Recognition**: Code development shows architectural preferences
- **Value Emergence**: User feedback or testing reveals new priorities
- **Vision Refinement**: Development work deepens understanding of project goals

## Philosophical Foundation Maintained
{{PHILOSOPHICAL_PRINCIPLES}}

*This iteration framework ensures {{VISION_PROTECTION_STATEMENT}} while building toward {{LONG_TERM_VISION}}.*

## Progress Updates

**✅ Working well**: {{SUCCESSFUL_PATTERNS}}
**🔍 Still exploring**: {{OPEN_QUESTIONS}}
**⚡ Emerging**: {{SURPRISING_DISCOVERIES}}

**Current phase progress**: {{PHASE_PROGRESS_STATUS}}
**Ready for transition?**: {{TRANSITION_READINESS_ASSESSMENT}}

---
*Last updated: {{LAST_UPDATE_DATE}} via {{UPDATING_COMMAND}}*
```

## Template Variables

### Core Project Information
- `{{PROJECT_NAME}}` - Project namespace (e.g., "design-well", "recipe-app")
- `{{DATE}}` - Initialization date
- `{{VISION_ONE_LINE}}` - Essential project truth from exploration
- `{{CORE_VALUE}}` - Primary value proposition identified

### Iteration Structure
- `{{ITERATION_COUNT}}` - Number of planned iterations (2-4 typical)
- `{{FIRST_ITERATION_THEME}}` - Theme for first development phase
- `{{FIRST_ITERATION_DESCRIPTION}}` - What the first iteration accomplishes
- `{{VISION_ALIGNMENT_STATEMENT}}` - How iteration serves core vision
- `{{ITERATION_PURPOSE_STATEMENT}}` - What this iteration enables

### Implementation Details
- `{{ITERATION_1_COMPONENTS}}` - Key technical/feature components (bullet list)
- `{{ITERATION_1_PRIORITIES}}` - Ordered development priorities (numbered list)
- `{{ITERATION_1_READINESS_SIGNALS}}` - Indicators of readiness to transition (bullet list)
- `{{IMMEDIATE_NEXT_STEPS}}` - First 1-3 concrete development steps
- `{{IN_SCOPE_FEATURES}}` - What belongs in this iteration
- `{{OUT_OF_SCOPE_FEATURES}}` - What goes to future iterations

### Current State
- `{{CURRENT_STRENGTHS}}` - What's already working well (foundation, setup, etc.)
- `{{CURRENT_QUESTIONS}}` - Areas of exploration and uncertainty
- `{{CURRENT_STATE_SUMMARY}}` - Brief current state assessment
- `{{CURRENT_STATE_DESCRIPTION}}` - Detailed description of where project stands

### Vision Protection
- `{{PROJECT_SPECIFIC_RED_FLAGS}}` - Project-specific drift warnings (bullet list)
- `{{PROJECT_SPECIFIC_GREEN_FLAGS}}` - Project-specific success indicators (bullet list)
- `{{VISION_PROTECTION_STATEMENT}}` - How framework protects vision
- `{{LONG_TERM_VISION}}` - Where project is ultimately headed

### Future Planning
- `{{FUTURE_ITERATIONS_SECTION}}` - Complete section for future iterations outline
- `{{PHILOSOPHICAL_PRINCIPLES}}` - Core development philosophy to maintain (bullet list)
- `{{IMMEDIATE_DEVELOPMENT_STEPS}}` - Actionable next steps

## Variable Extraction Guide

### From Chapter 1 (First Contact)
- Extract `{{FIRST_ITERATION_THEME}}` and `{{VISION_ALIGNMENT_STATEMENT}}`
- Identity transformation reveals natural first development phase

### From Chapter 2 (Core Experience Loop)  
- Extract `{{ITERATION_1_COMPONENTS}}` and `{{ITERATION_1_PRIORITIES}}`
- Core value delivery identifies key features and technical needs

### From Chapter 3 (Social Fabric)
- Identify `{{IN_SCOPE_FEATURES}}` vs `{{OUT_OF_SCOPE_FEATURES}}`
- Social/scaling features often belong in future iterations

### From Chapter 4 (Evolution & Growth)
- Extract `{{FUTURE_ITERATIONS_SECTION}}` and `{{LONG_TERM_VISION}}`
- Growth patterns reveal natural iteration progression

### From Chapter 5 (Technical Philosophy)
- Extract `{{PHILOSOPHICAL_PRINCIPLES}}` and technical `{{ITERATION_1_COMPONENTS}}`
- Architecture decisions inform implementation priorities

## Future Iterations Template Section

When `{{ITERATION_COUNT}}` > 1, include this section:

```markdown
## Iteration 2: {{SECOND_ITERATION_THEME}}
*Future Iteration*

### Focus
{{SECOND_ITERATION_DESCRIPTION}}

### Key Components
{{ITERATION_2_COMPONENTS}}

### Natural Transition Points  
{{ITERATION_2_TRANSITION_INDICATORS}}

{{ADDITIONAL_ITERATIONS_IF_NEEDED}}

## Future Vision: {{FINAL_TRANSFORMATION_THEME}}
*Beyond Core Iterations*

### Transformation Goal
{{ULTIMATE_TRANSFORMATION_DESCRIPTION}}

### Long-term Features
{{LONG_TERM_FEATURES}}
```

## Command Integration & Updates

### How Commands Use This Template

**Initial Creation**: `project-init.md` Phase 5 generates the complete roadmap structure

**Ongoing Updates**: Commands read and update the generated `.claude/iterations/{{PROJECT_NAME}}-iterations.md` file:

### Update Patterns for Commands

**Start Command**: 
- Reads current phase and provides phase-aware guidance
- Updates progress notes when patterns emerge

**Build Command**:
- References current phase goals for feature prioritization  
- Updates progress section after building:
  ```
  **✅ Working well**: [new successful pattern]
  **🔍 Still exploring**: [updated questions]
  **Current phase progress**: [status summary]
  ```

**Review Command**:
- Assesses progress against phase goals
- Updates transition readiness assessment
- Identifies when phase completion signals are met

**Evolve Command**:
- Updates roadmap when vision evolves
- Handles phase transitions by updating current phase
- Adjusts future phases based on learnings

## Quality Assurance

Each generated iteration framework must:

### Vision Alignment
- **Clear Connection**: Each iteration obviously serves core project vision
- **Practical Focus**: Iterations translate vision into concrete development tasks
- **Progressive Building**: Later iterations build on earlier iteration foundations

### Development Clarity
- **Actionable Priorities**: Implementation priorities are specific and achievable
- **Measurable Signals**: Completion signals are objective and observable
- **Realistic Scope**: Each iteration scope matches complexity budget and timeline

### Framework Intelligence
- **Natural Progression**: Iteration sequence feels logical and inevitable
- **Flexibility Points**: Framework accommodates learning and adaptation
- **Vision Protection**: Red/green flags prevent drift while allowing evolution

This template ensures every project starts with clear iteration focus that serves both immediate development needs and long-term vision protection.