clear all;
n = 8000;
m = 1000;       % Palavras a inserir
maxSize = 10000;% Palavras a verificar

C = importdata("wordlist-preao-20201103.txt");
arrFalsePos = zeros(1, 20);
for l = 1:1:20
    k = l;
    F = initialize(n, k);
    
    for i = 1:1:m
        F = insert(F, k, C{i});
    end
    
    numFalsePos = 0;
    
    %maxSize = size(C);
    %maxSize = maxSize(1)
    
    for i = m:1:maxSize
        belongs = verify(F, k, C{i});
        if (belongs == true)
            numFalsePos = numFalsePos + 1;
        end
    end
    
    numFalsePos;
    arrFalsePos(l) = numFalsePos / (maxSize-m);
end

plot(1:20, arrFalsePos)
xlabel("Num. Hash Functions");
ylabel("Percentage of False Positives");