function SimilarUsers = getSimilarNames(J, Nu, threshold, dicFilms)
    %% Com base na distância, determina pares com
    %% distância inferior a um limiar pré-definido
        
    % Array para guardar pares similares (user1, distância)
    SimilarUsers= zeros(1,2);
    k= 1;
    for n1 = 1:Nu
        for n2 = n1+1:1:Nu
            if dicFilms{n1, 1}(1) == dicFilms{n2,1}(1)
                continue;
            end
            if J(n1, n2) < threshold
                SimilarUsers(k,:) = [n1 n2];
                k = k+1;
            end
        end
    end
end

