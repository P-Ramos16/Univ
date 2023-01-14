n = 20;
p = 0.5;
N = 1e5;
vp = zeros(1,n);

for k = 1:1:n
    lancamentos = rand(n,N) > p;
    sucessos= sum(lancamentos)==k;
    probSimulacao= sum(sucessos)/N;
    vp(k) = probSimulacao;
end

stem(1:n, vp);