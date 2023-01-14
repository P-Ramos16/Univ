function [Set, Nf, filmNames] = makeSetsFilms(file)    
    % Carrega o ficheiro dos dados dos filmes
    dicFilms = readcell(file, 'Delimiter', '\t');
    % Fica apenas com as duas primeiras colunas
    clear udata;
    
    %  Lista de nomes de filmes, sendo o número da 
    % linha igual ao ID do filme.
    filmNames = dicFilms(:,1); % Extrai os IDs dos filmes
    Nf = length(filmNames);    % Número de filmes
    
    % Constrói a lista de categorias para cada filme
    Set = cell(Nf,1);  % Usa células
    for n = 1:Nf       % Para cada filme    
        %  Guarda num array. Usa células porque cada filme tem um número
        % diferente de categorias. Se fossem iguais podia ser um array
        Set{n} = dicFilms(n,2:end);
    end
end

