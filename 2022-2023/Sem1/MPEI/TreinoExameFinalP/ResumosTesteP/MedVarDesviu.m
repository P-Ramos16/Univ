n = 3;        %  num roupas 
i = 0:1:n;
p = 0.3       %  Probabilidade do evento

% array de quantas vezes aconteceu cada numero de coroas
% (se arrayProbs(1) for 3, quer dizer que em só 3 experiencias nao houve qualquer defeito)
arrayProbs = [1/6 1/6 1/3 1/3];

PMassax = arrayProbs


stairs(i, cumsum(PMassax));
title('Alinea 4a');
xlabel('Numero de roupa');
ylabel('A probabilidade de ter uma defeituosa');
axis([0 3.05 0 1.05]);
grid on;

media = sum(i.*PMassax)
variancia = sum((i.^2).*PMassax) - media^2  % = var(i, PMassax)
desvio = sqrt(variancia)                    % = std(variancia)

P2Defeito = sum(PMassax) - PMassax(1) - PMassax(2)