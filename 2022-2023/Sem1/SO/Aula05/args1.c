#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i;

    if (argc == 3) {
        for(i = 0; i < argc; i++) {
            printf("Argument %02d: \"%s\" \n", i, argv[i]);        
        }
        return EXIT_SUCCESS;
    }

    printf("Coloque só 2 argumentos!! Colocou %2d !!\n", argc-1);
    return EXIT_SUCCESS;
}
