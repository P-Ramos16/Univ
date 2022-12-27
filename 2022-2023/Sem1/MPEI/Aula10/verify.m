function belongs = verify(bitArr, k, element)
    %INSERT Summary of this function goes here
    %   Detailed explanation goes here
    key = element;

    bitArrSize = size(bitArr);
    bitArrSize = bitArrSize(2);

    for funcK = 1:1:k
        key = strcat(key, int2str(i));
        hashVal = mod(string2hash(key), bitArrSize-1)+1;
        if (bitArr(hashVal) == 0)
            belongs = false; 
            return
        end
    end
    
    belongs = true; 
    return
end

