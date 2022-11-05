nEstados = 20;


matTransicao = rand(nEstados, nEstados) ;

for i = 1:1:20
    matTransicao(:,i) = matTransicao(:,i)/ sum(matTransicao(:,i));
end

matTransicao
% repmat ?