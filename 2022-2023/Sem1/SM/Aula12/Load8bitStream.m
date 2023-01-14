function [N, M, Stream] = Load8bitStream(Filename)
    %  Abre o ficheiro e retira o tamanho da matriz
    % original. Retira depois o Stream e fecha
    % o ficheiro.
    file = fopen(Filename, 'rb');    
    N = fread(file, 1, 'uint16');
    M = fread(file, 1, 'uint16');
    Stream = fread(file, inf, 'uint8');
    
    fclose(file);
end

