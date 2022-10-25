function [X, f] = espetro(x, Ta)

    X = fft(x);



     fa = 1 / Ta;
     f = -fa/2:Ta:fa/2;
%     f0 = 1 / T0;
%     t = (0: (N-1))'*Ta;
%     N = length(x);
% 
%     z=zeros(1,Ta);
%     Sum=0;
% 
%     for k=1:Ta
%         for jj=1:N
%             Sum=Sum+x(jj)*exp(-2*pi*j*(jj-1)*(k-1)/Ta);
%         end
%     z(k)=Sum;
%     Sum=0;% Reset



end