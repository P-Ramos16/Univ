#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int ret;
    char role[10];

    printf("Antes do fork: PID = %d, PPID = %d\n", getpid(), getppid());
    if ((ret = fork()) < 0) { 
        perror("erro na duplicação do processo");
        return EXIT_FAILURE;
    }
    if (ret > 0) {
        sleep(1);
        strcpy(role, "PARENT");
    }
    else if (ret == 0) {
        strcpy(role, "CHILD");
    }
    printf("Quem sou eu? > %s \nApós o fork: PID = %d, PPID = %d, retorno do fork = %d\n",
           role, getpid(), getppid(), ret);

    return EXIT_SUCCESS;
}
