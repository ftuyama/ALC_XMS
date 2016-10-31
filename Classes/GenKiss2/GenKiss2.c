#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "../tools/tools.h"
char *aux;
int Ninput, Noutput, Ntrans, Nstate, Ndecvar;
int **subconjIn, **subconjOut, z, j;
bool useDDC;

typedef struct no{
	char* nome;
	struct no *prox;
} No;
 	
typedef struct input {
	char *nome;
	int tipo, ib, t;
	struct input *prox;
} Input;
			 
typedef struct output {
	char *nome;
	int tipo, ob, t;
	struct output *prox;
} Output;
			  
typedef struct state{
	int nome;
	struct state *prox;
} State;
			 
typedef struct transitions{
	int st1, st2;
	int tipo, ib, ob;
	struct no *nome1, *nome2;
	struct transitions *prox;
} Transitions;

typedef struct writen{
	int st, *In;
	struct writen *prox;
} Writen;

Writen* Wr, *wr, *w;
Input* In, *in;
Output* Out, *out;
State *St, *p, *q;
Transitions *Tr, *Tr1, *Tr2;
No *Dec, *noz;

//************************************/
//*    Subrotina de inicialização    */
//************************************/				  
void inicializa(bool DDC)
{
	useDDC = DDC;
	In=(Input*) malloc(sizeof(Input));
	Out=(Output*) malloc(sizeof(Output));
	St=(State*) malloc(sizeof(State));
	Tr=(Transitions*) malloc(sizeof(Transitions));
	Tr2=(Transitions*) malloc(sizeof(Transitions));
	Wr = (Writen*)malloc(sizeof(Writen));
	Dec=(No*) malloc(sizeof(No));
	
	Dec->prox = NULL; In->prox = NULL; Wr-> prox = NULL;
	St->prox = NULL; Tr->prox = NULL; Out->prox = NULL;
	Ninput = Noutput = Ntrans = Nstate = Ndecvar = In->t = 0;
}
// Inicializa vetor de subconjuntos
void inicVecSub()
{
	int m, k;
	subconjIn = (int**)(malloc(Nstate*sizeof(int*)));
	for (m=0; m<= Nstate; m++)
		subconjIn[m] = (int*)malloc(Ninput*sizeof(int));
	for (k = 0; k <= Nstate; k++)
		for (m=0; m< Ninput; m++)
			subconjIn[k][m] = 0;
			
	subconjOut = (int**)(malloc(Nstate*sizeof(int*)));
	for (m=0; m< Nstate; m++)
		subconjOut[m] = (int*)malloc(Noutput*sizeof(int));
	for (k = 0; k < Nstate; k++)
		for (m=0; m< Noutput; m++)
			subconjOut[k][m] = 0;
	for (Ndecvar = 0, in=In->prox; in!=NULL; in=in->prox)
		if (in->tipo == 3) Ndecvar++;
	for (z = 0, in=In->prox; in!=NULL; in=in->prox)
		subconjIn[0][z++] = in->ib;
	for (z = 0, out=Out->prox; out!=NULL; out=out->prox)
		subconjOut[0][z++] = out->ob;
}
int maxNumber(int st1, int st2){
	if (st1 < st2) st1 = st2;
	if (Nstate > st1)
		return Nstate;
	return st1 + 1;
}
//************************************/
//*		 Subrotinas criadas para     */
//*       a Leitura do arquivo       */
//************************************/
// Identifica o tipo de linha lida
int linhaKey (char *linha)
{
	int tam, l, key = 0;
	
	tam = strlen(linha);
	if (tam>5 && linha[0]!=';')
	{
		l = tam-1;
		while(l>0 && emptyChar(linha[l])==1)
		  linha[l--]='\0';
		  
		aux = strtok(linha," 	");
		if(aux!=NULL)
		{
			if(strcmp(aux,"name")==0) 		 key = 1; // Nome da especificação
			else if(strcmp(aux,"input")==0)  key = 2; // Entradas
			else if(strcmp(aux,"output")==0) key = 3; // Saídas
			else if(aux[0]>47&&aux[0]<58) 	 key = 4; // Transições (Entrada/Saída rajada)
		  }
	}
	return key;	
}
//************************************/
//*     Subrotinas para atualizar    */
//*       a estrutura de dados       */
//************************************/
// ********** Insere uma nova entrada ************//
void insIn (Input* l, char *i, char j)
{
	Input  *p,*novo = (Input*) malloc(sizeof(Input));
	Ninput++;
	novo->nome = i;
	novo->ib=j-48;   
	novo->tipo=0;
	if(l->prox==NULL)
	{  
		novo->prox=NULL;
		l->prox=novo;
		return; 
	}
	for(p=l;p->prox!=NULL;p=p->prox);
	novo->prox =NULL;
	p->prox=novo;
}
// ********** Insere uma nova saída ***********//
void insOut (Output* l, char *i,char j)
{
	Output *p,*novo = (Output*) malloc(sizeof(Output));
	Noutput++;
	novo->nome = i;
	novo->ob=j-48;
	novo->tipo=0;
	if(l->prox==NULL)
	{
		novo->prox=NULL;
		l->prox=novo;
		return; 
	}
	for(p=l;p->prox!=NULL;p=p->prox);
	novo->prox =NULL;
	p->prox=novo;
}
// ********** Insere um novo estado ************//
void insSt (State* l, int i)
{
	State  *p, *aux, *novo;
	if((novo = (State*) malloc(sizeof(State)))==NULL)
	{         
		printf("não foi possivel alocar memoria\n");
		exit(0);
	}
	novo->nome=i;
 
	if(l->prox==NULL)// inicio
	{  
	   novo->prox=NULL;
	   l->prox=novo;
	   return;
	 }
	 for(p=l,aux=l->prox;p->prox!=NULL;p=p->prox,aux=aux->prox) // meio
		if(aux->nome>i)
		{
			novo->prox=aux;
			p->prox=novo;
			return;
		}
	  novo->prox=NULL; // fim
	  p->prox=novo;
}
// ********** Insere uma nova transição ***********//
void insTr(Transitions* l, int i,int j)
{
	Transitions *p, *novo = (Transitions*) malloc(sizeof(Transitions));
	novo->st1 = i;
	novo->st2 = j;
	novo->nome1=(No*) malloc(sizeof(No));
	novo->nome1->prox = NULL;
	novo->nome2=(No*) malloc(sizeof(No));
	novo->nome2->prox = NULL;
	novo->tipo=0; // 0 = transição normal =1 level var

	if(l->prox==NULL)
	{
		novo->prox=NULL;
		l->prox=novo;
		return;
	}
	for(p=l;p->prox!=NULL;p=p->prox);
	novo->prox =NULL;
	p->prox=novo;
}
// ********** Insere um novo Nó ***********//
void insNo (No* l, char *i)
{
	No  *p,*novo = (No*) malloc(sizeof(No));
	novo->nome = i;
	novo->prox=NULL;

	if(l->prox==NULL)
	{
		l->prox=novo;
		return;
	}
	for(p=l;p->prox!=NULL;p=p->prox);
	p->prox=novo;
}

//************************************/
//*     Subrotinas para realizar     */
//*   buscas na estrutura de dados   */
//************************************/
// ********** Procura uma dada Entrada ************//
int getPosIn(Input *n,char *nome)
{
	 int x=0;
	 Input *ptr;
	 ptr=n->prox;
	 while(ptr!=NULL) {
		if(strcmp(nome,ptr->nome)==0)
			return x;
		ptr=ptr->prox;
		x++;
	 }
	 return -1;
}
// ********** Procura uma dada Entrada ************//
Input* buscaIn (Input* l, char v[])
{
	Input* p;
	if(l->prox!=NULL)
	   for (p=l->prox; p!=NULL; p=p->prox)
		  if (strcmp(p->nome, v)==0)
			return p;
	return NULL; /* não achou o elemento */
}
// ********** Procura uma dada Saída ************//
Output* buscaOut (Output* l, int pos)
{
   int x;
   Output* p;
   if(l->prox!=NULL)
       for (x=1,p=l->prox; p!=NULL; p=p->prox,x++)
	       if (x==pos)
			 return p;
	return NULL; /* não achou o elemento */
}
// ********** Procura um dado Estado ************//
State* buscaSt (State* l, int v)
{
	State* p;
	if(l->prox!=NULL)
		for (p=l->prox; p!=NULL; p=p->prox)
			if (p->nome==v)
				return p;
	return NULL; /* não achou o elemento */
}
// ********** Procura um dado Nó ************//
No* buscaNo (No* l, char v[])
{
	No* p;
    for (p=l->prox; p!=NULL; p=p->prox)
		if (strcmp(p->nome, v)==0)
		return p;
	return NULL; /* não achou o elemento */
}
// ********** Procura uma dada Transição ************//
Transitions* buscaTr (Transitions* l,int v1,int v2)
{
	Transitions* p;
	if(l->prox!=NULL)
	{
		for (p=l->prox; p!=NULL; p=p->prox)
			if (p->st1==v1 && p->st2==v2)
				return p;
	}
	return NULL; /* não achou o elemento */
}
//************************************/
//*     Lê a especificação XBM       */
//*      e a guarda na memória       */
//************************************/
void readXBM (FILE *input)
{
	No *Daux;
	Input *I;
	State *ss;
	int st1, st2, key, lin, l, erro;
	char linha[MAX], *aux1, *var, c, signal;
	for(lin = 0; !feof(input); lin++)
	{
		fgets(linha , MAX , input);
		key = linhaKey(linha);
		switch(key)
		{
			case 0: case 1: break;
			//*****************************//
			//*  Leitura do Input/Output  *//
			//*****************************//
			case 2: case 3:
				erro = 1;
				aux = strtok(NULL," 	");
				if(aux!=NULL)
				{
					var = copia(aux);
					if(isalpha(aux[0])==0)
						exception(lin, "not alpha");
					aux = strtok(NULL," 	");
					if(aux!=NULL)
						if(aux[0]=='0'||aux[0]=='1')
						{
							erro = 0;
							if (key == 2) insIn(In,var, aux[0]);
							if (key == 3) insOut(Out,var,aux[0]);
						}
				}
				if (erro == 1)
					exception(lin,"input fail");		 
		    break;
			//*****************************//
			//*   Leitura da Transição    *//
			//*****************************//
			case 4: 
				// Inserindo a transição
				st1 = nextNumber(lin, aux);
				aux = strtok(NULL," 	");
				if(aux==NULL) exception(lin, "trans fail");
				st2 = nextNumber(lin, aux);
				Nstate = maxNumber(st1, st2);
				insTr(Tr, st1, st2);
				
				// Inserindo os estados na lista
				Tr1 = buscaTr(Tr,st1,st2);
				if(Tr1==NULL) exception(lin, "search fail");
				ss = buscaSt(St,st1);
				Tr1->ib=0; Tr1->ob=0;
				if(ss==NULL) insSt(St,st1);
				aux=strtok(NULL," 	");
				if(aux==NULL) exception(lin, "burst fail");
				while(aux[0]!='|')
				{
					c = aux[strlen(aux)-1];
					if((isalpha(aux[0])==0&&aux[0]!='[')||strlen(aux)<2||((opChar(c)==0)&&c!=']'))
						exception(lin, aux);
					var = copia(aux);
					signal=var[strlen(var)-1];
					if (signal != '*' || useDDC) {
						insNo(Tr1->nome1,var); // inserindo as entradas rajadas
						Tr1->ib++;	
					}
					if(var[0]=='[')  // inserindo as variaveis de Decisão na lista
					{
						// 0 = var   1 = direct don't care  3 = var decision;
						Tr1->tipo=1; // 0 = transição normal =1 level var 
						aux++;
						signal=aux[strlen(aux)-2];
						aux[strlen(aux)-2]='\0';
						aux1=copia(aux);
						Daux=buscaNo(Dec,aux1);
						
						I=buscaIn(In,aux);
						if(Daux==NULL)
						 {
							 insNo(Dec,aux1); 
							 Ndecvar++;
						 }
						 if(I==NULL)
							exception(lin, var);
						 if(signal!='-'&&signal!='+')
							exception(lin, var);
						 Daux=buscaNo(Tr1->nome1,var);
						 if(Daux==NULL)
							exception(lin, "search2 fail");
						 I->tipo=3;// 0 = var   1 = direct don't care  3 = var decision
					}
				  aux=strtok(NULL,"	 ");	
				  if(aux==NULL) exception(lin, "output fail");		  
				}
				
				// Inserindo as saídas rajada.
				aux=strtok(NULL," 	");
				while(aux!=NULL)
				{
					if( strlen(aux)>0)
					{
						for(l = strlen(aux)-1; l>0&&(emptyChar(aux[l])==1||aux[l]<42); l--)
						aux[l]='\0';
						if (strlen(aux)<2) break;
						if(aux[0]=='1'||aux[0]=='0'||(aux[l]!='+'&&aux[l]!='-'))
							exception(lin, aux);
						var=copia(aux);
						if( strlen(var)>1){   
							insNo(Tr1->nome2,var); // inserindo as saidas rajada.
							Tr1->ob++;
						}
					}
					if(aux!=NULL) aux=strtok(NULL," 	");
				}
		    break;
		}
	}
	fclose(input);
}

// ********** Preparação Pré/Pós rajada ************//
void preBurst(int nomep, int nomeq)
{
	In->t = Out-> t = 0;
	for (z = 0, in=In->prox; in!=NULL; in=in->prox) {
		subconjIn[Nstate][z] = 0;
		in->ib = subconjIn[nomep][z++];
		in->t = 0;
	}
	for (z = 0, out=Out->prox; out!=NULL; out=out->prox) {
		out->ob = subconjOut[nomep][z++];
		out->t = 0;
	}
}
void posBurst(int nomep, int nomeq)
{
	for (z = 0, out=Out->prox; out!=NULL; out=out->prox)
		subconjOut[nomeq][z++] = out->ob;
}
// ********** Descreve uma rajada ************//
void Burst(char *burst, int nomep, int nomeq, int inout)
{
	int  x, y, z;
	char aux[MAX];
	strcpy(aux,burst);	
	for(x=0, y=0; x<strlen(burst); x++)
		if (opChar(burst[x])==1)
		{
			aux[y] = '\0';
			if (aux[0] == '[')
				for (z=0; z<strlen(aux); z++)
					aux[z] = aux[z+1]; 
			if (inout == 0)
				for (z=0, in=In->prox; in!=NULL; in=in->prox)
					if (strcmp(in->nome, aux) == 0) {
						if (burst[x] == '+')	  in->ib = 1; 
						else if (burst[x] == '-') in->ib = 0;
						else if (burst[x] == '*') in->ib = 2;
						In->t++; in->t = 1; y = 0; z++;
					}
			if (inout == 1)
				for (z=0, out=Out->prox; out!=NULL; out=out->prox)
					if (strcmp(out->nome, aux) == 0) {
						if (burst[x] == '+')	  out->ob = 1;
						else if (burst[x] == '-') out->ob = 0;
						Out->t++; y = 0; z++;
					}
		}
		else if (emptyChar(burst[x])==0) 
			aux[y++] = burst[x];
}
void printREP()
{
	printf("\n\nList\n");
	for (wr=Wr->prox; wr!=NULL; wr=wr->prox)
	{
		printf ("\n(%d)", wr->st);
		for (z = 0; z<Ninput; z++)
			printf ("%d", wr->In[z]);
	}
}

bool getIb()
{
	if (in->t == 1)
		if (subconjIn[Nstate][j++] == 0)
			return not(in->ib);
	return in->ib;
}
// ******* Repetição de estado transitório *********//
bool checkRep (int nome)
{
	int z = 0;
	for (wr = Wr->prox; wr!=NULL; wr = wr->prox)
		if (wr->st == nome)
			for (z = 0, j = 0, in=In->prox; in!=NULL; in=in->prox)
				if (wr->In[z] == getIb() || wr->In[z] == 2 || in->tipo == 3)
					if (++z == Ninput)
						return true;
			
	for (wr=Wr; wr->prox!=NULL; wr=wr->prox);
	w = (Writen*)malloc(sizeof(Writen));
	w->In = (int*)malloc(Ninput*sizeof(int));
	for (z = 0, j = 0, in=In->prox; in!=NULL; in=in->prox)
		w->In[z++] = getIb();
	w->st = nome;
	wr->prox = w;
	w->prox = NULL;
	return false;
}
void addWr(int nome)
{
	for (wr=Wr; wr->prox!=NULL; wr=wr->prox);
	w = (Writen*)malloc(sizeof(Writen));
	w->In = (int*)malloc(Ninput*sizeof(int));
	for (z = 0, j = 0, in=In->prox; in!=NULL; in=in->prox)
		w->In[z++] = in->ib;
	w->st = nome;
	wr->prox = w;
	w->prox = NULL;
}
// ********** Subconjuntos da Rajada ************//
void generateSub(FILE *output, int nome, int i, int n)
{
	int sum;
	if (i == n)
	{
		if (checkRep(nome) == false)
		{	
			/*
			printf("\n");
			for (j = 0, in=In->prox; in!=NULL; in=in->prox)
				printf("%d", in->t);
				printf("   ");
			for (j = 0, in=In->prox; in!=NULL; in=in->prox)
				printf("%d", in->tipo);
				printf("\n");
				for (z = 0, in=In->prox; in!=NULL; in=in->prox)
			printf("%d",subconjIn[Nstate][z++]);
				
			printf("\n  s%d s%d ", nome, nome);
			for (j = 0, in=In->prox; in!=NULL; in=in->prox)
					if (in->tipo == 3) printf("-");
			for (j = 0, in=In->prox; in!=NULL; in=in->prox)
				if (in->tipo != 3) printf("%d", getIb(nome));
			printf("(%d)\n",j);
			*/
			for (j = 0, sum =0, in=In->prox; in!=NULL; in=in->prox)
				if (in->tipo != 3) { 
					if (in->ib == getIb())
						sum++;
				}
				else getIb();
			if (sum != Ninput - Ndecvar )		
			{
				for (j = 0, in=In->prox; in!=NULL; in=in->prox)
					if (in->tipo == 3) 		fprintf(output, "-");
				for (j = 0, in=In->prox; in!=NULL; in=in->prox)
					if (in->ib == 2) {		fprintf(output, "-"); getIb();}
					else if (in->tipo != 3) fprintf(output, "%d", getIb());
					else getIb();
				fprintf(output, " s%d s%d ", nome, nome);
				for (out=Out->prox; out!=NULL; out=out->prox)
					fprintf(output, "%d", out->ob);
				fprintf(output, "\n");
				Ntrans++;
			}
		}
	}
	else
	{
		subconjIn[Nstate][i] = 0;
		generateSub(output, nome, i+1, n);
		subconjIn[Nstate][i] = 1;
		generateSub(output, nome, i+1, n);
	}
}
void writeSub(FILE *output, int nomep, int nomeq)
{	
	/*
	printf ("\n%d->%d (%d):", nomep, nomeq, In->t);
	for (z = 0, in=In->prox; in!=NULL; in=in->prox)
		printf("%d",subconjIn[nomep][z++]);
	*/
	generateSub(output, nomep, 0, In->t);
	for (z = 0, in=In->prox; in!=NULL; in=in->prox)
		subconjIn[nomeq][z++] = in->ib;
}

// ********** Escreve todas as transições ************//
void writeTransition(FILE *output)
{
	inicVecSub();
	for (p=St->prox; p!=NULL; p=p->prox)
		for (q=St->prox; q!=NULL; q=q->prox)
			if ((Tr1 = buscaTr(Tr,p->nome,q->nome))!= NULL)
			{
				preBurst(p->nome, q->nome);
				for (noz = Tr1->nome1->prox; noz!=NULL; noz=noz->prox)
					Burst(noz->nome, p->nome, q->nome, 0);
				addWr(p->nome);
				for (z = 0, in=In->prox; in!=NULL; in=in->prox)
					subconjIn[q->nome][z++] = in->ib;
				for (in=In->prox; in!=NULL; in=in->prox)
					if (in->tipo == 3 && in->t == 0) fprintf(output, "-");
					else if (in->tipo == 3) 		 fprintf(output, "%d", in->ib);
				for (in=In->prox; in!=NULL; in=in->prox)
					if (in->ib == 2) 				 fprintf(output, "-");
					else if (in->tipo != 3) 		 fprintf(output, "%d", in->ib);
				fprintf(output, " s%d s%d ", p->nome, q->nome);
				for (noz = Tr1->nome2->prox; noz!=NULL; noz=noz->prox)
					Burst(noz->nome, p->nome, q->nome, 1);
				posBurst(p->nome, q->nome);
				for (out=Out->prox; out!=NULL; out=out->prox)
					fprintf(output, "%d", out->ob);
				fprintf(output, "\n");
				Ntrans++;
			}
	for (p=St->prox; p!=NULL; p=p->prox)
		for (q=St->prox; q!=NULL; q=q->prox)
			if ((Tr1 = buscaTr(Tr,p->nome,q->nome))!= NULL)
			{
				preBurst(p->nome, q->nome);
				for (noz = Tr1->nome1->prox; noz!=NULL; noz=noz->prox)
					Burst(noz->nome, p->nome, q->nome, 0);
				writeSub(output, p->nome, q->nome);
			}
}
//************************************/
//*    Descreve sistema em formato   */
//*    .kiss a partir da memória     */
//************************************/
void writeKiss(FILE *output)
{
	int pointer, pointer2;
	fprintf(output, ".i %d\n", Ninput);
	fprintf(output, ".o %d\n", Noutput);
	fprintf(output, ".p ");
	
	pointer = ftell(output);
	fprintf(output,"            ");
	pointer2 = ftell (output);
	
	fprintf(output, ".s %d\n", Nstate);
	fprintf(output, ".r s0\n");
	writeTransition(output);
	fprintf(output, ".e");
	
	fseek(output, pointer , SEEK_SET );
	fprintf(output, "%d" , Ntrans);
	fseek(output, pointer2 - 1, SEEK_SET );
	fprintf(output, "\n");
	
	fclose(output);
}

//************************************/
//*    Descreve ordem dos sinais     */
//*         para a dada MEFA         */
//************************************/
void logSignalsOrder (char *XBM_file, FILE *log) {
	fprintf(log, "*** Sinais para a MEFA %s ***\n\n", XBM_file);
	
	fprintf(log, "Formato padrão para o arquivo blif:\n");
	fprintf(log, "[Entradas de nível][Entradas normais][Sinais de estado]");
	fprintf(log, "   [Sinais de estado][Sinais de saída]\n\n\n");
	fprintf(log, "Para a MEFA:\n\n");
	for (in=In->prox; in!=NULL; in=in->prox)
		if (in->tipo == 3) fprintf(log, "%s ", in->nome);
	for (in=In->prox; in!=NULL; in=in->prox)
		if (in->tipo != 3) fprintf(log, "%s ", in->nome);
	fprintf(log, "[Sinais de Entrada]     [Sinais de Entrada] ");
	for (out=Out->prox; out!=NULL; out=out->prox)
		fprintf(log, "%s ", out->nome);
	fprintf(log, "\n\n\n#\n");
	for (in=In->prox; in!=NULL; in=in->prox)
		if (in->tipo == 3) fprintf(log, "%s ", in->nome);
	for (in=In->prox; in!=NULL; in=in->prox)
		if (in->tipo != 3) fprintf(log, "%s ", in->nome);
	fprintf(log, "\n");
	for (out=Out->prox; out!=NULL; out=out->prox)
		fprintf(log, "%s ", out->nome);
}

//************************************/
//*     Núcleo da conversão de       */
//*      formato de arquivos         */
//************************************/
void GenKiss2 (char *XBM_file, char *Kiss_file, char *Log_file, bool useDDC)
{
	FILE *input = fopen (XBM_file, "r");
	FILE *output = fopen(Kiss_file, "w");
	FILE *log = fopen(Log_file, "w");
	checkFile(input, XBM_file);
	inicializa(useDDC);
	readXBM (input);
	writeKiss(output);
	logSignalsOrder(XBM_file, log);
	fclose(log);
	//printREP();
}
