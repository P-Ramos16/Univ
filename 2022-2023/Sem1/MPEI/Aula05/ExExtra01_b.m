N = 1e6;      %  num experiencias
n = 8;     %  num chips
p1 = 0.2 / 100; %  Probabilidade do evento
p2 = 0.5 / 100; %  Probabilidade do evento
pa = 1 / 100;   %  Probabilidade do evento
pDefeito = p1 + p2 + pa;

                %  X: Uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito
                %  P(pa | A)

array   =  rand(n, N);
caixasComDefeitos = 0;
caixasComDefeitosMont = 0;

for col=1:N
    % array de 0 e 1 dependendo se tem defeito ou não
    arrayDefeitos = array(:,col) <= pDefeito;
    arrayDefeitosMont = array(:,col) <= pa;

    if sum(arrayDefeitos ~= 0)
        caixasComDefeitos = caixasComDefeitos + 1;
        if sum(arrayDefeitosMont ~= 0)
            caixasComDefeitosMont = caixasComDefeitosMont + 1;
        end
    end

end

ProbA = caixasComDefeitos / N
ProbDefeitoMontagem = caixasComDefeitosMont / N

ProbDefeitoMontQuandoA = ProbDefeitoMontagem / ProbA

