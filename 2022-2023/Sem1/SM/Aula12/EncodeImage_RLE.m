function Stream = EncodeImage_RLE(Image)
    % Transforma sequencias como AAAABBB em A4B3
    [n,m] = size(Image);    
    N = n;
    M = m;

    Stream = [];
    NumCharSeguidos = 1;

    % Tranformar a matrix num vetor
    Image = reshape(Image', 1, N*M);

    % Percorrer o vetor
    for x = 2:1:length(Image)
        %  Se o simbolo não for igual ao anterior
        % colocar quantos simbolos iguais foram contados
        if (Image(x) ~= Image(x-1))
            Stream = [Stream Image(x-1) NumCharSeguidos];
            NumCharSeguidos = 1;
        else
            %  Se o caracter for igual ao anterior,
            % incrementar o contador
            NumCharSeguidos = NumCharSeguidos + 1;
        end
    end
    %  Colocar o ultimo carater
    Stream = [Stream Image(length(Image)) NumCharSeguidos];

end

