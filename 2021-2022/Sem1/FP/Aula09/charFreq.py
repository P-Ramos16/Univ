dicio = dict()

x = open(input("file? >"), 'r')

for line in x:
    for word in line.split():
        for char in word:
            if char not in dicio:
                dicio[char] = 1
            else:
                dicio[char] += 1

for x in sorted(dicio, key=dicio.get, reverse=True):
    print(x, dicio[x])