#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <string.h> 

/* SUGESTÂO: utilize as páginas do manual para conhecer mais sobre as funções usadas:
 man fopen
 man fgets
*/

#define LINEMAXSIZE 100 /* or other suitable maximum line size */


int main(int argc, char *argv[])
{
    FILE *fp = NULL;
    char line [LINEMAXSIZE]; 

    /* Validate number of arguments */
    if( argc < 2 )
    {
        printf("USAGE: %s fileName\n", argv[0]);
        return EXIT_FAILURE;
    }
    
    for (int nFile = 1; nFile < argc; nFile++){
        /* Open the file provided as argument */
        errno = 0;
        fp = fopen(argv[nFile], "r");
        if( fp == NULL )
        {
            perror ("Error opening file!");
            // perror(str) shows the str + the errno equivalent message
            return EXIT_FAILURE;
        }

        printf("\n-----------------------------------------\n");
        printf("\nFicheiro nº.%i -> %s\n", nFile, argv[nFile]);
        printf("\n-----------------------------------------\n");

        /* Read all the lines of the file */
        int lineNr = 1;
        while( fgets(line, sizeof(line), fp) != NULL ) {

            printf("%03i-> %s",lineNr, line); /* not needed to add '\n' to printf because fgets will read the '\n' that ends each line in the file */
            lineNr++;
            if(strchr(line, '\n') == NULL) {
                printf("\n");
            }

        }

        fclose(fp);
    }

    return EXIT_SUCCESS;
}
