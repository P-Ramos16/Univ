strg = input("Coloque uma string: >")
n = int(input("Coloque um número: >"))

returnString = ""

for char in strg:
    i = 0
    while i < n:
        returnString += char
        i += 1

print(returnString)
