clear all;
n = 8000;
m = 1000;
k = 3;
C = importdata("wordlist-preao-20201103.txt");

F = initialize(n, k);

for i = 1:1:m
    F = insert(F, k, C{i});
end

for i = 1:1:m
    belongs = verify(F, k, C{i});
    if (~belongs)
        C{i}
    end
end

sum(F)
size(F)
stem(F)

%  Todas as palavras voram verificadas dentro do conjunto,
% logo não existou falsos negativos