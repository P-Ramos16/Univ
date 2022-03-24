def mdc(a, b):
    r = a % b

    if r == 0:
        res = b
        return res

    else:
        res = mdc(b, r)

a = float(input("Insira o número a >"))

b = float(input("Insira o número b >"))


print("res >", mdc(a, b))