function H = entropia(texto)
    [simbolos, frequencia] = alfabeto2(texto);
    I = zeros(1, length(simbolos));
    H = 0;
    for i = 1:1:length(simbolos)
        freqI = frequencia(i)/100;
        I = -log(freqI);
        H = H + freqI * I;
    end
end

