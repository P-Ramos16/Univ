def getTeams(lst):

    x = input("Indique o nome de uma equipa >")

    while x != "":
        lst.append(x)
        x = input("Indique o nome de uma equipa >")

    print("Inserio {} equipas".format(len(lst)))

    return

def sortGames(lst, gameslst):

    shortlst = lst

    for team0 in shortlst:
        for team1 in shortlst:
            if team0 != team1:
                gameslst.append([team0, team1])
                print(team0, team1)
        shortlst.remove(team0)
    return

def getResults(gameslst, dic, pointsTable, winsTable):
    for game in gameslst:
        print("")
        print("No jogo entre o {} e o {},".format(game[0], game[1]))
        x = int(input("Quantos golos marcou o {}? >".format(game[0])))
        y = int(input("Quantos golos marcou o {}? >".format(game[1])))

        if game[0] not in pointsTable:
            pointsTable[game[0]] = []

        if game[1] not in pointsTable:
            pointsTable[game[1]] = []

        pointsTable[game[0]].append(x) 
        pointsTable[game[1]].append(y) 



                                #wins losses, ties, scores, gets scored, points
        if game[0] not in winsTable:
            winsTable[game[0]] = [0, 0, 0, 0, 0, 0]

        if game[1] not in winsTable:
            winsTable[game[1]] = [0, 0, 0, 0, 0, 0]

        if x > y:
            #team0 wins
            winsTable[game[0]][0] += 1 
            winsTable[game[1]][1] += 1 
            winsTable[game[0]][5] += 3 


        elif x < y:
            #team1 wins
            winsTable[game[1]][0] += 1 
            winsTable[game[0]][1] += 1 
            winsTable[game[1]][5] += 3 
        
        else:
            #ties
            winsTable[game[0]][2] += 1 
            winsTable[game[1]][2] += 1 
            winsTable[game[0]][5] += 1 
            winsTable[game[1]][5] += 1 



        winsTable[game[0]][3] += x 
        winsTable[game[1]][3] += y 
        winsTable[game[0]][4] += y 
        winsTable[game[1]][4] += x 



    return

def getChampion(winsTable):

    champion = ""

    for team0 in winsTable:
        for team1 in winsTable:
            if winsTable[team0][5] > winsTable[team1][5]:
                champion = team0

    if champion == "":
        for team0 in winsTable:
            for team1 in winsTable:
                if (winsTable[team0][3] - winsTable[team0][4]) > (winsTable[team1][3] - winsTable[team1][4]):
                    champion = team0

    return champion




teams = []
games = []
dic = {}
pointsTable = {}
winsTable = {}
sortedWinsTable = {}

getTeams(teams)     

sortGames(teams, games)   

getResults(games, dic, pointsTable, winsTable)
                        
                #wins losses, ties, scores, gets scored, points
print("{:>13s} : {:^13s} : {:^13s} : {:^13s} : {:^13s} : {:^13s} : {:<13s}".format("Equipa", "Vitórias", "Derrotas", "Empates", "Golos Marcados", "Golos Recebidos", "Pontos"))
for team in winsTable:
    print("{:^13} : {:^13} : {:^13} : {:^13} : {:^13} : {:^13} : {:^13}".format(team, winsTable[team][0], winsTable[team][1], winsTable[team][2], winsTable[team][3], winsTable[team][4], winsTable[team][5]))

print("O campeão é {}!".format(getChampion(winsTable)))
