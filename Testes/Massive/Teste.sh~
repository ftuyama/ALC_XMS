#!/bin/bash
../../main $1
for line in $(cat log.txt)
do
	echo "$line" >> logTest.txt
done
mv ALC_XMS/vhdl ALC_XMS/ALLVHDL/$(basename $1 .nounc)
