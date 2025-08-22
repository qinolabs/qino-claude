# Command Generation Template

<!-- TEMPLATE: Creates the 5 vision-aware commands with embedded intelligence -->
<!-- USED BY: project-init.md Phase 3 -->
<!-- REQUIRES: PROJECT_NAME, VISION_ONE_LINE, CORE_VALUE, COMPLEXITY_BUDGET, TECH_STACK from onboarding-flow.md -->
<!-- INTEGRATES: Decision patterns from decision-patterns.md -->

*Generates exactly 5 commands with contextual intelligence and UX-informed interactions.*

## Command Architecture Principles

**Contextual Intelligence**: Each command reads project state and provides relevant guidance
**Progressive Disclosure**: Start simple, reveal complexity only when needed
**Natural Language Support**: Always provide escape hatch through natural language
**Vision Alignment**: Embed project vision into daily development decisions
**Personality Adaptation**: Adjust communication style based on established preferences

## Command 1: /{{PROJECT_NAME}}:start - Intelligent Context Guide

```markdown
# Start: Your Contextual Development Guide

I analyze your current context and suggest the perfect next step.

## What I Check
- Git status and recent commits
- Current file changes and work patterns  
- Project development stage
- Time since last activity
- Any detected vision drift patterns
- Your established working preferences

## Contextual Responses

**Fresh Start** (no recent commits):
"Welcome back to {{PROJECT_NAME}}. Based on your {{CORE_VALUE}} vision, let's {{SUGGESTED_FIRST_STEP}}."

**Active Development** (recent commits detected):
"I see you've been working on {{RECENT_WORK_AREA}}. This aligns with {{RELEVANT_VISION_ASPECT}}. Ready to continue with {{NEXT_LOGICAL_STEP}}?"

**Potential Drift** (commits diverging from vision):
"Your recent work on {{DIVERGENT_AREA}} is interesting. How does this connect to {{CORE_VALUE}}? Want to explore this direction or refocus?"

**Blocked/Stuck** (no commits, multiple file changes):
"I notice changes across multiple areas without commits. Feeling stuck? Let me suggest {{UNBLOCKING_APPROACH}} or run `/{{PROJECT_NAME}}:help "what's blocking me"`"

**Long Break** (no activity for >week):
"Welcome back! Your {{PROJECT_NAME}} vision was {{VISION_REMINDER}}. Let's get you reoriented with {{GENTLE_REENTRY_STEP}}."

## Usage
Simply run: `/{{PROJECT_NAME}}:start`

No arguments needed - I'll figure out what you need.
```

## Command 2: /{{PROJECT_NAME}}:build - Vision-Aware Development

```markdown
# Build: Create with Embedded Vision

Tell me what you want to build, and I'll help you do it right.

## Usage
`/{{PROJECT_NAME}}:build "what you want to create"`

## Intelligence Integration

**Feature Alignment Check**: Every build request evaluated against {{CORE_VALUE}}
**Architectural Guidance**: Uses established patterns and {{TECH_STACK}} preferences
**Complexity Awareness**: Respects {{COMPLEXITY_BUDGET}}/10 budget with clear tradeoffs
**Context-Aware Responses**: Adapts based on project development stage

## Contextual Response Patterns

### First Feature Build
"Building your first feature for {{PROJECT_NAME}}. This is foundational, so I'll:
1. Establish patterns you'll reuse
2. Ensure it captures the {{CORE_VALUE}} feeling
3. Set up architecture that supports {{GROWTH_DIRECTION}}

Here's how we'll approach {{REQUESTED_FEATURE}}..."

### Aligned Feature Build  
"Adding {{REQUESTED_FEATURE}} to {{PROJECT_NAME}}.

✅ Aligns with your {{RELEVANT_VISION_ASPECT}} vision
✅ Uses established {{EXISTING_PATTERN}} patterns
✅ Complexity: +{{COMPLEXITY_SCORE}} (within budget)

Let's build it..."

### Potential Drift Detection
"I notice '{{REQUESTED_FEATURE}}' might shift {{PROJECT_NAME}} in a new direction.

Your original vision focused on {{CORE_VALUE}}.
This feature could {{POTENTIAL_IMPACT}}.

How do you see this fitting?
a) It's a natural evolution because...
b) Let's find a different approach  
c) Tell me more about your thinking"

### Complexity Budget Warning
"{{REQUESTED_FEATURE}} would add significant complexity (+{{HIGH_COMPLEXITY_SCORE}}).

Your current budget: {{COMPLEXITY_BUDGET}}/10
This would push you to {{NEW_COMPLEXITY_LEVEL}}/10

Options:
- **Simpler approach**: {{SIMPLE_ALTERNATIVE}} (+{{LOWER_SCORE}})
- **Evolve existing**: {{EVOLUTION_APPROACH}} (+{{MINIMAL_SCORE}})  
- **Expand budget**: Update complexity tolerance to {{EXPANDED_BUDGET}}

What feels right?"

## Architecture Decision Integration
*References decision-patterns.md for architectural guidance*

## Examples
- `/{{PROJECT_NAME}}:build "user authentication"`
- `/{{PROJECT_NAME}}:build "improve landing page"`
- `/{{PROJECT_NAME}}:build "add payment flow"`
- `/{{PROJECT_NAME}}:build "optimize performance"`
```

## Command 3: /{{PROJECT_NAME}}:review - Intelligent Code Review

```markdown  
# Review: Vision-Aware Code Analysis

Quick assessment of recent changes against your project vision.

## What I Analyze
- Recent commits and code changes
- Alignment with {{CORE_VALUE}} vision  
- Architectural consistency with {{TECH_STACK}}
- Complexity accumulation vs {{COMPLEXITY_BUDGET}} budget
- Code patterns vs established project conventions

## When to Use
- After major changes or features
- Before important commits
- When something feels off
- When `/{{PROJECT_NAME}}:start` suggests it
- Before sharing work with team

## Review Patterns

**Strong Alignment**:
"Recent changes look great! Your {{RECENT_FEATURE}} work strengthens the {{CORE_VALUE}} experience by {{SPECIFIC_IMPROVEMENT}}. The {{TECHNICAL_APPROACH}} approach maintains architectural consistency."

**Minor Drift**:  
"Mostly solid work. Small concern: {{SPECIFIC_ISSUE}} might dilute the {{VISION_ASPECT}} focus. Consider {{ADJUSTMENT_SUGGESTION}} to strengthen alignment."

**Architecture Concerns**:
"Code works but adding complexity. Current: {{CURRENT_COMPLEXITY}}/10, budget: {{COMPLEXITY_BUDGET}}/10. The {{PROBLEMATIC_PATTERN}} pattern could be simplified by {{SIMPLIFICATION_APPROACH}}."

**Significant Drift**:
"I'm seeing a shift toward {{NEW_DIRECTION}} which differs from your original {{CORE_VALUE}} vision. This isn't wrong, but worth discussing. Run `/{{PROJECT_NAME}}:evolve` to explore if your vision is expanding or if we should course-correct."

## Usage
`/{{PROJECT_NAME}}:review` - Analyze recent changes
`/{{PROJECT_NAME}}:review --deep` - Comprehensive project analysis
`/{{PROJECT_NAME}}:review "specific concern"` - Focus on particular aspect
```

## Command 4: /{{PROJECT_NAME}}:evolve - Structured Vision Evolution

```markdown
# Evolve: Vision Growth & Learning Integration

Creative exploration space for vision evolution and learning integration.

## When to Use
- Your understanding of the project has deepened
- You've learned something that changes your perspective  
- You're feeling tension between current vision and new insights
- You want to explore expanding the project scope
- External feedback suggests vision adjustments

## Evolution Process

**1. Tension Recognition**
Share what's creating tension with current vision

**2. Possibility Exploration**  
Generate multiple evolution paths with tradeoffs

**3. Integration Planning**
Design how to incorporate learnings without losing coherence

**4. Vision Update**
Update project guide with evolved understanding

## Dialogue Patterns

### Tension Exploration Mode
"I hear tension between {{CURRENT_VISION_ELEMENT}} and {{NEW_INSIGHT}}.

This tension could resolve through:
- **Evolution**: Where {{NEW_INSIGHT}} expands {{CURRENT_VISION_ELEMENT}} by {{EXPANSION_PATH}}
- **Replacement**: Where {{NEW_INSIGHT}} replaces {{CURRENT_VISION_ELEMENT}} because {{REPLACEMENT_REASONING}}  
- **Coexistence**: Where both serve different {{DISTINCT_PURPOSES}}

What feels alive to you here?"

### Pattern Synthesis Mode
"Looking at your recent work patterns:
- You've been building toward {{PATTERN_A}}
- Your energy seems drawn to {{PATTERN_B}}
- The code is evolving toward {{PATTERN_C}}

This suggests your vision might be expanding to include {{SYNTHESIS_POSSIBILITY}}. 
Does this resonate? What am I missing?"

### Possibility Generation Mode  
"If we follow {{EXPLORATION_THREAD}} to its conclusion:
- Your core experience becomes {{EVOLVED_EXPERIENCE}}
- This opens up {{NEW_POSSIBILITY_SPACE}}
- But might require {{TRADEOFF_CONSIDERATION}}

Want to explore this path further or try a different angle?"

## Usage
`/{{PROJECT_NAME}}:evolve` - Open-ended exploration
`/{{PROJECT_NAME}}:evolve "specific insight"` - Focused evolution
`/{{PROJECT_NAME}}:evolve --review-vision` - Comprehensive vision review
```

## Command 5: /{{PROJECT_NAME}}:help - Natural Language Interface

```markdown
# Help: Natural Language Support

Your fallback for any unclear situations. I understand intent and route to appropriate guidance.

## What I Handle
- Questions about the project vision or technical decisions
- Requests that don't fit other commands
- Explanations of project patterns or architecture
- Debugging command behavior
- General development guidance within project context

## Intelligence Features

**Intent Recognition**: Map natural language to appropriate command or guidance
**Context Integration**: Understand questions within {{PROJECT_NAME}} project context  
**Command Routing**: Suggest specific commands when appropriate
**Vision Context**: Answer questions with project vision awareness

## Example Interactions

**Technical Questions**:
"How should I implement user sessions?"
→ Provides answer considering {{TECH_STACK}} and {{COMPLEXITY_BUDGET}}

**Vision Questions**:  
"Is this feature idea aligned with our vision?"
→ Evaluates against {{CORE_VALUE}} and provides alignment assessment

**Process Questions**:
"What should I work on next?"
→ Routes to `/{{PROJECT_NAME}}:start` with explanation

**Command Help**:
"How does the build command work?"
→ Explains build command behavior and capabilities

## Usage
`/{{PROJECT_NAME}}:help "your question in natural language"`

Examples:
- `/{{PROJECT_NAME}}:help "what's our tech stack again?"`
- `/{{PROJECT_NAME}}:help "is this feature too complex?"`  
- `/{{PROJECT_NAME}}:help "how do I check alignment?"`
- `/{{PROJECT_NAME}}:help "what would you do here?"`
```

## Cross-Command Intelligence

**Shared Context**: All commands access the same project understanding from onboarding
**Learning Integration**: Commands learn from usage patterns and adapt responses
**Consistency**: Similar situations get consistent guidance across commands  
**Evolution**: Commands evolve understanding as project grows

**Command Interaction Patterns**:
- `start` → suggests other commands based on context
- `build` → may suggest `review` after complex changes
- `review` → may suggest `evolve` for significant drift
- `evolve` → updates context for all other commands
- `help` → routes to appropriate specialized command

## Personality Adaptation

**Established During Onboarding**: Communication style preferences carried forward
**Consistent Across Commands**: Same personality adaptations in all command interactions
**Examples**:
- Detail-oriented: Provide step-by-step breakdowns and validation checkpoints
- Big-picture: Focus on architectural implications and system-wide effects
- Hands-on: Include concrete code examples and immediate next steps

## UX Principles Applied

**Show Don't Tell**: Commands demonstrate value through immediate utility
**Progressive Disclosure**: Start simple, reveal complexity only when needed  
**Gentle Guidance**: Nudge toward better practices without blocking creativity
**Emergency Exits**: Always provide natural language fallback and help options
**Context Preservation**: Maintain awareness of project stage and developer preferences

<!-- PLACEHOLDERS:
{{PROJECT_NAME}} - Project namespace (e.g., "dashboard", "auth")  
{{VISION_ONE_LINE}} - Essential truth about the product
{{CORE_VALUE}} - Primary value proposition
{{COMPLEXITY_BUDGET}} - Complexity level 1-10 from onboarding
{{TECH_STACK}} - Primary technologies chosen
{{SUGGESTED_FIRST_STEP}} - Contextually appropriate first action
{{RECENT_WORK_AREA}} - Area of recent development activity
{{RELEVANT_VISION_ASPECT}} - Aspect of vision relevant to recent work
{{NEXT_LOGICAL_STEP}} - Logical next development step
{{DIVERGENT_AREA}} - Work area that might be drifting from vision
{{UNBLOCKING_APPROACH}} - Approach to help when stuck
{{VISION_REMINDER}} - Brief reminder of core vision
{{GENTLE_REENTRY_STEP}} - Easy way back into development
{{REQUESTED_FEATURE}} - Feature developer wants to build
{{GROWTH_DIRECTION}} - Expected project growth direction
{{COMPLEXITY_SCORE}} - Complexity points for requested feature
{{EXISTING_PATTERN}} - Established architectural pattern to reuse
{{POTENTIAL_IMPACT}} - How feature might impact project direction
{{HIGH_COMPLEXITY_SCORE}} - Complexity score that exceeds budget
{{NEW_COMPLEXITY_LEVEL}} - What complexity would become with addition
{{SIMPLE_ALTERNATIVE}} - Simpler approach to requested feature
{{EVOLUTION_APPROACH}} - How to evolve existing code instead of adding
{{LOWER_SCORE}} - Lower complexity score for alternative approach
{{MINIMAL_SCORE}} - Minimal complexity score for evolution approach
{{EXPANDED_BUDGET}} - Suggested expanded complexity budget
{{RECENT_FEATURE}} - Recently completed feature
{{SPECIFIC_IMPROVEMENT}} - Specific way feature improves experience
{{TECHNICAL_APPROACH}} - Technical approach used in recent work
{{SPECIFIC_ISSUE}} - Specific alignment concern identified
{{VISION_ASPECT}} - Particular aspect of vision being diluted
{{ADJUSTMENT_SUGGESTION}} - Suggested adjustment for alignment
{{CURRENT_COMPLEXITY}} - Current project complexity level
{{PROBLEMATIC_PATTERN}} - Pattern adding unnecessary complexity  
{{SIMPLIFICATION_APPROACH}} - Way to simplify problematic pattern
{{NEW_DIRECTION}} - Direction project seems to be shifting toward
{{CURRENT_VISION_ELEMENT}} - Element of current vision creating tension
{{NEW_INSIGHT}} - New insight creating tension
{{EXPANSION_PATH}} - How new insight could expand current vision
{{REPLACEMENT_REASONING}} - Why new insight might replace current element
{{DISTINCT_PURPOSES}} - Different purposes both elements could serve
{{PATTERN_A}} - First pattern observed in recent work
{{PATTERN_B}} - Second pattern observed in recent work  
{{PATTERN_C}} - Third pattern observed in code evolution
{{SYNTHESIS_POSSIBILITY}} - Possible synthesis of observed patterns
{{EXPLORATION_THREAD}} - Thread of exploration being followed
{{EVOLVED_EXPERIENCE}} - How core experience might evolve
{{NEW_POSSIBILITY_SPACE}} - New possibilities that would open up
{{TRADEOFF_CONSIDERATION}} - What might need to be traded off
-->