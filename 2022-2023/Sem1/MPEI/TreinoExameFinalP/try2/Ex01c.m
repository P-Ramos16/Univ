format long

T = [0.9  0.5  0.5
     0.01 0.4  0.4
     0.09 0.1  0.1];

%estadoInicial = [0    1/2  0    1/2  0    0];
v = [0  0  1]';

Limiar = 0.001;

nEstados = length(v);


matrizEstadoVelha = T;
N = 1;

while 1
    matrizEstadoNova = (T^N) * v;
    diffMatrizes = abs(matrizEstadoNova - matrizEstadoVelha);

    %  Se todas excederem, corta a execução
    if sum(diffMatrizes(:) < Limiar) == nEstados && N ~= 2
        break;
    end
    N = N + 1;
    matrizEstadoVelha = matrizEstadoNova;
end

matrizEstadoVelha
matrizEstadoVelha(2) + matrizEstadoVelha(3)