def isPrime(n):
    x = True

    for i in range(2, n):
        if n % i == 0:
            print("The number {:0} is not prime".format(n))
            x = False
            break

    if x:
        print("The number {:0} is prime".format(n))

    return

for i in range(0, 100):
    isPrime(i)