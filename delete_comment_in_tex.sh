#!/bin/bash

set -x

find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -n -e '/^%/p' {}
find . -name "*.tex" -type f | xargs -I '{}' -n 1 sed -i '/^%/d' {}
