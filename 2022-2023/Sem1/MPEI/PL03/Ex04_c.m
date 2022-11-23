p = 0.4;
q = 0.6;

T = [p^2      0  0  q^2
     (1-p)^2  0  0  q*(1-q)
     p*(1-p)  0  0  q*(1-q)     
     p*(1-p)  1  1  (1-q)^2 ];

sum(T);
T >= 0 & T <= 1;

M = [T - eye(size(T))
     ones(1, 4)];

b = [zeros(4, 1)
     1];

u = M\b

%  As probabilidades estabilizam após algumas transições, e a
% probabilidade limite não é afetada pelo estado inicial.