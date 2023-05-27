#!/bin/bash

#remove all existing checksums
rm *checksums
find -type f -exec sh -c 'FN="$1" && echo "$FN, $(xxhsum "$FN" | awk "{ print \$1 }")"' sh {} \; | sort -t ',' -k1,1 > "$(date +"%Y_%m_%d_%I_%M_%p").checksums"
