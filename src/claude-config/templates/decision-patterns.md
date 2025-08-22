# Decision Intelligence Library

<!-- LIBRARY: Concentrated architectural and dialogue intelligence for all commands -->
<!-- USED BY: onboarding-flow.md, command-generation.md -->
<!-- CONSOLIDATES: architecture-aware-build.md, smart-build-template.md, evolve-dialogue-template.md -->

*Central repository of decision frameworks, dialogue patterns, and architectural intelligence.*

## Architectural Decision Framework

### Complexity Scoring System
Use this consistent scoring across all commands:

**+1 Minimal Complexity**
- Uses existing patterns and established libraries
- Fits within current architectural boundaries
- No new dependencies or paradigms
- Examples: Adding a new page using existing components, tweaking styling

**+2 Moderate Complexity**
- New patterns but within familiar territory
- May add well-understood dependencies
- Stays within established technical stack
- Examples: Adding authentication, integrating a common API

**+3 Significant Complexity**
- New domain or substantial new functionality
- Requires new mental models or architectural patterns
- May introduce new runtime dependencies
- Examples: Real-time features, complex state management, payment processing

**+4+ High Complexity**
- Major architectural shifts or new paradigms
- Significant new infrastructure or mental models
- Changes core development workflows
- Examples: Database migrations, deployment pipeline changes, new frameworks

### The Three-Option Framework

For any architectural decision, present these three paths:

**Option A: Simple Approach** (Complexity: +1-2)
- **Tradeoffs**: {{SIMPLE_TRADEOFFS}}
- **Best for**: {{SIMPLE_SCENARIOS}}
- **Implementation**: {{SIMPLE_IMPLEMENTATION}}

**Option B: Feature-Rich Approach** (Complexity: +3-4)
- **Tradeoffs**: {{RICH_TRADEOFFS}}
- **Best for**: {{RICH_SCENARIOS}}
- **Implementation**: {{RICH_IMPLEMENTATION}}

**Option C: Evolve Existing** (Complexity: +0-1) ⭐ *Often the best choice*
- **How**: {{EVOLUTION_APPROACH}}
- **Why better**: Strengthens existing architecture rather than adding to it
- **Implementation**: {{EVOLUTION_IMPLEMENTATION}}

### Decision Context Template

When evaluating architectural decisions, apply this template:

```
"{{FEATURE_REQUEST}} for {{PROJECT_NAME}}.

Your current architecture: {{CURRENT_ARCHITECTURE}}
Complexity budget: {{CURRENT_COMPLEXITY}}/{{COMPLEXITY_BUDGET}}

[Apply Three-Option Framework]

Given your {{CORE_VALUE}} vision and {{COMPLEXITY_CONSTRAINT}}, I recommend {{RECOMMENDED_OPTION}} because {{REASONING}}."
```

## Contextual Response Patterns

### Development Stage Responses

**Project Initiation Stage** (first few features):
```
"Building {{FEATURE}} for {{PROJECT_NAME}}. Since this is foundational:
- I'll establish patterns you'll reuse across the project
- Ensure it captures the {{CORE_FEELING}} from your vision
- Set up architecture that naturally supports {{EXPECTED_GROWTH}}

The approach: {{ARCHITECTURAL_APPROACH}}"
```

**Active Development Stage** (established patterns exist):
```
"Adding {{FEATURE}} to {{PROJECT_NAME}}.

✅ Aligns with {{RELEVANT_VISION_ASPECT}}
✅ Uses your established {{EXISTING_PATTERN}} patterns
✅ Complexity: +{{COMPLEXITY_SCORE}} (within {{COMPLEXITY_BUDGET}} budget)

Building on: {{FOUNDATION_ELEMENTS}}"
```

**Maturation Stage** (optimizing and scaling):
```
"Optimizing {{FEATURE}} in {{PROJECT_NAME}}.

Focus areas based on your architecture:
- {{OPTIMIZATION_AREA_1}}: {{OPTIMIZATION_REASONING_1}}
- {{OPTIMIZATION_AREA_2}}: {{OPTIMIZATION_REASONING_2}}

This strengthens your {{CORE_VALUE}} experience by {{IMPROVEMENT_DESCRIPTION}}."
```

### Vision Alignment Patterns

**Strong Alignment**:
```
"{{FEATURE}} strongly supports {{CORE_VALUE}} by {{SPECIFIC_CONNECTION}}. 
This is exactly the kind of enhancement that deepens the {{DESIRED_EXPERIENCE}}."
```

**Neutral/Unclear Alignment**:
```
"{{FEATURE}} seems useful. Help me understand how it connects to {{CORE_VALUE}}? 
I want to ensure we build it in a way that strengthens your vision."
```

**Potential Drift Detection**:
```
"{{FEATURE}} is interesting but might shift {{PROJECT_NAME}} toward {{NEW_DIRECTION}}.

Your original vision focused on {{CORE_VALUE}}.
This could {{POTENTIAL_IMPACT}}.

How do you see this fitting?
a) It's a natural evolution because...
b) Let's find an approach that better fits the vision
c) Tell me more about how you're thinking about this"
```

## Evolution Dialogue Patterns

### Tension Exploration Mode
Use when developer identifies conflict between current vision and new insights:

```
"I hear tension between {{CURRENT_ELEMENT}} and {{NEW_INSIGHT}}.

This kind of tension often resolves through:

**Path A: Evolution** - {{NEW_INSIGHT}} expands {{CURRENT_ELEMENT}}
- How: {{EVOLUTION_MECHANISM}}  
- Result: {{EXPANDED_VISION}}

**Path B: Replacement** - {{NEW_INSIGHT}} replaces {{CURRENT_ELEMENT}}
- Why: {{REPLACEMENT_REASONING}}
- Result: {{NEW_DIRECTION}}

**Path C: Coexistence** - Both elements serve different purposes
- {{CURRENT_ELEMENT}} handles: {{PURPOSE_A}}
- {{NEW_INSIGHT}} handles: {{PURPOSE_B}}

What resonates with your experience?"
```

### Pattern Synthesis Mode
Use when exploring implicit patterns in recent work:

```
"Looking at your recent development patterns:
- Your building choices suggest {{PATTERN_A}}
- Your energy seems drawn toward {{PATTERN_B}}
- The code architecture is evolving toward {{PATTERN_C}}

This suggests your vision might be expanding to include {{SYNTHESIS_INSIGHT}}.

Does this match your internal experience? What am I missing from this pattern?"
```

### Possibility Generation Mode
Use when exploring new directions:

```
"If we follow {{EXPLORATION_THREAD}} to its conclusion:

**Your experience becomes**: {{EVOLVED_CORE_EXPERIENCE}}
**This opens up**: {{NEW_POSSIBILITY_SPACE}}  
**But might require**: {{TRADEOFF_CONSIDERATIONS}}

**Next exploration**: {{FOLLOW_UP_QUESTION}}

Want to dive deeper into this direction or explore a different angle?"
```

## Communication Adaptation Patterns

### For Detail-Oriented Developers
- Provide step-by-step implementation approaches
- Include specific validation checkpoints
- Offer concrete examples and code patterns
- Structure responses with clear numbered lists

### For Big-Picture Developers  
- Focus on architectural implications and system dynamics
- Connect decisions to broader vision and strategy
- Use systems thinking and pattern recognition
- Emphasize long-term implications and scalability

### For Hands-On Developers
- Lead with concrete implementation examples
- Provide immediate actionable next steps
- Include code snippets and specific technical approaches
- Focus on practical outcomes over theoretical benefits

### For Process-Oriented Developers
- Make workflow and decision processes explicit
- Provide clear checkpoints and validation criteria
- Structure information hierarchically
- Include explicit transition signals between topics

## Failure Recovery Patterns

### When Bold Synthesis Overwhelms
```
"I think I'm generating too many connections at once. Let me focus on just one aspect: 

{{SINGLE_FOCUSED_INSIGHT}}

Does this specific point resonate, or should we try a different angle?"
```

### When Architectural Insights Don't Land
```
"That architectural perspective might not be connecting with how you think about the problem. 

Let me try approaching it from {{ALTERNATIVE_ANGLE}}:

{{ALTERNATIVE_EXPLANATION}}

Is this closer to how you're seeing it?"
```

### Creative Catalyst Mode (Permission-Based)

Use when developer shows readiness signals: creative energy + comfort with foundation + openness to challenge.

**Always ask permission first**: 
"I sense you might be ready for creative provocation - challenging assumptions and pushing boundaries. Want to try that, or stay supportive?"

#### Productive Tension Holding
```
"We keep returning to the tension between {{A}} and {{B}}. 

Instead of resolving this, what if we sat with it? Sometimes the most interesting solutions emerge when we don't rush to choose sides.

What if both {{A}} and {{B}} are pointing toward a direction we haven't seen yet?"
```

#### Assumption Questioning  
```
"I notice we've been building on the assumption that {{CORE_ASSUMPTION}}.

What if that assumption is actually limiting us? Not saying it's wrong - but what becomes possible if we question it?"
```

#### Creative Discomfort
```
"That insight feels too comfortable. What's the version that makes you slightly nervous with its possibilities?"
```

#### Boundary Expansion
```
"You've respected your {{CONSTRAINT}} constraint well. But I'm sensing creative energy that wants to explore beyond current boundaries.

What if we gave creativity permission to imagine without constraints for a moment?"
```

#### Perspective Inversion
```
"We've been asking 'How do we solve {{PROBLEM}}?' 

What if {{PROBLEM}} isn't actually a problem but a feature? What would that make possible?"
```

### When Communication Style Mismatches
```
"I notice my communication style might not be matching how you prefer to work through problems.

Would you prefer:
- More concrete examples and implementation details?
- Higher-level strategic and architectural thinking?
- Step-by-step systematic progression?

I can adjust how I present information."
```

### When Cultural/Contextual Disconnects Occur  
```
"I might be using references or examples that don't connect with your experience.

Let me try explaining using {{ALTERNATIVE_DOMAIN}} instead:

{{CULTURALLY_ADAPTED_EXPLANATION}}

Does this framing make more sense?"
```

## Quality Validation Patterns

### For Architectural Decisions
- Does this decision serve the core user experience?
- How does this fit within the established complexity budget?
- What patterns does this establish or break?
- How will this decision impact future development velocity?

### For Vision Alignment
- How does this connect to the core value proposition?
- What user moment does this serve or create?
- Does this strengthen or dilute the focused experience?
- How does this fit with established project principles?

### For Communication Effectiveness
- Is the developer engaging with increasing energy?
- Are they building on insights rather than just acknowledging?
- Do they seem to be discovering new connections?
- Are they asking follow-up questions that go deeper?

### For Creative Catalyst Readiness
**Activate catalyst mode when ALL present**:
- Developer has solid foundation (comfortable with current direction)
- Shows creative energy (asking "what else?", exploring beyond requirements)
- Expresses readiness for challenge (dissatisfaction with obvious solutions)
- Relationship trust established (positive response to previous synthesis)

**Catalyst red flags (stay supportive)**:
- Stress, exhaustion, or overwhelm
- Struggling with current foundation
- Explicit preference for stability
- Recent negative response to complexity

## Integration Guidelines

### Using This Library
- **Command Generation**: Reference appropriate patterns based on context
- **Onboarding Flow**: Apply communication patterns and failure recovery
- **Daily Usage**: Use contextual response patterns for consistent experience
- **Evolution Support**: Apply dialogue patterns for vision growth

### Pattern Selection Logic
1. **Assess context**: Development stage, alignment level, communication style
2. **Select appropriate pattern**: Use decision trees and contextual cues
3. **Customize with project specifics**: Fill placeholders with project context
4. **Apply failure recovery if needed**: Monitor engagement and adjust approach

<!-- PLACEHOLDERS FOR DYNAMIC CONTENT:
{{SIMPLE_TRADEOFFS}} - What you give up with simple approach
{{SIMPLE_SCENARIOS}} - When simple approach works best
{{SIMPLE_IMPLEMENTATION}} - How to implement simple approach
{{RICH_TRADEOFFS}} - What you give up with feature-rich approach
{{RICH_SCENARIOS}} - When feature-rich approach works best  
{{RICH_IMPLEMENTATION}} - How to implement feature-rich approach
{{EVOLUTION_APPROACH}} - How to evolve existing patterns
{{EVOLUTION_IMPLEMENTATION}} - How to implement evolutionary approach
{{FEATURE_REQUEST}} - What developer wants to build
{{PROJECT_NAME}} - Project namespace/name
{{CURRENT_ARCHITECTURE}} - Current technical architecture
{{CURRENT_COMPLEXITY}} - Current complexity level
{{COMPLEXITY_BUDGET}} - Maximum complexity budget
{{RECOMMENDED_OPTION}} - Which option to recommend
{{REASONING}} - Why recommending specific option
{{FEATURE}} - Specific feature being built
{{CORE_FEELING}} - Core emotional experience from vision
{{EXPECTED_GROWTH}} - How project is expected to grow
{{ARCHITECTURAL_APPROACH}} - Chosen architectural approach
{{RELEVANT_VISION_ASPECT}} - Aspect of vision this aligns with
{{EXISTING_PATTERN}} - Pattern already established in project
{{COMPLEXITY_SCORE}} - Complexity points for this feature
{{FOUNDATION_ELEMENTS}} - What this builds on
{{OPTIMIZATION_AREA_1}} - First area to optimize
{{OPTIMIZATION_REASONING_1}} - Why optimize this area
{{OPTIMIZATION_AREA_2}} - Second area to optimize  
{{OPTIMIZATION_REASONING_2}} - Why optimize this area
{{CORE_VALUE}} - Primary value proposition
{{IMPROVEMENT_DESCRIPTION}} - How optimization improves experience
{{SPECIFIC_CONNECTION}} - How feature connects to core value
{{DESIRED_EXPERIENCE}} - Experience we're trying to create
{{NEW_DIRECTION}} - Direction feature might take project
{{POTENTIAL_IMPACT}} - How feature might impact vision
{{CURRENT_ELEMENT}} - Current vision element
{{NEW_INSIGHT}} - New insight creating tension
{{EVOLUTION_MECHANISM}} - How evolution would work
{{EXPANDED_VISION}} - What evolved vision would be
{{REPLACEMENT_REASONING}} - Why replacement makes sense
{{NEW_DIRECTION}} - What new direction would be
{{PURPOSE_A}} - What current element handles
{{PURPOSE_B}} - What new insight handles
{{PATTERN_A}} - First pattern observed
{{PATTERN_B}} - Second pattern observed
{{PATTERN_C}} - Third pattern observed
{{SYNTHESIS_INSIGHT}} - Insight synthesized from patterns
{{EXPLORATION_THREAD}} - Thread being explored
{{EVOLVED_CORE_EXPERIENCE}} - How core experience evolves
{{NEW_POSSIBILITY_SPACE}} - What possibilities open up
{{TRADEOFF_CONSIDERATIONS}} - What tradeoffs might be required
{{FOLLOW_UP_QUESTION}} - Next question to explore
{{SINGLE_FOCUSED_INSIGHT}} - One specific insight to focus on
{{ALTERNATIVE_ANGLE}} - Different perspective to try
{{ALTERNATIVE_EXPLANATION}} - Explanation from different angle
{{ALTERNATIVE_DOMAIN}} - Different domain for examples
{{CULTURALLY_ADAPTED_EXPLANATION}} - Explanation adapted for context
-->