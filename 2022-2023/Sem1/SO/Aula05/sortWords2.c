#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int compare (const void *x, const void *y) {  
    return strcmp (*(char * const *)x, *(char * const *)y);  
}

int main(int argc, char *argv[]) {
    int i, totalSize = 0;
    char* inp = "a";
    if (argc != 1) {
        printf("Coloque só 1 argumentos!! Colocou %2d !!\n", argc-1);
        return EXIT_FAILURE;
    }

    char* arrArg[100];
 
    while(fgets(inp, 1000, stdin) && inp[0] != '\n') {
        totalSize++;
        printf("\nColoque um argumento >");         
        arrArg[totalSize] = inp;
    }

    qsort(arrArg, argc-1, sizeof(*arrArg), compare);
    
    for(i = 0 ; i < argc-1 ; i++) {
        printf("%i > %s\n", i, arrArg[i]);
    }

    return EXIT_SUCCESS;
}
