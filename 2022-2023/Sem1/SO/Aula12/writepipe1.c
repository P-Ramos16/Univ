
#include <stdio.h>

int main(int argc, char *argv[])
{

    FILE *fp;
    char buf[1024];

    fp = fopen("myfifo1","w");

    printf(">");
    while(scanf("%[^\n]%*c",buf)>0) {
         fprintf(fp,"%s\n",buf);
         printf(">");
    }
  
    fclose(fp);

    return 0;
}

