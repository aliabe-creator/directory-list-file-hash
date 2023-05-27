# directory-list-file-hash
A one-line shell command that recursively lists all files within a directory with their xxHash-generated hash, sorted in alphabetical order.
# Dependencies
- xxhsum
# How to Use
- Download and make `directory_list_file_hash.sh` executable.
- In a terminal with `pwd` the top-level directory you want to recurse into, execute `./directory_list_file_hash.sh`.
- Run `./verify.sh` to confirm all files have been processed.
- To compare two directories, run the executable against another directory and `diff` the output files.
