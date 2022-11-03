nEstados = 20;

matTransicao = randfixedsum(nEstados, nEstados, 1, 0, 1);

matTransicao = rand(nEstados, nEstados) ;

matTransicao = matTransicao/ sum(matTransicao)

matTransicao

% repmat ?