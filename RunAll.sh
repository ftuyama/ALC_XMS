#!/bin/bash
while read file
do
  name="${file##*/}"
  echo "$name"
  ./main "$name"
done < <( find . -maxdepth 1 -iname '*.nounc')
