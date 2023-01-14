function matrizEstadoVelha = markov_estadoestacionario(MatrizT, EstadoInicial, Limiar)

    nEstados = length(EstadoInicial);
    
    %  Caso sejam inseridos apenas 1 argumento.
    if nargin == 1
        EstadoInicial = ones(nEstados, 1) / nEstados;
        Limiar = 1e-5;
    end

    matrizEstadoVelha = EstadoInicial;
    matrizEstadoNova = MatrizT * EstadoInicial;
    N = 1;

    probEstado2 = [EstadoInicial(2)];

    while max(abs(matrizEstadoVelha - matrizEstadoNova)) >= Limiar
        matrizEstadoVelha = matrizEstadoNova;
        matrizEstadoNova = MatrizT * matrizEstadoVelha;

        %  Se todas excederem, corta a execução
%         if sum(diffMatrizes(:) < Limiar) == nEstados && N ~= 2
%             break;
%         end
        probEstado2 = [probEstado2 matrizEstadoNova(2)];
        N = N + 1;
    end
    plot(1:N, probEstado2);
    axis([0 N 0 1]);
end

