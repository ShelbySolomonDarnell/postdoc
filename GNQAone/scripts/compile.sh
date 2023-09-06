#!/bin/sh
# A script for compiling a latex project.

mainFile=gnqa
outputName=TodaysExpertSystem

compiledebug() {
  pdflatex -output-format=dvi $mainFile
  bibtex $mainFile
  #biber $mainFile
  pdflatex $mainFile
  pdflatex $mainFile
  mv $mainFile.pdf $outputName.pdf
}

convertimgs() {
  convert image1.png image1.bmp
  mkbitmap image1.bmp -o image1.pgm
  potrace image1.pgm -e -o image1.eps
}

compilenodebug() {
  pdflatex -output-format=dvi $mainFile > /dev/null 2>&1
  #biber $mainFile > /dev/null 2>&1
  bibtex $mainFile > /dev/null 2>&1
  pdflatex $mainFile > /dev/null 2>&1
  pdflatex $mainFile > /dev/null 2>&1
  mv $mainFile.pdf $outputName.pdf
}

runBuild() {
  read -p "Compile with output (Y/N) -> " theVal

  if [ "$theVal" = "y" ] || [ "$theVal" = "Y" ]; then
    echo 'Compiling with output'
    compiledebug
    echo 'Compile complete'
  elif [ "$theVal" != "n" ] || [ "$theVal" != "N" ]; then
    echo 'Compile without output initiated'
    compilenodebug
    echo 'Compile without output concluded'
  else
    echo "Do better"
  fi
}

runBuild
