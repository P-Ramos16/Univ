
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int fdp[2];

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
              execlp("ls","ls",NULL);
              break;
       default:
              close(fdp[1]);
              dup2(fdp[0],0);
              close(fdp[0]);
              execlp("wc","wc","-l",NULL);
   }
   return 0;
}

