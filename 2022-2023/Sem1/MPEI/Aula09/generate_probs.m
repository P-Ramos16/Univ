function [outList] = generate_probs(N,imin,imax,alfabet, probs)

    % Array de comprimentos
    comp = randi([imin, imax],1,N);
    outList = cell(N,1);
    
    for i = 1:N
        % Array dos indices dos alfabetos
        % nums de 1 a len. alfabeto num vetor de tamanho comp(i)
        word = "";
        for k = 1:comp(i)       
            r = rand;
            x = sum(r >= cumsum([0, probs]));
            word = word + alfabet(x);
        end

        %fprintf(1,'%3d, %3d - %s\n',i,comp(i),word)
        outList{i} = word{1};
    end

end

