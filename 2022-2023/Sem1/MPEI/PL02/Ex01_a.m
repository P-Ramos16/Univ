N = 1e5;     %   num de experiencias
n = 2;       %   lançamentos
p = 0.5;     %   probabilidade de um filho rapaz
k = 1;       %   num. minimo pretendido de filho rapaz

lancamentos   =  rand(n,N) > (1-p);
sucessos      =  sum(lancamentos) >= k;
probSimulacao =  sum(sucessos) / N