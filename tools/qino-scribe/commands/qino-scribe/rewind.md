---
description: Rewind to before the last chapter (restore world state, remove chapter)
allowed-tools: Read, Write, Edit, Glob, Bash
---

## Task

Rewind the chronicle to before the last chapter was written. This restores `world.md` and `arcs.md` to their previous state, removes the last chapter, and updates the manifest.

Use this when you want to regenerate a chapter — rewind first, then run `/qino-scribe:chapter`.

## Process

### 1. Check Chronicle Exists

If `chronicle/` doesn't exist, stop:

```
No chronicle found. Nothing to rewind.
```

### 2. Read Manifest

Read `chronicle/manifest.json`. Find:
- The last chapter entry (last item in `chapters` array)
- The previous chapter entry (second-to-last item)

If there's only one chapter, stop:

```
Only one chapter exists. Cannot rewind past the first chapter.
```

### 3. Show What Will Happen

Present clearly:

```
rewind

  removing:    [last chapter slug] — "[last chapter title]"
  restoring:   world state from [previous chapter slug]

  This will:
  • Delete chronicle/chapters/[last-chapter-slug]/
  • Restore chronicle/world.md from [previous-chapter-slug]/world.md
  • Restore chronicle/arcs.md from [previous-chapter-slug]/arcs.md
  • Update manifest.json

                                              proceed? (y to confirm)
```

Wait for user confirmation.

### 4. Execute Rewind

On confirmation:

1. **Copy previous chapter's snapshots to root:**
   ```bash
   cp chronicle/chapters/[previous-slug]/world.md chronicle/world.md
   cp chronicle/chapters/[previous-slug]/arcs.md chronicle/arcs.md
   ```

2. **Remove last chapter directory:**
   ```bash
   rm -rf chronicle/chapters/[last-slug]/
   ```

3. **Update manifest.json:**
   - Remove the last entry from `chapters` array
   - Update `last_chapter` to reference the previous chapter's info

### 5. Report

```
rewound

  removed:     [last chapter slug]
  restored:    world state from [previous chapter slug]

  Ready to write a new chapter from the same git range.
  Run /qino-scribe:chapter to regenerate.
```

## Edge Cases

**User declines confirmation:** Stop without changes.

**Previous chapter missing snapshots:** This shouldn't happen if chapters were written correctly. If it does, warn and stop — don't partially rewind.

**Git state:** The manifest preserves `git_ref_start` and `git_ref_end` for each chapter. After rewind, running `/qino-scribe:chapter` will use the correct range automatically (from the now-last chapter's `git_ref_end` to HEAD).
