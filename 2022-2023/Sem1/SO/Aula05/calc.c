#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
    int i;
    char *endarg1, *endarg2;

    printf("\n\t\t\t");

    if (argc == 4) {

        int num1 = strtod(argv[1], &endarg1);
        int num2 = strtod(argv[3], &endarg2);
        // Se o carater depois de um numero for != '\0' (fim da string),
        //quer dizer que o user colocou letras num int
        // O atof(24abc) é igual a 24, e não queremos isso
        // strtod(24abc) = "a"
        // strdod(24) = \0

        printf("strtod > %i\n", strtod(argv[1], &endarg1));
        printf("atoi > %i\n", atoi(argv[1]));

        if (endarg1 == argv[1] || *endarg1 != '\0' || endarg2 == argv[3] || *endarg2 != '\0') {
            printf("Argumento(s) inválido(s)\n");
            return EXIT_SUCCESS;
        }

    
        for(i = 1; i < argc; i++) {
            printf("%s ", argv[i]);        
        }

        int result = 0;

        switch(*(argv[2])) {
            case '+':
                result = num1 + num2;
                break;

            case '-':
                result = num1 - num2;
                break;

            case 'x':
            case '*':
                result = num1 * num2;
                break;

            case '/':
                result = num1 / num2;
                break;

            case 'p':
                result = pow(num1, num2);
                break;

            default:
                printf("ERRO!! Coloque uma operação válida!\n");
                result = -1;
                return EXIT_SUCCESS;
                break;
        }

        printf("= %4i \n\n", result);
        return EXIT_SUCCESS;
        
    }

    printf("Coloque só 3 argumentos!! Colocou %2d!!\n\n", argc-1);
    return EXIT_SUCCESS;
}
