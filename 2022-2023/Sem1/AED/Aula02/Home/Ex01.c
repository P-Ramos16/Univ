/*
**  Hello World Program
*/

#include <stdio.h>
#include <stdbool.h>
#include <math.h>

int main(void) {

    int totalNums = 0;
    int maxDigits = 2;

        // numeros antes deste nao podem ser utilizados
        // ultimo numero é sempre 0
    for (int num = 0; num < pow(10, maxDigits); num++) {

        int digitCount[10] = { 0 };

        int tempNum = num;

        bool repeatedTest = true;

        while(tempNum > 0) {

            int lastDigit = tempNum % 10;

            digitCount[lastDigit]++;

            tempNum = tempNum / 10;
        }

        for (int i = 0; i < maxDigits; i++) {
            if (digitCount[i] > 1) {
                repeatedTest = false;
            }
        }

        for (int k = 1; k <= maxDigits; k++) {
            
            int firstKnums =  num;
            
            for (int ki = 0; ki < k; ki++) {
                num = num % 10;
            }
            

            if (firstKnums % k != 0) {
                repeatedTest = false;
            }
        }

        if (repeatedTest) {
            totalNums++;
        }
    }

    printf("%20i", totalNums);
    
    return 0;
}