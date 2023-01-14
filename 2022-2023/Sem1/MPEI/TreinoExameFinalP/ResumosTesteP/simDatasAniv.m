N=10e5;
diferentes=zeros(1,N);
for n=1:60
    M= randi(365, n, N); % inteiros de 1 a 365
    % verificar se houve repetição (1 ou mais)
    for i=1:N
        diferentes(i)= length(unique(M(:,i)));clc
    end
    colisoes=sum(diferentes~= n);
    pColisao=colisoes/N;
    fprintf(1,'n= %d, p=%.3f\n',n,pColisao);
end