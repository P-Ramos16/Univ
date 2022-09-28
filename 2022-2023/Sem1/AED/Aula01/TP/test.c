/*
**  Hello World Program
*/

#include <stdio.h>

int main(void) {

    int i = 3;
    int j = 2;

    int k = i++ + ++j;

    printf("i: %i\n", i);
    printf("j: %i\n", j);
    printf("k: %i", k);
    
    return 0;
}