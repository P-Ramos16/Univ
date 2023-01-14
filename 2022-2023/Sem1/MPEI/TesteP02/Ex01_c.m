a = [0.2 0 0.3 0.1 0.45];

T = [0      0   0      0       0      0
     a(1)   0   0      0       0      0
     0      0   0      a(4)    a(5)   0
     0      0   a(3)   0       1-a(5) 0
     1-a(1) 1   1-a(3) 0       0      0
     0      0   0       1-a(4) 0      1];


estadoInicial = 1;

nena = 5; % Numero de estados nao absorventes

Q = T(1:nena, 1:nena);

% F = (I-Q)⁻1
F = inv(eye(nena) - Q);

sum(F(:,estadoInicial))+1