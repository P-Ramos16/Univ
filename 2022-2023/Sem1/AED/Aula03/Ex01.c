#include <stdio.h>


int main(void) {
	int a = 3;
	int b = 7;

	a^=b;
	b^=a;
	a^=b;

	printf("a> %i\n", a);
	printf("b> %i\n", b);

	return 0;

}
