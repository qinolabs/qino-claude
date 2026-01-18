# Iteration 03: Onboarding & Validation

Create onboarding experience and validation tooling based on learnings from iterations 01-02. Scope determined after seeing real-world usage patterns.

## Scope

**Conditional on learnings from iterations 01-02:**
- Onboarding documentation (what depth is needed?)
- Validation tooling (how much to validate?)
- Error recovery guidance (what issues do users hit?)
- Progressive disclosure (what overwhelms new users?)

**What's explicitly deferred:**
- Migration tooling (need structure changes to accumulate first)
- Video walkthroughs (medium priority, resource-intensive)
- Advanced workspace management (not needed yet)
- Cloud sync or backup (out of scope entirely)

## Open Questions

**Q1: Onboarding depth?**

After iterations 01-02, we'll know:
- What confuses new users?
- Where do they get stuck?
- What assumptions do they bring?

**Options:**
1. **Minimal**: README-only, assume developers can explore
2. **Guided**: Interactive first-run, wizard-style
3. **Progressive**: Contextual help as user progresses
4. **Comprehensive**: Full tutorial, examples, videos

**Decision point:** After iteration 02 user testing

**Q2: Validation scope?**

What should `/qino validate workspace` check?

**Structure validation:**
- [ ] Required directories exist?
- [ ] Required files exist (.claude/qino-config.json)?
- [ ] Config files are valid JSON?

**Semantic validation:**
- [ ] Paths in workspace-config resolve?
- [ ] Linked concepts exist?
- [ ] Manifest entries match filesystem?
- [ ] repoType matches actual structure?

**Quality validation:**
- [ ] README exists and non-empty?
- [ ] Git repos initialized?
- [ ] No orphaned files?
- [ ] Naming conventions followed?

**Decision point:** After seeing what breaks in iterations 01-02

**Q3: Error recovery strategy?**

When validation finds issues, what next?

**Options:**
1. **Report only**: Show errors, user fixes manually
2. **Guided repair**: Offer to fix each issue
3. **Auto-repair**: Fix automatically with confirmation
4. **Interactive**: Step through fixes one by one

**Decision point:** Depends on error types that emerge

**Q4: Progressive disclosure?**

How much to show new users vs. experienced users?

**Considerations:**
- First-time users need hand-holding
- Experienced users need speed
- Information overload kills adoption

**Possible approaches:**
- Onboarding mode (verbose) → regular mode (terse)
- `/qino help` shows basics, `/qino help --advanced` shows all
- Contextual tips that can be dismissed
- "Learn more" links in output instead of inline docs

**Decision point:** After observing new user behavior

## Tentative Goals

**Subject to revision after iterations 01-02:**

### Onboarding
- [ ] First-run detection (show welcome guide)
- [ ] Quick start guide (5 minutes to first capture)
- [ ] Progressive tips (contextual, dismissible)
- [ ] Link to chronicles/journal for deeper understanding

### Validation
- [ ] `/qino validate workspace` command
- [ ] Structure validation (dirs, files, configs)
- [ ] Semantic validation (paths resolve, links valid)
- [ ] Clear error messages with fix suggestions
- [ ] Option to auto-repair simple issues

### Documentation
- [ ] Getting Started guide (separate from philosophy README)
- [ ] Troubleshooting guide (common issues)
- [ ] Upgrade guide (when templates change)
- [ ] FAQ based on real user questions

### Quality of Life
- [ ] `/qino status` — show workspace health
- [ ] `/qino where` — orient within workspace
- [ ] Better error messages from existing commands
- [ ] Consistent command naming across workflows

## Possible Implementation Paths

### Path A: Minimal Validation Only

**Scope:**
- Basic structure checking
- Config validation
- Clear error messages
- Manual fixes

**Pros:**
- Fastest to ship
- Less complex
- Users learn structure

**Cons:**
- More support burden
- Slower user success

### Path B: Guided Onboarding + Validation

**Scope:**
- Interactive first-run
- Progressive tips
- Structure + semantic validation
- Guided repair

**Pros:**
- Lower support burden
- Faster user success
- Better UX

**Cons:**
- More complex
- Longer to build
- Risk of over-engineering

### Path C: Hybrid (Likely Choice)

**Scope:**
- Minimal onboarding (README + quick start)
- Solid validation (structure + semantic)
- Clear errors with fix hints
- Manual repair (auto-repair for simple cases)

**Rationale:**
- Balance complexity and value
- Can enhance based on feedback
- Good enough to ship, room to improve

**Decision:** After iteration 02 completion

## Test Criteria

**Onboarding:**
- [ ] New user goes from install to first capture in <10 minutes
- [ ] No manual file creation needed
- [ ] Clear what to do next at each step
- [ ] Can find help when stuck

**Validation:**
- [ ] Catches all structure issues
- [ ] Catches broken paths/links
- [ ] Error messages are actionable
- [ ] False positives are minimal
- [ ] Validation runs fast (<1 second)

**Documentation:**
- [ ] Getting started guide is complete
- [ ] Troubleshooting covers common issues
- [ ] Links to deeper resources (chronicles, journal)
- [ ] Examples show real usage patterns

**Overall:**
- [ ] User success rate >80% on first try
- [ ] Support questions decline
- [ ] Users can self-serve common issues
- [ ] Advanced users aren't slowed down

## Dependencies on Previous Iterations

**From iteration 01:**
- Template repositories exist and work
- Users can fork and use templates
- What breaks when users fork?
- What questions do they ask?

**From iteration 02:**
- Workspace setup workflow exists
- Users can scaffold programmatically
- What errors occur during setup?
- What's confusing about the flow?

**Learnings needed:**
- Which approach do users prefer (templates vs scaffolding)?
- Where do they get stuck?
- What assumptions break?
- What's missing from docs?

## Implementation Approach

### Phase 0: Gather Learnings (After iteration 02)
1. User test workspace creation (both template and scaffolding)
2. Collect questions and confusion points
3. Analyze error patterns
4. Identify most common issues

### Phase 1: Design Based on Data
1. Review learnings from Phase 0
2. Decide on onboarding depth
3. Decide on validation scope
4. Prioritize features by impact
5. Write refined iteration plan (this file updated)

### Phase 2: Build (Exact scope TBD)
- Build chosen onboarding approach
- Build chosen validation approach
- Write documentation
- Create troubleshooting guide

### Phase 3: Test & Refine
- User test onboarding flow
- Test validation accuracy
- Refine error messages
- Improve documentation

## Deferred Beyond Iteration 03

**Migration tooling:**
- Need multiple template versions first
- Need actual migration scenarios
- Can document manual process until then

**Video walkthroughs:**
- Resource-intensive
- Text + images may suffice
- Can add later if adoption warrants

**Advanced features:**
- Multi-workspace management (not needed)
- Workspace templates (too meta)
- Cloud backup (out of scope)
- Collaboration features (future, maybe)

## Success Metrics (To Be Refined)

**Adoption:**
- X users create workspace (via templates or scaffolding)
- Y% complete first iteration successfully
- Z% return after 1 week

**Support:**
- Common issues documented in FAQ
- Question volume decreases over time
- Users help each other (community forms)

**Quality:**
- Validation catches real issues
- False positive rate <5%
- Error messages lead to resolution

**Specific metrics TBD after iteration 02**

## Learnings

(To be filled during implementation)

### What Shifted

### What Worked

### What Surprised Us

### Led To

---

## Notes

This iteration is **intentionally underspecified** compared to 01 and 02. The right scope depends on:
1. How iterations 01-02 work in practice
2. What issues users actually encounter
3. What level of hand-holding is needed
4. What validation catches real vs. theoretical problems

**After iteration 02 completes**, revisit this file and:
- Refine goals based on learnings
- Choose implementation path (A/B/C or hybrid)
- Specify exact validation scope
- Detail onboarding flow
- Update test criteria

**Flexibility principle:** Leave room to learn. Early iterations inform later ones. Don't over-specify before seeing reality.
