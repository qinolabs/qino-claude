#!/bin/bash
#
# Regenerate tools/manifest.json file lists from directory structure.
# Preserves tool metadata (description, archived) while updating file lists.
#
# Only updates tools already in the manifest. To add a new tool:
# 1. Add it to manifest.json manually with description and empty files array
# 2. Run this script to populate the files
#
# Usage:
#   ./scripts/sync-manifest.sh          # Show diff
#   ./scripts/sync-manifest.sh --write  # Write changes
#

set -eo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MANIFEST="$REPO_ROOT/tools/manifest.json"
WRITE_MODE=false

if [[ "${1:-}" == "--write" ]]; then
  WRITE_MODE=true
fi

# Check dependencies
if ! command -v jq &> /dev/null; then
  echo "Error: jq is required. Install with: brew install jq" >&2
  exit 1
fi

# Discover files for a tool directory
# Args: $1 = tool source dir (e.g., "tools/qino-concept" or "tools/archived/dev-assistant")
discover_files() {
  local tool_dir="$1"

  {
    # Commands
    find "$REPO_ROOT/$tool_dir/commands" -name "*.md" -type f 2>/dev/null || true
    # Agents
    find "$REPO_ROOT/$tool_dir/agents" -name "*.md" -type f 2>/dev/null || true
    # References (excluding README)
    find "$REPO_ROOT/$tool_dir/references" -type f ! -name "README.md" ! -name ".*" 2>/dev/null || true
    # Templates (legacy, maps to references/{tool}/templates/)
    find "$REPO_ROOT/$tool_dir/templates" -type f ! -name "README.md" ! -name ".*" 2>/dev/null || true
    # Examples (legacy, maps to references/{tool}/examples/)
    find "$REPO_ROOT/$tool_dir/examples" -type f ! -name "README.md" ! -name ".*" 2>/dev/null || true
    # Instructions (legacy, maps to references/{tool}/instructions/)
    find "$REPO_ROOT/$tool_dir/instructions" -type f ! -name "README.md" ! -name ".*" 2>/dev/null || true
    # Root-level migrations.md (updater special case)
    [[ -f "$REPO_ROOT/$tool_dir/migrations.md" ]] && echo "$REPO_ROOT/$tool_dir/migrations.md"
  } | sort
}

# Convert source path to destination path
# Args: $1 = full path, $2 = tool source prefix (e.g., "tools/qino-concept")
to_dest() {
  local full_path="$1"
  local tool_prefix="$2"
  local relative="${full_path#$REPO_ROOT/}"
  local tool_name

  # Extract tool name from prefix
  if [[ "$tool_prefix" == tools/archived/* ]]; then
    tool_name="${tool_prefix#tools/archived/}"
  else
    tool_name="${tool_prefix#tools/}"
  fi

  # Handle special directories -> references/{tool}/{dir}/
  if [[ "$relative" == *"/templates/"* ]]; then
    local after="${relative#*templates/}"
    echo "references/$tool_name/templates/$after"
  elif [[ "$relative" == *"/examples/"* ]]; then
    local after="${relative#*examples/}"
    echo "references/$tool_name/examples/$after"
  elif [[ "$relative" == *"/instructions/"* ]]; then
    local after="${relative#*instructions/}"
    echo "references/$tool_name/instructions/$after"
  elif [[ "$relative" == */migrations.md ]]; then
    # Root-level migrations.md -> references/{tool}/migrations.md
    echo "references/$tool_name/migrations.md"
  else
    # Strip tool prefix
    echo "${relative#$tool_prefix/}"
  fi
}

# Build JSON array of file entries for a tool
# Args: $1 = tool source dir
build_file_entries() {
  local tool_dir="$1"
  local entries="[]"

  while IFS= read -r file; do
    [[ -z "$file" ]] && continue
    local src="${file#$REPO_ROOT/}"
    local dest
    dest=$(to_dest "$file" "$tool_dir")
    entries=$(echo "$entries" | jq --arg src "$src" --arg dest "$dest" '. += [{"src": $src, "dest": $dest}]')
  done < <(discover_files "$tool_dir")

  echo "$entries"
}

# Get list of tools from current manifest (not from filesystem)
# This ensures we only update tools that are already tracked
get_manifest_tools() {
  jq -r '.tools | keys[]' "$MANIFEST"
}

# Determine tool source directory
# Args: $1 = tool name, $2 = archived flag from manifest
get_tool_dir() {
  local tool="$1"
  local archived="$2"

  if [[ "$archived" == "true" ]]; then
    echo "tools/archived/$tool"
  else
    echo "tools/$tool"
  fi
}

# Main: build new manifest
build_manifest() {
  local current
  current=$(cat "$MANIFEST")

  # Start with preserved top-level fields
  local new_manifest
  new_manifest=$(echo "$current" | jq '{version, description, tools: {}}')

  # Process all tools from manifest
  while IFS= read -r tool; do
    [[ -z "$tool" ]] && continue

    # Get existing metadata
    local desc archived
    desc=$(echo "$current" | jq -r --arg t "$tool" '.tools[$t].description // ""')
    archived=$(echo "$current" | jq -r --arg t "$tool" '.tools[$t].archived // false')

    # Determine source directory
    local tool_dir
    tool_dir=$(get_tool_dir "$tool" "$archived")

    # Skip if directory doesn't exist
    if [[ ! -d "$REPO_ROOT/$tool_dir" ]]; then
      echo "Warning: $tool_dir not found, skipping" >&2
      continue
    fi

    # Build file entries
    local files
    files=$(build_file_entries "$tool_dir")

    # Build tool entry
    local tool_entry
    if [[ "$archived" == "true" ]]; then
      tool_entry=$(jq -n --arg d "$desc" --argjson f "$files" '{description: $d, archived: true, files: $f}')
    else
      tool_entry=$(jq -n --arg d "$desc" --argjson f "$files" '{description: $d, files: $f}')
    fi

    new_manifest=$(echo "$new_manifest" | jq --arg t "$tool" --argjson e "$tool_entry" '.tools[$t] = $e')
  done < <(get_manifest_tools)

  echo "$new_manifest" | jq '.'
}

# Compare and show diff
show_diff() {
  local new_manifest="$1"
  local changes=0

  echo "Comparing manifest..."
  echo ""

  # Get tool names from both
  local current_tools new_tools
  current_tools=$(jq -r '.tools | keys[]' "$MANIFEST" | sort)
  new_tools=$(echo "$new_manifest" | jq -r '.tools | keys[]' | sort)

  # Check each tool
  for tool in $(echo -e "$current_tools\n$new_tools" | sort -u); do
    local current_files new_files
    current_files=$(jq -r --arg t "$tool" '.tools[$t].files // [] | .[].src' "$MANIFEST" | sort)
    new_files=$(echo "$new_manifest" | jq -r --arg t "$tool" '.tools[$t].files // [] | .[].src' | sort)

    local added removed
    added=$(comm -13 <(echo "$current_files") <(echo "$new_files") | grep -v '^$' || true)
    removed=$(comm -23 <(echo "$current_files") <(echo "$new_files") | grep -v '^$' || true)

    if [[ -n "$added" || -n "$removed" ]]; then
      echo "  $tool:"
      while IFS= read -r file; do
        [[ -n "$file" ]] && echo "    + $file" && ((changes++))
      done <<< "$added"
      while IFS= read -r file; do
        [[ -n "$file" ]] && echo "    - $file" && ((changes++))
      done <<< "$removed"
      echo ""
    fi
  done

  if [[ $changes -eq 0 ]]; then
    echo "No changes detected."
    return 1
  fi

  echo "$changes file(s) changed."
  return 0
}

# Main
main() {
  echo "Scanning tool directories..."
  local new_manifest
  new_manifest=$(build_manifest)

  if show_diff "$new_manifest"; then
    if $WRITE_MODE; then
      echo ""
      echo "$new_manifest" > "$MANIFEST"
      echo "Manifest updated."
    else
      echo ""
      echo "Run with --write to apply changes."
    fi
  fi
}

main
