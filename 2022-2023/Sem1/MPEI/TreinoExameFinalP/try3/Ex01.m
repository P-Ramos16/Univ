clear all

B = 0;

T = [0.01  0    0.07  0.02
     0.04  0    B     0.08
     0.04  0    0.15  0.09
     0.01  0    0.20  0.01];

B = 1 - sum(T, 'all')

T(2,3) = B;

probsX = sum(T,2);
probsY = sum(T);

%% Média e variancia
valsX = [1, 2, 3, 4];
Ex = sum(valsX * probsX(:));
Ex2 = sum(valsX.^2 * probsX(:))
Varx = Ex2 - Ex^2

valsY = [0, 1, 2, 3];
Ey = sum(valsY * probsY(:))
Ey2 = sum(valsY.^2 * probsY(:));
Vary = Ey2 - Ey^2

%% Correlação, covariancia e coeficiente de correlação
% E[XY]
t = size(T)
lenX = t(1)
lenY = t(2)
corrXY = 0;

for i = 1:1:lenX
    for j = 1:1:lenY
        corrXY = corrXY + valsX(i) * valsY(j) * T(i, j);
    end
end

corrXY

% E[XY] - E[X]E[Y]
covxy = corrXY - Ex*Ey


