function numBits = numeroBits(texto)
    [simbolos, frequencia] = alfabeto2(texto);
    numBits = 0;
    orderBits = sort(frequencia, "descend"); % ordenar por frequencia, assim
                                             % os mais frequentes tem menos bits
    for i = 1:1:length(simbolos)
        numBits = numBits + i * (length(texto) * orderBits(i) / 100);
    end
end

%% EXISTE OUTROS CÓDIGOS