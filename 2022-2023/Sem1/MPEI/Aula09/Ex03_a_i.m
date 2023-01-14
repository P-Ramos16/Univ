clear all;
%% Criar palavras
i_min = 6;
i_max = 20;
N = 1e5;
alfabet = ['a':'z' 'A':'Z' '0':'9'];
words = generate_unif(N, i_min, i_max, alfabet);

%% Criar hashcodes para cada palavra e coloca-los na tabela
T = [5e5 1e6 2e6];
numUniqueHashCodes = zeros(4, 3);
numColisoes = zeros(4, 3);
hold on
for t = 1:3
    % string2hash 1 (djb2)
    hashcodes = zeros(1, N);
    atribuicoes = zeros(1, T(t));
    
    for i = 1:N
        hash = string2hash(words{i});
        hash = rem(hash, T(t)) + 1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    numUniqueHashCodes(1, t) = length(unique(hashcodes));
    numColisoes(1, t) = sum(atribuicoes > 1);
    subplot(4, 3, t);
    hist(hashcodes, 100);
    

    % string2hash 2 (sdbm)
    hashcodes = zeros(1, N);
    atribuicoes = zeros(1, T(t));
    
    for i = 1:N
        hash = string2hash(words{i}, 'sdbm');
        hash = rem(hash,T(t)) + 1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    numUniqueHashCodes(2, t) = length(unique(hashcodes));
    numColisoes(2, t) = sum(atribuicoes > 1);
    subplot(4, 3, t+3);
    hist(hashcodes, 100);


    % hashstring
    hashcodes = zeros(1, N);
    atribuicoes = zeros(1, T(t));
    
    for i = 1:N
        hash = hashstring(words{i}, T(t));
        hash = rem(hash,T(t)) + 1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    numUniqueHashCodes(3, t) = length(unique(hashcodes));
    numColisoes(3, t) = sum(atribuicoes > 1);
    subplot(4, 3, t+6);
    hist(hashcodes, 100);


    % DJB31MA
    hashcodes = zeros(1, N);
    atribuicoes = zeros(1, T(t));
    
    for i = 1:N

        hash = DJB31MA(words{i}, 127);
        hash = rem(hash,T(t)) + 1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    numUniqueHashCodes(4, t) = length(unique(hashcodes));
    numColisoes(4, t) = sum(atribuicoes > 1);
    subplot(4, 3, t+9);
    hist(hashcodes, 100);
    
end
hold off
%% Dados da tabela
numUniqueHashCodes
numColisoes