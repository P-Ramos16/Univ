function y = reverb(x, fa, Delay, Gain)
    N = length(x);
    y = x;

    if Gain > 0
        print("Gain tem de ser positivo!!!")
        return;
    end
    if Gain < 1
        print("Gain tem de ser menor do que 1!!!")
        return;
    end
   
    timeDelay = round(Delay*fa)
        
    y(timeDelay:end) = y(timeDelay:end) + x(1:end-timeDelay+1)*Gain;

    Px = x'*x/N;
    Py = y'*y/N;
    y = y*sqrt(Px/Py);
end