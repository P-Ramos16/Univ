function [NumBits,NumBPS] = GeraMensagem(f, compMesg, nBits)
    %GERAMENSAGEM Summary of this function goes here
    %   Detailed explanation goes here

    NumBits = 0;
    for nSimb = 1:1:compMesg

        NumBits = NumBits + nBits(find(rand<cumsum(f), 1, 'first'));   
        
    end

    NumBPS = NumBits / compMesg;

end

