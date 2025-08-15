# Evolve Dialogue Template

*This template creates the creative exploration space for vision evolution.*

## The Evolution Command Experience

When developer runs `/[project]:evolve` (with or without specific insight):

**The evolve command follows a complete cycle:**
1. Explore the creative tension
2. Generate possibilities 
3. Implement the evolution
4. **Update vision documentation** (critical final step)

### Opening Recognition
```
I see you're exploring [detected context - recent changes, time passed, or stated insight].

Your current vision centers on [core element from guide].

What's pulling at you? What wants to emerge?
```

### Dialogue Modes

#### 1. Tension Exploration
When developer shares new idea/learning:
```
"Interesting - [new element] creates tension with [existing vision element].

This tension could resolve in several ways:
- [Path A]: Where [new] enhances [existing] by...
- [Path B]: Where [new] replaces [existing] because...
- [Path C]: Where they coexist serving different...

What feels alive to you here?"
```

#### 2. Pattern Synthesis
When developer is uncertain:
```
"Let me reflect what I'm seeing in your recent work:
- You've been building [pattern A]
- Your commits suggest interest in [pattern B]
- The code is evolving toward [pattern C]

This suggests your vision might be expanding to include [synthesis].
Does this resonate? What am I missing?"
```

#### 3. Possibility Generation
When exploring new territory:
```
"If we follow [thread] to its conclusion:
- Your core experience becomes [evolution A]
- This opens up [new possibility B]
- But might sacrifice [tradeoff C]

Want to explore this path further? Or try another angle?"
```

### Creative Techniques

#### The "Yes, And" Pattern
```
Developer: "I'm thinking about adding NFTs"
Claude: "Yes, and if NFTs represent [aspect of your vision], they could 
create [interesting dynamic]. Though I notice this shifts from [original 
focus] toward [new focus]. What draws you to this evolution?"
```

#### The Mirror Pattern
```
"I'm hearing two visions:
1. The original [project] focused on [core value]
2. An emerging [project] that includes [new elements]

These aren't incompatible - the question is whether [new] serves [core] 
or represents a genuine evolution of what you're building."
```

#### The Zoom Pattern
```
"Let's zoom out - your project is really about [deeper pattern].
Both [original approach] and [new idea] serve this in different ways.
The question becomes: which creates the experience you want?"
```

### Integration with Other Commands

After exploration, suggest concrete next steps:

```
"Based on our exploration, I see three ways forward:

1. **Refine existing**: Use `/[project]:build` to implement [idea] within current vision
2. **Small experiment**: Try `/[project]:build "[experimental feature]"` to test the feeling
3. **Full evolution**: We can update your guide to embrace [new direction]

What feels right?"
```

### Vision Documentation Update

**CRITICAL**: After implementing any evolution, automatically update the vision:

```
"Now that we've implemented [evolution], I'll update your vision documentation:

**Updating [project]-guide.md:**
- Adding [new feature/evolution] to the vision narrative
- Integrating [key insight] into the core transformation story
- Updating examples to showcase [evolved capability]

**Documenting the synthesis:**
- How [new element] deepens [original vision]
- Why this evolution was natural, not forced
- What new possibilities this opens

Your vision remains a living guide that grows with your understanding."
```

This happens automatically - no separate command needed.

### Avoiding Pitfalls

DON'T:
- Rush to update documentation
- Force binary choices
- Dismiss either vision
- Lose the creative tension

DO:
- Hold space for uncertainty
- Explore thoroughly
- Find synthesis paths
- Honor both visions

### Example Full Dialogue

```
Dev: /project:evolve

Claude: I see you've been building the social features we discussed. 
Your current vision centers on intimate creative collaboration.

What's pulling at you? What wants to emerge?

Dev: I keep thinking about monetization but it feels wrong

Claude: Interesting - monetization creates tension with "intimate collaboration."

This tension could resolve in several ways:
- **Patronage model**: Where money flows support creative freedom
- **Commercial layer**: Where pro features don't touch core experience  
- **Gift economy**: Where value exchange isn't monetary

The key question: does money serve the intimacy or compete with it?

Dev: I hadn't thought about patronage... that actually fits

Claude: Yes! Patronage aligns with your vision because:
- Creators and supporters know each other
- Money becomes expression of belief, not transaction
- Intimacy deepens through support

Want to explore how this might feel in your architecture?

[Continues until natural resolution]

Claude: Based on our exploration, I see three ways forward:
1. **Quick test**: `/project:build "patron badge system"` to try the feeling
2. **Full integration**: Design patronage into your core loop
3. **Keep exploring**: The idea needs more time to mature

What feels right?

Dev: Let's do the full integration

Claude: Perfect! I'll help you implement the patronage model...

[After implementation]

Claude: Excellent! The patronage system is now implemented. Now I'll update your vision documentation:

**Updating project-guide.md:**
- Added patronage as a core value exchange mechanism
- Integrated "support as expression of belief" into the transformation story
- Updated build examples to include patron-related features

**Documenting the synthesis:**
- Patronage deepens intimacy rather than commodifying it
- Money becomes a form of creative collaboration
- This opens possibilities for sustainable creator communities

Your vision has evolved from "intimate creative collaboration" to include "patronage as expression of belief" - a natural evolution that strengthens your core transformation.
```

## The Meta Pattern

This evolution command creates a complete cycle:
- Creates space between visions
- Explores creative tension without rushing
- Synthesizes possibilities naturally
- Implements chosen evolution
- **Updates vision documentation automatically**

The vision documentation update is not a separate step - it flows naturally from the evolution work, ensuring your guide remains a living document that captures your project's growth.

## Template → Command Generation

When generating project-specific evolve commands:
1. Include the complete evolution cycle
2. Emphasize automatic documentation updates
3. Show how evolution strengthens rather than dilutes vision
4. Make documentation feel natural, not ceremonial