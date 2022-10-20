N = 1e4;      %  num experiencias
n = 8000;     %  num chips
p = 1 / 1000; %  Probabilidade do evento


                %  X: Num de roupas defeituosas observadas

array   =  rand(n, N);
         % array de tamanho 2 com numeros de 0 a 1

% array de quantas vezes aconteceu cada numero de coroas
% (se arrayProbs(1) for 3, quer dizer que em só 3 experiencias nao houve qualquer defeito)
arrayProbs = zeros(1, 25);

for col=1:N

    % array de 0 e 1 dependendo se tem defeito ou não
    defeitos = array(:,col) <= p;
    % numero de colunas 
    numDefeitos = sum(defeitos);

    arrayProbs(1, numDefeitos + 1) = arrayProbs(1, numDefeitos + 1) + 1;
end

ProbA = arrayProbs(1, 7 + 1)/ N


Pk = (8000*7999*7998*7997*7996*7995*7994 / (7*6*5*4*3*2)) * p^7 * (1-p)^7993
