def max2(prim, sec):
    if prim >= sec:
        res = prim
    else:
        res = sec
    return res


x = float(input("Qual é o primeiro número? >"))

y = float(input("Qual é o segundo número? >"))

z = float(input("Qual é o terceiro número? >"))

n = max2(x, y)

print("O maio número é o ", max2(n, z))