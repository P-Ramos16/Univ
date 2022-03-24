dicio = dict()

x = open(input("file? >"), 'r')

for line in x:
    for word in line.split():
        if word not in dicio:
            dicio[word] = 1
        else:
            dicio[word] += 1

print(dicio)