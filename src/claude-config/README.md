# Claude Config Structure

This directory contains the refactored metaprogramming system for qino-claude with clear separation of concerns.

## Directory Structure

```
src/claude-config/
├── instructions/          # How Claude should behave
│   └── onboarding-behavior.md
├── templates/            # What Claude should generate
│   ├── opening-synthesis.md
│   ├── chapter-framework.md
│   ├── onboarding-structure.md
│   ├── core-commands-template.md
│   ├── project-guide-simplified.md
│   ├── smart-build-template.md
│   ├── architecture-aware-build.md
│   └── evolve-dialogue-template.md
├── examples/             # Sample outputs and demonstrations
│   ├── gentle-beginning-example.md
│   └── monorepo-setup.md
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
- `{{PROJECT_NAME}}` - Project namespace (e.g., "dashboard", "auth")
- `{{VISION_SUMMARY}}` - Core vision from onboarding
- Clear documentation of all placeholders at template end

## Execution Flow

1. **Entry**: `/core:project-init` reads concept files
2. **Instructions**: Loads behavior from `/instructions/onboarding-behavior.md`
3. **Templates**: Uses atomic templates to generate content:
   - `opening-synthesis.md` → Initial synthesis
   - `onboarding-structure.md` → Chapter framework
   - `core-commands-template.md` → 5 core commands
   - `project-guide-simplified.md` → Consolidated guide
4. **Output**: Structured `.claude/` directory with commands and guides

## Benefits of This Structure

### ✅ Clear Separation
- Instructions vs templates vs examples are obvious
- No more confusion about what Claude should do vs generate

### ✅ Atomic Templates
- Each template is self-contained
- No recursive dependencies
- Easy to test and debug

### ✅ Consistent Placeholders
- Standard `{{VARIABLE}}` format
- Clear documentation of required inputs
- Predictable template filling

### ✅ Maintainable
- Easy to update individual components
- Clear validation criteria
- Obvious error sources

## Migration Notes

**Before**: Mixed instruction/template content caused:
- Claude confusion about behavior vs generation
- Recursive template dependencies
- Unpredictable output
- Hard to debug failures

**After**: Clean separation enables:
- Reliable execution every time
- Easy maintenance and updates
- Clear debugging when issues arise
- Consistent output structure