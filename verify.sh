#!/bin/bash

# Calculate the line counts and compare them
ACTUAL_FC=$(find -type f | wc -l | awk '{print $1}')
OUTPUT_LC=$(wc -l *.checksums | awk '{print $1}')
echo "$ACTUAL_FC", "$OUTPUT_LC"

if [[ "$ACTUAL_FC" -eq $((OUTPUT_LC + 1)) ]]; then
    echo "Verified ACTUAL is exactly 1 greater than OUTPUT."
else
    echo "Failed to verify ACTUAL is exactly 1 greater than OUTPUT."
fi
