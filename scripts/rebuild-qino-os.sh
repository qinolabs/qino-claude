#!/usr/bin/env bash
set -euo pipefail

# Rebuild qino-os and sync to both the repo bundle and the Claude plugin cache.
# Run after making changes to qinolabs-repo/packages/qino-os.

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MONOREPO="${REPO_ROOT}/../qinolabs-repo"
PLUGIN_DIST="${REPO_ROOT}/plugins/qino/servers/dist"
CACHE_DIR="$HOME/.claude/plugins/cache/qino-plugins/qino"

# Build
echo "Building qino-os plugin bundle..."
(cd "$MONOREPO" && pnpm -F @qinolabs/qino-os build:plugin)

# Sync to repo
echo "Syncing to repo..."
rm -rf "$PLUGIN_DIST"
mkdir -p "$PLUGIN_DIST/server"
cp "$MONOREPO/packages/qino-os/dist/plugin/server/index.js" "$PLUGIN_DIST/server/"
cp -r "$MONOREPO/packages/qino-os/dist/ui" "$PLUGIN_DIST/"

# Sync to plugin cache (all installed versions)
if [ -d "$CACHE_DIR" ]; then
  for version_dir in "$CACHE_DIR"/*/; do
    if [ -d "${version_dir}servers/dist/server" ]; then
      echo "Syncing to cache: $(basename "$version_dir")"
      cp "$PLUGIN_DIST/server/index.js" "${version_dir}servers/dist/server/"
      rm -rf "${version_dir}servers/dist/ui"
      cp -r "$PLUGIN_DIST/ui" "${version_dir}servers/dist/"
    fi
  done
fi

echo "Done. Reload plugins in Claude Code: /reload-plugins"
