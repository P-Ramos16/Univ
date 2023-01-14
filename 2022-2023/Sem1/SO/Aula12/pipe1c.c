
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int fdp0[2];
    int fdp1[2];
    char buf[1024];

    if(pipe(fdp0)!=0) {
        perror(argv[0]);
        return 1;
    }

    if(pipe(fdp1)!=0) {
        perror(argv[0]);
        return 1;
    }

    switch(fork()) {
       case -1:
              perror(argv[0]);
              return 1;
       case 0:
              close(fdp0[0]);
              close(fdp1[1]);
              write(fdp0[1],"Hello Dad!",11);
              read(fdp1[0],buf,1024);
              printf(" Child recieves: %s\n",buf);
              break;
       default:
              close(fdp0[1]);
              close(fdp1[0]);
              write(fdp1[1],"Hello Child!",11);
              read(fdp0[0],buf,1024);
              printf("Parent recieves: %s\n",buf);

   }
   return 0;
}

