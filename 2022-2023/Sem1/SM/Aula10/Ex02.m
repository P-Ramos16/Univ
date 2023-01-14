clear all;
load("Mensagem.mat");
[simbolos, frequencia] = alfabeto2(Mensagem);

length(Mensagem)
simbolos
frequencia

stem(1:length(simbolos), frequencia);
axis([0 length(simbolos)+1 0 50])