N = 1e5;      %  num experiencias
n = 4;        %  num lançamentos 
i = 0:1:4


                %  X: Num de coroas observadas

tic
array   =  rand(n, N); % é o mesmo disto: ceil(rand(n,N) * m);
         % array de tamanho 2 com numeros de 0 a 1

% array de quantas vezes aconteceu cada numero de coroas
arrayProbs = [0 0 0 0 0];

for col=1:N

    % array de 0 e 1 dependendo se foi coroa ou não
    coroas = array(:,col) < 0.5;
    % numero de colunas 
    numCoroas = sum(coroas);

    arrayProbs(numCoroas + 1) = arrayProbs(numCoroas + 1) + 1;
end

PMassax = arrayProbs / N

stem(i, PMassax);
title('Alinea 3a');
xlabel('Numero de coroas');
ylabel('Probabilidade de sair esse numero de coroas');
axis([-1 5 0 0.5]);
grid on;
toc