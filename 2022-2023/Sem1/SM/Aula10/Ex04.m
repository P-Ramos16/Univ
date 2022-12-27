clear all;
load("Mensagem.mat");
numBits = numeroBits('AABCABABAAABBCABCAAC');
numBits

numBits = numeroBits(Mensagem);
numBits

%% 
%  Ao dar menos bits aos simbolos mais utilizados passamos
% de utilizar 1216 bits para apenas 901 bits (34% menos).