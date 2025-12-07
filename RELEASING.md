# Releasing

## Create a release

```
/release v0.2.0
```

This command:
1. Analyzes changes since last release
2. Generates meaningful changelog entries
3. Updates CHANGELOG.md
4. Creates the GitHub release

The workflow (`.github/workflows/release.yml`) then builds and attaches zip files automatically.

## Version numbers

No strict rules. Increment when it feels right:
- `v0.1.0` → `v0.2.0` for new features or significant changes
- `v0.1.0` → `v0.1.1` for small fixes

## Check it worked

After creating a release, check the [Actions tab](https://github.com/qinolabs/qino-claude/actions). The zips should appear on the release page within a minute or two.
