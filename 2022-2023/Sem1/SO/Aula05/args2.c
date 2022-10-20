#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    int i, numChars;
    char *username;
    char *NEWUSER;

    username = getenv("USER");
    NEWUSER = getenv("NEWUSER");
    if(username != NULL) {
        if(NEWUSER != NULL) {
            printf("This program is being executed by (new) %s\n", NEWUSER);
        }
        else {
            printf("This program is being executed by %s\n", username);
        }
    }
    else {
        printf("ERROR: USER not defined\n");
        return EXIT_FAILURE;
    }

    numChars = 0;
    for(i = 1 ; i < argc ; i++) {
        numChars += strlen(argv[i]);
    }

    printf("All arguments have %d characters\n", numChars);

    return EXIT_SUCCESS;
}
