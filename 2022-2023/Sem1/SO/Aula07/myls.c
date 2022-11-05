#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <dirent.h>

void listDir(char dirname[], int type, char* ext) {
    DIR *dp; 
    struct dirent *dent;

    dp = opendir(dirname); 
    if(dp == NULL)
    {
        perror("Error opening directory");
        return;
    }

    dent = readdir(dp);
    switch (type) {
        case 1:
            while(dent!=NULL) {
                if(dent->d_name[0] != '.' && dent->d_type != DT_DIR) { /* do not list hidden dirs/files */
                    printf("%s/%s\n",dirname,dent->d_name);
                }
                dent = readdir(dp);
            }
            break;

        case 2:
            while(dent!=NULL) {
                if(dent->d_name[0] != '.' && dent->d_type != DT_REG) { /* do not list hidden dirs/files */
                    printf("%s/%s\n",dirname,dent->d_name);
                }
                dent = readdir(dp);
            }
            break;

        case 3:
            while(dent!=NULL) {
                if(dent->d_name[0] != '.' && strstr(dent->d_name, ext) != NULL) { /* do not list hidden dirs/files */
                    printf("%s/%s\n",dirname,dent->d_name);
                }
                dent = readdir(dp);
            }
            break;

    }
}


int main(int argc, char *argv[]) {

    int opt;
    int type = 0;
    char* ext;

    /* The getopt() function parses the command-line arguments. Its arguments
      argc and argv are the argument count and array as passed to the main()
      function on program invocation. An element of argv that starts with
      '-' (and is not exactly "-" or "--") is an option element. The charac‐
      ters of this element (aside from the initial '-') are option charac‐
      ters.  If getopt() is called repeatedly, it returns successively each
      of the option characters from each of the option elements.

      For more information check the man page (man 3 getopt) 
     */
    while ((opt = getopt(argc, argv, "fde:")) != -1)
    {
        switch (opt)
        {
            case 'f':
                type = 1;
                listDir(argv[1], type, "");
                break;
            case 'd':
                type = 2;
                listDir(argv[1], type, "");
                break;
            case 'e':
                ext = optarg;
                type = 3;
                listDir(argv[1], type, ext);
                break;
                /* If getopt() finds an option character in argv that was not included in
                  optstring, or if it detects a missing option argument, it returns '?'
                 */
            default: /* '?' */
                fprintf(stderr, "Usage: %s [-t nsecs] [-n] name\n",
                        argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    /* By default, getopt() permutes the contents of argv as it scans, so that
      eventually all the nonoptions are at the end.
     */
    if (optind >= argc)
    {
        fprintf(stderr, "Expected argument after options\n");
        return EXIT_FAILURE;
    }

    printf("name argument = %s\n", argv[optind]);

    /* Other code omitted */

    return EXIT_SUCCESS;
}
