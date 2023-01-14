format rational
%format short

npw = 5; % number of possible words
nws = 2; % number of words in a sequence
seq = zeros(nws,npw^nws); % all possible sequences will be kept here
seq(:,1) = 1;
 % first sequence
nc = 1;

 % number of columns of the block that will be replicated
for i=1:nws
    % replicate a block npw-1 times, and change the data of its i-th row
    for j=2:npw
        seq( : ,(j-1)*nc+1:j*nc ) = seq(:,1:nc); % copy a block
        seq( i ,(j-1)*nc+1:j*nc ) = j;
         % change its i-th row
    end
    nc = nc*npw; % increase the block size
end
has_one = sum(reshape(seq == 1,size(seq))) >= 1;
has_two = sum(reshape(seq == 2,size(seq))) >= 1;

has_one_and_two = sum([has_one; has_two], 1);

has_one_and_two = sum(has_one_and_two == 2)

res = has_one_and_two / sum(has_two)
