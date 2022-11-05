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


Person Persons[100];

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
    fp = fopen(argv[1], "rb");
    if(fp == NULL)
    {
        perror ("Error opening file!");
        return EXIT_FAILURE;
    }

    Person p = {0, 0, ""};

    printf("-----------------------------\n");
    printf("Current persons in the file >\n");
    printf("-----------------------------\n");
    int x = 0;
    /* read all the items of the file */
    while(fread(&p, sizeof(Person), 1, fp) == 1) {
        printPersonInfo(&p);
        Persons[x] = p;
        x++;
    }

    printf("\nAdicionar mais pessoas?\n (0 se não, número de pessoas se sim) > ");
    int nPeople;
    scanf("%d", &nPeople);


    /* Write nPeople items on a file */
    for(i = 0 ; i < nPeople ; i++) {    
        
        printf("\n   Age of person %i > ", i);
        scanf("%d", &p.age);

        printf("Height of person %i > ", i);
        scanf("%lf", &p.height);

        printf("  Name of person %i > ", i);
        scanf("%s", &p.name);

        Persons[x] = p;
        x++;
    }

    fclose(fp);

    fp = fopen(argv[1], "w");
    for(i = 0; i < x; i++) {
        fwrite(&Persons[i], sizeof(Person), 1, fp);
    }

    fclose(fp);

    printf("\n---------------------\n");
    printf("Persons in the file >\n");
    printf("---------------------\n");
    fp = fopen(argv[1], "rb");
    /* read all the items of the file */
    while(fread(&p, sizeof(Person), 1, fp) == 1) {
        printPersonInfo(&p);
    }

    fclose(fp);

    return EXIT_SUCCESS;
}
