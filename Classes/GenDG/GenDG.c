#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "../tools/tools.h"
int Ninput, Noutput, Ntrans, Nstate;
char *Sinput, aux[MAX];
int Norig, Ndest, Ndependencias;
typedef struct inl {
	char *in;
	int Norig;
	struct inl *prox;
} Inl;
Inl *sttData;

//************************************/
//*    Inicialização da estrutura    */
//*         de dados e do DG		 */
//************************************/
void inicializa2()
{
	Sinput = (char*)malloc(Ninput*sizeof(char));
	sttData = (Inl*)malloc(Nstate*sizeof(Inl));
	for (int j = 0; j<Nstate; j++)
		sttData->prox = NULL;
}
//************************************/
//*        Análise do Grafo          */
//*     	de Dependência       	 */
//************************************/
// Mostra o DG construído a partir da leitura
void showTransitions()
{
	for (int j = 0; j < Nstate; j++)
		for (Inl *ptx = sttData[j].prox; ptx!=NULL; ptx = ptx->prox)
			printf ("%d: (%d->%d) %s \n", j, ptx->Norig, j, ptx->in);
}
// Mostra a dependência detectada
void Dependencia(int origA, int destA, int origB, int destB, bool show)
{
	if (show == true)
	{
		printf(KRED);
		printf("Dependência detectada:\n");
		printf(KWHT);
		printf("%d->%d (%s)\n", origA, destA, Sinput);
		printf("%d->%d (%s)\n", origB, destB, Sinput);
	}
	Ndependencias++;
}
// Para cada transição do DG, procura dependência
int countDependency(bool show)
{
	Inl *ptx, *pty;
	for (int j = 0; j < Nstate; j++)
		for (ptx = sttData[j].prox; ptx!=NULL; ptx = ptx->prox)
		{
			strcpy(Sinput, ptx->in);
			for (int k = 0; k < Nstate; k++)
				for (pty = sttData[k].prox; pty!=NULL; pty = pty->prox)
					if (strcmp(pty->in, Sinput) == 0)
						if (pty != ptx)
							Dependencia(ptx->Norig, j, pty->Norig, k, show);
		}
	if (Ndependencias == 0)
		printf("%sNenhuma dependência detectada.\n%s",KRED,KWHT); 
	return Ndependencias;
}
//************************************/
//*     Leitura do arquivo Kiss      */
//*     	da MEF minimizada		 */
//************************************/
// Processa String até próximo Blank Space
int nextBS (char *linha, int start){
	int j, k;
	for (j = start, k = 0; j<strlen(linha); j++, k++)
		if (linha[j] == ' ') break;
		else if (isalpha(linha[j])) k--;
		else if (linha[j] == '-') aux[k] = '2';
		else aux[k] = linha[j];
	aux[k] = '\0';
	return j;
}
// Identifica transição na string lida.
bool isTrans(char *linha){
	int bsPt = -1;
	bsPt = nextBS(linha, ++bsPt); strcpy(Sinput, aux);
	bsPt = nextBS(linha, ++bsPt); Norig = atoi(aux);
	bsPt = nextBS(linha, ++bsPt); Ndest = atoi(aux);	
	return Norig != Ndest;
}
// Verifica se a transição já existe
bool existTrans()
{
	for (Inl *ptx = sttData[Ndest].prox; ptx!=NULL; ptx = ptx->prox)
		if (sttData[Ndest].Norig == Norig)
			if (strcmp(ptx->in, Sinput) == 0)
				return true;
	return false;
}
// Adiciona uma nova transição à estrutura.
void addTrans()
{
	Inl *pt, *newInl;
	if (existTrans() == true) 
		return;
	newInl = (Inl*)malloc(sizeof(Inl));
	newInl->in = (char*)malloc(Ninput*sizeof(char));
	newInl->Norig = Norig;
	newInl->prox = NULL;
	strcpy(newInl->in, Sinput);
	if (sttData[Ndest].prox == NULL) {
		sttData[Ndest].prox = newInl;
		return;
	}
	for (pt = sttData[Ndest].prox; pt->prox!=NULL; pt=pt->prox);
	pt->prox = newInl;
}

// Determina o número de produtos e literais de um arquivo Blif
void analyseBlif(char *Blif_file, int *Nprodutos, int *Nliterais)
{
	int logicBegin, *isSet, Noutput, Nblank, Nlines, j;
	j = Nblank = Noutput = *Nliterais = *Nprodutos = 0;
	
	FILE *input = fopen (Blif_file, "r");
	while (!(aux[0] == '.' && aux[1] == 'p'))
		fgets(aux , MAX , input);
	fgets(aux , MAX , input);
	logicBegin = ftell(input);
	
	while (aux[++j] != ' ');
	Noutput = (strlen(aux) - j); Nblank = j; 
	isSet = (int*)malloc(Noutput*sizeof(int));
	for (int i = 0; i < Noutput; i++)
		isSet[i] = 0;
		
	while(Nlines == 0 && !(aux[0] == '.' && aux[1] == 'e'))
	{
		j = 0;
		while (aux[++j] != ' ');
		while(j++ < strlen(aux))
			if (aux[j] == '0') 
				Nlines = 1;
		if (Nlines == 0)
			*Nprodutos = *Nprodutos + 1;
		fgets(aux , MAX , input);
	}
	
	Nlines = *Nprodutos;
	fseek(input, logicBegin, SEEK_SET );
	for (int i = 0; i<Nlines; i++)
	{
		j = 0;
		while(aux[j] != ' ')
			if (aux[j++] != '-')
				*Nliterais = *Nliterais + 1;
		while(j++ < strlen(aux)) 
			if (aux[j] == '1')
				if (isSet[j - Nblank]++ == 1)
					*Nprodutos = *Nprodutos + 1;
		fgets(aux , MAX , input);
	}
	fclose(input);
	free(isSet);
}

// Determina o número de estados do arquivo .kiss
void analyseStatesKiss(char *Kiss_file, int *Nminstates)
{
	FILE *input = fopen (Kiss_file, "r");
	checkFile(input, Kiss_file);
	while (!feof(input))
	{
		fgets(aux , MAX , input);
		if (aux[0] == '.' && aux[1] == 's')
		{
			fclose(input);
			*Nminstates = nextNumber(0,aux); 
			return;
		}
	}
	fclose(input);
}
// Realiza a leitura do formato .kiss
void readKiss(FILE *input)
{
	char linha[MAX];
	bool readTrans = false;
	for(int lin = 0; !feof(input); lin++)
	{
		fgets(linha , MAX , input);
		if (linha[0] == '.')
			switch (linha[1])
			{
				case 'i': Ninput  = nextNumber(lin,linha); break;
				case 'o': Noutput = nextNumber(lin,linha); break;
				case 'p': Ntrans  = nextNumber(lin,linha); break;
				case 's': Nstate  = nextNumber(lin,linha); break;
				case 'r': readTrans = true; inicializa2(); break;
				case 'e': fclose(input); return;
			}
		if (readTrans == true)
			if (isTrans(linha) == true)
				addTrans();
	}
	fclose(input);
}

//************************************/
//*     Núcleo da Análise do GD      */
//*     					         */
//************************************/
void analyseGD(char *Kiss_file, bool show, int *Ndependencias)
{
	FILE *input = fopen (Kiss_file, "r");
	checkFile(input, Kiss_file);
	inicializa2();
	readKiss(input);
	if (show == true) showTransitions();
	*Ndependencias = countDependency(show);
}
