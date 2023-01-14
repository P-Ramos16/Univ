
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>

int main(int argc, char *argv[])
{

    if(mkfifo("myfifo1",0600)!=0) {
       perror(argv[0]);
       return 1;
    }

    return 0;
}

