format long

matEstados = [0   0.5 0   0
              1   0   0.6 0.6
              0   0   0   0.4
              0   0.5 0.4 0  ];


vetEstado1 = [0.25; 0.25; 0.25; 0.25];

matFinal = markov_estadoestacionario(matEstados, vetEstado1, 0.00001);

matFinal

 % método algébrico
 N = length(matEstados);
 M = [matEstados-eye(N); ones(1,N)];
 
 res= zeros(N+1,1);
 res(N+1) = 1
 
 x_est= M\res
  