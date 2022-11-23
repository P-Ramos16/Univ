load('L.mat')

saidas = sum(L);
H = L./saidas;
H(isnan(H)) = 0;
H