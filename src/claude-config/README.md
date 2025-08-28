# Claude Config Structure

This directory contains the refactored metaprogramming system for qino-claude with clear separation of concerns.

## Directory Structure

```
src/claude-config/
├── instructions/          # How Claude should behave
│   └── exploration-behavior.md
├── templates/            # What Claude should generate (streamlined)
│   ├── exploration-process.md     # Complete exploration process
│   ├── commands-template.md       # Intelligent command creation
│   ├── intelligence-library.md    # Architectural intelligence library
│   ├── iteration-template.md      # Living iteration context
│   └── guide-template.md          # Consolidated project reference
├── examples/             # Sample outputs and demonstrations
│   └── exploration-example.md
└── commands/core/        # Entry point commands
    └── project-init.md
```

## Content Type Conventions

### Instructions (`/instructions/`)
Files that tell Claude **how to behave** during execution:
- Communication style
- Synthesis techniques  
- Conversation patterns
- Success indicators

**Format:**
```markdown
# Instruction Title
*Instructions for Claude on how to...*

## Behavior Guidelines
- Do this
- Don't do that
```

### Templates (`/templates/`)
Files that define **what Claude should generate**:
- Atomic, self-contained content
- Clear placeholder conventions
- Required inputs documented
- Validation criteria included

**Format:**
```markdown
# Template Title
<!-- TEMPLATE: Description of what this generates -->
<!-- REQUIRES: input1, input2, input3 from previous step -->

Template content with {{PLACEHOLDERS}}

<!-- PLACEHOLDERS:
{{VARIABLE}} - Description of what this represents
-->
```

### Examples (`/examples/`)
Files that show **sample outputs** and usage patterns:
- Demonstrations of good/bad approaches
- Before/after comparisons
- Reference implementations

## Placeholder Conventions

All templates use consistent placeholder format:
- `{{VARIABLE_NAME}}` - Required input from previous steps
- `{{PROJECT_NAME}}` - Project namespace (e.g., "recipe-app", "admin-portal")
- `{{VISION_SUMMARY}}` - Core vision from onboarding
- Clear documentation of all placeholders at template end

## Execution Flow

1. **Entry**: `/core:project-init` reads concept files
2. **Instructions**: Loads behavior from `/instructions/exploration-behavior.md`
3. **Templates**: Uses streamlined 5-template system:
   - `exploration-process.md` → Complete 20-30 minute exploration process
   - `commands-template.md` → 5 intelligent commands with creative catalyst
   - `guide-template.md` → Consolidated project reference  
   - `intelligence-library.md` → Architectural intelligence library (used throughout)
   - `iteration-template.md` → Living iteration context that evolves
4. **Output**: Structured `.claude/` directory with vision-aware commands and guides

## Benefits of Streamlined Structure

### ✅ Focused System (4 vs 8 templates)
- 50% reduction in maintenance complexity
- Clear single purpose per template
- No overlapping responsibilities
- Linear execution flow

### ✅ Enhanced Intelligence  
- Consolidated architectural decision patterns
- Creative catalyst capabilities when ready
- Contextual awareness across all commands
- Communication adaptation for different personalities

### ✅ Preserved Transformation
- Complete 20-30 minute holistic onboarding maintained
- Bold synthesis and pattern recognition enhanced
- Vision protection embedded naturally in commands
- Progressive disclosure from foundation to creative catalyst

### ✅ Improved Accessibility
- Multiple communication styles supported
- Cultural sensitivity and failure recovery
- Permission-based creative provocation
- Easy exits and natural language fallbacks

## Evolution Notes

**Previous System (8 templates)**: Overlapping complex templates with unclear dependencies
**Current System (4 templates)**: Streamlined flow with concentrated intelligence
**Key Improvement**: All architectural intelligence consolidated into `decision-patterns.md` library
**Creative Enhancement**: Added creative catalyst mode with permission-based activation

The system now scales from supportive guidance to transformative creative catalyst based on developer readiness and explicit consent.