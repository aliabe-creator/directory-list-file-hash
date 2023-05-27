#!/bin/bash

find -type f -exec sh -c 'xxhsum -H3 "$1" | awk "{ print \"$1\" \",\" \$4 }"' sh {} \; | sort -t ',' -k1,1
