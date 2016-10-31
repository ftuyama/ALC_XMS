#include <stdio.h>
#include <stdlib.h>
#include "../tools/tools.h"
#ifndef GenKiss2_H
#define GenKiss2_H

void writeKiss(FILE *Kiss_output);
void readXBM (FILE *XBM_input);
void GenKiss2 (char *XBM_file, char *Kiss_file, char *Log_file, bool useDDC);

#endif
