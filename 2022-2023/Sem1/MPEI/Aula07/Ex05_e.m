T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4];

% variável de Bernoulli (Sol / Não Sol)
nDiasSol = 1;
nDiasNuvens = 0;
nDiasChuva = 0;
V = [0 0 1]';

for dia = 2:31
    V = T * V;
    nDiasSol = nDiasSol + V(1);
    nDiasNuvens = nDiasNuvens + V(2);
    nDiasChuva = nDiasChuva + V(3);
end

nDiasSol
nDiasNuvens
nDiasChuva


%  Conclui-se que, após alguns dias, o número médio de dias de 
% sol, nuvens e chuva fica quase independente do estado do dia inicial