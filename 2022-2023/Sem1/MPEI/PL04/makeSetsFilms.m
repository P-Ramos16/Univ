function [Set, filmRatings, Nf, films] = makeSetsFilms(file)    

    udata = load(file); % Carrega o ficheiro dos dados dos filmes
    
    % Fica apenas com as tres primeiras colunas
    u = udata(1:end,1:3);
    clear udata;
    
    % Lista de utilizadores
    films = unique(u(:,2)); % Extrai os IDs dos filmes
    Nf    = length(films);  % Número de filmes
    
    % Constrói a lista de utilizadores para cada filme
    Set = cell(Nf,1);  % Usa células
    filmRatings = cell(Nf,1);
    for n = 1:Nf       % Para cada filme
        % Obtém os utilizadores de cada um
        ind = find(u(:,2) == films(n));
    
        % E guarda num array. Usa células porque cada filme tem um número
        % diferente de utilizadores. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind, 1)];
        filmRatings{n} = [filmRatings{n} u(ind, 3)];
    end
end

