#!/bin/bash

set -x
set -e

CURRENTPATH=`pwd`
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

#cd ${SCRIPTPATH}

bash ${SCRIPTPATH}/remove_unused_bibtex_tag.sh ${1}.bib ${1}_remove_unused_bibtex_tag.bib

cp ${1}_remove_unused_bibtex_tag.bib ${1}_full_booktitle.bib
bash ${SCRIPTPATH}/convert_to_full_booktitle.sh ${1}_full_booktitle.bib

bash ${SCRIPTPATH}/uc.sh ${1}_full_booktitle

cp ${1}_full_booktitleU.bib ${1}_format.bib
