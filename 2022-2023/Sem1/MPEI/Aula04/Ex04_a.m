N = 1e5;      %  num experiencias
n = 5;        %  num roupas 
i = 0:1:n;
p = 0.3       %  Probabilidade do evento


                %  X: Num de roupas defeituosas observadas

array   =  rand(n, N);
         % array de tamanho 2 com numeros de 0 a 1

% array de quantas vezes aconteceu cada numero de coroas
% (se arrayProbs(1) for 3, quer dizer que em só 3 experiencias nao houve qualquer defeito)
arrayProbs = [0 0 0 0 0 0];

for col=1:N

    % array de 0 e 1 dependendo se tem defeito ou não
    defeitos = array(:,col) <= p;
    % numero de colunas 
    numDefeitos = sum(defeitos);

    arrayProbs(numDefeitos + 1) = arrayProbs(numDefeitos + 1) + 1;
end

PMassax = arrayProbs / N


stairs(i, cumsum(PMassax));
title('Alinea 4a');
xlabel('Numero de roupa');
ylabel('A probabilidade de ter uma defeituosa');
axis([0 5 0 1.25]);
grid on;

media = sum(i.*PMassax)
variancia = sum((i.^2).*PMassax) - media^2  % = var(i, PMassax)
desvio = sqrt(variancia)                    % = std(variancia)

P2Defeito = sum(PMassax) - PMassax(1) - PMassax(2)