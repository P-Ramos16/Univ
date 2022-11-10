x=[1:5];
y=floor(2.*randn(1,5));
z = [100:-20:20]
M=[x;y;z]

c = {M M+M;
    M(:,1) M(3,:)}

% cell(rows, columns)
a = cell(3, 6)

% A(i,j) = {x}  adereçar vários
% A(i,j) = x    adereçar um

% B = {~,~,~,~, etc} => class(B) = 'cell'

% ismember(x, B);

% intersect(A, B);
% union(A, B);

% celldisp(B); => mostra as celulas uma por uma

% y = length(C);