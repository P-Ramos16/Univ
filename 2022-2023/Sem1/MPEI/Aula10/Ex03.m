clear all;
n = 8000;
m = 1000;       % Palavras a inserir
k = 3;
maxSize = 10000;% Palavras a verificar

C = importdata("wordlist-preao-20201103.txt");

F = initialize(n, k);

for i = 1:1:m
    F = insert(F, k, C{i});
end

numFalsePos = 0;

%maxSize = size(C);
%maxSize = maxSize(1)

for i = m:1:maxSize
    belongs = verify(F, k, C{i});
    if (belongs == true)
        numFalsePos = numFalsePos + 1;
    end
end

stem(F)
numFalsePos
numFalsePos / (maxSize-m)