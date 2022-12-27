function Save8bitStream(Filename, N, M, Stream)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    file = fopen(Filename, 'wb');    
    fwrite(file,N,'uint16');
    fwrite(file,M,'uint16');
    fwrite(file,Stream,'uint8');
    fclose(file);
end

