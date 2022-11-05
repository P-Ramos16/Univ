clear all;
%% VALORES INICIAIS
Ta = 0.001;
F0 = 0.5;
Np = 2;

Vamp = [20 16 10];
Vfreq = [1.5 3.5 4.5];
Vfas = [-2*pi/3  2*pi/3  pi/4];
%% T_F = 1
T_F = 1;

[y, x] = tempo_frequencia(T_F, Ta, F0, Np, Vamp, Vfreq, Vfas);
figure(1);
p = plot(x, y, 'r');
p(1).LineWidth = 2;

title('Alinea d');
xlabel('Tempo (s)');
ylabel('y');
legend("y(t)");
grid on;
%% T_F = 2
T_F = 2;

[y, x] = tempo_frequencia(T_F, Ta, F0, Np, Vamp, Vfreq, Vfas);
figure(2);
p = plot(x, abs(y), 'b');
p(1).LineWidth = 2;

title('Alinea d');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
axis([-6 6 0 11]);
legend("A(f)");
grid on;

%% T_F != 1,2

T_F = 3;

[y, x] = tempo_frequencia(T_F, Ta, F0, Np, Vamp, Vfreq, Vfas);



