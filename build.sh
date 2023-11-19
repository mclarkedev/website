#!/bin/bash

source config.sh

# Configure the target dir
# rm -r "$TARGET_DIR"
# echo "[build.sh] nuked $TARGET_DIR"
mkdir "$TARGET_DIR"
cp -r "$SOURCE_DIR"/* "$TARGET_DIR"
echo "[build.sh] freshly minted $TARGET_DIR"

# Build the nav before we build the pages
source build-nav.sh

# Loop through each .md file in the directory
for MD_FILE in "$MD_DIR"/*.md; do
  # Check if there are .md files
  if [ -f "$MD_FILE" ]; then
    # Extract the file name without the extension
    FILE_NAME=$(basename "$MD_FILE" .md)

    # Encode file name for URL use
    FILE_NAME_FIRST_WORD=$(get_first_word_lowercase "$FILE_NAME")

    # Create the HTML content
    MD_HTML=$(pandoc "$MD_FILE")

    # Output HTML to a temporary file
    TEMP_HTML_FILE=$(mktemp)
    echo "<!doctype html>
<html lang=\"en\">
  <head>
    <title>$FILE_NAME</title>
    $GLOBAL_META_HTML
    <style type="text/css">
$GLOBAL_CSS
    </style>
  </head>
  <body>
    <nav>
      $NAV_HTML
    </nav>
    <main>
      $MD_HTML
      <p>
        <a href=\"pages/$FILE_NAME.md\">Raw</a>
      </p>
    </main>
  </body>
</html>" > "$TEMP_HTML_FILE"

    # Use tidy to format and save the output
    tidy -quiet --output-xhtml "y" --indent "auto" --indent-spaces "2" --wrap "90" -o "$TARGET_DIR/$FILE_NAME_FIRST_WORD.html" "$TEMP_HTML_FILE"
    echo "[build.sh] md to html complete for $FILE_NAME_FIRST_WORD"

    # Remove temporary HTML file
    rm "$TEMP_HTML_FILE"
  fi
done

echo "[build.sh] build complete"
