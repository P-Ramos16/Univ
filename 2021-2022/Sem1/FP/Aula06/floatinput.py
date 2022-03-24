import math

def floatInput(prompt, min = None, max = None):
    while True:
        try:
            res = float(input(prompt))
            break
        except ValueError:
            print("ERROR: Not a float")
    while True:    
        try:
            assert min < max
            if min < res < max:
                return res
            else:
                print("ERROR: Value should be in [-273.15, inf]!")
                break
        except TypeError:
            return res

        


def main():
    print("a) Try entering invalid values such as 1/2 or 3,1416.")
    v = floatInput("Value? ")
    print("v:", v)

    print("b) Try entering invalid values such as 15%, 110 or -1.")
    h = floatInput("Humidity (%)? ", 0, 100)
    print("h:", h)

    print("c) Try entering invalid values such as 23C or -274.")
    t = floatInput("Temperature (Celsius)? ", min=-273.15)
    print("t:", t)

    # d) What happens if you uncomment this?
    impossible = floatInput("Value in [3, 0]? ", min=3, max=0)

    return

if __name__ == "__main__":
    main()
