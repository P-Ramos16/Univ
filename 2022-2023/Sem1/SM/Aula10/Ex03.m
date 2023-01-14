clear all;
load("Mensagem.mat");

[simbolos, frequencia] = alfabeto2(Mensagem);
numBits = 0;
orderBits = sort(frequencia, "descend"); % ordenar por frequencia, assim
                                         % os mais frequentes tem menos bits
% Se tiver 6 simbolos, numBits é 4 * numero de cada vez que cada simbolo
% aparece. (leng(msg)*percentagem desse simbolo).
for i = 1:1:length(simbolos)
    numBits = numBits + 4 * (length(Mensagem) * orderBits(i) / 100);
end

numBits