# Fabric Overview

"Fabric" is Daniel Miessler's collection of **AI Patterns**. Think of them as "Mental APIs" or "Pre-baked Prompts" optimized for specific cognitive tasks.

## Why 300+ Files?

Instead of writing a prompt from scratch every time ("Please summarize this video..."), Daniel calls a specific pattern tool:
`Skill('Fabric', 'extract_wisdom')`

This loads a highly-tuned system prompt that ensures consistent, high-quality output.

## Key Categories (Examples)

### 1. Extraction & Summarization (The "Gold" Standard)

- **`extract_wisdom`**: The most famous one. Extracts bullet points, quotes, and actionable insights from ANY text/transcript.
- **`summarize`**: General purpose summary.
- **`summarize_git_changes`**: Specifically for commit logs.
- **`extract_article_wisdom`**: Optimized for blog posts.

### 2. Writing & Creation

- **`write_essay`**: Structured essay generation.
- **`create_keynote`**: strict slide layout generation.
- **`tweet_thread`**: Converts content into viral threads.
- **`create_logo`**: Generates SVG or DALL-E prompts for logos.

### 3. Coding & Security

- **`explain_code`**: deeply explains what a snippet does.
- **`improve_prompt`**: Meta-pattern to make your prompts better.
- **`create_threat_model`**: Security analysis of a system.
- **`analyze_claims`**: Fact-checking logic.

### 4. Philosophy & Thinking

- **`find_logical_fallacies`**: Debating tool.
- **`create_aphorisms`**: Distills complex ideas into punchy one-liners.
- **`analyze_personality`**: Psychology profiling.

## Recommendation

**Keep them all.**
They are text files. They take up negligible space.
Having them available means you can randomly "shop" for a new capability just by browsing the folder.
If you delete them, you lose the "Discovery" aspect of the ecosystem.
