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
- **Iteration context** (`.claude/iteration.md` if exists)
- Time since last activity
- Any detected vision drift patterns
- Your established working preferences

## Iteration Document Creation
**Auto-creates** `.claude/iteration.md` when:
- No iteration document exists yet
- Some development work has been done (commits exist)
- Running `/{{PROJECT_NAME}}:start` for guidance

**Creation process**:
"I notice you've been building {{RECENT_WORK_SUMMARY}}. Let me capture your current iteration focus to help guide development.

*Creates iteration document based on recent work patterns*

Here's what I see as your current iteration..."

## Contextual Responses

**With Iteration Context** (iteration.md exists):
"{{PROJECT_NAME}} - Current iteration: {{CURRENT_FOCUS}}

Progress: {{ITERATION_PROGRESS}}
What's working: {{SUCCESSFUL_PATTERNS}}
Next step: {{SUGGESTED_ACTION}}"

**Fresh Start** (no recent commits, no iteration doc):
"Welcome back to {{PROJECT_NAME}}. Based on your {{CORE_VALUE}} vision, let's {{SUGGESTED_FIRST_STEP}}."

**Iteration Creation** (commits exist, no iteration doc):
"I notice you've started building. Let me capture your current iteration focus based on {{RECENT_WORK_PATTERNS}} to help guide next steps."

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
**Iteration Context**: Reads `.claude/iteration.md` for current focus and progress
**Architectural Guidance**: Uses established patterns and {{TECH_STACK}} preferences
**Complexity Awareness**: Respects {{COMPLEXITY_BUDGET}}/10 budget with clear tradeoffs
**Context-Aware Responses**: Adapts based on project development stage
**Implicit Maintenance**: Updates iteration document after building with new patterns and progress

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
✅ Code is ready for this evolution

Let's build it..."

### New Iteration Detected
"{{REQUESTED_FEATURE}} feels like a new iteration beginning.

Recent learnings to carry forward:
- {{PREVIOUS_ITERATION_LEARNING}}
- {{CODE_PATTERN_EVOLUTION}}

This iteration could explore {{ITERATION_THEME}}. 
Building with this understanding..."

### Potential Drift Detection
"I notice '{{REQUESTED_FEATURE}}' might shift {{PROJECT_NAME}} in a new direction.

Your original vision focused on {{CORE_VALUE}}.
Current iteration goals: {{ITERATION_GOALS}}
This feature could {{POTENTIAL_IMPACT}}.

How do you see this fitting?
a) It's part of this iteration because...
b) Save it for Iteration {{FUTURE_ITERATION}}  
c) It's a natural evolution because...
d) Let's find a different approach"

### Complexity Budget Warning
"{{REQUESTED_FEATURE}} would add significant complexity (+{{HIGH_COMPLEXITY_SCORE}}).

Your current budget: {{COMPLEXITY_BUDGET}}/10
This would push you to {{NEW_COMPLEXITY_LEVEL}}/10

Options:
- **Simpler approach**: {{SIMPLE_ALTERNATIVE}} (+{{LOWER_SCORE}})
- **Evolve existing**: {{EVOLUTION_APPROACH}} (+{{MINIMAL_SCORE}})  
- **Expand budget**: Update complexity tolerance to {{EXPANDED_BUDGET}}

What feels right?"

## Post-Build Iteration Maintenance

After completing a build, automatically updates `.claude/iteration.md`:
```
*Built {{FEATURE_NAME}}*

**✅ Working well**: {{NEW_SUCCESSFUL_PATTERN}}
**🔍 Still exploring**: {{UPDATED_QUESTIONS}}
**⚡ Emerging**: {{DISCOVERED_PATTERN}}

**Progress**: {{ITERATION_COMPLETION_PERCENTAGE}}
**Next natural step**: {{SUGGESTED_NEXT_BUILD}}
```

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

Quick assessment of recent changes against your project vision and iteration goals.

## What I Analyze
- Recent commits and code changes
- Alignment with {{CORE_VALUE}} vision  
- **Current iteration context** (from `.claude/iteration.md`)
- **Progress toward iteration completion signals**
- Architectural consistency with {{TECH_STACK}}
- Complexity accumulation vs {{COMPLEXITY_BUDGET}} budget
- Code patterns vs established project conventions

## When to Use
- After significant development work
- Before important commits
- When something feels off
- When `/{{PROJECT_NAME}}:start` suggests it
- Before sharing work with team
- **When iteration completion signals are triggered**

## Review Patterns

**Strong Alignment**:
"Recent changes look great! Your {{RECENT_FEATURE}} work strengthens the {{CORE_VALUE}} experience by {{SPECIFIC_IMPROVEMENT}}. The {{TECHNICAL_APPROACH}} approach maintains architectural consistency."

**Iteration Progress Check**:
"Current iteration: {{CURRENT_FOCUS}}

✅ Completed: {{COMPLETED_SIGNALS}}
🔄 In progress: {{REMAINING_SIGNALS}}

{{COMPLETION_PERCENTAGE}}% complete. Ready to wrap up this iteration or continue building?"

**Iteration Completion Detected**:
"🎉 Iteration completion signals met:
✅ {{COMPLETION_SIGNAL_1}}
✅ {{COMPLETION_SIGNAL_2}}  
✅ {{COMPLETION_SIGNAL_3}}

**What emerged**: {{ITERATION_LEARNINGS}}
**Natural next iteration**: {{SUGGESTED_NEXT_FOCUS}}

Ready to evolve to the next iteration? Run `/{{PROJECT_NAME}}:evolve --next-iteration`"

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

## Command 4: /{{PROJECT_NAME}}:evolve - Vision Evolution & Creative Catalyst

```markdown
# Evolve: Vision Growth & Creative Catalyst

Creative exploration space for vision evolution, learning integration, and creative provocation when ready.

## When to Use
- Your understanding of the project has deepened
- You've learned something that changes your perspective  
- You're feeling tension between current vision and new insights
- You want to explore expanding the project scope
- You're dissatisfied with obvious solutions and want creative challenge
- External feedback suggests vision adjustments

## Evolution Modes

### Standard Evolution (Default)
**Process**: Tension Recognition → Possibility Exploration → Integration → Vision Update
**Approach**: Supportive guidance for vision growth

### Creative Catalyst (Permission-Based)
**Triggers**: Creative energy + solid foundation + readiness for challenge
**Approach**: Assumption questioning, boundary pushing, productive discomfort
**Always ask**: "Want creative provocation mode, or supportive evolution?"

## Dialogue Patterns

### Tension Exploration Mode
"I hear tension between {{CURRENT_VISION_ELEMENT}} and {{NEW_INSIGHT}}.

This tension could resolve through:
- **Evolution**: Where {{NEW_INSIGHT}} expands {{CURRENT_VISION_ELEMENT}} by {{EXPANSION_PATH}}
- **Replacement**: Where {{NEW_INSIGHT}} replaces {{CURRENT_VISION_ELEMENT}} because {{REPLACEMENT_REASONING}}  
- **Coexistence**: Where both serve different {{DISTINCT_PURPOSES}}

What feels alive to you here?"

### Creative Catalyst Mode (When Permitted)
**Assumption Challenge**: "What if your core assumption about {{FUNDAMENTAL_BELIEF}} is limiting you?"
**Productive Discomfort**: "That direction feels safe. What's the version that makes you nervous with possibility?"
**Constraint Removal**: "Forget all constraints for a moment - what would you build?"
**Perspective Flip**: "What if {{PERCEIVED_PROBLEM}} is actually a feature?"

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

## Creative Catalyst Safeguards
- **Permission required**: Always ask before catalyst mode
- **Easy exit**: "Say 'too much' and I'll return to supportive mode"
- **Acknowledge uncertainty**: "This might be completely wrong"
- **Respect authority**: "Your creative intuition is the final judge"

## Iteration Evolution Patterns

### Next Iteration Transition
`/{{PROJECT_NAME}}:evolve --next-iteration`

Creates new iteration based on current learnings:
```
**Completed iteration**: {{CURRENT_FOCUS}}
**Key learnings**: {{ITERATION_INSIGHTS}}

**New iteration focus**: {{NEXT_ITERATION_FOCUS}}
**Exploration areas**: {{NEW_AREAS_TO_EXPLORE}}
**Building on**: {{PATTERNS_TO_EXTEND}}

*Updates .claude/iteration.md with new focus*
```

### Mid-Iteration Evolution  
`/{{PROJECT_NAME}}:evolve "new insight"`

Updates current iteration based on discovery:
```
**Insight**: {{NEW_UNDERSTANDING}}
**Impact on current iteration**: {{HOW_FOCUS_SHIFTS}}
**Adjusted approach**: {{REFINED_STRATEGY}}

*Updates iteration document with evolved understanding*
```

## Usage
`/{{PROJECT_NAME}}:evolve` - Open-ended exploration
`/{{PROJECT_NAME}}:evolve "insight"` - Focused evolution  
`/{{PROJECT_NAME}}:evolve --next-iteration` - Transition to next iteration
`/{{PROJECT_NAME}}:evolve --catalyst` - Request creative provocation mode
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
**Iteration Awareness**: Use current iteration focus for relevant answers
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

## Iteration Document Maintenance

### Implicit Maintenance Pattern
The `.claude/iteration.md` document is kept current through natural command usage:

**start command**:
- Creates iteration.md when development begins
- Reads it for context and guidance
- Updates progress notes when significant patterns emerge

**build command**:  
- Reads iteration context before building
- Updates document after completion with:
  - New successful patterns
  - Emerging discoveries
  - Progress toward completion signals
  - Suggested next builds

**review command**:
- Checks progress against iteration completion signals
- Prompts for next iteration when signals are met
- Updates learnings and insights

**evolve command**:
- Major updater for iteration transitions
- Creates new iteration focus when current completes
- Adjusts current iteration when insights emerge

**help command**:
- References iteration context for relevant answers

### Maintenance Philosophy
- **No explicit management**: Updates happen during natural development flow
- **Context-driven**: Changes based on actual building patterns, not arbitrary updates
- **Forward-looking**: Always suggests natural next steps
- **Learning-integrated**: Captures insights as they emerge from building

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