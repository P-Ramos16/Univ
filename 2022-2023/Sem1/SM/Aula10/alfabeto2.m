function [simbolos, frequencia] = alfabeto2(texto)
    n = 1;
    simbolos(n) = texto(1);
    frequencia(n) = sum(texto == simbolos(n));
    %  Para todos os simbolos não identificados, conta
    % quantos tem e faz a média
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

