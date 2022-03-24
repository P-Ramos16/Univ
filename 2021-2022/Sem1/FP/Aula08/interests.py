def main():
    A = "reading"
    B = "eating"
    C = "traveling"
    D = "writing"
    E = "running"
    F = "music"
    G = "movies"
    H = "programming"

    interests = {
        "Marco": {A, D, E, F},
        "Anna": {E, A, G},
        "Maria": {G, D, E},
        "Paolo": {B, D, F},
        "Frank": {D, B, E, F, A},
        "Teresa": {F, H, C, D}
        }


    print("a) Table of common interests:")

    shortDict = dict(interests)

    commoninterests = {}

    for person0 in interests.keys():

        for person1 in shortDict.keys():
            
            if person0 != person1:

                commoninterests[person0, person1] = []

                for interest0 in interests[person0]:

                    for interest1 in interests[person1]:


                        if interest0 == interest1:
                            
                            commoninterests[person0, person1].append(interest0)
                                                            

        shortDict.pop(person0)


    print(commoninterests)

    print("b) Maximum number of common interests:")

    maxLen = max([len(x) for x in commoninterests.values()])

    maxCI = [y for y in commoninterests.values() if len(y) == maxLen]
    
    print(len(maxCI[0]))

    print("c) Pairs with maximum number of matching interests:")
    maxmatches = [y for y in commoninterests.keys() if len(commoninterests[y]) == maxLen]
    print(maxmatches)

    print("d) Pairs with low similarity:")
    lowJaccard = [y for y in commoninterests.keys() if len(commoninterests[y]) < 0.25 * (len(interests[y[0]]) + len(interests[y[0]]) - len(commoninterests[y]))]
    print(lowJaccard)


# Start program:
main()

