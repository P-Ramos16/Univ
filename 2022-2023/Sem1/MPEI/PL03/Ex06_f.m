T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1];

nena = 3; % Numero de estados nao absorventes

Q = T(1:nena, 1:nena);


% F = (I-Q)⁻1
F = inv(eye(nena) - Q);

format short

sumsF = sum(F);

transAntesAbsor1 = sumsF(1)
transAntesAbsor2 = sumsF(2)
transAntesAbsor4 = sumsF(3)
