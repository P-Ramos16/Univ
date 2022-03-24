def inpuFloatList():

    x = []

    while True:
        y = input("Insira um número >")

        if y == "":
            return x

        x.append(float(y))



def minmax(lst):

    x = -10000

    y = 10000

    for i in range(len(lst)):
        if lst[i] > x:
            x = lst[i]

        if lst[i] < y:
            y = lst[i]

    return x, y


def countLower(lst, v):

    r = 0

    for i in range(len(lst)):
        if lst[i] < v:
            r += 1
        
    return r
       


x = inpuFloatList()


y, z = minmax(x)

med = (y + z) / 2


print("O valor médio entre {:0} e {:0} é: {:0}".format(y, z, med))

print(countLower(x, med))

print(minmax(x))
