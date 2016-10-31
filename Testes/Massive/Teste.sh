#!/bin/bash
../../main $1
for line in $(cat log.txt)
do
	echo "$line" >> logTest.txt
done
mv $(basename $1)/vhdl ALC_XMS/ALLVHDL/$(basename $1 .nounc)
