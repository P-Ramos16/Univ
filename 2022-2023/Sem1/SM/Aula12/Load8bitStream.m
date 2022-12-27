function [N, M, Stream] = Load8bitStream(Filename)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
    file = fopen(Filename, 'rb');
    
    N = fread(file, 1, 'uint16');
    M = fread(file, 1, 'uint16');
    Stream = fread(file, inf, 'uint8');
    
    fclose(file);
end

