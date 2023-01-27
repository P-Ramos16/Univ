#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mem_copy(char *src,char *dst,size_t size) {
    for(size_t i = 0;i < size;i++) {
        dst[i] = src[i];
    }
}

int main(int argc,char **argv) {

    char c[10] = { 0,1,2,3,4,5,6,7,8,9 };
    mem_copy(&c[4],&c[5],4);
    for (int x = 0; x < 10; x++) {
        printf("c[%i] > %i\n", x, c[x]);
    }

    printf("-------------\n");

    char c2[10] = { 0,1,2,3,4,5,6,7,8,9 };
    mem_copy(&c2[5],&c2[4],4);
    for (int x = 0; x < 10; x++) {
        printf("c[%i] > %i\n", x, c2[x]);
    }

  return 0;
}
