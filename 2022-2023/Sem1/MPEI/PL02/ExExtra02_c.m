N = 1e5;      %  num experiencias
p1 = 0.2 / 100; %  Probabilidade do evento
p2 = 0.5 / 100; %  Probabilidade do evento
pa = 1 / 100;   %  Probabilidade do evento
pDefeito = p1 + p2 + pa;

                %  X: Uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito

tic

ProbB = zeros(1, 19);
for n = 1:1:19     %  num chips

    array   =  rand(n + 2, N);
    caixasSemDefeitos = 0;
    
    for col=1:N
        % array de 0 e 1 dependendo se tem defeito ou não
        arrayDefeitos = array(:,col) <= pDefeito;
    
        if sum(arrayDefeitos) == 0
            caixasSemDefeitos = caixasSemDefeitos + 1;
        end
    end

    ProbB(n) = caixasSemDefeitos / N;

end

n = 1:1:19;
plot(n + 1, ProbB);
title('Alinea 3a');
xlabel('Numero de brinquedos na caixa');
ylabel('Probabilidade de nenhum brinquedo ter defeito');
axis([1 21 0 1]);
grid on;

toc

% 5 brinquedos no maximo para terem 90% de caixas sem defeito