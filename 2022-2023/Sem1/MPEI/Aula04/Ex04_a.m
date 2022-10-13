N = 1e5;      %  num experiencias
n = 5;        %  num roupas 
i = 0:1:n;


                %  X: Num de roupas defeituosas observadas

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

PMassax = arrayProbs / N;

toc

media = sum(i.*PMassax)
variancia = sum((i.^2).*PMassax) - media^2  % = var(i, PMassax)
desvio = sqrt(variancia)                    % = std(variancia)