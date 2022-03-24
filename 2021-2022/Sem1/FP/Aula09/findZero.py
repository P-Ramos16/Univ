import math 

def findZero(func, a, b, tol):
    mid = (b + a) / 2

    if func(a)*func(b) > 0:
        return

    if func(a) < func(b):
        c = a
        a = b
        b = c

    if tol > func(mid) > -tol:
        print("func: ", func(mid))
        print("mid: ", mid)

        return

    if func(mid) > 0:
        a = mid
        findZero(func, a, b, tol)
    
    elif func(mid) < 0:
        b = mid
        findZero(func, a, b, tol)


func = lambda x: x + math.sin(10 * x)
findZero(func, 0.2, 0.4, 0.01)
findZero(func, 0.4, 0.6, 0.01)
findZero(func, -0.4, 0.1, 0.01)
findZero(func, -0.4, 0.5, 0.01)