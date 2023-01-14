clear all;
%% Começa por criar as estruturas necessárias
createStructures;

load("structures.mat");

%%
while 1
    disp("/------------------------------------------------------------\");
    disp("|                      Select an option                      |");
    disp("|------------------------------------------------------------|");
    disp("|  1 - Users that evaluated current movie                    |");
    disp("|  2 - Sugestion of users to evaluate movie                  |");
    disp("|  3 - Sugestion of users to based on common interests       |");
    disp("|  4 - Movies feedback based on popularity                   |");
    disp("|  5 - Exit                                                  |");
    disp("\------------------------------------------------------------/");
    prompt = "                            > ";
    option = input(prompt);
    switch option
        case 1
            % IDs dos Users que viram o Filme.
            usersPerFilm =  Set{filmID, :};
            % Imprimir cada user .
            for nUsers = 1:1:length(usersPerFilm)
                % Para cada User imprimir um número, o sei ID e 
                % o seu Nome próprio + apelido
                fprintf("User nº.%-4i> Nome: %-26s ID: %-4i\n", nUsers, append(dicUsers{nUsers, 2}, " ", dicUsers{nUsers, 3}), usersPerFilm(nUsers));
            end
            fprintf("\n");

        case 2
            % Obter os IDs dos filmes com users parecidos.
            similarFilm1ID = SimilarFilms(2); % Primeiro é o próprio filme!!!
            similarFilm2ID = SimilarFilms(3);
            usersPerFilm =  Set{filmID, :};
            similarFilm1Users = Set{similarFilm1ID, :};
            similarFilm2Users = Set{similarFilm2ID, :};
            % Set de filmes visto pelos dois users semelhantes.
            usersFromSimilarFilms = union(similarFilm1Users, similarFilm2Users);
            % Remover os users que já viram o Filme Inicial.
            usersFromSimilarFilms = setdiff(usersFromSimilarFilms, usersPerFilm);

            for nUsers = 1:1:length(usersFromSimilarFilms)
                fprintf("User nº.%-4i> Nome: %-26s ID: %-4i\n", nUsers, append(dicUsers{nUsers, 2}, " ", dicUsers{nUsers, 3}), usersPerFilm(nUsers));
            end

        case 3
            % IDs dos filmes do User.
            userFilms =  Set{filmID, :};



        case 4

        case 5
            disp("Acabando o programa!")
            return

        otherwise
            disp("Opção inválida!");
    end
end