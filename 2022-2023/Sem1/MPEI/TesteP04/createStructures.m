
% Obter o ID do Filme em questão
filmID = 0;
while filmID == 0 || filmID < 1 || filmID > 1682
    prompt = "Insert Film ID (1 to 1682): ";
    filmID = input(prompt);
end

% Criar os Sets
[Set, Nf, films] = makeSetsFilms("u.data");
dicUsers = readcell('users.txt', 'Delimiter', ';');
dicFilms = readcell('film_info.txt', 'Delimiter', '\t');

nHashFunctions = 500;
Jfilms = minHashFilms(Set, Nf, filmID, nHashFunctions);
% Obter as distâncias de Jaccard aos outros filmes
%  Threshold grande para garantir pelo menos dois filmes
% mas não tão grande que leve a ineficiência no sort.
SimilarFilms = getSimilarUsers(Jfilms, Nf, 0.5, films);
%  Sort aos filmes baseado na Distância
% de Jaccard ao filme inicial.
% Primeiro é o próprio filme!!!!!
SimilarFilms = sortrows(SimilarFilms,2);

save("structures.mat",  "dicUsers", "dicFilms", "filmID", "nHashFunctions", "SimilarFilms");