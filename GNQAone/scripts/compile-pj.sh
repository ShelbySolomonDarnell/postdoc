#! /bin/sh

otype=dvi

./clean.sh
pdflatex -output-format=$otype NIHDivApp
bibtex NIHDivApp


