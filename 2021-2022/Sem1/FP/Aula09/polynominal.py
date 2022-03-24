# COMPLETE a função abaixo.
# Veja os exemplos de utilização e resultados esperados.

# polynomial2(a,b,c) deve devolver uma função f tal que
# f(x) seja o polinómio de segundo grau ax²+bx+c.
def polynomial2(a, b, c):
    function = (lambda x: a * x**2 + b * x + c)
    return function


# DESAFIO EXTRA:
# Crie uma versão generalizada que cria polinómios de qualquer grau.
# (Não é tão fácil com expressões lambda.)

# polynomial(a), onde a=[a0, a1, ..., an], deve devolver uma função f tal que
# f(x) seja o polinómio a0*x**n + a1*x**(n-1) + ... + an.
def polynomial(lst):
    function = (lambda x: lst[0] * x**(len(lst) - 1) + lst[1] * x**(len(lst) - 2) + lst[2] * x**(len(lst) - 3) + + lst[2] * x**(len(lst) - 4))
    return function


# unfinished version of polynomial 
def polynomial3(lst):
    function = lambda x: 0
    f1 = [0,0,0,0,0,0]
    for i in range(len(lst)):

        f1[i] = lambda y: lst[i] * y**(len(lst) - i - 1)

    function = lambda x, function = function, f1 = f1: (for i in f1: function(x) + i(x))

    print(function(3))

    return function


def main():
    xx = [0, 1, 2, 3]   # Valores de x a testar

    print("\nTestes à função polynomial2:")
    p = polynomial2(1, 2, 3)    # creates p(x)=x²+2x+3
    print([p(x) for x in xx])   # [3, 6, 11, 18]

    q = polynomial2(2, 0, -2)   # creates q(x)=2x²-2
    print([q(x) for x in xx])   # [-2, 0, 6, 16]

    print("\nTestes à função polynomial:")
    r = polynomial([1, 2, 3])   # same as p(x)
    print([r(x) for x in xx])   # [3, 6, 11, 18]

    s = polynomial([1, -1, 0, 100])     # creates s(x)=x³-x²+100
    print([s(x) for x in xx])           # [100, 100, 104, 118]

if __name__ == "__main__":
    main()
