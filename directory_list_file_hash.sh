#!/bin/bash

find -type f -exec sh -c 'xxhsum "$1" | awk "{ print \"$1\" \",\" \$NF }"' sh {} \; | sort -t ',' -k1,1 > "$(date +"%Y_%m_%d_%I_%M_%p").checksums"
