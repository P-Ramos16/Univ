#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int f(int n) {
  int numCorreu = 0;
  int i,j,k,r1,r2 = 0;
  for(i = 0;i < n;i++) {
    for(j = 0;j <= 4;j++) {
      r1 = 1;
      for(k = 0;k <= j;k++)
        numCorreu++;
    }
    r2 += r1;
  }
  return numCorreu;
}

int main(int argc,char **argv) {

  int numCorreu = 0;
    
  printf("n = 20  > %i  | correu %i vezes\n", 0, f(20));
  numCorreu = 0;
  printf("n = 100 > %i  | correu %i vezes\n", 0, f(100));

  return 0;
}
