#!/bin/bash

set -x

find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -n -e '/^%/p' {}

# remove whitespace at begin of line
find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -i 's/^ *//' {}
# remove tab at begin of line
find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -i 's/^\t*//' {}
# delete line begin with %
find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -i '/^%/d' {}
