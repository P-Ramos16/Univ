function [f, t] = fourier(Ta, f0, Np, ak, bk) 
    % Ta = 0.001; % perioddo de amostragem
    % f0 = 1;
    
    T = 1 / f0;
    
    % Num amostras = periodos a considerar * num pontos
    N = round(Np * T / Ta);
    % Lista dos tempos dos pontos
    t = (0:1:(N-1)) * Ta;
    
    % f = [0 0 0]
    f = zeros(1, N);
    
    for k = 1:length(ak)
        % primeiro ciclo >  [0 0 0] + [cos(1 * t1)  cos(1 * t2)  cos(1 * t3)] 
        %  segundo ciclo >  [cos(1 * t1)  cos(1 * t2)  cos(1 * t3)]  + [cos(2 * t1)  cos(2 * t2)  cos(2 * t3)]
        % ...
        f = f + ak(k) * cos(2*pi*(k-1)*f0*t) + bk(k) * sin(2*pi*(k-1)*f0*t);
    end

end