N = 1e5

M = rand(15, N) %% 15 lançamentos, N vezes

lancamentos = M > 0.5 %% lançamentos que sairam caras

num_caras = sum(lancamentos) %% Ma

x = num_caras >= 6
cfav = sum(x)

prob = cfav / N