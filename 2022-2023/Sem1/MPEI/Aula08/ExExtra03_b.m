H = [0   1/2    1/2   0     1/4     0
     1   0      0     0     1/4     0
     0   0      0     1     1/4     0
     0   0      1/2   0     1/4     1
     0   0      0     0     0       0
     0   1/2    0     0     0       0];

N = size(H);
N = N(1);   % num páginas

beta = 0.8; % probabilidade de não saltar para uma página ao calhas

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

A = beta*H + (1-beta)*ones(N)/N;


%% 
iter = 1;
pRank = ones(N, 1) / N;
newpRank = A * pRank;


while (sum(abs(newpRank - pRank)) > 0.0001)
    iter = iter + 1;
    pRank = newpRank;
    newpRank = A * newpRank;
end
iter
pRank = newpRank

%  A melhor página é a D e a pior é a E