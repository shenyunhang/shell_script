#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

bibtool -r ${SCRIPTPATH}/remove_bibtex.rsc -i $1 -o $2
