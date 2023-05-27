#!/bin/bash

# Calculate the line counts and compare them
ACTUAL_FC=$(find -type f | wc -l | awk '{print $1}')
OUTPUT_LC=$(wc -l *.checksums | awk '{print $1}')
echo "$ACTUAL_FC", "$OUTPUT_LC"

if [[ "$ACTUAL_FC" -eq $((OUTPUT_LC + 1)) ]]; then
    # 1 greater because the actual FC will include the actual checksum file itself, but when the list program runs, it pipes to the checksum file so it does not take its hash into account.
    echo "LGTM"
else
    echo "Sadge, failed verification."
fi
