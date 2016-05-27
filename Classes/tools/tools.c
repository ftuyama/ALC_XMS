#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "tools.h"

//************************************/
//*		 Subrotinas criadas para     */
//*       a Leitura do arquivo       */
//************************************/
// Notificação de arquivo não encontrado
void checkFile(FILE *file, char *name)
{
	if (file == NULL)  {
		printf("%s not Found.\n", name);
		exit (1);
	}
}
// Notificação de erro na leitura do arquivo
void exception(int lin, char* aux)
{
	printf("\nLinha: %d com especificacao invalida... %s\n",lin,aux);
	exit(0);
}
// Lê o primeiro número da String
int nextNumber(int lin, char* aux)
{
	int c, d = 0;
	char aux2[MAX] = "\0";
	for(c=0; c<strlen(aux); c++)
		if(aux[c]>47&&aux[c]<58)
			aux2[d++] = aux[c];
		else if (aux2[0] != '\0') break;
	aux2[d] = '\0';
	return atoi(aux2);
}
// Verifica se o char lido é nulo
bool emptyChar(char c)
{
	if ((c=='\0'||c==10||c=='\n')||c==' '||c=='	'||c==']')
		return true;
	return false;
}
// Inverte o nível digital do sinal
int not(int x)
{
	if (x == 1) return 0;
	if (x == 0) return 1;
	if (x == 2) return 2;
	return 1;
}
// Verifica se o char lido é uma operação
bool opChar(char c)
{
	if (c=='+'||c=='-'||c=='*')
		return true;
	return false;
}
// Copia String limpando seu conteúdo
char* copia(char *aux)
{
	int x;
	char *obj;
	obj=(char*) malloc((strlen(aux)+1)*sizeof(char));
	for(x=0; x<strlen(aux)&&(emptyChar(aux[x])==0); x++)
		obj[x]=aux[x];
		obj[x]='\0';
	return obj;
}

void writeLog (char *file, char *name, int Nminstates, int Ndependencias, 
				int Nprodutos, int Nliterais, int Ninput, int Noutput)
{
	FILE *output = fopen(file, "w");
	fprintf(output, "%s\n", name);
	fprintf(output, "Num_StateMin:%d\n", Nminstates);
	fprintf(output, "Num_Dependen:%d\n", Ndependencias);
	fprintf(output, "Num_Produtos:%d\n", Nprodutos);
	fprintf(output, "Num_Literais:%d\n", Nliterais);
	fprintf(output, "Num_Entradas:%d\n", Ninput);
	fprintf(output, "Num_Saidas:%d\n",	 Noutput);
	fprintf(output, "------------------\n");
	fclose(output);
}
