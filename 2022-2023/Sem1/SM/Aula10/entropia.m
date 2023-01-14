function H = entropia(texto)
    % entropia = quantidade de informação em bits/simbolo (bps) (CORRETO, SIM)
    %  Entropia é a soma de -log(freq simbolos) * freq simbolo
    % para todos os simbolos
    [simbolos, frequencia] = alfabeto2(texto);
    I = zeros(1, length(simbolos));
    H = 0;
    for i = 1:1:length(simbolos)
        freqI = frequencia(i)/100;
        I = -log2(freqI);
        H = H + freqI * I;
    end
end

