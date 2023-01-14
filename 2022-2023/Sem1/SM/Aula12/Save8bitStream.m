function Save8bitStream(Filename, N, M, Stream)
    %  Abre o ficheiro e guarda o tamanho da matriz
    % original. Guarda depois o Stream e fecha
    % o ficheiro.
    file = fopen(Filename, 'wb');    
    fwrite(file,N,'uint16');
    fwrite(file,M,'uint16');
    fwrite(file,Stream,'uint8');
    fclose(file);
end

