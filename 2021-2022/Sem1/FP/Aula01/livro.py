lucro = (24.75 / (24.75 * 1.23)) - 0.20
print("Lucro: %d€" % (lucro * 500))

tax = 24.75 - (24.75 * 100 / 123)
print("Taxas para o estado: %d€" % (tax * 500))

alltax = tax + 0.2
print("Taxas totais: %d€" % (alltax * 500))