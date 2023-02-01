#! /bin/sh

./scripts/clean.sh
pdflatex -output-format=dvi proposal
bibtex proposal
pdflatex proposal
pdflatex proposal
mv proposal.pdf out/SSD_Postdoc_Proposal_2023.pdf
./scripts/clean.sh


