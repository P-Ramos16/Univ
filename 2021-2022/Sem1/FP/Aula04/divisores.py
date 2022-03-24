def div(n):
    res = 0
    print("O número {:0} é divisivel por".format(n), end = '')

    for i in range (1, n):
        if n % i == 0:
            print(",", i, end = '')
            res += i
    
    print("")
    return res


n = int(input("Introduza um número ->"))
x = div(n)

if x < n:
    print("O número {:0} é um número deficiente".format(n))

elif x > n:
    print("O número {:0} é um número abundante".format(n))

else:
    print("O número {:0} é um número perfeito".format(n))

