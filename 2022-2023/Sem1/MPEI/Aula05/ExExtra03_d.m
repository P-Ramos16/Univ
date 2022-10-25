N = 1e5;      %  num experiencias
n = 16;        %  num chips
p1 = 0.2 / 100; %  Probabilidade do evento
p2 = 0.5 / 100; %  Probabilidade do evento
pa = 1 / 100;   %  Probabilidade do evento
pDefeito = p1 + p2 + pa;


array   =  rand(n, N); % é o mesmo disto: ceil(rand(n,N) * m);
         % array de tamanho 2 com numeros de 0 a 1

% array de quantas vezes aconteceu cada numero de coroas
arrNumDefeitos = zeros(1, n + 1);

for col=1:N
        % array de 0 e 1 dependendo se tem defeito ou não
        arrayDefeitos = array(:,col) <= pDefeito;
    
        numDefeitos = sum(arrayDefeitos);
    
        arrNumDefeitos(numDefeitos + 1) = arrNumDefeitos(numDefeitos + 1) + 1;
end

PMassax = arrNumDefeitos / N

PxMaior2 = sum(PMassax(3:1:n+1)) % Muito improvável haver mais de 1 brinquedo defeituoso por caixa

n = 0:1:n;
media = sum(n.*PMassax)
variancia = sum((n.^2).*PMassax) - media^2  % = var(i, PMassax)
desvio = sqrt(variancia)     

stem(n, PMassax);
title('Alinea 3a');
xlabel('Numero de coroas');
ylabel('Probabilidade de sair esse numero de coroas');
axis([-0.5 16.5 0 1]);
grid on;

% Maior probabilidade de cada caixa ter pelo menos um brinquedo com defeito