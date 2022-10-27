N = 1e5;      %  num experiencias
n = 1000;       %  lançamentos
m = 100000;      %  num alvos
ns = 10:10:100;
res = [];
                
             %  A: Um alvo ser atingido mais de uma vez            


for n = ns
    lancamentos   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);

    colDiferentes = zeros(1, N);  %  Alocar espaço

    for col=1:N
        colDiferentes(col) = length(unique(lancamentos(:,col))) < n;
                  % tamanho do vetor de numeros unicos é igual a n
    end

    res = [res sum(colDiferentes) / N];
end

subplot(1, 2, 1)  % GRAFICO ERRADO
plot(ns, res, 'r*-'), xlabel('n'), ylabel('prob'), title('m = 1000')

subplot(1, 2, 2)
plot(ns, res, 'r*-'), xlabel('n'), ylabel('prob'), title('m = 100000')
