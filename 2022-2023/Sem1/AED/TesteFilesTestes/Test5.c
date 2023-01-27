#include <stdio.h>

int f(int x) { return 2 * x + 3; }
int g(int x) { printf("x > %i\n", x); return x * x - 7; }

int main(void) {
    for(int i = -5;i <= 5;i++)
        if( (f(i) > 0) || (g(i) > 0) )
            printf("%d\n",i);
    return 0;
}