#include <stdio.h>
#include <stdlib.h>

int f(int x) { return x % 3; }
int g(int x) { return x % 2; }
int main(void)
{
    int arr[3] = {4, 123, 6};
    printf("%d\n", arr[1]);
    int *px = arr;
    *(px)+1*sizeof(arr[0]) = 5;
    printf("%d\n", arr[1]);







    int y = 12;

    int *x = &y;

    printf("%d\n", *(&y));
}