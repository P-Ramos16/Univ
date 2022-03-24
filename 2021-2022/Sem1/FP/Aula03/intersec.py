def intersects(x1, x2, y1, y2):
    if ((x1 < y1 and x2 < y1) or (x1 > y2 and x2 > y2)):
        res = "Os intervalos não se intersectam"

    else:
        res = "Os intervalos intersectam-se" 

    return res

def ordenar(x, y):
    if x <= y:
        return x, y
    else:
        return y, x



a1 = float(input("Qual o valor de a1? >"))

a2 = float(input("Qual o valor de a2? >"))

b1 = float(input("Qual o valor de b1? >"))

b2 = float(input("Qual o valor de b2? >"))

x1, x2 = ordenar(a1, a2)

y1, y2 = ordenar(b1, b2)


print(intersects(x1, x2, y1, y2))