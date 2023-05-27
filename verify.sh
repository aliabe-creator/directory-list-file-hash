#!/bin/bash

# Calculate the line counts and compare them
ACTUAL_FC=$(find -type f | wc -l | awk '{print $1}')
OUTPUT_LC=$(wc -l *.checksums | awk '{print $1}')
echo "$ACTUAL_FC", "$OUTPUT_LC"

if [[ "$ACTUAL_FC" == "$OUTPUT_LC" ]]; then
    echo "Verified same number of lines in checksums file as files in directory."
else
    echo "Failed to verify same number of lines in checksums file as files in directory."
fi
