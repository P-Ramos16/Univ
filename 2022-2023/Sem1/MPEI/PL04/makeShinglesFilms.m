function Set = makeShinglesFilms(dicFilms, shingleSize)    
    
    % Fica apenas com as duas primeiras colunas
    nameCells = dicFilms(:,1);
    
    Nc    = length(nameCells);  % Número de filmes

    % Constrói a lista de shingles para cada node de filme
    Set = cell(Nc,1);  % Usa células
    for n = 1:Nc       % Para cada filme
        % Obtém o nome do filme
        name = nameCells{n};

        % E guarda num array. Usa células porque cada filme tem um número
        % diferente de shingles. Se fossem iguais podia ser um array
        numShingles = length(name)-shingleSize+1;
        ShingleArr = strings(numShingles, 1);

        for k = 1:1:numShingles
            ShingleArr(k) = name(k:shingleSize+k-1);
        end

        Set{n} = ShingleArr;
    end
end

