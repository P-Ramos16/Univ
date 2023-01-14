clear all;

numHashFunctions = 1500;
%seeds = randi((100), [numHashFunctions, 1], 'int16');  Unused
tic
[Set, Nu, users] = makeSets("u.data");
J = minHashFinal(Set, Nu, numHashFunctions);
getSimilarUsers(J, Nu, 0.4, users)
toc