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
Inl **sttData;
typedef struct aresta {
	int orig, dest, depe;
	struct aresta *prox;
} Aresta;
Aresta *arestas;

//************************************/
//*    Inicialização da estrutura    */
//*         de dados e do DG		 */
//************************************/
void inicializa2()
{
	Sinput = (char*)malloc(Ninput*sizeof(char));
	sttData = (Inl**)malloc(Nstate*sizeof(Inl));
	arestas = (Aresta*)malloc(Nstate*sizeof(Aresta));
	arestas->prox = NULL;
	for (int j = 0; j<Nstate; j++) {
		sttData[j] = (Inl*)malloc(sizeof(Inl));
		sttData[j]->prox = NULL;
	}
}
//************************************/
//*      Imprimindo o Grafo          */
//*        de Dependências           */
//************************************/
//* A impressão pode ser feita usando GraphViz
//*  http://graphs.grevian.org/graph/6175947048878080
//************************************/
// Imprime uma nova transição, se não houver dependência
void printTransition(FILE *log, int orig, int dest, bool show)
{
	for (Aresta *ar = arestas->prox; ar != NULL; ar = ar->prox)
		if (ar->orig == orig && ar->dest == dest)
			return;
			
	Aresta *newAresta = (Aresta*)malloc(Nstate*sizeof(Aresta));
	newAresta->orig = orig;	newAresta->dest = dest;
	newAresta->prox = NULL;
	for (Aresta *ar = arestas; ar != NULL; ar = ar->prox)
		if (ar->prox == NULL) {
			ar->prox = newAresta;
			break;
		}
	fprintf(log, "%d->%d\n", orig, dest);
	if (show == true)
		printf("%d->%d\n", orig, dest); 
}
// Imprime uma nova dependência, se não for repetida
void printDependencia(FILE *log, int orig, int dest, int depe, bool show)
{
	for (Aresta *ar = arestas->prox; ar != NULL; ar = ar->prox)
		if (ar->orig == orig && ar->dest == dest && ar->depe == depe)
			return;
			
	Aresta *newAresta = (Aresta*)malloc(Nstate*sizeof(Aresta));
	newAresta->orig = orig;	newAresta->dest = dest;
	newAresta->depe = depe;	newAresta->prox = NULL;
	for (Aresta *ar = arestas; ar != NULL; ar = ar->prox)
		if (ar->prox == NULL) {
			ar->prox = newAresta;
			break;
		}
		  
	fprintf(log, "%d->%d [ label = \"%d\" ];\n", orig, dest, depe); 
	if (show == true)
		printf("%s%d->%d [ label = \"%d\" ];%s\n", KRED, orig, dest, depe, KWHT); 
}
//************************************/
//*        Análise do Grafo          */
//*     	de Dependência       	 */
//************************************/
// Mostra o DG construído a partir da leitura
void showTransitions(FILE *log, bool show)
{
	for (int j = 0; j < Nstate; j++)
		for (Inl *ptx = sttData[j]->prox; ptx!=NULL; ptx = ptx->prox)
			printTransition(log, ptx->Norig, j, show);
}
// Mostra a dependência detectada
void Dependencia(FILE *log, int origA, int destA, int origB, int destB, bool show)
{
	Ndependencias++;
	printDependencia(log, origA, destA, origB, show);
	printDependencia(log, origB, destB, origA, show);
}
// Para cada transição do DG, procura dependência
int countDependency(FILE *log, bool show)
{
	Inl *ptx, *pty;
	for (int j = 0; j < Nstate; j++)
		for (ptx = sttData[j]->prox; ptx!=NULL; ptx = ptx->prox)
		{
			strcpy(Sinput, ptx->in);
			for (int k = 0; k < Nstate; k++)
				for (pty = sttData[k]->prox; pty!=NULL; pty = pty->prox)
					if (strcmp(pty->in, Sinput) == 0)
						if (pty != ptx)
							Dependencia(log, ptx->Norig, j, pty->Norig, k, show);
		}
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
	for (Inl *ptx = sttData[Ndest]->prox; ptx!=NULL; ptx = ptx->prox)
		if (sttData[Ndest]->Norig == Norig)
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
	if (sttData[Ndest]->prox == NULL) {
		sttData[Ndest]->prox = newInl;
		return;
	}
	for (pt = sttData[Ndest]->prox; pt->prox!=NULL; pt=pt->prox);
	pt->prox = newInl;
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
//*     Análise produtos/literais    */
//*     dos arquivos .blif gerados	 */
//************************************/
// Determina o número de produtos e literais de um arquivo Blif
// Conforme o padrão utilizado em Minimalist
void analyzeDefaultBlif(char *Blif_file, int *Nprodutos, int *Nliterais)
{
	int j, flag, Nblank = 0;
	int *isSet, *literais_down, *literais_up;
	
	FILE *input = fopen (Blif_file, "r");
	while (!(aux[0] == '.' && aux[1] == 'p'))
		fgets(aux , MAX , input);
	fgets(aux , MAX , input);
	
	while (aux[++Nblank] != ' ');
	
	literais_down = (int*)malloc((Nblank-1)*sizeof(int));
	literais_up = (int*)malloc((Nblank-1)*sizeof(int));
	for (int i = 0; i < Nblank; i++)
		literais_down[i] = literais_up[i] = 0;
	
	isSet = (int*)malloc((strlen(aux) - Nblank)*sizeof(int));
	for (int i = 0; i < (strlen(aux) - Nblank); i++)
		isSet[i] = 0;
		
	while(!(aux[0] == '.' && aux[1] == 'e'))
	{
		for (int y = Nblank; y < strlen(aux); y++)
			if (aux[y] == '0') 
			{
				fclose(input);
				free(isSet);
				free(literais_down);
				free(literais_up);
				return;
			}
		for(j = 0; aux[j] != ' '; j++)
			if (aux[j] == '0' && literais_down[j] == 0) {
				literais_down[j] = 1;
				*Nliterais += 1;
			}
			else if (aux[j] == '1' && literais_up[j] == 0) {
				literais_up[j] = 1;
				*Nliterais += 1;
			}
		flag = 0;
		for (int l = j + 1; l < strlen(aux); l++)
			if (aux[l] == '1' && isSet[l - Nblank] == 1) 
				flag = 1;
		if (flag == 0) {
			*Nprodutos += 1;
			while(++j < strlen(aux)) 
				if (aux[j] == '1') 
					isSet[j - Nblank] = 1;
		}
		fgets(aux , MAX , input);
	}

	fclose(input);
	free(isSet);
}

// Determina o número de produtos e literais de um arquivo Blif
// Conforme o padrão estabelecido em sala de aula.
void analyzeBlif(char *Blif_file, int *Nprodutos, int *Nliterais)
{
	int *isSet, j, Nblank = 0;
	
	FILE *input = fopen (Blif_file, "r");
	while (!(aux[0] == '.' && aux[1] == 'p'))
		fgets(aux , MAX , input);
	fgets(aux , MAX , input);
	
	while (aux[++Nblank] != ' ');
	isSet = (int*)malloc((strlen(aux) - Nblank)*sizeof(int));
	for (int i = 0; i < (strlen(aux) - Nblank); i++)
		isSet[i] = 0;
		
	while(!(aux[0] == '.' && aux[1] == 'e'))
	{
		for (int y = Nblank; y < strlen(aux); y++)
			if (aux[y] == '0') 
			{
				fclose(input);
				free(isSet);
				return;
			}
		*Nprodutos += 1;
		for(j = 0; aux[j] != ' '; j++)
			if (aux[j] != '-')
				*Nliterais += 1;
		while(++j < strlen(aux)) 
			if (aux[j] == '1')
				if (isSet[j - Nblank]++ == 1)
					*Nprodutos += 1;
		fgets(aux , MAX , input);
	}

	fclose(input);
	free(isSet);
}

//************************************/
//*     Análise número de estados    */
//*     do arquivo .kiss2 gerado	 */
//************************************/
// Determina o número de estados do arquivo .kiss
void analyzeStatesKiss(char *Kiss_file, int *Nminstates)
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

//************************************/
//*     Núcleo da Análise do GD      */
//*     					         */
//************************************/
void analyzeGD(char *Kiss_file, char *Log_file, bool show, int *Ndependencias)
{
	FILE *input = fopen (Kiss_file, "r");
	FILE *log = fopen (Log_file, "w");
	fprintf(log, "*** Dependency Graph (DG) ***\n\n");
	fprintf(log, "Visual Graph on GraphViz: http://graphs.grevian.org/graph\n\n");
	fprintf(log, "digraph {\n");
	if (show == true) printf("digraph {\n");
	checkFile(input, Kiss_file);
	inicializa2();
	readKiss(input);
	*Ndependencias = countDependency(log, show);
	showTransitions(log, show);
	fprintf(log, "}\n");
	if (show == true) printf("}\n");
	if (*Ndependencias == 0)
		printf("%sNenhuma dependência detectada.\n%s",KRED,KWHT); 
}
