
# Constantes para indexar os tuplos:
NAME,DATE,OPEN,MAX,MIN,CLOSE,VOLUME = 0,1,2,3,4,5,6

def main():
    lst = loadStockFile("nasdaq.csv")
    
    # Show just first and last tuples:
    print("first:", lst[1])
    print("last:", lst[-1])
    
    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))
    
    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))

def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        for line in f:
            parts = line.strip().split('\t')
            name = parts[NAME]
            date = parts[DATE]
            tup = (name, date, float(parts[OPEN]), float(parts[MAX]),
                float(parts[MIN]), float(parts[CLOSE]), int(parts[VOLUME]))
            lst.append(tup)
    return lst

def totalVolume(lst):
    totVol = {}
    for i in range(len(lst)):
        totVol[lst[i][0]] = lst[i][6]
    
    return totVol

def maxValorization(lst):
    vMax = {}

    for i in range(len(lst)):
        valorização = (lst[i][5] / lst[i][4])
        vMax[lst[i][1]] = (lst[i][0], valorização)
    

    return vMax

def stocksByDateByName(lst):
    dic = {}

    for i in range(len(lst)):
        if lst[i][1] not in dic.keys():
            dic[lst[i][1]] = {}
            
        if lst[i][0] not in dic[lst[i][1]].keys():
            dic[lst[i][1]][lst[i][1]] = {}

        dic[lst[i][1]][lst[i][0]] = [lst[i][2], lst[i][3], lst[i][4], lst[i][5], lst[i][6]]
            
    return dic

def portfolioValue(stocks, portfolio, date):
    assert date in stocks
    val = 0.0
    for i in portfolio:
        val += stocks[date][i][3] * portfolio[i]

    return val

if __name__ == "__main__":
    main()
