clear all;
tamanho = 9850;
m = 300;       % Palavras a inserir
maxSize = 10000;% Palavras a verificar


%% Criar palavras
compProbs = [0.4 0.6];
comprimentos = [5 8];
N = 1e5;
alfabet = ['a':'z'];


% Array de comprimentos
comp = zeros(maxSize, 1);
C = cell(N,1);

for i = 1:1:N
    r = rand;
    x = sum(r >= cumsum([0, compProbs]));
    comp(i) = comprimentos(x);
end

for i = 1:N
    % Array dos indices dos alfabetos
    % nums de 1 a len. alfabeto num vetor de tamanho comp(i)

    x = randi([1,length(alfabet)],1,comp(i));
    word = alfabet(x);
    %fprintf(1,'%3d, %3d - %s\n',i,comp(i),word)
    C{i} = word;
end


%%

F = zeros(1, tamanho, "uint8");


for i = 1:1:m

    key =  C{i};

    hashVal = mod(string2hash(key), tamanho-1)+1;
    F(hashVal) = 1;
end

numFalsePos = 0;

%maxSize = size(C);
%maxSize = maxSize(1)

for i = m:1:maxSize

    key = C{i};   

    hashVal = mod(string2hash(key), tamanho-1)+1;
    if (F(hashVal) == 1)
        numFalsePos = numFalsePos + 1;
    end

end

stem(F)
numFalsePos
numFalsePos / (maxSize-m)