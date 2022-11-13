T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1];

estadoInicial = 1;
nena = 3; % Numero de estados nao absorventes

Q = T(1:nena, 1:nena);

R = T(nena+1:end, 1:nena);

% F = (I-Q)⁻1
F = inv(eye(nena) - Q);

B = R*F

B(1, estadoInicial)
B(2, estadoInicial)