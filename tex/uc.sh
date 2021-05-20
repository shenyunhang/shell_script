#!/bin/bash

set -x
set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

perl ${SCRIPTPATH}/uc.pl $1

#https://www.stat.berkeley.edu/~paciorek/computingTips/Change_case_your_journal_ti.html
#Change the case of your journal titles in a Bibtex datafile
#One thing that is a pain in the ass is that some journals want the words in the journal titles to be title case (i.e., upper case for all words except 'the', 'of', etc.), while others want only the first word of the title capitalized. I have created two perl scripts to go back and forth between lower case and title case.

#The perl code file uc.pl takes file.bib, converts all journal titles to title case and saves to fileU.bib (leaving file.bib unmodified). One invokes the code using 
#perl uc.pl file
#The perl code lc.pl takes file.bib, converts all journal titles to lower case, and overwrites it, but saves a copy to file.bib.save. It is invoked as
#perl lc.pl file



