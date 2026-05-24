#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

generate_commit_message() {
  local changed_lib_files
  changed_lib_files="$(git diff --cached --name-only -- lib/ | sort -u)"

  if [[ -z "$changed_lib_files" ]]; then
    printf '%s' "deploy web build"
    return
  fi

  local summaries=()
  local file

  while IFS= read -r file; do
    [[ -z "$file" ]] && continue

    case "$file" in
      *experience*)
        summaries+=("experience section")
        ;;
      *home_view*)
        summaries+=("hero section")
        ;;
      *about*)
        summaries+=("about section")
        ;;
      *project*)
        summaries+=("projects section")
        ;;
      *constant*)
        summaries+=("portfolio content")
        ;;
      *skill*)
        summaries+=("skills section")
        ;;
      *footer*)
        summaries+=("footer")
        ;;
      *navigation*|*menu*)
        summaries+=("navigation")
        ;;
      *)
        summaries+=("$(basename "${file%.dart}")")
        ;;
    esac
  done <<< "$changed_lib_files"

  local unique_summary
  unique_summary="$(
    printf '%s\n' "${summaries[@]}" |
      awk '!seen[$0]++ { if (NR > 1) printf ", "; printf "%s", $0 } END { print "" }'
  )"

  printf '%s' "update $unique_summary and deploy web build"
}

CUSTOM_MESSAGE="${1:-}"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
REMOTE="${DEPLOY_REMOTE:-origin}"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Error: flutter is not installed or not on PATH." >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: not inside a git repository." >&2
  exit 1
fi

echo "==> Fetching latest changes from $REMOTE..."
git fetch "$REMOTE"

echo "==> Pulling latest changes from $REMOTE/$BRANCH..."
git pull "$REMOTE" "$BRANCH" --rebase --autostash

echo "==> Cleaning Flutter build cache..."
flutter clean

echo "==> Building Flutter web (release)..."
flutter build web --release

echo "==> Staging all changes..."
git add .

if git diff --cached --quiet; then
  echo "Nothing to commit. Web build is already up to date."
  exit 0
fi

if [[ -z "$CUSTOM_MESSAGE" ]]; then
  CUSTOM_MESSAGE="$(generate_commit_message)"
fi

echo "==> Commit message:"
echo "    $CUSTOM_MESSAGE"
echo

git commit -m "$CUSTOM_MESSAGE"

echo "==> Pushing to $REMOTE/$BRANCH..."
git push "$REMOTE" "$BRANCH"

echo "==> Deploy complete."
