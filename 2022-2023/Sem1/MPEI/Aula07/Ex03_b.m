nEstados = 20;


matTransicao = rand(nEstados, nEstados) ;

for i = 1:1:20
    matTransicao(:,i) = matTransicao(:,i)/ sum(matTransicao(:,i));
end

sum(matTransicao);
matTransicao >= 0 & matTransicao <= 1;

V = zeros(nEstados, 1);
V(1) = 1;

T2 = matTransicao^2;
Vfinal2 = (T2(:,1))' * V * 100

T5 = matTransicao^5;
Vfinal5 = (T5(:,1))' * V * 100

T10 = matTransicao^10;
Vfinal10 = (T10(:,1))' * V * 100

T100 = matTransicao^100;
Vfinal100 = (T100(:,1))' * V * 100

%  Independentemente da probabilidade, a chance de estar no
% estado I após n iterações estabiliza sempre (após 5-10 iterações).