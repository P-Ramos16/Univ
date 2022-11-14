p = 0.4;
q = 0.6;

format rat

T = [p^2      0  0  q^2
     (1-p)^2  0  0  q*(1-q)
     p*(1-p)  0  0  q*(1-q)     
     p*(1-p)  1  1  (1-q)^2 ]

sum(T);
T >= 0 & T <= 1;