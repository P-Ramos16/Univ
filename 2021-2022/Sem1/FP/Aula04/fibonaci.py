def fibonaci(n):
    n_min1 = 0
    n_res = 1

    for i in range(2, n + 1):
        n_min2 = n_min1
        n_min1 = n_res
        n_res = n_min1 + n_min2

    return n_res




n = int(input("Introduza um número ->"))

print("O número final é:", fibonaci(n))