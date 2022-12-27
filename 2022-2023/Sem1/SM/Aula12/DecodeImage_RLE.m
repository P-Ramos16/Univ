function Image = DecodeImage_RLE(N, M, Stream)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
        
    Image = [];    
    
    length(Stream)
    for x = 1:2:length(Stream)
        for numChar = 1:1:Stream(x+1)
            Image = [Image Stream(x)];
        end
    end
    Image = reshape(Image', M, N);
    Image = Image';
end

