//
// Tomás Oliveira e Silva, AED, October 2021
//
// program to print a table of the squares and square roots of some integers
//
// on GNU/Linux, run the command
//   man 3 printf
// to see the manual page of the printf function
//
#define _USE_MATH_DEFINES
#include <math.h>
#include <stdio.h>




void do_it(int N)
{
  int i;

  FILE* f = fopen("table.txt", "w");



  printf(" n n*n      sqrt(n)     cos(n) sin(n)\n");
  printf("-- --- ----------------- ---- ----\n");
  for(i = 1;i <= N;i++)
    printf("%2d %3d %17.15f %3.1f %3.1f\n",i,i * i,sqrt((double)i), cos((double)i) * 180 / M_PI, sin((double)i) * 180 / M_PI );
    fprintf(f, "%2d %3d %17.15f %3.1f %3.1f\n",i,i * i,sqrt((double)i), cos((double)i) * 180 / M_PI, sin((double)i) * 180 / M_PI );

}

int main(void)
{
  do_it(10);
  return 0;
}
