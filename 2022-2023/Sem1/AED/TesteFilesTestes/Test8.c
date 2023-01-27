#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int f(int n) {
    int numCorreu = 0;
    int r = -20220204;
    for(int i = 0;i <= n;i++)
        for(int j = 2 * i;j <= 2 * n;j++)
            numCorreu++;
    return numCorreu;
}

int main(int argc,char **argv) {

    
  printf("n = 20  > %i  | correu %i vezes\n", 0, f(20));
  printf("n = 100 > %i  | correu %i vezes\n", 0, f(100));
  return 0;
}
