H = [0   0   0   0   1   0
     1   0   0   0   1   0
     0   1   0   1   0   0
     0   0   1   0   0   0
     0   1   0   0   0   0
     0   0   0   0   1   1];

N = size(H);
N = N(1);   % num páginas

beta = 0.8; % probabilidade de não saltar para uma página ao calhas

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

A = beta*H + (1-beta)*ones(N)/N;

%% 
iter = 1
pRank = ones(N, 1) / N;
newpRank = A * pRank;


while (-0.001 > newpRank - pRank) && (newpRank - pRank > 0.001)
    iter = iter + 1
    pRank = newpRank;
    newpRank = A * newpRank;
end

pRank = newpRank
