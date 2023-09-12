#!/bin/sh

./compile-pj.sh
while inotifywait -e modify *.tex ; do
  echo "Updating..."
  ./compile-pj.sh
done

