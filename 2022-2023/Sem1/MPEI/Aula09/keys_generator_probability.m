function [outList] = keys_generator_probability(N,imin,imax,alfabet)

    % Array de comprimentos
    comp = randi([imin, imax],1,N);
    outList = cell(N,1);
    
    for i = 1:N
        % Array dos indices dos alfabetos
        x = randi([1,10],1,comp(i));
        word = alfabet(x);
        %fprintf(1,'%3d, %3d - %s\n',i,comp(i),word)
        outList{i} = word;
    end

end

