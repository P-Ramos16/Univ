function [N, M, Im] = Load8bitImage(Filename)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
    file = fopen(Filename, 'rb');
    
    N = fread(file, 1, 'uint16');
    M = fread(file, 1, 'uint16');
    Im = fread(file, [N,M], 'uint8');
    
    fclose(file);
end

