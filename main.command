#!/bin/bash

# Log file to help troubleshoot Automator issues (optional for debugging)
LOGFILE="/tmp/automator-ocr-log.txt"
echo "Starting script at $(date)" >> "$LOGFILE"

# Define a temporary file path for the screenshot


TMPFILE=$(mktemp /Users/simonbian/Documents/NUS/过去所有/tmp/screenshot-ocr-XXXXXX.png)


# Capture a screenshot, allowing the user to select the area, and save it to the temporary file
screencapture -i "$TMPFILE"
echo "Screenshot saved to $TMPFILE" >> "$LOGFILE"

# Check if the screenshot was successfully taken
if [[ -f "$TMPFILE" ]]; then
    # Use Tesseract to extract text from the screenshot and send the output to stdout
    TEXT=$(/opt/homebrew/bin/tesseract "$TMPFILE" stdout 2>> "$LOGFILE")
    echo "OCR output: $TEXT" >> "$LOGFILE"
    CLEANED_TEXT=$(echo "$TEXT" | /Users/simonbian/anaconda/bin/python3 /tmp/clean_text.py 2>> "$LOGFILE")

    echo "Cleaned OCR output: $CLEANED_TEXT" >> "$LOGFILE"

    # Copy the cleaned text to the clipboard
    echo "$CLEANED_TEXT" | pbcopy
    echo "Cleaned text copied to clipboard" >> "$LOGFILE"

    # Clean up the temporary screenshot file
    rm "$TMPFILE"
    echo "Temporary file removed" >> "$LOGFILE"
else
    echo "Screenshot failed." >> "$LOGFILE"
    exit 1
fi
