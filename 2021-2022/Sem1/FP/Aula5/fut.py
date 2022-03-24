def inpuFloatList():

    x = []

    while True:
        y = input("Insira uma equipa >")

        if y == "":
            return x

        x.append(y)


def allMatches(lst):

    match = []

    for i in range(len(lst)):
        for n in range(len(lst)):
            if lst[i] != lst[n]:
                match.append((lst[i], lst[n]))

    return match




x = inpuFloatList()



print(allMatches(x))