
function all() {
  rm -r *.dvi *.blg *.out *.fls *.fdb* *.aux *.bbl *.synctex ._* *.log *.pdf *.bcf > /dev/null 2>&1
  rm -rf imgs/*-converted-to* Figures/*-converted-to* *.run.xml > /dev/null 2>&1
}

function partial() {
    rm -r *.dvi *.blg *.out *.fls *.fdb* *.aux *.bbl *.synctex ._* *.log *.bcf > /dev/null 2>&1
    rm -rf imgs/*-converted-to* Figures/*-converted-to* *.run.xml > /dev/null 2>&1
}

function clean() {
  read -p "Clean all or some(A/S) -> " theVal

  if [ "$theVal" = "s" ] || [ "$theVal" = "S" ]; then
    echo 'Partial clean initiated'
    partial
    echo 'Partial clean concluded'
  elif [ "$theVal" = "a" ] || [ "$theVal" = "A" ]; then
    echo 'Full clean initiated'
    all
    echo 'Full clean concluded'
  else
    echo "Do better"
  fi
}

clean
