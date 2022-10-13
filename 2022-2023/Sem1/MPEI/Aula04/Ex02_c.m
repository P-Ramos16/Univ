i = 1:1:3

Px = [90/100 9/100 1/100];

% Função distribuição acumulada (discreta) de X
PDistrix = cumsum(Px)
stairs([0 i 4], [0 PDistrix 1]);
title('Alinea 2b');
xlabel('Numeros que podem sair');
ylabel('A probabilidade de sair');
axis([0 4 0 1.25]);
grid on;