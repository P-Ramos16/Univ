
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
              write(fdp[1],"Hello Dad!",11);
              break;
       default:
              close(fdp[1]);
              read(fdp[0],buf,1024);
              printf("Parent: %s\n",buf);
   }
   return 0;
}

