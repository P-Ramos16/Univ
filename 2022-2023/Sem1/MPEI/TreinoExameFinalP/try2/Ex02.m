H = [0   1   1   1   0
     1   0   0   1   1
     1   1   0   1   0
     0   0   1   0   1
     0   0   0   1   0];

N = size(H);
N = N(1);   % num páginas

beta = 0.8; % probabilidade de não saltar para uma página ao calhas

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

A = beta*H + (1-beta)*ones(N)/N

%% 
iter = 1;
pRank = ones(N, 1) / N;
newpRank = A * pRank;

for iter = 1:1:10
    pRank = A * pRank;
end

% while (sum(abs(newpRank - pRank)) > 0.0001)
%     iter = iter + 1;
%     pRank = newpRank;
%     newpRank = A * newpRank;
% end

pRank

%  É precido 14 iterações
%  Os valores são muito parecidos, visto que após 10 iterações
% os valores já ficam muito constantes
