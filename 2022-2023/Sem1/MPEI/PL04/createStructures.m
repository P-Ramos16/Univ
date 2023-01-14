
%% Obter o ID do Filme em questão
filmID = 0;
while filmID == 0 || filmID < 1 || filmID > 1682
    prompt = "Insert Film ID (1 to 1682): ";
    filmID = input(prompt);
end

bar = waitbar(0, "Calculating");

%% Criar os Sets e ler os ficheiros
[FilmsSet, FilmsRatings, Nf, films] = makeSetsFilms("u.data");
dicUsers = readcell('users.txt', 'Delimiter', ';');
dicFilms = readcell('film_info.txt', 'Delimiter', '\t');

%  criar os k-shingles
shingleSize = 3;
[NamesFilmsShingles] = makeShinglesFilms(dicFilms, shingleSize);
nHashFunctions = 500;

FilmsSet{1}
%% MinHash dos Utilizadores por Filme
%  Obter as distâncias de Jaccard entre o filme inicial e os outros filmes
Jfilms = minHashFilms(FilmsSet, Nf, filmID, nHashFunctions, bar);
%  Obter os filmes mais parecidos.
%  Threshold grande para garantir pelo menos dois filmes
% mas não tão grande que leve a ineficiência no sort
% (grande parte dos filmes estão entre 0.9 e 1).
SimilarFilms = getSimilarFilms(Jfilms, Nf, 0.9, films);
%  Sort aos filmes baseado na Distância
% de Jaccard ao filme inicial.
% Primeiro é o próprio filme!!!!!
SimilarFilms = sortrows(SimilarFilms,2);


%% MinHash dos Gostos por Utilizadores
%  Obter os users que avaliaram o Filme em questão
usersThatReviewedTheFilm =  FilmsSet{filmID, :};

%  Obter as distâncias de Jaccard entre os gostos dos
% utilizadores que viram o filme e todos os outros
Jusers = minHashUsers(dicUsers, usersThatReviewedTheFilm, nHashFunctions, bar);
%  Obter os mais parecidos
SimilarUsers = getSimilarUsers(Jusers, usersThatReviewedTheFilm, 0.5);

%  Guardar todos os IDs dos users parecidos (vem vários repetidos)
tempArrayOfSimilarUsers=SimilarUsers(:,2);
%  Guardar o mais repetido
twoMostSimilarUsers(1) = mode(tempArrayOfSimilarUsers);
%  Remove o mais repetido do array temporário
tempArrayOfSimilarUsers(tempArrayOfSimilarUsers==twoMostSimilarUsers(1)) = NaN;
%  Volta a guardar o mais repetido (que já não é possível ser o removido antes, logo é o segundo)
twoMostSimilarUsers(2) = mode(tempArrayOfSimilarUsers);


%% MinHash dos Nomes dos Filmes
%  Obgter as assinaturas dos numes de cada filme
AssinaturasNames = minHashNames(NamesFilmsShingles, Nf, nHashFunctions, bar);
waitbar(1 ,bar, "Finished!");

%% Counting Filtro de Bloom
sizeF = 10000; % O tamanho do Bloom Filter
bloomHashFunctions = 5;
Filtro = initialize(sizeF, bloomHashFunctions);

for i = 1:1:Nf
    Filtro = insert(Filtro, bloomHashFunctions, dicFilms{i, 1}, FilmsRatings{i, 1});
end

%%  Guardar as variáveis necessárias e apagar todas

save("structures.mat", "FilmsSet", "dicUsers", "dicFilms", "filmID", "nHashFunctions", "shingleSize", "Nf", "bloomHashFunctions", "SimilarFilms", "SimilarUsers", "twoMostSimilarUsers", "AssinaturasNames", "Filtro");
close(bar);
clear all;