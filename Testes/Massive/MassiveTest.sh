#!/bin/bash
echo "******************************"
echo "*                            *"
echo "*      Massive Tester        *"
echo "*                            *"
echo "******************************"
rm \logTest.txt
touch logTest.txt
find selectedBench -name "*.nounc" -exec ./Teste.sh '{}' \;
