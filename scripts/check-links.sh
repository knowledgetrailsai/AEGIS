#!/usr/bin/env bash
# Lightweight consistency check for Compass.
# 1. Every relative markdown link resolves to a real file.
# 2. Every top-level numbered content directory is referenced in INDEX.md.
# Usage: bash scripts/check-links.sh   (run from repo root)
set -u
cd "$(dirname "$0")/.."
fail=0

echo "== Checking markdown links resolve =="
while IFS= read -r -d '' file; do
  dir=$(dirname "$file")
  grep -oE '\]\(([^)]+)\)' "$file" | sed -E 's/^\]\((.*)\)$/\1/' | while read -r link; do
    case "$link" in
      http*|mailto:*|\#*) continue ;;
    esac
    target="${link%%#*}"
    [ -z "$target" ] && continue
    resolved="$dir/$target"
    if [ ! -e "$resolved" ]; then
      echo "BROKEN LINK: $file -> $link"
      fail=1
    fi
  done
done < <(find . -name '_to_delete' -prune -o -name '.git' -prune -o -name '*.md' -print0)

echo "== Checking numbered content dirs are indexed in INDEX.md =="
if [ -f INDEX.md ]; then
  for d in [0-9][0-9]-*/; do
    name="${d%/}"
    if ! grep -q "$name" INDEX.md; then
      echo "NOT INDEXED: $name"
      fail=1
    fi
  done
else
  echo "SKIPPED: no root INDEX.md (this repo uses a different navigation structure)."
fi

if [ "$fail" -eq 0 ]; then
  echo "OK: no broken links, all directories indexed."
else
  echo "FAILED: see issues above."
fi
exit $fail
