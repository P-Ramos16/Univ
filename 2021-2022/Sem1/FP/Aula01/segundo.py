inp = int(input("Insira uma quantidade de segundos:"))


hora = int(inp // (60*60))
mins = int((inp % (60*60)) / 60)
seg = int(inp % 60)

print("{:02d}:{:02d}:{:02d}".format(hora, mins, seg))