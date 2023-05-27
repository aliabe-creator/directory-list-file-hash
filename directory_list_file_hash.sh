#!/bin/bash

find -type f -exec sh -c 'xxhsum "$1" | awk "{ print \"$1\" \",\" \$NF }"' sh {} \; | sort -t ',' -k1,1 > "$(date +"%Y_%m_%d_%I_%M_%p").checksums"
ACTUAL_FC = `find -type f | wc -l | awk '{print $1}'`
OUTPUT_LC = `wc -l *.checksums | awk '{print $1}'`
echo $ACTUAL_FC $OUTPUT_FC
if [[ $(ACTUAL_FC) -eq $(OUTPUT_LC) ]];
then
    echo Verified same number of lines in checksums file as files in directory.
else
    echo Failed to verify same number of lines in checksums file as files in directory.
fi

