format long

T = [0.9  0.5  0.5
     0.01 0.4  0.4
     0.09 0.1  0.1];

%estadoInicial = [0    1/2  0    1/2  0    0];
v = [0  0  1]';


matrizFinal  = (T^4)*v;
matrizFinal(1) % estado final = 1
matrizFinal(2) % estado final = 2
matrizFinal(3) % estado final = 3