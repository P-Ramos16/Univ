def leibnizPi4(n):
    i = 0
    x = 0

    while i <= n:
        x += ( (-1)**i ) / ( 2*i + 1 )
        i += 1

    return x


n = int(input("Enter a number ->"))

print("Pi is ", leibnizPi4(n) * 4)

