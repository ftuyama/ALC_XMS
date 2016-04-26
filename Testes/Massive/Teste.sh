#!/bin/bash
./main $1
for line in $(cat log.txt)
do
	echo "$line" >> logTest.txt
done
