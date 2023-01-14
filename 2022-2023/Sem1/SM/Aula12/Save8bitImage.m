function Save8bitImage(Filename,Image)
    % SAVE8BITIMAGE Abre o ficheiro e coloca o N e o M
    % Após isto guarda a variavel Image e fecha o ficheiro
    file = fopen(Filename, 'wb');
    [n,m] = size(Image);
    
    N = uint16(n);
    M = uint16(m);
    
    fwrite(file,N,'uint16');
    fwrite(file,M,'uint16');
    fwrite(file,Image,'uint8');
    fclose(file);
end

