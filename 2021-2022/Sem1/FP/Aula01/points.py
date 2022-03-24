import math
x1 = float(input("Qual o x1?"))
y1 = float(input("Qual o y1?"))
x2 = float(input("Qual o x2?"))
y2 = float(input("Qual o y2?"))

resx = x2 - x1
resy = y2 - y1

result = math.sqrt(resx ** 2 + resy ** 2)

print(result)