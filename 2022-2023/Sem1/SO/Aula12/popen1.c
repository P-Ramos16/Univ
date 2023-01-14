
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    FILE *fp;
    char buf[1024];

    fp = popen("ls -l", "r");
    if(fp==NULL) {
        perror(argv[0]);
        return 1;
    }

    while(fscanf(fp,"%[^\n]%*c",buf)>0) {
        printf("frompipe: %s\n",buf);
    }
 
    fclose(fp);
    
    return 0;
}

