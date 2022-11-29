#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SUGESTÂO: utilize as páginas do manual para conhecer mais sobre as funções usadas:
  man opendir
  man readdir
*/

void listDir(char dirname[])
{
    DIR *dp; 
    struct dirent *dent;

    dp = opendir(dirname); 
    if(dp == NULL)
    {
        perror("Error opening directory");
        return;
    }

    char newDir[250];
    memset(newDir, 0, sizeof(newDir));
    while(dent=readdir(dp)) 
    {
        if(dent->d_name[0] == '.') { /* do not list hidden dirs/files */
            continue;
        }
        strcat(newDir, dirname);
        strcat(newDir, "/");
        strcat(newDir, dent->d_name);
        if(dent->d_type == DT_DIR) { /* list dirs */
            printf("\n----%s----\n\n", newDir);
            listDir(newDir);
        }
        else {
          printf("%s\n",newDir);
        }
        memset(newDir, 0, sizeof(newDir));

    }
}

int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        fprintf(stderr,"Usage: %s base_directory\n",argv[0]);
        return EXIT_FAILURE;
    }

    listDir(argv[1]);
    
    return EXIT_SUCCESS;
}

