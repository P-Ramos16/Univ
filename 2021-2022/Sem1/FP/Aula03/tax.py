def tax(r):
    if r <= 1000:
        res = 0.1 * r
    
    elif r <= 2000:
        res = (0.2 * r) - 100
    
    else:
        res = (0.3 * r) - 300
    
    return res

x = float(input("Insira um número >"))

print("O valor final é", tax(x))