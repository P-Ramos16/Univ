format long

matEstados = [0.7 0.8 
              0.3 0.2];

sum(matEstados);
matEstados >= 0 & matEstados <= 1;

vetEstado1 = [1  % estava presente no estado 1
              0];


matFinal = markov_estadoestacionario(matEstados, vetEstado1, 0.00001);

matFinal
