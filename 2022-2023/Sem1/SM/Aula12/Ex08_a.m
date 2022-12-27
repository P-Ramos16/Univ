dict = ["A", "I", "L"];
str = "LALAALAILAILAI";
nBits = 3;

i = 1;
finalCode = [];
strSize = strlength(str);

while i < strSize-1  
    seqSize = 2;
    subStr = extractBetween(str, i, i+1);
    while ismember(subStr, dict) && (seqSize+i-1 < strSize)
        seqSize = seqSize + 1;
        subStr = extractBetween(str, i, seqSize+i-1);
        i = i + 1;
    end
    i = i + 1;

    dict = [dict subStr];
    exit = extractBetween(subStr, 1, strlength(subStr) - 1);
    finalCode = [finalCode find(dict==exit)];
end
% Final Sequence
exit = extractBetween(str, strSize-1, strSize);
finalCode = [finalCode find(dict==exit)];


finalCode