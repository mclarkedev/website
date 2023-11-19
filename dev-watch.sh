#!/bin/bash

source config.sh

echo "[watch.sh] watching $SOURCE_DIR for .md file changes..."

# Use fswatch to monitor the directory
fswatch -r "$SOURCE_DIR" | while read -r file; do
    FILENAME=$(basename "$file")

    echo "[watch.sh] $FILE has changed!"

    # Enable to debug
    echo "[watch.sh - debug] detected change in: $FILENAME"

    # Check if the changed file has a .md extension
    if [[ $FILENAME == *.md ]] || [[ $FILENAME == *.css ]]; then
        echo "[watch.sh] $FILE has changed!"
        # Build the site
        ./build.sh
    fi
done
