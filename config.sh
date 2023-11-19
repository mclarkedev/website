#!/bin/bash

# Directories
SOURCE_DIR="./src"
TARGET_DIR="./www"
MD_DIR="$SOURCE_DIR/pages"
HTML_DIR="$SOURCE_DIR/fragments"
CSS_DIR="$SOURCE_DIR/css"

# Read global fragments
GLOBAL_META_HTML=$(cat "$HTML_DIR/meta.html")
GLOBAL_CSS=$(cat "$CSS_DIR/globals.css")

# Check if the directory exists
if [ ! -d "$SOURCE_DIR" ] || [ ! -d "$MD_DIR" ] || [ ! -d "$HTML_DIR" ]; then
    echo "[watch.sh] error: a directory does not exist. Check:
src: $SOURCE_DIR
md: $MD_DIR
html: $HTML_DIR"
    exit 1
fi

# Utilities
get_first_word_lowercase() {
    local STRING="$1"
    local FIRST_WORD=$(echo "$STRING" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
    echo "$FIRST_WORD"
}
