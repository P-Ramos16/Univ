num1 = float(input("Número 1 >"))
num2 = float(input("Número 2 >"))
num3 = float(input("Número 3 >"))

if num1 >= num2 and num1 >= num3:
    print("O maior número é o",num1)

elif num2 >= num1 and num2 >= num3:
    print("O maior número é o", num2)

else:
    print("O maior número é o", num3)