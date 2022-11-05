T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4];

% variável de Bernoulli (Sol / Não Sol)
nDiasSol = 1;
nDiasNuvens = 0;
nDiasChuva = 0;
V = [1 0 0]';

for dia = 2:31
    V = T * V;
    nDiasSol = nDiasSol + V(1);
    nDiasNuvens = nDiasNuvens + V(2);
    nDiasChuva = nDiasChuva + V(3);
end

nDiasDorSol = nDiasSol * 0.1 + nDiasNuvens * 0.3 + nDiasChuva * 0.5


nDiasSol = 0;
nDiasNuvens = 0;
nDiasChuva = 1;
V = [1 0 0]';

for dia = 2:31
    V = T * V;
    nDiasSol = nDiasSol + V(1);
    nDiasNuvens = nDiasNuvens + V(2);
    nDiasChuva = nDiasChuva + V(3);
end

nDiasDorChuva = nDiasSol * 0.1 + nDiasNuvens * 0.3 + nDiasChuva * 0.5

%  Irá existir diferença entre o nũmero medio de dias com
% dores dependendo do tempo do primeiro dia, apesar de pequena