clear all;
%% Começa por criar as estruturas necessárias
createStructures;

load("structures.mat");

%%
while 1
    %  Menu príncipal
    disp(" /------------------------------------------------------------\");
    disp(" |                      Select an option                      |");
    disp(" |------------------------------------------------------------|");
    disp(" |  1 - Users that evaluated current movie                    |");
    disp(" |  2 - Sugestion of users to evaluate movie                  |");
    disp(" |  3 - Sugestion of users to based on common interests       |");
    disp(" |  4 - Movies feedback based on popularity                   |");
    disp(" |  5 - Exit                                                  |");
    disp(" \------------------------------------------------------------/");
    prompt = "                            > ";
    option = input(prompt);
    %  Dependendo da opção escolhida
    switch option

        case 1
            %  Obter IDs dos Users que viram o Filme.
            usersPerFilm =  FilmsSet{filmID, :};

            %  Imprimir cada user .
            fprintf("\n");
            fprintf("  %10s  |   %-2s   |  %-26s\n", "User n.º", "ID", "Name");
            fprintf(" ----------------------------------------------------------\n");

            %  Para cada User imprimir um número, o seu ID e 
            % o seu Nome próprio + apelido
            for nUsers = 1:1:length(usersPerFilm)
                userID = usersPerFilm(nUsers);
                fprintf("  %6i      |  %4i  |  %-26s\n", nUsers, userID, append(dicUsers{userID, 2}, " ", dicUsers{userID, 3}));
            end

            fprintf("\n");

            clear("usersPerFilm", "nUsers", "userID");

        case 2
            %  Obter os IDs dos filmes com users parecidos.
            similarFilm1ID = SimilarFilms(2); % Primeiro é o próprio filme!!!
            similarFilm2ID = SimilarFilms(3);
            %  Obter os Sets de users que viram:
            %  -O filme em questão
            usersPerFilm =  FilmsSet{filmID, :};
            %  -Os filmes mais parecidos por users
            similarFilm1Users = FilmsSet{similarFilm1ID, :};
            similarFilm2Users = FilmsSet{similarFilm2ID, :};
            
            %  Set de users que viram pelo menos um dos filmes semelhantes.
            usersFromSimilarFilms = union(similarFilm1Users, similarFilm2Users);
            %  Remover os users que já viram o Filme Inicial.
            usersFromSimilarFilms = setdiff(usersFromSimilarFilms, usersPerFilm);

            fprintf("\n");
            fprintf("  %10s  |   %-2s   |  %-26s\n", "User n.º", "ID", "Name");
            fprintf(" ----------------------------------------------------------\n");
            %  Imprimir cada user obtido
            for nUsers = 1:1:length(usersFromSimilarFilms)
                userID = usersFromSimilarFilms(nUsers);
                fprintf("  %6i      |  %4i  |  %-26s\n", nUsers, userID, append(dicUsers{userID, 2}, " ", dicUsers{userID, 3}));
            end

            fprintf("\n");

            clear("similarFilm1ID", "similarFilm2ID", "usersPerFilm", "similarFilm1Users", "similarFilm2Users", "usersFromSimilarFilms", "userID", "nUsers");

        case 3
            %  Obter os IDs dos Users que ainda não viram o filme em questão mas
            % tem interesses semelhares aos que já o viram
            userID1 = twoMostSimilarUsers(1);
            userID2 = twoMostSimilarUsers(2);

            fprintf("\n");
            fprintf("  %10s  |   %-2s   |  %-26s\n", "User n.º", "ID", "Name");
            fprintf(" ----------------------------------------------------------\n");
            fprintf("  %6i      |  %4i  |  %-26s\n", 1, userID1, append(dicUsers{userID1, 2}, " ", dicUsers{userID1, 3}));
            fprintf("  %6i      |  %4i  |  %-26s\n", 2, userID2, append(dicUsers{userID2, 2}, " ", dicUsers{userID2, 3}));
            fprintf("\n");

            clear("userID1", "userID2");

        case 4
            %  Obter o nome do Filme ou a string a procurar
            searchName = "";
            while strcmp(searchName, "") == 1 || length(searchName) < shingleSize
                prompt = " Insert a Film Name or part of one: ";
                searchName = input(prompt, 's');
                if length(searchName) < shingleSize
                    fprintf(" A string inserida tem de ser maior ou igual ao tamanho dos k-shingles! (%1i)\n", shingleSize);
                end
            end

            %  Gerar os k-shingles para o input colocado e criar as assinaturas
            SearchShingles = makeShinglesFilms({searchName}, shingleSize);
            AssinaturasSearch = minHashNames(SearchShingles, 1, nHashFunctions, 0);
            SimilarNames= zeros(1,2);
            k = 1;

            %  Encontrar a distancia de Jaccard a partir da string
            % inserida até ao nomes de cada filme
            for n1 = 1:1:Nf
                SimilarNames(k, :) = [n1 (sum(AssinaturasNames(n1,:) ~= AssinaturasSearch(1,:))/nHashFunctions)];
                k = k+1;           
            end
                        
            %  Sort aos nomes encontrados baseado na
            % Distância de Jaccard ao input inicial.
            SimilarNames = sortrows(SimilarNames,2);

            %  Guardar as primeiras 3 entradas
            film1ID = SimilarNames(1,1);
            film2ID = SimilarNames(2,1);
            film3ID = SimilarNames(3,1);

            %  Verificar quantos users deram reviews maiores que 3 estrelas
            % aos filmes obtidos ao ir buscar o seu valor ao filtro de Bloom
            numGoodEvalsFilm1 = verify(Filtro, bloomHashFunctions,  dicFilms{film1ID, 1});
            numGoodEvalsFilm2 = verify(Filtro, bloomHashFunctions,  dicFilms{film2ID, 1});
            numGoodEvalsFilm3 = verify(Filtro, bloomHashFunctions,  dicFilms{film3ID, 1});

            fprintf("\n");
            fprintf("  %10s  |   %-2s   |  %-26s  |  %-4s\n", "Filme n.º", "ID", "Name", "N.º Good Reviews");
            fprintf(" -------------------------------------------------------------------------\n");
            fprintf("  %6i      |  %4i  |  %-26s  |  %4i\n", 1, film1ID, dicFilms{film1ID, 1}, numGoodEvalsFilm1);
            fprintf("  %6i      |  %4i  |  %-26s  |  %4i\n", 2, film2ID, dicFilms{film2ID, 1}, numGoodEvalsFilm2);
            fprintf("  %6i      |  %4i  |  %-26s  |  %4i\n", 3, film3ID, dicFilms{film3ID, 1}, numGoodEvalsFilm3);
            fprintf("\n");

            clear("searchName", "bar", "SearchShingles", "AssinaturasSearch", "SimilarNames", "k", "n1", "prompt", "film1ID", "film2ID", "film3ID", "numGoodEvalsFilm1", "numGoodEvalsFilm2", "numGoodEvalsFilm3");
        
        case 5
            %  Acaba a execução do programa
            fprintf("\n Acabando o programa!\n");
            return

        otherwise
            %  Caso uma opção válida não seja escolhida
            fprintf("\n Opção inválida!\n");
    end
    clear("option");
end