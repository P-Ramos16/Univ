# A set of functions to deal with bags of money.
#
# JMR 2017


# Face values of coins (in cents):
COINS = [200, 100, 50, 20, 10, 5, 2, 1]

def value(bag):
    """Return total amount in a bag."""
    val = 0
    for coin in bag:
        val += coin * bag[coin]
    return val


def transfer1coin(bag1, c, bag2):
    """Try to transfer one coin of value c from bag1 to bag2.
    If possible, transfer coin and return True, otherwise return False."""
    if bag1[c] != 0:
        bag1[c] -= 1
        if c not in bag2.keys():
            bag2[c] = 1
        else:
            bag2[c] += 1

        return True

    else:
        return False

def transfer(bag1, amount, bag2):
    """Try to transfer an amount from bag1 to bag2.
    If possible, transfer coins and return True,
    otherwise, return False and leave bags with same values."""

    bag1Save = bag1 
    bag2Save = bag2

    if amount == 0:
        return True

    if value(bag1) < amount:
        return False

    for coin in COINS:
        if amount % coin == 0 and bag1[coin] * coin == amount:
            while amount > 0:
                transfer1coin(bag1, coin, bag2)
                amount -= coin
            
            return True
            
    CoinsShort = [200, 100, 50, 20, 10, 5, 2, 1]

    while amount > 0:
        for coin in CoinsShort:
            if coin > amount or bag1[coin] == 0:
                CoinsShort.remove(coin)
                break

            elif amount >= coin and bag1[coin] != 0:
                transfer1coin(bag1, coin, bag2)
                amount -= coin
                
            if CoinsShort == []:
                bag1 = bag1Save
                bag2 = bag2Save
                return False

    return True


def strbag(bag):
    """Return a string representing the contents of a bag.""" 

    val = 0
    for coin in bag:
        val += coin * bag[coin]

    string = ""
    for coin in bag:
        string += str(bag[coin])
        string += "x"
        string += str(coin)
        string += " + "

    string = string[:-3] + " = "
    string += str(val)
    # You may want to change this to produce a more user-friendly
    # representation such as "4x200+3x50+1x5+3x1=958".
    return string


def main():
    # A bag of coins is represented by a dict of {coin: number} items
    bag1 = {1: 4, 2: 0, 5:1, 10: 0, 20: 5, 50: 4, 100: 2, 200: 1}
    bag2 = {}

    # Test the value function.
    assert value({}) == 0
    assert value({1:7, 5:2, 20:4, 100:1}) == 197

    # Test the strbag function.
    print( strbag({1:7, 5:2, 20:4, 100:1}) )        # 1x100+4x20+2x5+7x1=197
    print( strbag({1:7, 5:2, 10:0, 20:4, 100:1}) )  # 1x100+4x20+2x5+7x1=197

    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    print("bag2:", strbag(bag2))    # bag2: =0
    
    print(transfer1coin(bag1, 10, bag2))    # False!
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    print("bag2:", strbag(bag2))    # bag2: =0

    print(transfer1coin(bag1, 20, bag2))    # True
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+4x20+1x5+4x1=689
    print("bag2:", strbag(bag2))    # bag2: 1x20=20

    print(transfer1coin(bag1, 20, bag2))    # True
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+3x20+1x5+4x1=669
    print("bag2:", strbag(bag2))    # bag2: 2x20=40

    print(transfer(bag1, 157, bag2))        # True (should be easy)
    print("bag1:", strbag(bag1))    # bag1: 1x200+1x100+3x50+3x20+2x1=512
    print("bag2:", strbag(bag2))    # bag2: 1x100+1x50+2x20+1x5+2x1=197

    print("Transfer 60 coins")
    print(transfer(bag1, 60, bag2)) # not easy, but possible...
    print("bag1:", strbag(bag1))
    print("bag2:", strbag(bag2))

    return

if __name__ == "__main__":
    main()

