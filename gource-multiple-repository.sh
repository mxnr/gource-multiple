#!/usr/bin/env bash
# Generates gource video (h.264) out of multiple repositories.
# Pass the repositories in command line arguments.
# Example:
# <this.sh> /path/to/repo1 /path/to/repo2

RESOLUTION="1600x1080"
outfile="gource.mp4"

# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo "Error: No repositories specified"
    echo "Usage: $0 /path/to/repo1 /path/to/repo2 ..."
    exit 1
fi

i=0
for repo in "$@"; do
    # Check if directory exists and is a git repository
    if [ ! -d "$repo" ]; then
        echo "Error: Directory '$repo' does not exist"
        continue
    fi
    
    if [ ! -d "$repo/.git" ]; then
        echo "Error: '$repo' is not a git repository"
        continue
    fi

    # 1. Generate a Gource custom log files for each repo
    logfile="$(mktemp /tmp/gource.XXXXXX)"
    gource --output-custom-log "${logfile}" "${repo}"
    
    # 2. Add repository name to the log entries
    # Using a simpler sed pattern that works on both BSD and GNU sed
    sed -i '' "s#|#|${repo}#" "${logfile}"
    
    logs[$i]=$logfile
    let i=$i+1
done

# Check if we have any valid logs
if [ ${#logs[@]} -eq 0 ]; then
    echo "Error: No valid git repositories found"
    exit 1
fi

combined_log="$(mktemp /tmp/gource.XXXXXX)"
cat "${logs[@]}" | sort -n > "$combined_log"
rm "${logs[@]}"

echo "Committers:"
cat "$combined_log" | awk -F\| '{print $2}' | sort | uniq
echo "======================"

time gource "$combined_log" \
    -s 0.4 \
    -i 0 \
    -$RESOLUTION \
    --highlight-users \
    --highlight-dirs \
    --file-extensions \
    --hide mouse,filenames \
    --key \
    --stop-at-end \
    --output-ppm-stream - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - \
    -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 "$outfile"

rm "$combined_log"
