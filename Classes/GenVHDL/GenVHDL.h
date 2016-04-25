#include <stdio.h>
#include <stdlib.h>
#include "../tools/tools.h"
#ifndef GenVHDL_H
#define GenVHDL_H

void GenVHDL(char *Blif_file, char *Vhdl_file);
void GenDLatchVHDL(char *DLatch_file);
void assembleVHDL(char *Kiss_file, char *Blif_file, char *Vhdl_file);

#endif
