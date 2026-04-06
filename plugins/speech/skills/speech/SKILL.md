---
name: speech
description: |
  Read Claude's last response aloud using macOS text-to-speech.
  Creates an audio-optimized version and speaks it using the system default voice.

  ACTIVATE:
  - "/speech", "read this", "speak", "say it", "read aloud"
---

# Speech Skill

Converts Claude's last response into spoken audio using macOS `say` command.

---

## Execution

When this skill is invoked:

### Step 1: Extract Last Response

Look at the immediately preceding assistant message in the conversation. This is the content to be spoken.

### Step 2: Create Audio-Optimized Version

Transform the response for natural speech by:

1. **Remove markdown formatting:**
   - Strip `**bold**` and `*italic*` markers (keep inner text)
   - Remove `# Headers` markers (keep header text)
   - Remove `` `code` `` backticks (keep code text)
   - Remove `[links](url)` — keep link text, drop URL
   - Remove horizontal rules (`---`)
   - Remove bullet points (`- `, `* `, `1. `) — keep content

2. **Handle code blocks:**
   - For small inline code: speak it as-is
   - For multi-line code blocks: replace with "Code block omitted" or summarize briefly

3. **Clean special characters:**
   - Replace `→` with "arrow"
   - Replace `|` in tables with pauses
   - Remove excessive whitespace

4. **Optimize for listening:**
   - Keep explanatory text
   - Preserve natural sentence structure
   - Add slight pauses at paragraph breaks (double newlines → period and pause)

### Step 3: Write to Temp File

Write the audio-optimized text to a temporary file:

```bash
SPEECH_FILE=$(mktemp /tmp/claude-speech.XXXXXX.txt)
```

### Step 4: Speak with System Voice

Execute the macOS say command (uses system default voice):

```bash
say -f "$SPEECH_FILE"
```

### Step 5: Cleanup (Optional)

The temp file can be left for inspection or removed:

```bash
rm "$SPEECH_FILE"
```

---

## Example Transformation

**Original response:**
```markdown
## Here's what I found

The `calculateTotal` function in `src/utils.ts:42` has a bug:

- It doesn't handle **negative values**
- The return type is `number | undefined`

```typescript
function calculateTotal(items: Item[]) {
  return items.reduce((sum, i) => sum + i.value, 0);
}
```

Let me know if you want me to fix it!
```

**Audio-optimized version:**
```
Here's what I found.

The calculateTotal function in src/utils.ts line 42 has a bug.

It doesn't handle negative values.
The return type is number or undefined.

Code block omitted.

Let me know if you want me to fix it!
```

---

## Notes

- **macOS only** — Uses the `say` command which is macOS-specific
- **Voice** — Uses the system default voice (configure in System Settings → Accessibility → Spoken Content)
- **Long responses** — For very long responses, consider speaking only the summary or key points
