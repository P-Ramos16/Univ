# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^24s} : {:<24s}".format("Numero", "Nome", "Localização"))
    for num in dic:
        print("{:>12s} : {:^24s} : {:<24s}".format(num, dic[num][0], dic[num][1]))

def addContacts(dic):
    """Add contents to the dictionary"""
    num = input("Número? >")
    nome = input("Nome? >")
    loc = input("Localização? >")
    dic[num] = [nome, loc]

def removeContacts(dic):
    """Remove contents to the dictionary"""
    num = input("Número? >")
    dic.pop(num)


def filterNum(dic):
    """Returns the result of the number search."""
    num = input("Número? >")

    if num in dic:
        dic.get(num)
        print("{:>12s} : {}".format(num, dic[num]))
    else:
        print("{:>12s}".format(num))
    return

    
def filterPartName(dic, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    for value in dic.values():
        if value.startswith(partName):
            print("{:>12s} : {}".format(dic, dic.get(value)))

def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": ["Universidade de Aveiro", "Aveiro"],
        "727392822": ["Cristiano Aveiro", "Porto"],
        "387719992": ["Maria Matos", "Peniche"],
        "887555987": ["Marta Maia", "Lisboa"],
        "876111333": ["Carlos Martins", "Faro"],
        "433162999": ["Ana Bacalhau", "Lagos"]
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            print("Contactos:")
            addContacts(contactos)
        elif op == "R":
            print("Contactos:")
            removeContacts(contactos)
        elif op == "N":
            print("Contactos:")
            filterNum(contactos)
        elif op == "P":
            print("Contactos:")
            partName = input("Parte do nome? >")
            filterPartName(contactos, partName)
        else:
            print("Não implementado!")
    

# O programa começa aqui
main()