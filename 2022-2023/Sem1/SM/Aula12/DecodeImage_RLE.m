function Image = DecodeImage_RLE(N, M, Stream)
    %  Repete os números guardados no Stream e
    % copia-os para a Imagem
    Image = [];    
    
    length(Stream)
    % Lẽ qual o caracter
    for x = 1:2:length(Stream)
        % Lẽ quantas vezzes tem de escreve-lo
        for numChar = 1:1:Stream(x+1)
            % Coloca no vetor final
            Image = [Image Stream(x)];
        end
    end
    % Transforma o vetor no arra com as dimensões certas
    Image = reshape(Image', M, N);
    Image = Image';
end

