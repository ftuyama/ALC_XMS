#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "../tools/tools.h"
int Ninput, Noutput, Ntrans, Nstate, lenState;
char *Sinput, aux[MAX];
bool readTrans = false;
typedef struct stt{
	char *code;
	struct stt *prox;
} Stt;
Stt *State;
typedef struct tran{
	char *string;
	struct tran *prox;
} Tran;
Tran *Transit;
int pointer;

//************************************/
//*    Inicialização da estrutura    */
//*         de dados e do DG		 */
//************************************/
void preInicio()
{
	Stt * zStt = (Stt*)malloc(sizeof(Stt));
	zStt->prox = NULL;
	State = zStt;
	
	Tran *zTrans = (Tran*)malloc(sizeof(Tran));
	zTrans->prox = NULL;
	Transit = zTrans;
	
	Nstate = 0;
	Ntrans = 0;
}
void addNewTrans(char *linha)
{
	Tran *newTrans, *p;
	int tam = strlen(linha) + 3;
	newTrans = (Tran*)malloc(sizeof(Tran));
	newTrans->string = (char*)malloc(tam*sizeof(char));
	for (int j = 0, k = 0; j < strlen(linha); j++, k++)
	{
		if (j == Ninput) newTrans->string[k++] = ' ';
		if (j == strlen(linha) - Noutput - 1) 
			newTrans->string[k++] = ' ';
		newTrans->string[k] = linha[j];
	}
	for(p = Transit; p->prox != NULL; p = p->prox);
	p->prox = newTrans;
	Ntrans++;
}
void addNewState(char *linha)
{
	int j = 0;
	Stt *newStt, *p;
	for (; linha[j]!=' '; j++); j++;
	for (; linha[j]!=' '; j++); j++;
	lenState = strlen(linha) - j - 1;
	newStt = (Stt*)malloc(sizeof(Stt));
	newStt->code = (char*)malloc(lenState*sizeof(char));
	for (int k = 0; j < strlen(linha); j++, k++)
		newStt->code[k] = linha[j];
	for(p = State; p->prox != NULL; p = p->prox);
	p->prox = newStt;
	Nstate++;
}
// Realiza a leitura do formato .kiss
void readBlif(FILE *input, FILE *out1, FILE *out2, FILE *out3)
{
	bool active = false;
	char linha[MAX];
	preInicio();
	for(int lin = 0; !feof(input); lin++)
	{
		fgets(linha , MAX , input);
			
		if (strstr(linha, "States") != NULL)
			addNewState(linha);
		else if (strstr(linha, ".ilb") != NULL);
		else if (strstr(linha, ".ob")!= NULL)  
			active = true;
		else if (strstr(linha, ".i") != NULL)  
			Ninput  = nextNumber(lin,linha) - lenState;
		else if (strstr(linha, ".o") != NULL)  
			Noutput = nextNumber(lin,linha) - lenState;
		else if (strstr(linha, ".e") != NULL) 
			readTrans = false;
			
		if (readTrans == true)
			addNewTrans(linha);
		else if (strstr(linha, ".ob")!= NULL) {
			fprintf(out1, "%s", linha);
			fprintf(out2, "%s", linha);
			fprintf(out3, "%s", linha);
		}
		else if (strstr(linha, ".o") != NULL) {
			fprintf(out1, ".o %d\n", 1);
			fprintf(out2, ".o %d\n", Noutput);
			fprintf(out3, ".o %d\n", lenState);
		}
		else if (strstr(linha, ".e") == NULL) {
			fprintf(out1, "%s", linha);
			fprintf(out2, "%s", linha);
			fprintf(out3, "%s", linha);
		}
		if (active) readTrans = true;
	}
	fclose(input);
}

int isTransit(char *linha){
	int k, l, j = 0;
	for (; linha[j]!= ' '; j++); j++;
	for (k = j; linha[k]!= ' '; k++); k++;
	for (l = k; linha[l]!= ' '; l++)
		if (linha[l] == '-')
			return 2;
	for(; linha[k]!= ' '; j++, k++)
		if (linha[k] != linha[j])
			return 1;
	return 0;
}
// Constrói a função FGC
void constructFGC(FILE *output)
{
	int j;
	for(Tran *p = Transit->prox; p!= NULL; p = p->prox)
	{
		j = 0;
		strcpy(aux, p->string);
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		fprintf(output, " ");
		for (; aux[j]!=' '; j++);
		
		j = isTransit(aux);
		if (j == 2)fprintf(output, "-");
		else fprintf(output, "%d", j);
		
		fprintf(output, "\n");
	}
	fprintf(output, ".e");
	fclose(output);
}
// Constrói a função de próximo estado
void constructNSTATE(FILE *output)
{
	int j;
	for(Tran *p = Transit->prox; p!= NULL; p = p->prox)
	{
		j = 0;
		strcpy(aux, p->string);
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		fprintf(output, " ");
		
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]);
		
		fprintf(output, "\n");
	}
	fprintf(output, ".e");
	fclose(output);
}
// Constrói a função lógica de saída
void constructOUT(FILE *output)
{
	int j, l;
	for(Tran *p = Transit->prox; p!= NULL; p = p->prox)
	{
		j = l = 0;
		strcpy(aux, p->string);
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		for (; aux[j]!=' '; j++) fprintf(output, "%c", aux[j]); j++;
		for (; aux[j]!=' '; j++); j++;
		
		fprintf(output, " ");
		for (; aux[j]!='\n'; j++, l++) 
			fprintf(output, "%c", aux[j]);
		fprintf(output, "\n");
	}
	fprintf(output, ".e");
	fclose(output);
}

//************************************/
//*   Núcleo da geração das funções  */
//*     					         */
//************************************/
void GenFunc(char *Blif_file, char *FGC, char *OUT, char *NSTATE)
{
	FILE *input   = fopen (Blif_file, "r");
	FILE *FGC_OUT = fopen (FGC, "w");
	FILE *OUT_OUT = fopen (OUT, "w");
	FILE *NSTATE_OUT = fopen (NSTATE, "w");
	checkFile(input, Blif_file);
	
	readBlif(input, FGC_OUT, OUT_OUT, NSTATE_OUT);
	
	constructFGC(FGC_OUT);
	constructOUT(OUT_OUT);
	constructNSTATE(NSTATE_OUT);
}
