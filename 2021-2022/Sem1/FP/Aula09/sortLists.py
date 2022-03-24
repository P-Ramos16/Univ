from bisect import bisect

with open("wordlist.txt", 'r') as file:
    words = [line.strip("\n") for line in file]


    firstEA = bisect(words, "ea")
    firstEB = bisect(words, "eb")

    print("Number of words started in 'ea':", (firstEB-firstEA))


    resIndex = 0
    i = 2

    while i < 25:
        numIndex = "t" + chr(ord('`')+i)
        firstT = bisect(words, numIndex)

        print(words[firstT][0:2])
        if words[firstT][0:2] == numIndex:
            resIndex = firstT
            break

        i += 1

    print("First word started with 't' and not 'ta'", words[resIndex])


