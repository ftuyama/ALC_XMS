#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../tools/tools.h"

char vhdlName[MAX], iCode[MAX];
int Nin, Nout, iState, iOut[MAX];
int Ninput, Noutput, Nstt;
/* Auxilliary variables */
char ** inputList  = NULL;
char ** outputList  = NULL;
int inputListSize = 0;
int outputListSize = 0;
//************************************/
//*      Construção da base do       */
//*           arquivo VHDL		     */
//************************************/
// Constrói o Header VHDL
void constructVHDLHeader(FILE *output)
{
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.std_logic_1164.all;\n");
	fprintf(output, "use IEEE.NUMERIC_STD.all;\n");
	fprintf(output, "\n");
	fprintf(output, "ENTITY %s_Block IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT : IN  STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT: OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Nout - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END %s_Block;\n", vhdlName);
	fprintf(output, "\n");
	fprintf(output, "ARCHITECTURE version OF %s_Block IS\n", vhdlName);
	fprintf(output, "BEGIN\n");
	fprintf(output, "  PROCESS(INPUT)\n");
	fprintf(output, "  BEGIN\n     ");
}

void constructVHDLBottom(FILE *output)
{
	fprintf(output, "    END if;\n");
	fprintf(output, "\n");
	fprintf(output, "  END PROCESS;\n");
	fprintf(output, "END version;\n");
}

// Constrói o núcleo VHDL
void constructVHDL(FILE *input, FILE *output)
{
	int j;
	char linha[MAX];
	fgets(linha , MAX , input);
	if (strstr(linha, ".p") != NULL)
		fgets(linha , MAX , input);
	while (strstr(linha, ".e") == NULL) {
		j = 0;
		fprintf(output, "if std_match(INPUT, ");
		for (int i = 0; i < strlen(linha); i++)
			if (linha[i] == '~') linha[i] = '-';
		fprintf(output, "\"%.*s\"", (int)(strchr(linha, ' ') - linha), linha);
		for (; linha[j]!=' '; j++);
		
		fprintf(output, ") then OUTPUT <= ");
		for (int i = 0; i < strlen(linha); i++)
			if (linha[i] == '~') linha[i] = '-';
		fprintf(output, "\"%.*s\";\n", (int)strlen(linha) - j - 2, linha + j + 1);
		fprintf(output, "     els");
		fgets(linha , MAX , input);
	}
	fprintf(output, "e OUTPUT <= \"");
	for (int i = 0; i < Nout; i++)
		fprintf(output, "-");
	fprintf(output, "\";\n");
	fclose(input);
}

//************************************/
//*     Parsers de informações	     */
//*       referentes à MEFA   		 */
//************************************/
bool isMessy(char *linha) {
	int j = 0;
	for (; linha[j]!=' '; j++);
	for (int i = j; i < strlen(linha); i++)
		if (linha[i] == '0')
			return true;
	return false;
}

void parseInputSignals(char * signals) {
	char * p  = strtok (signals, " ");
	/* split string and append tokens to 'signals list' */
	while (p && p[0] != '\n') {
		inputList = realloc (inputList, sizeof (char*) * ++inputListSize);
		if (inputList == NULL)
			exit (-1); /* memory allocation failed */
		inputList[inputListSize-1] = malloc(sizeof(char)*(strlen(p) + 1));
		strcpy(inputList[inputListSize-1], p);
		p = strtok (NULL, " ");
	}
}

void parseOutputSignals(char * signals) {
	char * p  = strtok (signals, " ");
	/* split string and append tokens to 'signals list' */
	while (p && p[0] != '\n') {
		outputList = realloc (outputList, sizeof (char*) * ++outputListSize);
		if (outputList == NULL)
			exit (-1); /* memory allocation failed */
		outputList[outputListSize-1] = malloc(sizeof(char)*(strlen(p) + 1));
		strcpy(outputList[outputListSize-1], p);
		p = strtok (NULL, " ");
	}
}

// Lê informações do arquivo blif
void parseBlif(FILE *input) 
{
	char linha[MAX];
	do
	{
		fgets(linha , MAX , input);
		if (strstr(linha, ".ob") != NULL);
		else if (strstr(linha, ".ilb") != NULL);
		else if (strstr(linha, ".i") != NULL)
			Nin  = nextNumber(0,linha);
		else if (strstr(linha, ".o") != NULL)  
			Nout = nextNumber(0,linha);
	} while (strstr(linha, ".ob") == NULL 
			&& strstr(linha, ".p") == NULL);
}

// Lê informações do arquivo kiss
void parseKiss(FILE *input) 
{
	char linha[MAX];
	do
	{
		fgets(linha , MAX , input);
		if (strstr(linha, ".i") != NULL)
			Ninput  = nextNumber(0,linha);
		if (strstr(linha, ".o") != NULL)  
			Noutput = nextNumber(0,linha);
		if (strstr(linha, ".r") != NULL)  
			iState = nextNumber(0,linha);
	} while (strstr(linha, ".r") == NULL);
	Nstt = Nin - Ninput;
	fclose(input);
}

// Lê informações de codificação
void parseCode(FILE *input) 
{
	char linha[MAX];
	while(fgets(linha, MAX, input) != NULL) {
		if (strstr(linha, "# State") != NULL && iState == nextNumber(0, linha)) {
			int j = 0, i = strlen(linha);
			while (linha[--i] != ' ');
			i++;
			while (i < strlen(linha)) 
				iCode[j++] = linha[i++] - '0';
			break;
		}
	}
	fclose(input);
}

// Lê informações da especificação
void parseXBM(FILE *input) 
{
	int i = 0;
	char linha[MAX];
	while(fgets(linha, MAX, input) != NULL)
		if (strstr(linha, "output") != NULL)
			iOut[i++] = lastNumber(0, linha);
	fclose(input);
}

//************************************/
//*      Reportando equações 	     */
//*       lógicas da MEFA    		 */
//************************************/

// Lê os sinais da MEFA
void readSignals(FILE *signal) 
{
	char linha[MAX], in[MAX], ou[MAX];
	
	/* Reading Signals */
	while (fgets(linha , MAX , signal) != NULL)
		if (strstr(linha, "#") != NULL)
			break;
	
	fgets(linha , MAX , signal);
	strcpy (in,linha);
	parseInputSignals(in);
	fgets(linha , MAX , signal);
	strcpy (ou,linha);
	parseOutputSignals(ou);
}

// Reporta as equações lógicas - Low Level
void reportEquationsLow(FILE *input, FILE *output)
{
	int j;
	char linha[MAX];
	
	/* Setting cursor */
	fprintf(output, "*** Equações da MEFA ***\n\n");
	parseBlif(input);
	
	/* Print the signals */
	for (int i = 0; i < inputListSize; i++)
	  fprintf (output, "%s ", inputList[i]);
	fprintf (output, " [States]  [States] ");
	for (int i = 0; i < outputListSize; i++)
	  fprintf (output, "%s ", outputList[i]);
	fprintf (output, "\n\n");
	
	/* Low Level Equation Description */
	fgets(linha , MAX , input);
	if (strstr(linha, ".p") != NULL)
		fgets(linha , MAX , input);
	while (isMessy(linha) == false) {
		j = 0;
		fprintf(output, "INPUT ");
		for (int i = 0; i < strlen(linha); i++)
			if (linha[i] == '~') linha[i] = '-';
		fprintf(output, "%.*s", (int)(strchr(linha, ' ') - linha), linha);
		for (; linha[j]!=' '; j++);
		
		fprintf(output, " OUTPUT ");
		fprintf(output, "%.*s\n", (int)strlen(linha) - j - 2, linha + j + 1);
		fgets(linha , MAX , input);
	}
}

// Reporta as equações lógicas - High Level
void reportEquationsHigh(FILE *input, FILE *output)
{
	int index;
	char linha[MAX];
	
	/* Setting cursor */
	fprintf(output, "\n\n");
	rewind(input);
	parseBlif(input);
	
	/* High Level Equation Description */
	fgets(linha , MAX , input);
	if (strstr(linha, ".p") != NULL)
		fgets(linha , MAX , input);
	while (isMessy(linha) == false) {
		
		/* Output States */
		for (int i = 0; linha[i] != ' '; i++)
			index = i + 2;
		for (int i = index; i < strlen(linha) - outputListSize - 1; i++)
			if (linha[i] == '1')
				fprintf(output, "state[%d],\t", i - index);
			else if (linha[i] == '0')
				fprintf(output, "state[%d]',\t", i - index);
		
		/* Outputs */
		index = strlen(linha) - outputListSize - 1;
		for (int i = index; i < strlen(linha); i++)
			if (linha[i] == '1')
				fprintf(output, "%s,\t", outputList[i - index]);
		fprintf(output, "=\t");
		
		/* Inputs */
		for (int i = 0; i < inputListSize; i++)
			if (linha[i] == '1')
				fprintf(output, "%s\t", inputList[i]);
			else if (linha[i] == '0')
				fprintf(output, "%s'\t", inputList[i]);
				
		/* Input States */
		index = inputListSize;
		for (int i = index; linha[i] != ' '; i++)
			if (linha[i] == '1')
				fprintf(output, "state[%d]\t", i - index);
			else if (linha[i] == '0')
				fprintf(output, "state[%d]'\t", i - index);
				
		fprintf(output, "\n");
		fgets(linha , MAX , input);
	}
}

// Reporta as equações lógicas
void reportEquations(char *blifFile, char *signalFile, char *logFile) {
	FILE *input  = fopen (blifFile, "r");
	FILE *signal  = fopen (signalFile, "r");
	FILE *output = fopen (logFile, "w");
	checkFile(input, blifFile);
	checkFile(signal, signalFile);
	readSignals(signal);
	reportEquationsLow(input, output);
	reportEquationsHigh(input, output);
	fclose(input);
	fclose(signal);
	fclose(output);
}

void cropExtension(char* name)
{
	int i = -1, j = -1;
	while (name[++j] != '.' && name[++i] != '.')
		if (name[i] == '/') j = -1;
		else if (name[i] == '-')
			vhdlName[j] = '_';
		else vhdlName[j] = name[i];
	vhdlName[j] = '\0';	
	
	if (strstr(vhdlName, "_Block") != NULL) 
		while (vhdlName[j] != '_')
			vhdlName[j--] = '\0';
	vhdlName[j] = '\0';
}

void castBlifToVHDL(FILE *input, FILE *output, char *Vhdl_file)
{
	cropExtension(Vhdl_file);
	parseBlif(input);
	constructVHDLHeader(output);
	constructVHDL(input, output);
	constructVHDLBottom(output);
}

//************************************/
//*      Núcleo Gerador de VHDL	     */
//*     					         */
//************************************/
void GenVHDL(char *Blif_file, char *Vhdl_file)
{
	FILE *input   = fopen (Blif_file, "r");
	FILE *VHDL_OUT = fopen (Vhdl_file, "w");
	
	checkFile(input, Blif_file);
	castBlifToVHDL(input, VHDL_OUT, Vhdl_file);
}

//************************************/
//*      Junta as partes VHDL	     */
//*       em um único arquivo		 */
//************************************/

void GenDLatchVHDLwithI(char *DLatch_file, int i)
{
	FILE *output  = fopen (DLatch_file, "w");
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.STD_LOGIC_1164.ALL;\n\n");
	fprintf(output, "entity D_Latch%d is\n", i);
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    rst: in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "end D_Latch%d;\n\n", i);
	fprintf(output, "architecture Behavioral of D_Latch%d is\n\n", i);
	fprintf(output, "begin\n");
	fprintf(output, "process(EN, rst, D)\n");
	fprintf(output, "begin\n");
	fprintf(output, "  if (rst = '0') then\n");
	fprintf(output, "    Q <= '%d';\n", i);
	fprintf(output, "  elsif (EN = '1') then\n");
	fprintf(output, "    Q <= D;\n");
	fprintf(output, "  end if;\n");
	fprintf(output, "end process;\n\n");
	fprintf(output, "end Behavioral;\n");
}

void GenDLatchVHDLNeutral(char *DLatch_file)
{
	FILE *output  = fopen (DLatch_file, "w");
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.STD_LOGIC_1164.ALL;\n\n");
	fprintf(output, "entity D_Latch is\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "end D_Latch;\n\n");
	fprintf(output, "architecture Behavioral of D_Latch is\n\n");
	fprintf(output, "begin\n");
	fprintf(output, "process(EN, D)\n");
	fprintf(output, "begin\n");
	fprintf(output, "  if (EN = '1') then\n");
	fprintf(output, "    Q <= D;\n");
	fprintf(output, "  end if;\n");
	fprintf(output, "end process;\n\n");
	fprintf(output, "end Behavioral;\n");
}


void GenDLatchVHDL(char *DLatch0_file, char *DLatch1_file, char *DLatch_file, bool debug)
{
	if (debug == false) {
		GenDLatchVHDLwithI(DLatch0_file, 0);
		GenDLatchVHDLwithI(DLatch1_file, 1);
	} else GenDLatchVHDLNeutral(DLatch_file);
}

void GenVPulseVHDL(char *VPulse_file)
{
	FILE *output  = fopen (VPulse_file, "w");
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.STD_LOGIC_1164.ALL;\n\n");
	fprintf(output, "entity V_Pulse is\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    i : in  STD_LOGIC;\n");
	fprintf(output, "    o : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "end V_Pulse;\n\n");
	fprintf(output, "architecture Behavioral of V_Pulse is\n\n");
	fprintf(output, "signal s0,s1,s2,s4,s5: std_logic;\n\n");
	
	fprintf(output, "begin\n\n");
	
	fprintf(output, "s0<= '1';   \n");
	fprintf(output, "process (s0,s2,i)\n");
	fprintf(output, "begin\n");
	fprintf(output, "	if s2 = '0' then\n");
	fprintf(output, "	s1<='0';\n");
	fprintf(output, "	elsif s0 = '0' then\n");
	fprintf(output, "	s1<='1';\n");
	fprintf(output, "	elsif rising_edge(i) then\n");
	fprintf(output, "	s1 <= s0;\n");
	fprintf(output, "	end if;\n");
	fprintf(output, "end process;\n\n");
	
	fprintf(output, "s2<= not s1;   \n");
	fprintf(output, "process (s0,s2,s5)\n");
	fprintf(output, "begin\n");
	fprintf(output, "	if s5 = '0' then\n");
	fprintf(output, "	s4<='0';\n");
	fprintf(output, "	elsif s0 = '0' then\n");
	fprintf(output, "	s4<='1';\n");
	fprintf(output, "	elsif rising_edge(s2) then\n");
	fprintf(output, "	s4 <= s0;\n");
	fprintf(output, "	end if;\n");
	fprintf(output, "end process;\n\n");
	
	fprintf(output, "s5 <= not(s4);\n");
	fprintf(output, "o <= s4;\n\n");
	fprintf(output, "end Behavioral;\n");
}

void constructMasterVHDL(FILE *output)
{
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.std_logic_1164.all;\n");
	fprintf(output, "use IEEE.NUMERIC_STD.all;\n");
	fprintf(output, "\n");
	fprintf(output, "ENTITY %s IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN  STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "    STATE  : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "    RSTATE : IN  STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "    RESET  : IN  STD_LOGIC;\n");
	fprintf(output, "    IN_DELAY  : IN  STD_LOGIC;\n");
	fprintf(output, "    OUT_DELAY : OUT STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END ENTITY %s;\n", vhdlName);
	fprintf(output, "\n");
	fprintf(output, "ARCHITECTURE ALC_XMS OF %s IS\n\n", vhdlName);
	
	fprintf(output, "COMPONENT FGC_Block IS\n"); 
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT NSTATE_Block IS\n");
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Nstt - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT OUT_Block IS\n");
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Noutput - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT D_Latch IS\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");

	fprintf(output, "  SIGNAL SSTATE : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SNSTATE: STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SLSTATE: STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SSOUT  : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "  SIGNAL SOUT   : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	
	fprintf(output, "\nBEGIN\n");
	
	fprintf(output, "B1: FGC_Block    PORT MAP(INPUT & SSTATE, OUT_DELAY);\n");
	fprintf(output, "B2: NSTATE_Block PORT MAP(INPUT & SSTATE, SNSTATE);\n");
	fprintf(output, "B3: OUT_Block    PORT MAP(INPUT & SSTATE, SOUT);\n");

	for (int i = 0; i < Nstt; i++)
		fprintf(output, "STT%d: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(%d), SSTATE(%d));\n", i, i, i);
	fprintf(output, "\n");
	for (int i = 0; i < Noutput; i++)
		fprintf(output, "OUT%d: D_Latch    PORT MAP(SSOUT(%d) XOR SOUT(%d), SOUT(%d), SSOUT(%d));\n", i, i, i, i, i);
	
	fprintf(output, " \n  PROCESS(INPUT, RSTATE, RESET, IN_DELAY)\n");
	fprintf(output, "  BEGIN\n");
	fprintf(output, "    OUTPUT <= SSOUT;\n");
	fprintf(output, "    IF (RESET = '1') THEN\n");
	fprintf(output, "      SLSTATE <= RSTATE;\n");
	fprintf(output, "    ELSE\n");
	fprintf(output, "      SLSTATE <= SNSTATE;\n");
	fprintf(output, "    END IF;\n");
	fprintf(output, "    STATE <= SSTATE;\n");
	fprintf(output, "  END PROCESS;\n");
	
	fprintf(output, "END ALC_XMS;\n");
}

void constructMasterSyncVHDL(FILE *output)
{
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.std_logic_1164.all;\n");
	fprintf(output, "use IEEE.NUMERIC_STD.all;\n");
	fprintf(output, "\n");
	fprintf(output, "ENTITY %s IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN  STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "    STATE  : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "    RSTATE : IN  STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "    RESET  : IN  STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END ENTITY %s;\n", vhdlName);
	fprintf(output, "\n");
	fprintf(output, "ARCHITECTURE ALC_XMS OF %s IS\n\n", vhdlName);
	
	fprintf(output, "COMPONENT %s_Block IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput + Nstt - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Noutput + Nstt - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");

	fprintf(output, "COMPONENT D_Latch IS\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");

	fprintf(output, "  SIGNAL SSTATE : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SNSTATE: STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SLSTATE: STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SSOUT  : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "  SIGNAL SOUT   : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	
	fprintf(output, "\nBEGIN\n");
	fprintf(output, "B: %s_Block    PORT MAP(INPUT & SSTATE, SSTATE & SOUT);\n", vhdlName);

	for (int i = 0; i < Nstt; i++)
		fprintf(output, "STT%d: D_Latch    PORT MAP(RESET, SLSTATE(%d), SSTATE(%d));\n", i, i, i);
	for (int i = 0; i < Noutput; i++)
		fprintf(output, "OUT%d: D_Latch    PORT MAP(RESET, SOUT(%d), SSOUT(%d));\n", i, i, i);
	
	fprintf(output, " \n  PROCESS(INPUT, RSTATE, RESET)\n");
	fprintf(output, "  BEGIN\n");
	fprintf(output, "    OUTPUT <= SSOUT;\n");
	fprintf(output, "    IF (RESET = '1') THEN\n");
	fprintf(output, "      SLSTATE <= RSTATE;\n");
	fprintf(output, "    ELSE\n");
	fprintf(output, "      SLSTATE <= SNSTATE;\n");
	fprintf(output, "    END IF;\n");
	fprintf(output, "    STATE <= SSTATE;\n");
	fprintf(output, "  END PROCESS;\n");
	
	fprintf(output, "END ALC_XMS;\n");
}

void constructOptimizedVHDL(FILE *output)
{
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.std_logic_1164.all;\n");
	fprintf(output, "use IEEE.NUMERIC_STD.all;\n");
	fprintf(output, "\n");
	fprintf(output, "ENTITY %s IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    RESET  : IN  STD_LOGIC;\n    ");
	for (int i = 0; i < Ninput; i++)
		if (i == Ninput - 1) fprintf(output, "%s : in std_logic;\n", inputList[i]);
		else fprintf(output, "%s, ", inputList[i]);
	fprintf(output, "    STATE  : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "    NSTATE : OUT STD_LOGIC_VECTOR(%d DOWNTO 0);\n    ", (Nstt - 1));
	for (int i = 0; i < Noutput; i++)
		if (i == Noutput - 1) fprintf(output, "%s : out std_logic\n", outputList[i]);
		else fprintf(output, "%s, ", outputList[i]);
	fprintf(output, "  );\n");
	fprintf(output, "END ENTITY %s;\n", vhdlName);
	fprintf(output, "\n");
	fprintf(output, "ARCHITECTURE ALC_XMS OF %s IS\n\n", vhdlName);
	
	fprintf(output, "COMPONENT FGC_Block IS\n"); 
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT NSTATE_Block IS\n");
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Nstt - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT OUT_Block IS\n");
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nin - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Noutput - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT D_Latch0 IS\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    rst: in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT D_Latch1 IS\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    EN : in  STD_LOGIC;\n");
	fprintf(output, "    D  : in  STD_LOGIC;\n");
	fprintf(output, "    rst: in  STD_LOGIC;\n");
	fprintf(output, "    Q  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");
	
	fprintf(output, "COMPONENT V_Pulse IS\n");
	fprintf(output, "  Port (\n");
	fprintf(output, "    i  : in  STD_LOGIC;\n");
	fprintf(output, "    o  : out STD_LOGIC\n");
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");

	fprintf(output, "  SIGNAL INPUT  : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput - 1));
	fprintf(output, "  SIGNAL SSTATE : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SNSTATE: STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SSOUT  : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "  SIGNAL SOUT   : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput - 1));
	fprintf(output, "  SIGNAL SFGC   : STD_LOGIC;\n");
	fprintf(output, "  SIGNAL FGC    : STD_LOGIC;\n");
	
	fprintf(output, "BEGIN\n\n");
	
	/* Inputs do VHDL */
	fprintf(output, "  -- Ordem dos inputs\n");
	fprintf(output, "  INPUT <= ");
	for (int i = 0; i < Ninput; i++)
		if (i == Ninput - 1) fprintf(output, "%s;\n\n", inputList[i]);
		else fprintf(output, "%s & ", inputList[i]);
	
	/* States do VHDL */
	fprintf(output, "  -- Lógica de estado\n");
	fprintf(output, "  STATE <= SSTATE;\n");
	fprintf(output, "  SNSTATE <= SNSTATE;\n\n");
	
	/* Linkando blocos */
	fprintf(output, "  -- Blocos lógicos\n");
	fprintf(output, "  DELAY: V_PULSE    PORT MAP(FGC, SFGC);\n");
	fprintf(output, "  B1: FGC_Block     PORT MAP(INPUT & SSTATE, FGC);\n");
	fprintf(output, "  B2: NSTATE_Block  PORT MAP(INPUT & SSTATE, SNSTATE);\n");
	fprintf(output, "  B3: OUT_Block     PORT MAP(INPUT & SSTATE, SOUT);\n\n");

	/* Linkando Latches */
	fprintf(output, "  -- Elementos de memória\n");
	for (int i = Nstt - 1; i >= 0; i--)
		fprintf(output, "  STT%d: D_Latch%d    PORT MAP(SFGC, SNSTATE(%d), RESET, SSTATE(%d));\n", i, iCode[Nstt - i - 1], i, i);
	fprintf(output, "\n");
	for (int i = Noutput - 1; i >= 0; i--)
		fprintf(output, "  OUT%d: D_Latch%d    PORT MAP(SSOUT(%d) XOR SOUT(%d), SOUT(%d), RESET, SSOUT(%d));\n", i, iOut[Noutput - i - 1], i, i, i, i);
	
	/* Outputs do VHDL */
	fprintf(output, "\n  -- Ordem dos outputs");
	for (int i = Noutput - 1; i >= 0; i--)
		fprintf(output, "\n  %s <= SSOUT(%d);", outputList[Noutput - i - 1], i);

	fprintf(output, "\n\nEND ALC_XMS;\n");
}

void constructOptimizedSyncVHDL(FILE *output)
{
	fprintf(output, "library IEEE;\n");
	fprintf(output, "use IEEE.std_logic_1164.all;\n");
	fprintf(output, "use IEEE.NUMERIC_STD.all;\n");
	fprintf(output, "\n");
	fprintf(output, "ENTITY %s IS\n", vhdlName);
	fprintf(output, "  PORT (\n    ");
	for (int i = 0; i < Ninput; i++)
		if (i == Ninput - 1) fprintf(output, "%s : in std_logic;\n", inputList[i]);
		else fprintf(output, "%s, ", inputList[i]);
	fprintf(output, "    RESET  : IN  STD_LOGIC;\n");
	fprintf(output, "    CLOCK  : IN  STD_LOGIC;\n    ");
	for (int i = 0; i < Noutput; i++)
		if (i == Noutput - 1) fprintf(output, "%s : out std_logic\n", outputList[i]);
		else fprintf(output, "%s, ", outputList[i]);
	fprintf(output, "  );\n");
	fprintf(output, "END ENTITY %s;\n", vhdlName);
	fprintf(output, "\n");
	fprintf(output, "ARCHITECTURE ALC_XMS OF %s IS\n\n", vhdlName);
	
	fprintf(output, "COMPONENT %s_Block IS\n", vhdlName);
	fprintf(output, "  PORT (\n");
	fprintf(output, "    INPUT  : IN STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput + Nstt - 1));
	fprintf(output, "    OUTPUT : OUT STD_LOGIC_VECTOR(%d DOWNTO 0)\n", (Noutput + Nstt - 1));
	fprintf(output, "  );\n");
	fprintf(output, "END COMPONENT;\n\n");

	fprintf(output, "  SIGNAL INPUT  : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Ninput - 1));
	fprintf(output, "  SIGNAL SSTATE : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Nstt - 1));
	fprintf(output, "  SIGNAL SOUT   : STD_LOGIC_VECTOR(%d DOWNTO 0);\n", (Noutput + Nstt - 1));
	
	fprintf(output, "\nBEGIN\n");
	
	/* Inputs do VHDL */
	fprintf(output, "  -- Ordem dos inputs\n");
	fprintf(output, "  INPUT <= ");
	for (int i = 0; i < Ninput; i++)
		if (i == Ninput - 1) fprintf(output, "%s;\n\n", inputList[i]);
		else fprintf(output, "%s & ", inputList[i]);
		
	fprintf(output, "  B: %s_Block    PORT MAP(INPUT & SSTATE, SOUT);\n", vhdlName);
	
	fprintf(output, " \n  PROCESS(CLOCK, RESET)\n");
	fprintf(output, "  BEGIN\n");
	
	/* Sinal de RESET */
	fprintf(output, "    IF (RESET = '0') THEN");
	
	/* Outputs do VHDL */
	fprintf(output, "\n    	-- Ordem dos outputs");
	for (int i = Noutput - 1; i >= 0; i--)
		fprintf(output, "\n    	%s <= \'%d\';", outputList[Noutput - i - 1], iOut[Noutput - i - 1]);
	
	/* Estados do VHDL */
	fprintf(output, "\n      SSTATE <= \"");
	for (int i = Nstt - 1; i >= 0; i--)
		fprintf(output, "%d", iCode[Nstt - i - 1]);
		
	/* Sinal de Clock */
	fprintf(output, "\";\n\n    ELSIF (RISING_EDGE(CLOCK)) THEN");
	
	/* Outputs do VHDL */
	fprintf(output, "\n    	-- Ordem dos outputs");
	for (int i = Noutput - 1; i >= 0; i--)
		fprintf(output, "\n    	%s <= SOUT(%d);", outputList[Noutput - i - 1], i);
	
	/* Estados do VHDL */
	fprintf(output, "\n    	SSTATE <= SOUT(%d DOWNTO %d);\n", (Noutput + Nstt - 1), (Noutput));
		
	fprintf(output, "\n    END IF;\n");
	fprintf(output, "  END PROCESS;\n");
	
	fprintf(output, "END ALC_XMS;\n");
}

void assembleVHDL(char *XBM_file, char *Kiss_file, char *Code_file, char *Blif_file, char *Vhdl_file, bool sync, bool debug)
{
	FILE *BLIF_IN  = fopen (Blif_file, "r");
	FILE *CODE_IN  = fopen (Code_file, "r");
	FILE *KISS_IN  = fopen (Kiss_file, "r");
	FILE *XBM_IN   = fopen (XBM_file, "r");
	FILE *VHDL_OUT = fopen (Vhdl_file, "w");
	
	checkFile(BLIF_IN, Blif_file);
	checkFile(CODE_IN, Code_file);
	checkFile(KISS_IN, Kiss_file);
	checkFile(XBM_IN,  XBM_file );
	cropExtension(Vhdl_file);
	parseBlif(BLIF_IN);
	parseKiss(KISS_IN);
	parseXBM (XBM_IN );
	parseCode(CODE_IN);
	
	if (debug == true) {
		if (sync == false) constructMasterVHDL(VHDL_OUT); 
		else constructMasterSyncVHDL(VHDL_OUT);
	} else {
		if (sync == false) constructOptimizedVHDL(VHDL_OUT); 
		else constructOptimizedSyncVHDL(VHDL_OUT);
	}
}
