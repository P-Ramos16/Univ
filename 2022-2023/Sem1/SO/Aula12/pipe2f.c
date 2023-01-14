
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int fdp[2];
    char buf[1024];
    int nr;

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
              dup2(fdp[1],2);
              close(fdp[1]);
              fprintf(stderr, "Hello Dad!");
              break;
       default:
              close(fdp[1]);
              nr = read(fdp[0],buf,1024);
              printf("Parent recieves: %.*s\n",nr,buf);
   }
   return 0;
}

