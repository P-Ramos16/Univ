from bisect import bisect
from bisect import bisect_right

with open("wordlist.txt", 'r') as file:
    words = [line.strip("\n") for line in file]

searchStr = ""
inptAdd = ""

while True:
    inptAdd = input("Introduza uma letra para adcionar à search >")
    if inptAdd != "":
        searchStr += inptAdd

        firstW = bisect(words, searchStr)
        lastW = bisect(words, searchStr + "z")

        print("Words started in {}:".format(searchStr))

        if len(words[firstW:lastW]) == 0:
            print("No word found")
            break

        for x in range(len(words[firstW:lastW])):
            print(">", words[firstW + x])

        print("")
    else:
        print("Final word >", searchStr)
        break