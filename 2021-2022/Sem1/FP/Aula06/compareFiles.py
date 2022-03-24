import os
def compareFiles(file0, file1):
    x = open(file0, 'rb')
    y = open(file1, 'rb')

    same = True

    
    if x.read() != y.read():
        print("Os ficheiros são diferentes!")
        same = False
    else:
        print("Os ficheiros são iguais")

    return

def ls():
    for i in os.listdir():
        z = os.stat(i).st_size
        print(i, end="   ")
        print(z)

file0 = input("File0Name?") + ".txt"
file1 = input("File1Name?") + ".txt"

compareFiles(file0, file1)
ls()