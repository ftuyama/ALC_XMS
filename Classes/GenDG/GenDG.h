#include <stdio.h>
#include <stdlib.h>
#include "../tools/tools.h"
#ifndef GenDG_H
#define GenDG_H

void analyzeGD(char *Blif_file, bool show, int *Ndependencias);
void analyzeStatesKiss(char *Kiss_file, int *Nminstates);
void analyzeBlif(char *Blif_file, int *Nprodutos, int *Nliterais);

#endif
