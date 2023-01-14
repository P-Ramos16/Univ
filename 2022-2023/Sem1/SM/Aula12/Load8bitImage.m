function [N, M, Im] = Load8bitImage(Filename)
    %SAVE8BITIMAGE Abre o ficheiro e retira o N e o M
    % Após isto retira a variavel Image e fecha o ficheiro
    file = fopen(Filename, 'rb');
    
    N = fread(file, 1, 'uint16');
    M = fread(file, 1, 'uint16');
    Im = fread(file, [N,M], 'uint8');
    
    fclose(file);
end
