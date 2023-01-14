format long

matEstados = [0   0.5 0   0
              1   0   0.6 0.6
              0   0   0   0.4
              0   0.5 0.4 0  ];


vetEstado1 = [0; 1; 0; 0];

matFinal = markov_estadoestacionario(matEstados, vetEstado1, 0.00001);

matFinal

% Continuam a convergir para o mesmo número