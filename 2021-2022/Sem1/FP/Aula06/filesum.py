from tkinter import filedialog

def main():
    # 1) Pedir nome do ficheiro (experimente cada alternativa):
    #name = input("File? ")                                  #A
    name = filedialog.askopenfilename(title="Choose File") #B
    
    # 2) Calcular soma dos números no ficheiro:
    total = fileSum(name)
    
    # 3) Mostrar a soma:
    print("Sum:", total)


def fileSum(filename):
    
    res = 0
    
    for x in open(filename, "r", encoding = "utf-8"):
        res += float(x)
    
    return res


if __name__ == "__main__":
    main()

