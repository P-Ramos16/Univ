%% Obter o ID do Filme em questão
filmID = 1; %0
% while filmID == 0 || filmID < 1 || filmID > 1682
%     prompt = "Insert Film ID (1 to 1682): ";
%     filmID = input(prompt);
% end

bar = waitbar(0, "Calculating");

%% Criar os Sets e ler os ficheiros
%[FilmsSet, FilmsRatings, Nf, films] = makeSetsFilms("u.data");
FilmsSet{1} = [1 2 3 4 5 6 7 8 9 10]';
FilmsSet{2} = [1 12 13 4 5 6 7 8 9 12]';
Nf = 2;

nHashFunctions = 500;


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
SimilarFilms

close(bar);
