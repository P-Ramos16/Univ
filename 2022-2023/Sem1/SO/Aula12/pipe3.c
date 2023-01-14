
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int fdp[2];
    char buf[1024];

    if(pipe(fdp)!=0) {
       perror(argv[0]);
       return 1;
    }

    switch(fork()) {
       case -1:
              perror(argv[0]);
              return 1;
       case 0:
              close(fdp[0]);
              dup2(fdp[1],1);
              close(fdp[1]);
              printf("Hello Dad!\nHow are you?");
              break;
       default:
              close(fdp[1]);
              dup2(fdp[0],0);
              close(fdp[0]);
              while(scanf("%[^\n]%*c",buf)>0) {
                  printf("Parent: %s\n",buf);
              }
   }
   return 0;
}

