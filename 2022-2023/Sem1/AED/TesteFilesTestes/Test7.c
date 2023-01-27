#include <stdio.h>

int f(int x) {
    int i,j,r = 0;
    for(i = 0;i <= x;i++)
        for(j = i;j >= 0;j--)
            r += i - j;
    return r;
}

int main(void) {
    printf("f(3) > %i\n",f(3));
    printf("f(5) > %i\n",f(5));
    printf("f(10) > %i\n",f(10));
    return 0;
}