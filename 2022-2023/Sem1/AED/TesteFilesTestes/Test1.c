#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int f(int x) { return x * x - 1; }
int g(int x) { return x / 3; }

int main(int argc,char **argv) {

    int c = 0;
    for(int i = 0;i <= 10;i++) {
        printf("gi >%i\n", g(i));
        if( f(i) && g(i) ) {
            printf("i = %d\n",i);
            c += g(i);
        }
    }
    printf("c = %d\n",c);
  return 0;
}
