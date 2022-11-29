#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    execl("/bin/ls", "ls", "-la", NULL);
    return EXIT_SUCCESS;
}
