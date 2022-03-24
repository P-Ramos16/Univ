def inpuFloatList():

    x = []

    while True:
        y = input("Insira um número >")

        if y == "":
            return x

        x.append(float(y))



def countLower(lst, v):

    r = 0

    for i in range(len(lst)):
        if lst[i] < v:
            r += 1
        
    return r



def minmax(lst):

    x = -10000

    y = 10000

    for i in range(len(lst)):
        if lst[i] > x:
            x = lst[i]

        if lst[i] < y:
            y = lst[i]

    return print("O num máx é o", x, "e o min é", y)

        


print(inpuFloatList())




x = []

while True:
    y = input("Insira um número para a lista>")

    if y == "":
        break

    x.append(float(y))



v = float(input("Insira o número v>"))


print(countLower(x, v))

print(minmax(x))
