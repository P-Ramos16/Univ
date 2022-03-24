import math


# Inputs dos dados

x = float(input("Posição x do dardo:"))
y = float(input("Posição y do dardo:"))


# Distância do dardo ao ponto (0, 0)

z = math.sqrt(x**2 + y**2)


# Cálculo do angulo pelo produto escalar

ref = abs(x)

if y == 0 and x >= 0:
    alpha = 0

elif y == 0 and x <= 0:
    alpha = 180

else:
    alpha = round(math.degrees(math.acos(((170 * x) + (0 * y))/(170 * z))), 2)


# Cálculo da coluna (neste caso a coluna é cada partição do circulo, existindo 20)

collumn = int((alpha + 9) / 18)


# Pontos por coluna

if y < 0:
    collumn = -1 * collumn

if collumn == 0:
    points = 6
    
elif collumn == 1:
    points = 13

elif collumn == 2:
    points = 4

elif collumn == 3:
    points = 18

elif collumn == 4:
    points = 1

elif collumn == 5:
    points = 20

elif collumn == 6:
    points = 5

elif collumn == 7:
    points = 12

elif collumn == 8:
    points = 9

elif collumn == 9:
    points = 14

elif collumn == 10:
    points = 11

elif collumn == -1:
    points = 10

elif collumn == -2:
    points = 15

elif collumn == -3:
    points = 2

elif collumn == -4:
    points = 17

elif collumn == -5:
    points = 3

elif collumn == -6:
    points = 19

elif collumn == -7:
    points = 7

elif collumn == -8:
    points = 16

elif collumn == -9:
    points = 8

elif collumn == -10:
    points = 11

# Cálculo final dos pontos (pontos da coluna * um valor dependente da distancia ao ponto (0,0))

if z < 6.35:
    finalPoints = 50

elif 6.35 < z < 22.35:
    finalPoints = 25

elif 22.35 < z < 76.65:
    finalPoints = points

elif 76.65 < z < 84.65:
    finalPoints = points * 3

elif 84.65 < z < 162:
    finalPoints = points

elif 162 < z < 170:
    finalPoints = points * 2

else:
    finalPoints = 0

print("A pontuação foi de:", finalPoints, "pontos.")