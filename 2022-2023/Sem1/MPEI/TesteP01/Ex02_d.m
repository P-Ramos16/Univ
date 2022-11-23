load('L.mat')

N = size(H);
N = N(1);   % num páginas

beta = 0.85; % probabilidade de não saltar para uma página ao calhas

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

A = beta*H + (1-beta)*ones(N)/N

%%
pRank = ones(N, 1) / N;

for i = 1:1:n
    pRank = A * pRank;
end

pRank