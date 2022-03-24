import math

a = float(input("Tamanho do cateto A:"))
b = float(input("Tamanho do cateto B:"))

c = round(math.sqrt(a ** 2 + b ** 2), 4)

x = round(math.degrees(math.asin(a / c)), 1)
print("\n")
print("Tamanho da hipotenusa:", c)
print("O angulo A^C tem %dº" % x)
print("\n")