%% Criar palavras
i_min = 6;
i_max = 20;
N = 1e5;
alfabet = ['a':'z' 'A':'Z' '0':'9'];
words = generate_unif(N, i_min, i_max, alfabet);

%% Criar hashcodes para cada palavra e coloca-los na tabela
T = 5e5;
hashcodes = zeros(1, T);
atribuicoes = zeros(1,T);

for i = 1:N
    hash = string2hash(words{i});
    hash = rem(hash,T);
    hashcodes(i) = hash;
    atribuicoes(hash) = atribuicoes(hash) + 1;
end


%% Dados da tabela
length(unique(hashcodes))
%hist(hashcodes, 100); 
%hist(atribuicoes, 0:5);
perColisoes = sum(atribuicoes > 1) 