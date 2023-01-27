#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc,char **argv) {

    int a[10],*b = &a[7];
    for(int i = 0;i < 10;i++)
        a[i] = -i;

    printf("b[3] > %i", b[2]);

  return 0;
}
