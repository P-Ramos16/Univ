function Save8bitImage(Filename,Image)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    file = fopen(Filename, 'wb');
    [n,m] = size(Image);
    
    N = uint16(n);
    M = uint16(m);
    
    fwrite(file,N,'uint16');
    fwrite(file,M,'uint16');
    fwrite(file,Image,'uint8');
    fclose(file);
end

