# Speech Plugin

Text-to-speech utility for reading Claude responses aloud using macOS native speech synthesis.

## Usage

Invoke with `/speech` or natural language like "read this aloud", "speak", "say it".

## How It Works

1. Extracts the last Claude response
2. Transforms markdown to audio-friendly plain text
3. Writes to a temp file
4. Speaks using `say -v "Siri Female"`

## Requirements

- macOS (uses native `say` command)
- "Siri Female" voice installed (default on modern macOS)

## Voice Alternatives

Edit the `say -v` parameter to use different voices:
- `"Samantha"` — Classic Siri
- `"Alex"` — Male voice with high quality
- `"Daniel"` — British accent
