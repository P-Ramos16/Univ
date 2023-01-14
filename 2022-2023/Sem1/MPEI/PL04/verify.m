function value = verify(bitArr, k, element)
    %INSERT Summary of this function goes here
    %   Detailed explanation goes here

    bitArrSize = size(bitArr);
    bitArrSize = bitArrSize(2);
    value = 0;

    % Transforma cada carater do nome do elemento em double e soma todos
    %key = sum(double(char(element)));

    key = element;

    numsStored = zeros(k, 1);

    for funcK = 1:1:k
        key = append(key, int2str(funcK));
        hashVal = rem(DJB31MA(key, 255), bitArrSize) + 1;
        numsStored(funcK) = bitArr(hashVal);
    end
    
    value = min(numsStored);

    return
end

