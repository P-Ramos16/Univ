#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

typedef struct
{
    int age;
    double height;
    char name[64];
} Person;

void printPersonInfo(Person *p)
{
    printf("Person: %s, %d, %f\n", p->name, p->age, p->height);
}

int main (int argc, char *argv[])
{
    FILE *fp = NULL;
    int i;

    /* Validate number of arguments */
    if(argc != 2)
    {
        printf("USAGE: %s fileName\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* Open the file provided as argument */
    errno = 0;
    fp = fopen(argv[1], "wb");
    if(fp == NULL)
    {
        perror ("Error opening file!");
        return EXIT_FAILURE;
    }

    printf("Qual o número de pessoas?");
    int nPeople;
    scanf("%d", &nPeople);

    Person p = {0, 0, ""};

    /* Write nPeople items on a file */
    for(i = 0 ; i < nPeople ; i++) {    
        
        printf("Age of person %i > ", i);
        scanf("%d", &p.age);

        printf("Height of person %i > ", i);
        scanf("%lf", &p.height);

        printf("Name of person %i > ", i);
        scanf("%s", &p.name);

        fwrite(&p, sizeof(Person), 1, fp);
    }

    fclose(fp);

    return EXIT_SUCCESS;
}
