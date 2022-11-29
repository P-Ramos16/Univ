#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i, num, guess, max, min;
    if (argc != 3) {
        printf("Coloque só 2 argumentos!! Colocou %2d !!\n", argc-1);
        return EXIT_FAILURE;
    }

    min = atoi(argv[1]);
    max = atoi(argv[2]);
    num = round((rand()%(max-min)) + min);

    while(guess != num) {
        printf("\nEscolha um número de %i a %i: \n", min, max);
        scanf("%d", &guess);

        if (guess < min) {
            printf("O número tem de ser maior que %i!\n", min);
        }  
        else if (guess > max) {
            printf("O número tem de ser menor que %i!\n", max);
        } 
        else if (guess > num) {
            printf("O número é mais baixo!\n");
        }
        else if (guess < num) {
            printf("O número é mais alto!\n");
        }       
    }
    printf("Sucesso! O número é %i\n", num);

    return EXIT_SUCCESS;
}
