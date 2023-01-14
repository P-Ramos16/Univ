format short

T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4];

% variável de Bernoulli (Sol / Não Sol)
nDiasSol = 1;
nDiasNuvens = 0;
nDiasChuva = 0;
V = [1 0 0]';

% P(chuva2 * chuva3 | sol1) =
% = P(sol1) * P(chuva2 | sol1) * P(chiva3 | chuva2) =
prob = 1 - 1 * T(3, 1) * T(3, 3)

for dia = 2:31
    V = T * V;
    nDiasSol = nDiasSol + V(1);
    nDiasNuvens = nDiasNuvens + V(2);
    nDiasChuva = nDiasChuva + V(3);
end

nDiasSol
nDiasNuvens
nDiasChuva
