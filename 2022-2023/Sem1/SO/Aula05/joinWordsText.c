#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    int i;
    char phrase[100] = {'\0'};


    for(i = 1; i < argc; i++) {
        if(!isalpha(argv[i][0])) {
            printf("\n ERRO!! O argumento nº.%i não começa por uma letra!! \n\n", i);
            return EXIT_SUCCESS;
        }
        strcat(phrase, argv[i]);
    }

    printf("\n Char[] gerado > %s \n\n", phrase);
    return EXIT_SUCCESS;
}
