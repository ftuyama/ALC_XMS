#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../tools/tools.h"
int Ninput, Noutput, Ntrans, Nstate;
char aux[MAX], aux2[MAX];
typedef struct dict {
	char key[MAX], value[MAX];
	struct dict *prox;
} Dict;
Dict *dicionario;

//************************************/
//*    Inicialização da estrutura    */
//*     de dados tipo dicionário	 */
//************************************/
void inicializa3()
{
	dicionario = (Dict*)malloc(sizeof(Dict));
	dicionario->prox = NULL;
}
// Adiciona nova entrada ao dicionário
// Entrada: sXXX 	@code
void encode(char *aux)
{
	Dict *entry = (Dict*)malloc(sizeof(Dict));
	entry->prox = NULL;
	
	int i, j;	
	for (i = 0; aux[i] != 's' && aux[i] != 'S'; i++);
	
	for (j = 0, i++; aux[i] != ' '; i++, j++)
		entry->key[j] = aux[i];
	entry->key[j] = '\0';

	for (j = 0, i++; i < strlen(aux); i++, j++)
		entry->value[j] = aux[i];
	entry->value[j] = '\0';
	entry->prox = NULL;

	if (dicionario-> prox == NULL) {
		dicionario->prox = entry;
		return;
	}
	for (Dict *p = dicionario; p != NULL; p = p->prox)
		if (p->prox == NULL) {
			p->prox = entry;
			return;
		}
}
// Faz pesquisa no dicionário
// Entrada: sXXX 	Saída: @code
char* decode(char *aux)
{
	int i, j;
	for (i = 0; aux[i] != 's' && aux[i] != 'S'; i++);
	for (j = 0, i++; aux[i] != '\0'; i++, j++)
		aux2[j] = aux[i];
	aux2[j] = '\0';
	
	for (Dict *p = dicionario->prox; p != NULL; p = p->prox)
		if (strcmp(p->key, aux2) == 0)
			return p->value;
			
	return "";
}
//************************************/
//*     Leitura do arquivo Kiss      */
//*     	da MEF minimizada		 */
//************************************/
// Realiza a leitura do formato .kiss
void readCodedKiss(FILE *input, FILE *output)
{
	do {
		fgets(aux , MAX , input);
		if (aux[0] == '.')
			switch (aux[1])
			{
				case 'i': Ninput  = nextNumber(0,aux); break;
				case 'o': Noutput = nextNumber(0,aux); break;
				case 'p': Ntrans  = nextNumber(0,aux); break;
				case 's': Nstate  = nextNumber(0,aux); break;
				default: break;
			}
	} while (!(aux[0] == '.' && aux[1] == 'e'));
	fgets(aux , MAX , input);
	fprintf(output, "# Codificação\n");
	do {
		strtok(aux, "\n");
		if (strstr(aux, ".code") != NULL) 
		{
			for (int j = 0; j + 6 <= strlen(aux); j++)
				aux[j] = aux[j + 6];
			fprintf(output, "# States.%s\n", aux);
			encode(aux);
		}
		fgets(aux , MAX , input);
	} while (!(aux[0] == '.' && aux[1] == 'e'));
}

//************************************/
//*     Escrita do arquivo Blif      */
//*    	   da MEF minimizada         */
//************************************/
// Realiza a escrita do Header .blif
void writeBlifHeader(FILE *output)
{
	fprintf(output, ".type fr\n");
	fprintf(output, ".i %d\n", (Ninput + Nstate));
	fprintf(output, ".o %d\n", (Noutput + Nstate));
	fprintf(output, ".p %d\n", Ntrans);
}
// Realiza a escrita do Bottom .blif
void writeBlifBottom(FILE *output)
{
	fprintf(output, ".e");
}
// Realiza a escrita do Body .blif
void writeBlifBody(FILE *output, FILE *input)
{
	do {
		fgets(aux , MAX , input);
	} while (!(aux[0] == '.' && aux[1] == 'r'));
	fgets(aux , MAX , input);
	do 
	{
		int i, j;
		strtok(aux, "\n");
		
		// Printing input bits
		for (i = 0, j = 0; aux[i] != ' '; i++, j++)
			aux2[j] = aux[i];
		aux2[j] = '\0';
		fprintf(output, "%s", aux2);
		
		// Printing state bits
		for (j = 0, i++; aux[i] != ' '; i++, j++)
			aux2[j] = aux[i];
		aux2[j] = '\0';
		char *codeOrig = decode(aux2);
		fprintf(output, "%s ", codeOrig);
		
		// Printing next state bits
		for (j = 0, i++; aux[i] != ' '; i++, j++)
			aux2[j] = aux[i];
		aux2[j] = '\0';
		char *codeDest = decode(aux2);
		fprintf(output, "%s", codeDest);
		
		// Printing output bits
		for (j = 0, i++; i < strlen(aux); i++, j++)
			aux2[j] = aux[i];
		aux2[j] = '\0';
		fprintf(output, "%s", aux2);
		
		// Next round
		fprintf(output, "\n");
		fgets(aux , MAX , input);
	} while (!(aux[0] == '.' && aux[1] == 'e'));
	
}
// Realiza a escrita no formato .blif
void writeBlif(FILE *input, FILE *output)
{
	rewind(input);
	writeBlifHeader(output);
	writeBlifBody(output, input);
	writeBlifBottom(output);
}
//************************************/
//*     Geração do arquivo Blif      */
//*    	   do Kiss minimizado        */
//************************************/
// Gera arquivo .blif a partir de .kiss2 codificada
void GenBlif(char *Kiss_file, char *Blif_file, char *Log_file)
{
	FILE *KISS = fopen (Kiss_file, "r");
	FILE *BLIF = fopen (Blif_file, "w");
	FILE *LOG  = fopen (Log_file, "w");

	inicializa3();
	readCodedKiss(KISS, BLIF);
	writeBlif(KISS, BLIF);
	
	rewind(KISS);
	readCodedKiss(KISS, LOG);
	
	fclose(KISS);
	fclose(BLIF);
}
