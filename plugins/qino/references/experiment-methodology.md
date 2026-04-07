# Experiment Methodology

Reference for the build agent and any experimental work. This document carries the five-part iteration loop, significance shifts, in-process simulation patterns, and anti-patterns discovered through real experiments. It's general methodology — apply where the work calls for it.

---

## The Five-Part Loop

An autonomous iteration loop has five parts:

1. **Measure** — run the system, capture structured metrics
2. **Compare** — how does this run differ from baseline and from the current best?
3. **Decide** — what to change next, informed by the comparison
4. **Record** — persist the run (parameters, metrics, reasoning) so it survives context compression
5. **Listen** — notice when rounds stop opening new ground

If any part is missing, the loop degrades:
- No measurement → guessing
- No comparison → each run is isolated, no learning direction
- No decision framework → random parameter walks
- No recording → rediscovery next session, conversation-dependent knowledge
- No listening → the loop keeps moving after it has already arrived somewhere

### On listening

Steps 1-4 are the rhythm of the loop. Step 5 is what gives the loop permission to change shape.

When several rounds of adjustment don't produce meaningfully different results, that's the loop telling you something about the space it's searching. The question shifts from "which value next" to "is this the right kind of change."

In practice: after N rounds without improvement beyond the noise floor, pause and write down what the runs have shown. Not just the numbers — what pattern they form. Where the improvement came from and where it stopped coming from. The act of writing often reveals the structural assumption that the parameter sweep can't reach.

**The pause may produce**: a different experiment (testing a structural change instead of sweeping a constant), a new annotation (proposal for a structural mechanism), or the conclusion that the current values are good enough and the remaining variance is the system's character. All three are legitimate findings.

**A reasonable default**: pause after 4-5 rounds of the same kind of adjustment without clear directional signal. The number isn't sacred — what matters is that the pause exists and is written into the process.

---

## How Significance Shifts

A metric's relationship to the research question is not fixed. It moves through phases:

**Orienting.** Early in an experiment, crude metrics are enough. "Total drops per 200 ticks" told us the system was 92% silent — sufficient to establish that something needed to change. The metric and the question were close enough.

**Tracking.** As parameters shift, the metric moves with the question. "Longest silence went from 61 to 28 ticks" was meaningful — it tracked a real improvement in what we cared about. The metric and the question were aligned.

**Diverging.** At some point, the metric keeps moving but stops telling you about the question. "Total drops went from 46 to 68" — but was 68 better than 46 as rhythm? The metric measured quantity; the question was about character. They had drifted apart, but the experiment continued as if they hadn't.

**Arriving.** The metric hits a ceiling while the question remains open. The numbers are good. But the original question — does this feel like settled electricity — is now somewhere the metric can't follow. This is not a failure. The experiment carried the question to a threshold where a different way of attending takes over.

**The structured question to check**: *"Does this metric still address the question I recorded at the start?"* An agent running a loop can ask it at each round. The observation "the metric has plateaued but the question hasn't been answered" is something the loop can surface; what to do about it still requires judgment.

---

## The Handoff Between Instruments

Some questions begin measurable and become experiential. The experiment doesn't fail at this transition — it produces the conditions under which the experiential question can be encountered.

The drops rhythm experiment produced a system that reliably forms drops with capped silences and staggered track activation. Whether that rhythm *feels like* settled electricity requires sitting with the canvas. The experiment can't answer that, but it created the conditions where the question is now reachable. Before the tuning, there was nothing to sit with.

This handoff is worth recording explicitly: *"the experiment has brought us here, and from here a different instrument is needed."* The record of the handoff connects the quantitative work to the qualitative encounter that follows. Without it, the experiment reads as "concluded" when it's actually "arrived."

---

## The Metric-Question Record

When you choose a metric, you're making a bet: "this number will tell me something about my question." Recording that bet — not just the number — is what turns an experiment into an inquiry.

Three things to write down at each stage:

1. **What you're measuring** — the metric itself
2. **What you expect it to reveal** — the question it addresses and why you think it speaks to that question
3. **What actually happened** — whether the measurement behaved as expected, and what it means if it didn't

The third entry is where the understanding lives. A metric that behaves as expected confirms a hypothesis. A metric that stops tracking the question reveals something about the shape of the question itself.

**Templates**:

> **At the start of an experiment**: We're measuring [metric] because we believe it will tell us [what] about [the question]. This assumes [assumption about the relationship].

> **When a metric stops being useful**: [Metric] stopped tracking the question at run N. It was still moving, but the movement no longer mapped to [the question] because [what we learned]. This tells us [what about the nature of the thing].

> **At the handoff**: The experiment has brought [the question] to a place where [metric] can't follow. The conditions for encountering it are now [what they are]. The next instrument is [what it is].

These can live as entries in a results log (`note` field alongside metrics), as annotations on the implementation node, or as sections in the inquiry document. The form matters less than the practice of writing them.

---

## In-Process Simulation

**The enabling move for fast loops.** Many backend systems have pure-computation cores — no I/O, no database, no network. Import the computation directly into the experiment script. This bypasses the full server stack:

| Approach | Latency per run | Server needed | State reset |
|----------|----------------|---------------|-------------|
| CLI → HTTP → DO → sim | ~30s (200 ticks) | Yes | Requires clear + seed |
| In-process import | ~300ms (200 ticks) | No | Fresh instance per run |

The 100x speedup makes sweeps practical. More importantly, it makes the loop *interruptible* — you can stop, reflect, and restart without infrastructure overhead.

**When it works**: simulation logic is a pure function of state. No external service calls, no database reads during the tick loop.

**When it doesn't**: if behavior depends on service bindings, external AI calls, or database state, use the full stack.

### Finding the seam

Look for classes or functions where:
- Constructor takes configuration, not environment bindings
- The tick/step/generate method returns data, not void
- All imports are from local files, not from `cloudflare:*` or external APIs

---

## Experiment Script Anatomy

Location: `app-backend/experiments/{experiment-name}.ts`

```
experiments/
  {experiment-name}.ts        — the runner
  results/
    {experiment-name}.jsonl   — accumulated run log (one JSON object per line)
```

The script does six things:

1. **Defines test fixtures** — figures, scenarios, initial state as constants (matching seed data from the real app ensures realistic conditions).
2. **Accepts parameter overrides** — CLI flags that override constants *without editing production files*. This is the critical difference between experimentation and implementation.
3. **Runs the simulation** — N ticks with per-tick metric capture. The trace is the raw data.
4. **Computes summary metrics** — derived from the trace. Metrics should be chosen AFTER a few exploratory runs (play first, criteria emerge from substrate).
5. **Appends to results log** — one JSON line per run to `results/{name}.jsonl` with timestamp, label, parameters, summary, optionally full trace.
6. **Prints comparison** — shows this run vs. baseline and current best. The comparison is what makes the loop *directional*.

---

## Results Accumulation

### The JSONL log

Each line is a self-contained record:

```json
{"ts":"2026-04-06T14:32:00Z","label":"baseline","params":{"deposit":0.15},"summary":{"totalDrops":31,"silentRatio":0.92,"cv":3.93},"runMs":286}
```

### Why JSONL, not a database

- Git-trackable (lives in the repo, visible in PRs)
- Readable by humans (one line per run)
- Parseable by agents (JSON)
- Appendable (no schema migrations)
- Diffable (new runs show up as new lines)

### The log connects sessions

Session 1 runs 6 experiments, finds "extraction 0.5 is best so far." Session 2 starts, loads the log, sees the full history. The agent doesn't need conversation context to know what was tried.

### When to prune

The log grows indefinitely. Prune when:
- An experiment line concludes (archive to a summary annotation on the implementation node)
- The log exceeds ~100 runs (keep the baseline + top 10 + most recent 20)

---

## Connecting to qino-protocol

Experiment scripts and results logs are operational artifacts. The protocol connects them to the knowledge graph:

### Before experimenting

1. **Read the implementation node** — current iteration context
2. **Read open annotations** — proposals and tensions that motivate the experiment
3. **Create the experiment script** in `app-backend/experiments/`

### During experimentation

4. **Run the loop** — measure, compare, decide, record, listen
5. **The results log accumulates** — in `experiments/results/`

### After experimenting (this is where most value is lost)

6. **Write an annotation** on the implementation node:
   - Signal: `reading` (observational) or `proposal` (suggests a change)
   - Include: what was tested, what was found, best parameters, what remains open
   - Reference the results log for detail
7. **Update the iteration doc** — if the experiment produced a shipping change, add it to Technical Decisions and Learnings
8. **Commit the experiment script + results log** — these are part of the project's knowledge, not throwaway tools
9. **Resolve or update annotations** — if the experiment addressed an open proposal or tension, resolve it with findings

### The artifact map

```
implementations/{app}/
  content/{NN}-{iteration}.md        -- iteration that motivates the experiment
  annotations/{NNN}-{finding}.md     -- findings written AFTER experiment

app-backend/
  experiments/
    {name}.ts                        -- the experiment runner (committed)
    results/
      {name}.jsonl                   -- accumulated run log (committed)
  src/simulation/
    {changed-files}.ts               -- production code, changed ONCE at the end
```

---

## Anti-Patterns

### Editing production code for each experimental run

Parameter changes in production files create meaningless back-and-forth diffs. Override parameters in the experiment script instead. Touch production code once when the experiment converges.

### Results in conversation context only

Six runs, each printed to stdout. When context compresses, the comparison table is gone. The next session re-runs the baseline. Append to a results log — the log IS the experimental memory.

### No labeled baseline

Later comparisons require mentally tracking "the original numbers." Run the first experiment explicitly as `--label baseline`. All comparisons anchor to it.

### Sweeping too many parameters at once

When results are worse, you can't tell which change caused it. Change one parameter at a time. For 2D spaces: sweep one dimension, find the best, then sweep the other.

### Pre-built rubrics before play

Designing an evaluation framework before running experiments encodes what you already think matters and prevents discovery of what actually matters. Runs 1-3: no framework, just play and annotate. After 3-5 runs: review annotations, let criteria crystallize from the patterns. *(Exception: when the evaluation dimension is already well-understood — factual accuracy, type safety — pre-built criteria are fine.)*

### Building the next capability layer to compensate for a gap in the current one

Three capability layers exist: CLI tooling → agent + protocol → SDK autonomous. Build each only when the previous is validated. Before building new infrastructure, ask: can the existing tools do this if used correctly? The qino protocol + Claude Code agents already form a complete interactive evaluation environment.

---

## Starting a New Experiment

1. **Identify the seam** — can you import the computation in-process? What's the I/O boundary?
2. **Create the experiment script** with test fixtures, parameter overrides, metric capture, and results logging
3. **Run the baseline** — `--label baseline`, before any changes
4. **Define what "better" means** — which metric matters most? (Update as runs reveal things.)
5. **Iterate** — one parameter at a time, results logged, comparison printed
6. **Listen** — pause every 4-5 rounds to check whether the metric still addresses the question
7. **Write findings back** — annotation on the implementation node, update iteration doc
8. **Commit the clean change** — one coherent diff to production code, with the experiment script and log alongside
