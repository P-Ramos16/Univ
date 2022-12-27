function [simbolos, frequencia] = alfabeto1(texto)
    n = 1;
    simbolos(n) = texto(1);
    frequencia(n) = sum(texto == simbolos(n)) ;
    for i = 1:1:length(texto)
        if sum(texto(i)==simbolos) == 0
            n = n+1;
            simbolos(n) = texto(i);
            frequencia(n) = 1;
            frequencia(n) = sum(texto == simbolos(n)) ;
        end
    end
    frequencia = frequencia / length(texto) * 100;
end

