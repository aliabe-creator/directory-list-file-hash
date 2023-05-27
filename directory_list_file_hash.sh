#!/bin/bash

bash -c find -type f -exec sh -c 'FN="$1" && xxhsum "$FN" | awk "{ print \"$FN\" \",\" \$1 }"' sh {} \; | sort -t ',' -k1,1 > "$(date +"%Y_%m_%d_%I_%M_%p").checksums"
