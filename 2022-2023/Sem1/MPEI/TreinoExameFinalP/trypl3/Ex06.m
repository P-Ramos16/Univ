%    1    2    4    3    5
T = [0.8  0    0.3  0    0
     0.2  0.6  0.2  0    0
     0    0.1  0.4  0    0
     0    0.3  0    1    0
     0    0    0.1  0    1];

v0 = [1 0 0 0 0]';
nIter = 100;
res = zeros(nIter, 1);

res(1) = v0(2);

for n = 1:1:nIter-1
    TiterN = (T^n) * v0;
    res(n+1) = TiterN(2);
end

plot(1:1:nIter, res);
grid on;

%  Após cerca de 5 transições, a probabilidade de estar no
% estado 2 é quase nula, visto que é muito mais provável
% ter-mos ficado presos num estado absorvente.
