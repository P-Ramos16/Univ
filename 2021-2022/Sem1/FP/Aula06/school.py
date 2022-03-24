

# Carregar o ficheiro e acrescentar cada linha na variável lst (em listas de 2 dimensões)
def loadFile(fname, lst):
    
    file = open(fname, "r", encoding="utf-8")

    next(file)
    
    for line in file:

        x = line.strip().split("\t")

        y = [int(x[0]), x[1], float(x[5]), float(x[6]), float(x[7])]

        lst.append(y)

    return


# Ler as notas dos testes a partir da lst e adicionar a média à lst
def notaFinal(reg):
    res= []

    for line in reg:

        z = round((line[2]  + line[3] + line[4]) / 3, 1)

        res.append(z)

    for i in range(0, len(reg)):
        reg[i].append(res[i])

    return reg

    
    
# Dar print à pauta. A variável seperator apenas serve para embelezar a tabela (linhas horizontais)
def printPauta(lst):

    print("")


    seperator = "|"

    for i in range(0, 73):
        seperator += "-"
    seperator += "|"

    print(seperator)

    print("| Numero {:20} Nome {:33} Nota |".format("", ""))


    print(seperator)

    for line in lst:
        print("| {:6} {:6} {:48} {:1} {:6} |".format(line[0], "", line[1] ,"", line[5]))

    print(seperator)

    print("")


def main():
    lst = []
    # ler os ficheiros
    loadFile("school1.csv", lst)
    loadFile("school2.csv", lst)
    loadFile("school3.csv", lst)

    finalGrade = notaFinal(lst)

    finalGrade.sort()

    printPauta(finalGrade)


# Call main function
if __name__ == "__main__":
    main()


