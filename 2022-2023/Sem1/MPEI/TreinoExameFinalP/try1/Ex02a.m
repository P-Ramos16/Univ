format long

H = [0  0  1  0  1  1
     1  1  1  1  1  1
     0  0  0  0  0  1
     0  1  0  0  0  1
     1  0  0  1  0  1
     0  1  0  0  0  0];

nIter = 15;

N = size(H);
N = N(1);

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

pRankIter = [];

pRank = ones(N, 1) / N;

for n = 1:1:nIter
    pRank = H * pRank;
    pRankIter = [pRankIter pRank];
end

pRank

hold on

K = 1:1:nIter;
plot(K, pRankIter(1,K));
plot(K, pRankIter(2,K));
plot(K, pRankIter(3,K));
plot(K, pRankIter(4,K));
plot(K, pRankIter(5,K));
plot(K, pRankIter(6,K));
legend("Estado 1", "Estado 2", "Estado 3", "Estado 4", "Estado 5", "Estado 6")

hold off