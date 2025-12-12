# qino-eval: Gap Assessment

*What's missing for a complete evaluation workflow?*

---

## What We Have

### Commands
- `/eval:compare` — Guided comparison of two chapters

### References
- `framework.md` — The 7-dimension lens for perceiving quality
- `session-guide.md` — How to facilitate the human through evaluation
- `learning-log.md` — How evaluations become architectural improvements

---

## What's Missing

### 1. Single Chapter Evaluation

**Gap:** We can only compare two chapters. Sometimes you want to evaluate a chapter on its own — "is this good?" not "is this better than that?"

**Needed:** `/eval:chapter [path]` command that:
- Walks through the framework dimensions for one chapter
- Identifies strengths and weaknesses
- Suggests what would improve it
- Creates a lighter-weight log entry

**Priority:** Medium — comparison is the main use case, but single eval is useful for iteration

---

### 2. Quick Scoring Mode

**Gap:** The full session is thorough but heavy. Sometimes you want a quick read.

**Needed:** `/eval:quick [path] [path]` that:
- Reads both chapters
- Scores each on the 7 dimensions (1-4)
- Provides a brief summary of key differences
- Takes 5 minutes not 30

**Priority:** Medium — useful for rapid iteration, but risks losing depth

---

### 3. Pattern Review Command

**Gap:** Pattern extraction from the log is manual. After 5+ evaluations, you need to synthesize.

**Needed:** `/eval:patterns` command that:
- Reads the evaluation log
- Extracts recurring problems and successes
- Identifies highest-leverage changes not yet tried
- Suggests what to test next

**Priority:** High — this closes the learning loop

---

### 4. Architectural Diff Helper

**Gap:** When we decide to change soul.md or process.md, we do it manually. No structured way to track what changed and test it.

**Needed:** `/eval:experiment [hypothesis]` command that:
- Records the hypothesis being tested
- Notes which files will change
- Creates a before/after comparison plan
- Links to evaluation entries that test it

**Priority:** Low — manual tracking works for now

---

### 5. Cross-Tool Comparison

**Gap:** We might have multiple scribe tools (qino-scribe, qino-world). No structured way to compare architectures.

**Needed:** Guidance in session-guide.md for architecture comparison, plus:
- A way to generate the same chapter with different tools
- A log that tracks cross-tool patterns

**Priority:** Medium — relevant once we have confirmed qino-world is different

---

### 6. Reader Proxy Mode

**Gap:** The human evaluator knows the source material. A true test is whether someone who doesn't know would be engaged.

**Needed:** `/eval:reader` mode that:
- Presents the chapter without context
- Asks pure reader questions (would you keep reading? do you care?)
- Removes all framework language — just felt response

**Priority:** Low — valuable but the human can simulate this

---

### 7. Passage Library

**Gap:** Good and bad passages are noted in log entries but not easily findable. Over time, we accumulate examples but can't reference them.

**Needed:** A `passages.md` file that collects:
- Exemplar passages (with notes on why they work)
- Anti-patterns (with notes on why they fail)
- Organized by dimension or problem type

**Priority:** Medium — becomes valuable after 10+ evaluations

---

## Recommended Next Steps

### Immediate (before first evaluation)
- [x] Core commands and references exist
- [ ] Test `/eval:compare` with a real comparison

### After 3-5 Evaluations
- [ ] Add `/eval:patterns` command
- [ ] Start `passages.md` if useful passages emerge

### After 10+ Evaluations
- [ ] Consider `/eval:quick` for rapid iteration
- [ ] Consider `/eval:chapter` for single evaluation
- [ ] Review whether cross-tool comparison needs structure

---

## Architecture Questions

### Should qino-eval be scribe-agnostic?

Currently, the log lives with each scribe tool (`tools/qino-world/evaluation-log.md`). This keeps insights close to what they improve.

Alternative: Central log in qino-eval. Pro: one place to see everything. Con: loses connection to specific architecture.

**Current decision:** Keep logs with scribe tools. qino-eval is the method, not the memory.

### Should evaluation be automatable?

Some dimensions could be partially automated:
- Explanation count (grep for dialogue patterns)
- Action detection (does wanderer verb-something?)
- Stakes test (are there tension words?)

**Current decision:** No. The value is in human felt sense. Automation would optimize for metrics, not experience.

### How does this connect to chapter generation?

The scribe (qino-world) generates. The eval (qino-eval) assesses. Insights flow back to scribe references.

Could they be tighter? E.g., eval runs automatically after generation?

**Current decision:** Keep separate. Evaluation is a deliberate act of attention, not a CI check.
