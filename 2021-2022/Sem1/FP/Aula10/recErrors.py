# Calcula o factorial de n, baseado na recorrencia n! = n*(n-1)!.
# Mas não termina!  Detete a causa e corrija o erro.
def fact(n):
    res = 1
    while n > 0:
        res *= n
        n -= 1

    return res


# Calcula o maximo divisor comum entre a e b.
# Baseia-se no algoritmo de Euclides.
# Mas não termina!  Detete a causa e corrija o erro.
def gcd(a, b):
    
    r = a%b

    if r == 0:
        return b
    
    elif b > r:
        return gcd(b, r)

    elif b < r:
        return gcd(r, b)


def main():
    print( fact(4) )    # 24
    print( fact(5) )    # 120

    x = 2*27*53*61
    y = 2*2*17*23*53
    print(x, y, gcd(x, y))
    assert gcd(x, y) == 2*53

if __name__ == "__main__":
    main()

