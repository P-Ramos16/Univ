N = 1e6     %   num de experiencias
n = 4       %   lançamentos
p = 0.9     %   probabilidade de cara
k = 2       %   caras

lancamentos = rand(n,N) > (1-p);
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N