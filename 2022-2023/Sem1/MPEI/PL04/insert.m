function bitArr = insert(bitArr, k, element, reviews)
    %INSERT Summary of this function goes here
    %   Detailed explanation goes here
    numVezesAInserir = 0;

    bitArrSize = size(bitArr);
    bitArrSize = bitArrSize(2);

    for i = 1:1:length(reviews)
        if reviews(i) >= 3
            numVezesAInserir = numVezesAInserir + 1;
        end
    end    

    % Transforma cada carater do nome do elemento em double e soma todos
    key = element;

    for funcK = 1:1:k
        key = append(key, int2str(funcK));
        hashVal = rem(DJB31MA(key, 255), bitArrSize) + 1;
        bitArr(hashVal) = bitArr(hashVal) + numVezesAInserir;
    end
end

