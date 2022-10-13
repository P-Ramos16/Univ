import time

#inp = int(input("Insira uma quantidade de segundos:"))
inp  = time.time() - 946684800

#inp = 1665234618 - 946684800

dia  = int((inp // (60*60*24)))

mins = int((inp % (60*60*24)) / 60)
seg  = int(inp % 60)

print("Dias     > {:>5d}\nMinutos  > {:>5d} \nSegundos > {:>5d}".format(dia, mins, seg))
