# Um andar / dia
calc = 3 * 2 * 2

# Metros / dia (cada calc é para cada morador)
mDia = calc * 1 + calc * 2 + calc * 3

# Metros / ano
mAno = mDia *365

# Kilometros / ano
kmAno = mAno / 1000

print("Kms/Ano:", kmAno, "km")

# Horas / ano
# Metros/Ano / m/s / min / horas
hAno = mAno / 1 / 60 / 60

print("Horas/Ano:", hAno, "h")