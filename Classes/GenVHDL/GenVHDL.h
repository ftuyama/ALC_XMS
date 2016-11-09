#include <stdio.h>
#include <stdlib.h>
#include "../tools/tools.h"
#ifndef GenVHDL_H
#define GenVHDL_H

void GenVHDL(char *Blif_file, char *Vhdl_file);
void GenDLatchVHDL(char *DLatch0_file, char *DLatch1_file, DLatch_file, bool debug);
void GenVPulseVHDL(char *VPulse_file);
void assembleVHDL(char *XBM_file, char *Kiss_file, char *Code_file, char *Blif_file, char *Vhdl_file, bool sync, bool debug);
void reportEquations(char *blifFile, char *signalFile, char *logFile);

#endif
