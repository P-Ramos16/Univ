function [y_t_f, t_f] = tempo_frequencia(T_F, Ta, F0, Np, Vamp, Vfreq, Vfas)
    
    y_t_f = 0;
    t_f = 0;
    Y = 0;
    
    tempo = 0:Ta:Np*(1/F0);

    for i = 1:length(Vamp)
        Y = Y + ( Vamp(i) * sin(2*pi*Vfreq(i)*tempo + Vfas(i)));
    end


    if T_F == 1
        % Sinal no tempo    
        y_t_f = Y;
        t_f = 0:Ta:Np*(1/F0);

    elseif T_F == 2
        % Sinal na frequência
        N = length(Y);  
        Fa = 1/Ta;
        df = Fa/N;
        
        y_t_f = fftshift(fft(Y)) / N;
        t_f = (0:N-1)*df-(Fa/2);

    
    else
        fprintf("T_F deverá ter valores de 1 ou 2\n")
        y_t_f = 0;
        t_f = 0;
    end

end

