#!/bin/bash

# Set author info
export GIT_AUTHOR_NAME="Yaman"
export GIT_AUTHOR_EMAIL="yaman.9yj@gmail.com"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

declare -A commit_times=(
  ["2025-02-01"]="09:00:00 09:30:00 12:00:00 11:30:00 10:00:00"
  ["2025-02-02"]="12:00:00 11:30:00 11:00:00 09:30:00 11:00:00 12:30:00"
  ["2025-02-08"]="11:00:00 09:30:00 12:00:00 09:30:00"
  ["2025-02-09"]="10:00:00 12:30:00 09:00:00 09:30:00 12:00:00 11:30:00 10:00:00 11:30:00"
  ["2025-02-15"]="12:00:00 12:30:00 09:00:00 12:30:00 12:00:00"
  ["2025-02-16"]="09:00:00 09:30:00 10:00:00 10:30:00 11:00:00 10:30:00 09:00:00 09:30:00"
  ["2025-02-22"]="10:00:00 09:30:00 09:00:00"
  ["2025-02-23"]="11:00:00 11:30:00 10:00:00 10:30:00 11:00:00 09:30:00 10:00:00 12:30:00"
)

commit_msg="chore: backdated commit for"

echo "Starting backdated commits..."

for date in "${!commit_times[@]}"; do
  for time in ${commit_times[$date]}; do
    datetime="$date"T"$time"
    echo "$commit_msg $datetime" > README.md
    GIT_AUTHOR_DATE=$datetime GIT_COMMITTER_DATE=$datetime git add README.md
    GIT_AUTHOR_DATE=$datetime GIT_COMMITTER_DATE=$datetime git commit -m "$commit_msg $datetime"
    echo "Committed at $datetime"
  done
done

echo "✅ All backdated commits done. You can now push using: git push origin main"
