N = 1e5;      %  num experiencias
n = 10;       %  num keys 
m = 1000;     %  tamanho do array
res = [];


array   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);
         % array de tamanho 10 com numeros de 1 a 1000 (posições)
colIguais = zeros(1, N);  %  Alocar espaço

for col=1:N
    colIguais(col) = length(unique(array(:,col))) < n;
              % tamanho do vetor de numeros unicos é menor a n
end

ProbA = sum(colIguais) / N