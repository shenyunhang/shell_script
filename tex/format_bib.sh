#!/bin/bash

set -x
set -e

CURRENTPATH=`pwd`
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

cd ${SCRIPTPATH}

bash ${SCRIPTPATH}/remove_unused_bibtex_tag.sh ${CURRENTPATH}/${1}.bib ${1}.bib

bash ${SCRIPTPATH}/convert_to_full_booktitle.sh ${1}.bib

bash ${SCRIPTPATH}/uc.sh $1

cp ${1}U.bib ${CURRENTPATH}/${1}_format.bib

rm ${1}.bib ${1}U.bib
