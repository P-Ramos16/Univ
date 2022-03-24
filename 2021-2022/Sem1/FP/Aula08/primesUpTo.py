
def primesUpTo(n):
    #Criar uma lista inicial com todos os números de 2 a n
    xList = {*range(2, n + 1)}

    #Criar uma lista igual à inicial (mas não interligada, logo sem utilizar finalList = xList)
    finalList = {*range(2, n + 1)}

    #Criar uma lista de todos os divisores, adicionando o número dois à lista começada a 3 e com incrementos de 2 em 2. até n
    divisors =[2, *range(3, n, 2)]


    # Estes ciclos for vão remover os números divisiveis por cada divisor da lista final, um de cada vez
    for y in divisors:

        for x in xList:

            if x % y == 0 and x != y and (x in finalList):

                finalList.remove(x)

    return finalList

    


def main():
    # Testing:
    s = primesUpTo(1000)
    print(s)

    # Do some checks:
    assert primesUpTo(30) == {2,3,5,7,11,13,17,19,23,29}
    print(len(primesUpTo(1000)))
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")

if __name__ == "__main__":
    main()

