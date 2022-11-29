#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int compare (const void *x, const void *y) {  
    return strcmp (*(char * const *)x, *(char * const *)y);  
}

int main(int argc, char *argv[]) {
    int i, num, guess, max, min;
    if (argc == 1) {
        printf("Coloque só 2 argumentos!! Colocou %2d !!\n", argc-1);
        return EXIT_FAILURE;
    }

    char* arrArg[argc-1];
    for(i = 1 ; i < argc ; i++) {
        arrArg[i-1] = argv[i];
    }

    qsort(arrArg, argc-1, sizeof(*arrArg), compare);
    
    for(i = 0 ; i < argc-1 ; i++) {
        printf("%i > %s\n", i, arrArg[i]);
    }

    return EXIT_SUCCESS;
}
