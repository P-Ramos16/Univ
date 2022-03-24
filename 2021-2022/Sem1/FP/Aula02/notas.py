CTP = float(input("CTP > "))
CP = float(input("CP > "))

fail = False

if CTP < 9.5 or CP < 9.5:
    print("Uma das tuas notas é menor do que 9.5, introduz as notas de recurso:")
    ATPR = float(input("ATPR > "))
    APR = float(input("APR > "))
    nFinal = (ATPR + APR) / 2

else:
    nFinal = (CTP + CP) / 2

print("A sua nota final é", nFinal)

   