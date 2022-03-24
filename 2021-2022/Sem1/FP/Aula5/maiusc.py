def maisc(str):

    x = ""

    for i in range(len(str)):
        if str[i:i+1].isupper():
            x += str[i:i+1]
    
    return x

x = input("Insira uma string >")

print(maisc(x))