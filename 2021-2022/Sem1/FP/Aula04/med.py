def get_values():
    total = 0
    i = 0

    while True:
        val = input("Introduza um valor ->")
        if val == "":
            break
        total += float(val)
        i += 1

    total = float(total / i)
    return total


print("A média dos números introduzidos é {:2}".format(get_values()))
        

