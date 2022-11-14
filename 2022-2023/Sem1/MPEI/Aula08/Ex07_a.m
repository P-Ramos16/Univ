n = 10;

H = [0   0   0   0   1   0
     1   0   0   0   1   0
     0   1   0   1   0   0
     0   0   1   0   0   0
     0   1   0   0   0   0
     0   0   0   0   1   1];

N = size(H);
N = N(1);

saidas = sum(H)
H = H./saidas
H(isnan(H)) = 0

%% 
%[1/6 1/6 1/6 1/6 1/6 1/6]';

pRank = ones(N, 1) / N

for i = 1:1:n
    pRank = H * pRank;
end

pRank

%  As páginas com maior rank são a C, D e F, com valores perto de 1/3 cada,
% visto que são páginas com "spider traps" ou "dead-ends"
