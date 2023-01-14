%% 4. Crie uma nova versao da funcao de calculo de distancia 
% recorrendo a uma aproximacao probabilıstica usando MinHash. 
% 
% Comece por testar esta nova implementacao com um numero pequeno de utilizadores
% e depois teste-a com o conjunto total de utilizadores.
%
% Na implementacao do MinHash, considere um numero k de funcoes de dispersao de 50, 100 e 200.
%
% Compare os pares considerados como similares (e o seu valor de similaridade) para cada valor de k com
% os obtidos com a implementacao nao probabilística e retire conclusoes.

%% Processar dados

numHash = 200;   %Nº funções de dispersão
[users,Set] = criarSet("u.data");

assinaturas = minHash(Set,numHash);

threshold = 0.4;
similares = obterSimilaresHash(users,assinaturas,threshold,numHash);

%% Mostrar Resultados
N = length(similares);
for k= 1:N
  fprintf("Distância: %f  (user 1: %d , user 2: %d)\n",similares(k,3),similares(k,1),similares(k,2));
end