#include <stdio.h>
#include <stdlib.h>
#include "../tools/tools.h"
#ifndef GenDG_H
#define GenDG_H

void analyseGD(char *Blif_file, bool show, int *Ndependencias);
void analyseStatesKiss(char *Kiss_file, int *Nminstates);
void analyseBlif(char *XBM_fileName, int *Nprodutos, int *Nliterais);

#endif
