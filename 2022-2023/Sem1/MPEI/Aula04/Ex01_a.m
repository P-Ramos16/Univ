i = 1:1:6 %[1 2 3 4 5 6];



% Função massa de probabilidade de X
PMassax = ones(1,6)/6; 
% cria um vetor 1 por 6 cheio de uns e
% divide os por 6 => [1/6 1/6 1/6 1/6 1/6 1/6]

stem(i, PMassax);
title('Alinea 2a');
xlabel('Numeros que podem sair');
ylabel('A probabilidade de sair');
axis([0 7 0 0.25]);
grid on;
