#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

bibtool -r ${SCRIPTPATH}/remove_unused_bibtex_tag.rsc -i $1 -o $2
