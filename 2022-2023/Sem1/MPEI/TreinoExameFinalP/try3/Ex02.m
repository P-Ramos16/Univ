T = [0.84  0.1  0    0.5
     0.1   0.7  0    0.1
     0.05  0.1  0.8  0.1
     0.01  0.1  0.2  0.3];

v = [1  2  10 5]';
nTrocas = 7;

matFinal = (T^nTrocas)*v 0

matUltimate = zeros(4, 100);
Dmenos2 = 0;

for i = 1:1:100
    matUltimate(:,i) = (T^i)*v;
    if matUltimate(4,i) < 2 && Dmenos2 == 0
        Dmenos2 = 1
        fprintf("Dia 14 do mes %i", i);
    end
end

matUltimate(:,100)

hold on
plot(1:1:100, matUltimate(1,:));
plot(1:1:100, matUltimate(2,:));
plot(1:1:100, matUltimate(3,:));
plot(1:1:100, matUltimate(4,:));
hold off

legend("Angola", "Brasil", "Chile", "Dinamarca")

axis([0 100 0 10]);