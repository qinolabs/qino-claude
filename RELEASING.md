# Releasing

Releases are created manually. The GitHub Actions workflow then builds and attaches the zip files automatically.

## Create a release

```bash
# Make sure everything is committed and pushed
git status
git push

# Create the release
gh release create v0.2.0 --title "v0.2.0" --notes "What changed"
```

Or use the [GitHub web UI](https://github.com/qinolabs/qino-claude/releases/new).

## What happens next

The workflow (`.github/workflows/release.yml`) automatically:
1. Builds zip files for each tool
2. Builds `all-tools.zip` with everything combined
3. Attaches them to the release

## Version numbers

No strict rules. Just increment when it feels right:
- `v0.1.0` → `v0.2.0` for new features or significant changes
- `v0.1.0` → `v0.1.1` for small fixes

## Check it worked

After creating a release, check the [Actions tab](https://github.com/qinolabs/qino-claude/actions) to see the workflow run. The zips should appear on the release page within a minute or two.
