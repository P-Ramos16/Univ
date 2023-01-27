#include <stdio.h>

int main(void) {
    
    char a[10] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
    
    char * b = &a[7];

    printf("b[-4] > %c\n", b[-4]);

    return 0;
}