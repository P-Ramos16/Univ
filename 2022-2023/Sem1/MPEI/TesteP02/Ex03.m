clear all;
frases{1} = 'Lisboa e porto são duas cidades importantes de Portugal.';
frases{2} = 'Lisboa é a capital de Portugal.';
frases{3} = 'Porto é a capital do Norte de Portugal.';
frases{4} = 'Portugal não é só Lisboa e Porto.';

shingleSize = 3;

Nfrases = 4;

% Constrói a lista de shingles para cada frase
Set = cell(Nfrases,1);
for n = 1:1:Nfrases

    frase = frases{n};

    % E guarda num array. Usa células porque cada filme tem um número
    % diferente de shingles. Se fossem iguais podia ser um array
    numShingles = strlength(frase)-shingleSize+1;
    ShingleArr = strings(numShingles, 1);

    for k = 1:1:numShingles
        ShingleArr(k) = frase(1, k:shingleSize+k-1);
    end

    Set{n} = ShingleArr;
end
