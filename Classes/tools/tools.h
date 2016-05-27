#include <stdio.h>
#include <stdlib.h>
#define KNRM  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"
#ifndef tools_H
#define tools_H
#define MAX 400
typedef enum { false, true } bool;
void checkFile(FILE *file, char *name);
void writeLog (char *file, char *name, int Nminstates, int Ndependencias, 
				int Nprodutos, int Nliterais, int Ninput, int Noutput);
void exception(int lin, char* aux);
int nextNumber(int lin, char* aux);
int not(int x);
bool emptyChar(char c);
bool opChar(char c);
char* copia(char *aux);
#endif
