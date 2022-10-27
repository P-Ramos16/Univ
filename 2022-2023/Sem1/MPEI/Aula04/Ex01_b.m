i = 1:1:6 %[1 2 3 4 5 6];


subplot(1, 2, 1);

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


subplot(1, 2, 2);

% Função distribuição acumulada (discreta) de X
PDistrix = cumsum(PMassax)
stairs([0 i 7], [0 PDistrix 1]);
title('Alinea 2b');
xlabel('Numeros que podem sair');
ylabel('A probabilidade de sair');
axis([0 7 0 1.25]);
grid on;