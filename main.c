//**************************************************/
//*                  ALC XMS					   */
//*   Automatic Local-Clock XBM MEF Synthesis	   */
//*    	Entrada: arquivo .nounc                    */
//*    	Saida  : arquivo .vhdl                     */
//*                                                */
//*  Autor: Felipe Tuyama                          */
//**************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Classes/GenKiss2/GenKiss2.h"
#include "Classes/GenDG/GenDG.h"
#include "Classes/GenBlif/GenBlif.h"
#include "Classes/GenFunc/GenFunc.h"
#include "Classes/GenVHDL/GenVHDL.h"
#include "Classes/tools/tools.h"
int Nminstates = 0, Ndependencias = 0;
int Nprodutos = 0, Nliterais = 0;
int Ninput, Noutput;
char fileName[MAX], name[MAX];
bool showDG = false;
bool useDDC = false; 
bool showStamina = false;
bool sincAnalysis = false;
bool debugMode = false;

void getFilePath(char* name)
{
	int i = -1;
	while(name[++i] != '.')
		fileName[i] = name[i];
	fileName[i] = '\0';
}

void getFileName()
{
	int i = strlen(name), j = 0;
	while(name[--i] != '/' && i !=0)
		if (name[i] == '-')
			name[i] = '_';
	if (i == 0) i--;
	while(name[i] != '.')
		fileName[j++] = name[++i];
	fileName[--j] = '\0';
}

void fileNameDot(char* path, char* extension)
{
	strcpy(name, path);
	strcat(name, fileName);
	strcat(name, extension);
}

int main(int arc, char** argv)
{
	printf(KBLU);
	printf("***************************************\n");
	printf("*             ALC XMS                 *\n");
	printf("*    Local-Clock XBM MEF Generator    *\n");
	printf("*                                     *\n");
	printf("***************************************\n");
	printf("*   By Felipe Tuyama                  *\n");
	printf("***************************************\n");
	printf(KYEL);

	//********************************************/
	//*  Argumentos Comando do software ALC XMS  */
	//********************************************/

	if (arc > 1) getFilePath(argv[1]);
	else getFilePath("biu-fifo2dma.nounc");
	if (arc > 2 && argv[2][0] == '1') useDDC = true;
	if (arc > 3 && argv[3][0] == '1') showDG = true;
	if (arc > 4 && argv[3][0] == '1') sincAnalysis = true;
	
	printf ("%sFileName[%s]%s\n", KRED, fileName, KYEL);
	system ("mkdir -p ALC_XMS");
	system ("mkdir -p ALC_XMS/kiss2");
	system ("mkdir -p ALC_XMS/log");
	system ("mkdir -p ALC_XMS/blif");
	system ("mkdir -p ALC_XMS/vhdl");
	
	//*****************************************/
	//* Converte especificação XBM -> Kiss2   */
	//*****************************************/
	// Realiza a conversão da especificação
	// Input: Nounc @ Output: Kiss2
	
	printf("%s$ Conversão XBM - KISS2.%s\n", KYEL, KWHT);
	fileNameDot("", ".nounc");
	GenKiss2(name, "ALC_XMS/kiss2/arquivo.kiss2", useDDC);
	
	//*****************************************/
	//*        Minimização de estados         */	
	//*****************************************/
	// Uso da ferramenta Stamina para minimizar estados
	// Input: Kiss2 @ Output: Kiss2
	
	printf("%s$ Minimização de Estados.%s\n", KYEL, KWHT);
	if (showStamina == true)
		system("stamina -v 1 -o ALC_XMS/kiss2/arquivo_min.kiss2 ALC_XMS/kiss2/arquivo.kiss2");
	else system("stamina -v 1 -o ALC_XMS/kiss2/arquivo_min.kiss2 ALC_XMS/kiss2/arquivo.kiss2");
	analyzeStatesKiss("ALC_XMS/kiss2/arquivo_min.kiss2", &Nminstates);
	printf ("> Nº Estados minimizados: %d\n", Nminstates);

	//*****************************************/
	//*   Análise do Grafo de Dependência     */
	//*****************************************/
	// Lê o arquivo Kiss2 minimizado
	// Faz análise do Grafo de Dependências
	
	printf("%s$ Análise do Grafo de Dependência.%s\n", KYEL, KWHT);
	analyzeGD("ALC_XMS/kiss2/arquivo_min.kiss2", showDG, &Ndependencias);
	printf("> Dependências detectadas: %d\n", Ndependencias);
	printf(KMAG);
	
	//*****************************************/
	//*        Assinalamento de estados       */
	//*****************************************/
	// Uso da ferramenta Jedi / Assinalamento One-Hot
	// Conforme os resultados da análise realizada.
	// Input: Kiss @ Output: Blif
	
	printf("%s$ Assinalamento de Estados.%s\n", KYEL, KWHT);
	// Codificação One-Hot
	if (Ndependencias != 0 && sincAnalysis == false)
	{
		system("jedi -e h ALC_XMS/kiss2/arquivo_min.kiss2 >ALC_XMS/kiss2/oneHot.blif"); 
		GenBlif("ALC_XMS/kiss2/oneHot.blif", "ALC_XMS/blif/arquivo.blif"); 
		GenFunc("ALC_XMS/blif/arquivo.blif", "ALC_XMS/blif/FGC.blif", "ALC_XMS/blif/OUT.blif", "ALC_XMS/blif/NSTATE.blif");
	}
	// Assinalamento convencional usando JEDI
	else
	{
		system("jedi -p ALC_XMS/kiss2/arquivo_min.kiss2 >ALC_XMS/blif/arquivo.blif");
		GenFunc("ALC_XMS/blif/arquivo.blif", "ALC_XMS/blif/FGC.blif", "ALC_XMS/blif/OUT.blif", "ALC_XMS/blif/NSTATE.blif");
	}
	
	//*****************************************/
	//*          Minimização Lógica           */
	//*****************************************/
	// Uso da ferramenta Espresso
	// Input: Kiss @ Output: Eq. Booleanas

	printf("%s$ Minimização Lógica.%s\n", KYEL, KWHT);
	system("espresso -o fr ALC_XMS/blif/arquivo.blif >ALC_XMS/blif/arquivo_min.blif");
	system("espresso -o fr ALC_XMS/blif/FGC.blif >ALC_XMS/blif/FGC_min.blif");
	system("espresso -o fr ALC_XMS/blif/OUT.blif >ALC_XMS/blif/OUT_min.blif");
	system("espresso -o fr ALC_XMS/blif/NSTATE.blif >ALC_XMS/blif/NSTATE_min.blif");
	
	if (sincAnalysis == false) {
		analyzeBlif("ALC_XMS/blif/FGC_min.blif", 	&Nprodutos, &Nliterais);
		analyzeBlif("ALC_XMS/blif/NSTATE_min.blif", &Nprodutos, &Nliterais);
		analyzeBlif("ALC_XMS/blif/OUT_min.blif", 	&Nprodutos, &Nliterais);
		Nprodutos += Noutput; Nliterais += Noutput;
	} else {
		//analyzeDefaultBlif("ALC_XMS/blif/arquivo_min.blif", &Nprodutos, &Nliterais);
		analyzeBlif("ALC_XMS/blif/NSTATE_min.blif", &Nprodutos, &Nliterais);
		analyzeBlif("ALC_XMS/blif/OUT_min.blif", 	&Nprodutos, &Nliterais);
	}

	//*****************************************/
	//*          Conversão para VHDL          */
	//*****************************************/
	// Conversão das Eq. Booleanas para VHDL
	// Input: Eq. Booleanas @ Output: Códigos VHDL

	printf("%s$ Conversão para VHDL.%s\n", KYEL, KWHT);
	GenVHDL("ALC_XMS/blif/FGC.blif"	 , "ALC_XMS/vhdl/FGC_Block.vhdl");
	GenVHDL("ALC_XMS/blif/OUT.blif"	 , "ALC_XMS/vhdl/OUT_Block.vhdl");
	GenVHDL("ALC_XMS/blif/NSTATE.blif", "ALC_XMS/vhdl/NSTATE_Block.vhdl");
	GenDLatchVHDL("ALC_XMS/vhdl/D_Latch.vhdl");
	
	getFileName(); 
	fileNameDot("ALC_XMS/vhdl/", ".vhdl");
	assembleVHDL("ALC_XMS/kiss2/arquivo_min.kiss2", "ALC_XMS/blif/arquivo.blif", name, false, debugMode);
	
	getFileName(); 
	fileNameDot("ALC_XMS/vhdl/", "_SYNC.vhdl");
	assembleVHDL("ALC_XMS/kiss2/arquivo_min.kiss2", "ALC_XMS/blif/arquivo.blif", name, true, debugMode);
	getFileName(); 
	fileNameDot("ALC_XMS/vhdl/", "_Block.vhdl");
	GenVHDL("ALC_XMS/blif/arquivo_min.blif", name);

	//*****************************************/
	//*          Generate Log File            */
	//*****************************************/
	// Cria um arquivo Log com os resultados obtidos
	fileNameDot("", ".nounc");
	writeLog("log.txt", name, Nminstates, Ndependencias, Nprodutos, Nliterais, Ninput, Noutput);
	
	return 0;
}
