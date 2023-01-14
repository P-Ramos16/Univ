f = [0.14, 0.64, 0.05, 0.1, 0.07];
compMesg = 1000;
nBits = [2, 1, 4, 3, 4];

timesToTest = 100;
results = 0;

for x = 1:1:timesToTest
    [NumBits,NumBPS] = GeraMensagem(f, compMesg, nBits);
    results = results + NumBits;
end

res = results / timesToTest