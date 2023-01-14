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
tic
for i = 1:N
    hash = string2hash(words{i});
    hash = rem(hash,T);
    hashcodes(i) = hash;
    atribuicoes(hash) = atribuicoes(hash) + 1;
end

tempo = toc;
%% Dados da tabela
colisoes = sum(atribuicoes > 1) ;
perColisoes = colisoes * 100 / length(atribuicoes);
fprintf("      T->%i | Tempo->%d \n Colisões->%d | Percentagem Colisões ->%d\n\n", T, tempo, colisoes, perColisoes)
