%% Criar palavras
i_min = 6;
i_max = 20;
N = 1e5;
alfabet = ['a':'z'];

probs = load("prob_pt.txt")';

words = generate_probs(N, i_min, i_max, alfabet, probs)