#!/bin/bash

# Check for multiple files matching *checksums
checksum_files=(*checksums)
num_checksum_files=${#checksum_files[@]}

if (( num_checksum_files > 1 )); then
    # Sort the files by modification time in descending order
    sorted_files=($(ls -t "${checksum_files[@]}"))

    # Delete all except the newest file
    for (( i=1; i < num_checksum_files; i++ )); do
        rm "${sorted_files[$i]}"
    done
fi

# Calculate the line counts and compare them
ACTUAL_FC=$(find -type f | wc -l | awk '{print $1}')
OUTPUT_LC=$(wc -l *.checksums | awk '{print $1}')
echo "$ACTUAL_FC", "$OUTPUT_LC"

if [[ "$ACTUAL_FC" == "$OUTPUT_LC" ]]; then
    echo "Verified same number of lines in checksums file as files in directory."
else
    echo "Failed to verify same number of lines in checksums file as files in directory."
fi
