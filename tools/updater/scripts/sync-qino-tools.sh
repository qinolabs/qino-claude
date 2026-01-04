#!/bin/bash
#
# sync-qino-tools.sh — Sync qino-claude tools from GitHub or local checkout
#
# Usage:
#   ./sync-qino-tools.sh [--dev PATH] [--force]
#
# Options:
#   --dev PATH   Source from local checkout instead of GitHub
#   --force      Update all tools regardless of version
#
# Environment:
#   GITHUB_REPO  Override GitHub repo (default: qinolabs/qino-claude)
#   GITHUB_REF   Override GitHub ref (default: main)

set -euo pipefail

# Defaults
GITHUB_REPO="${GITHUB_REPO:-qinolabs/qino-claude}"
GITHUB_REF="${GITHUB_REF:-main}"
BASE_URL="https://raw.githubusercontent.com/${GITHUB_REPO}/${GITHUB_REF}"
DEV_SOURCE=""
FORCE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --dev)
      DEV_SOURCE="$2"
      shift 2
      ;;
    --force)
      FORCE=true
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# Helper: fetch file content (local or remote)
fetch() {
  local path="$1"
  if [[ -n "$DEV_SOURCE" ]]; then
    cat "$DEV_SOURCE/$path"
  else
    curl -sL "$BASE_URL/$path"
  fi
}

# Helper: copy file to destination
copy_file() {
  local src="$1"
  local dest=".claude/$2"

  mkdir -p "$(dirname "$dest")"

  if [[ -n "$DEV_SOURCE" ]]; then
    cp "$DEV_SOURCE/$src" "$dest"
  else
    curl -sL "$BASE_URL/$src" -o "$dest"
  fi
}

# Get manifest
echo "Fetching manifest..."
MANIFEST=$(fetch "tools/manifest.json")

# Get list of tools (excluding archived)
TOOLS=$(echo "$MANIFEST" | jq -r '
  .tools | to_entries[]
  | select(.value.archived != true)
  | .key
')

# Track stats
TOTAL_FILES=0
UPDATED_TOOLS=()

# Process each tool
for tool in $TOOLS; do
  # Get tool info
  TOOL_INFO=$(echo "$MANIFEST" | jq -r ".tools[\"$tool\"]")

  # Check if we need to update (skip version check in dev mode or if forced)
  if [[ -z "$DEV_SOURCE" ]] && [[ "$FORCE" != "true" ]]; then
    # Get local version
    LOCAL_VERSION=""
    if [[ -f ".claude/references/$tool/version.json" ]]; then
      LOCAL_VERSION=$(jq -r '.version' ".claude/references/$tool/version.json" 2>/dev/null || echo "")
    fi

    # Get remote version
    REMOTE_VERSION=$(fetch "tools/$tool/references/$tool/version.json" 2>/dev/null | jq -r '.version' 2>/dev/null || echo "")

    # Skip if versions match
    if [[ -n "$LOCAL_VERSION" ]] && [[ "$LOCAL_VERSION" == "$REMOTE_VERSION" ]]; then
      continue
    fi

    # Skip if not installed and not forcing
    if [[ -z "$LOCAL_VERSION" ]]; then
      continue
    fi
  fi

  # Get files for this tool
  FILES=$(echo "$TOOL_INFO" | jq -r '.files[] | "\(.src)|\(.dest)"')
  FILE_COUNT=0

  # Copy each file
  while IFS='|' read -r src dest; do
    copy_file "$src" "$dest"
    ((FILE_COUNT++))
  done <<< "$FILES"

  TOTAL_FILES=$((TOTAL_FILES + FILE_COUNT))

  # Get version for reporting
  VERSION=$(jq -r '.version' ".claude/references/$tool/version.json" 2>/dev/null || echo "unknown")
  UPDATED_TOOLS+=("$tool:$VERSION:$FILE_COUNT")
done

# In dev mode, mark versions with -dev suffix
if [[ -n "$DEV_SOURCE" ]]; then
  for version_file in .claude/references/*/version.json; do
    if [[ -f "$version_file" ]]; then
      # Strip any existing -dev suffix, then add fresh one
      jq '.version = (.version | sub("-dev.*$"; "")) + "-dev"' "$version_file" > "$version_file.tmp"
      mv "$version_file.tmp" "$version_file"
    fi
  done
fi

# Report results
echo ""
if [[ -n "$DEV_SOURCE" ]]; then
  echo "Dev sync complete:"
else
  echo "Update complete:"
fi

echo ""
printf "  %-20s %-14s %s\n" "Tool" "Version" "Files"
printf "  %-20s %-14s %s\n" "----" "-------" "-----"

for entry in "${UPDATED_TOOLS[@]}"; do
  IFS=':' read -r tool version files <<< "$entry"
  if [[ -n "$DEV_SOURCE" ]]; then
    # Read actual version from file (after -dev suffix applied)
    version=$(jq -r '.version' ".claude/references/$tool/version.json" 2>/dev/null || echo "$version")
  fi
  printf "  %-20s %-14s %s\n" "$tool" "$version" "$files"
done

echo ""
echo "$TOTAL_FILES files synced."
echo ""
echo "Note: Updated commands will be available in a new conversation."
