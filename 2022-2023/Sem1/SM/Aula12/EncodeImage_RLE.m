function Stream = EncodeImage_RLE(Image)
%SAVE8BITIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    [n,m] = size(Image);    
    N = n;
    M = m;

    Stream = [];
    NumCharSeguidos = 1;

    Image = reshape(Image', 1, N*M);

    for x = 2:1:length(Image)
        if (Image(x) ~= Image(x-1))
            Stream = [Stream Image(x-1) NumCharSeguidos];
            NumCharSeguidos = 1;
        else
            NumCharSeguidos = NumCharSeguidos + 1;
        end
    end

    Stream = [Stream Image(length(Image)) NumCharSeguidos];

end

