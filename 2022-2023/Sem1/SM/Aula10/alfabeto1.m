function simbolos = alfabeto1(texto)
    n = 1;
    simbolos(n) = texto(1); 
    for i = 1:1:length(texto)
        if sum(texto(i)==simbolos) == 0
            n = n+1;
            simbolos(n) = texto(i);
        end
    end
end

