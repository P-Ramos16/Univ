%% Criar palavras
i_min = 6;
i_max = 20;
N = 1e5;
alfabet = ['a':'z' 'A':'Z' '0':'9'];
words = generate_unif(N, i_min, i_max, alfabet)