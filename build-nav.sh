#!/bin/bash

source config.sh

# Initialize the navigation content
NAV_CONTENT=""

# Loop through each .md file in the directory
for MD_FILE in "$MD_DIR"/*.md; do

  # Extract the file name without the extension
  FILE_NAME=$(basename "$MD_FILE" .md)

  # Encode file name for URL use
  FILE_NAME_FIRST_WORD=$(get_first_word_lowercase "$FILE_NAME")

  # Skip "index"
  if [ "$FILE_NAME_FIRST_WORD" == "index" ]; then
    echo "[build-nav.sh] index file discovered and skipped"
    continue
  fi

  # Check if there are .md files
  if [ -f "$MD_FILE" ]; then
    # Append link to navigation content
    NAV_CONTENT="$NAV_CONTENT<a href=\"$FILE_NAME_FIRST_WORD.html\">$FILE_NAME</a>"
  fi
done

# Create the nav.html content
NAV_HTML="<a href=\"/\">Matthew Clarke</a>
$NAV_CONTENT"

# Write nav.html to fragments
NAV_HTML_DIR="$TARGET_DIR/fragments/nav.html"
echo "$NAV_HTML" > $NAV_HTML_DIR
echo "[build-nav.sh] navigation file created at $NAV_HTML_DIR"