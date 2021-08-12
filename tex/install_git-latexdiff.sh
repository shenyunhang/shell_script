#!/bin/bash

set -e
set -x

apt update
apt install -y latexdiff

cd /tmp

rm -rf asciidoc
git clone https://github.com/asciidoc/asciidoc.git
cd asciidoc
git checkout 8.6.9
cd ..

cp asciidoc/asciidoc.py /usr/local/bin/asciidoc
cp asciidoc/a2x.py /usr/local/bin/a2x


rm -rf git-latexdiff
git clone https://gitlab.com/git-latexdiff/git-latexdiff.git
cd git-latexdiff
git checkout master
cd ..

cp git-latexdiff/git-latexdiff /usr/local/bin


rm -rf latexpand
git clone https://gitlab.com/latexpand/latexpand.git
cd latexpand
git checkout master
cd ..
cp latexpand/latexpand /usr/local/bin
