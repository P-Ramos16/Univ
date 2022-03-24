finalDict = {}

txtFile = open("names.txt", "r").readlines()

txtFile.pop(0)

for line in txtFile:
    
    words = line.split()
    words[-1]
    words[0]
    if words[-1] in finalDict:
        finalDict[words[-1]].append(words[0])

    else:
        finalDict[words[-1]] = []
        finalDict[words[-1]].append(words[0])

for i in finalDict:
    print(i, ":" ,finalDict[i])