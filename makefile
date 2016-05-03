all: main
    
main.o: main.c
	gcc -std=c99 -Wall -c main.c
	
GenKiss2.o: Classes/GenKiss2/GenKiss2.c
	gcc -std=c99 -Wall -c Classes/GenKiss2/GenKiss2.c
	
GenDG.o: Classes/GenDG/GenDG.c
	gcc -std=c99 -Wall -c Classes/GenDG/GenDG.c
	
GenBlif.o: Classes/GenBlif/GenBlif.c
	gcc -std=c99 -Wall -c Classes/GenBlif/GenBlif.c
	
GenFunc.o: Classes/GenFunc/GenFunc.c
	gcc -std=c99 -Wall -c Classes/GenFunc/GenFunc.c
	
GenVHDL.o: Classes/GenVHDL/GenVHDL.c
	gcc -std=c99 -Wall -c Classes/GenVHDL/GenVHDL.c
	
tools.o: Classes/tools/tools.c
	gcc -std=c99 -Wall -c Classes/tools/tools.c

main: main.o Classes/GenKiss2/GenKiss2.o Classes/GenDG/GenDG.o Classes/GenBlif/GenBlif.o Classes/GenFunc/GenFunc.o Classes/GenVHDL/GenVHDL.o Classes/tools/tools.o
	gcc -std=c99 -Wall main.o Classes/GenKiss2/GenKiss2.o Classes/GenDG/GenDG.o  Classes/GenBlif/GenBlif.o Classes/GenFunc/GenFunc.o Classes/GenVHDL/GenVHDL.o Classes/tools/tools.o -o main
	
clean:
	rm -rf *o main
