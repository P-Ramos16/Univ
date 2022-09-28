//
// Tomás Oliveira e Silva, AED, October 2021
//
// list all command line arguments
//

#include <stdio.h>

int main(int argc,char *argv[argc])
{
  for(int i = 0;i < argc;i++) {
    char *ptr;
    printf("argv[%2d] = \"%-24s\"   | value = %4d \n", i, argv[i], strtol(argv[i], &ptr, 10));
  }
  return 0;
}
