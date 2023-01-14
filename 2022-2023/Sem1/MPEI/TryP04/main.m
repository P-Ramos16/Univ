clear all;

[Set, Nu, users] = makeSetsUsers("u.data");
userID = 0;
while userID == 0 || userID < 1 || userID > 943
    prompt = "Insert User ID (1 to 943): ";
    userID = input(prompt);
end

% Generate the seeds for the DJB31MA hash function
nHashFunctions = 500;
%seeds = randi((2^32-1), [nHashFunctions, 1], 'int32')

Jusers = minHashUser(Set, Nu, userID, nHashFunctions);
% Obter as distâncias de Jaccard aos outros users
%  Threshold grande para garantir pelo menos dois utilizadores
% mas não tão grande que leve a ineficiencia no sort.
SimilarUsers = getSimilarUsers(Jusers, Nu, 0.7, users);
%  Sort aos utilizadores baseado na Distância de 
% Jaccard ao utilizador inicial.
% Primeiro é o próprio user!!!!!
SimilarUsers = sortrows(SimilarUsers,2);
SimilarUsers

% [Set, Nu, users] = makeSetsFilms("films.txt");
% filmNames = strings(length(dicFilms, 1));
% Jfilms = minHashFilms(Set, Nu, userID);
% SimilarFilms = getSimilarFilms(Jfilms, Nu, 0.8, users, userID);

%%
while 1
    disp("/------------------------------------------------------------\");
    disp("|                      Select an option                      |");
    disp("|------------------------------------------------------------|");
    disp("|  1 - Your movies                                           |");
    disp("|  2 - Sugestion of movies based on other users              |");
    disp("|  3 - Sugestion of movies based on already evaluated movies |");
    disp("|  4 - Movies feedback based on popularity                   |");
    disp("|  5 - Exit                                                  |");
    disp("\------------------------------------------------------------/");
    prompt = "                            > ";
    option = input(prompt);
    switch option
        case 1
            % IDs dos filmes do User.
            userFilms =  Set{userID, :};
            % Imprimir cada filme .
            for nFilm = 1:1:length(userFilms)
                fprintf("Filme nº.%-4i, ID = %-4i > %s\n", nFilm, userFilms(nFilm),"Teste (dicFilms{nFilm, 1})");
            end

        case 2
            % Obter os IDs dos users mais parecidos.
            similarUser1ID = SimilarUsers(2) % Primeiro é o user!!!
            similarUser2ID = SimilarUsers(3)
            userFilms =  Set{userID, :};     
            similarUser1Films = Set{similarUser1ID, :};
            similarUser2Films = Set{similarUser2ID, :};
            % Set de filmes visto pelos dois users semelhantes.
            filmsFromSimilarUsers = union(similarUser1Films, similarUser2Films);
            % Remover os filmes já vistos pelo User.
            filmsFromSimilarUsers = setdiff(filmsFromSimilarUsers, userFilms);

            for nFilm = 1:1:length(filmsFromSimilarUsers)
                fprintf("Filme nº.%-4i, ID = %-4i > %s\n", nFilm, filmsFromSimilarUsers(nFilm),"Teste (dicFilms{nFilm, 1})");
            end

        case 3
            % IDs dos filmes do User.
            userFilms =  Set{userID, :};



        case 4

        case 5
            disp("Acabando o programa!")
            return

        otherwise
            disp("Opção inválida!");
    end
end