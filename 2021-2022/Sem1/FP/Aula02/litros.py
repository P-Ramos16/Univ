x = float(input("Litros > "))

if x > 40:
    y = 0.9

else:
    y = 1

z = x * 1.4 * y

print("O preço a pagar é", z,"€")