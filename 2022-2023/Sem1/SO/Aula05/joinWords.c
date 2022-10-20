#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int i;
    char* phrase = argv[1];

    for(i = 2; i < argc; i++) {
        strcat(phrase, argv[i]);
    }

    printf("\n Char[] gerado > %s \n\n", phrase);
    return EXIT_SUCCESS;
}
