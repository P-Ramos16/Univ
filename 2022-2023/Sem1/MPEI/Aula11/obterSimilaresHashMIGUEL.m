function SimilarUsers = obterSimilaresHash(users,assinaturas,threshold,numHash)
%OBTERSIMILARESHASH Summary of this function goes here
%   Detailed explanation goes here

Nu = length(users);
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= zeros(1,3);
k= 1;

h = waitbar(0,'Calculating');
tic
for n1= 1:Nu
    for n2= n1+1:Nu
        distancia = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/numHash;
        if  distancia < threshold
            SimilarUsers(k,:)= [n1 n2 distancia];
            k= k+1;
        end
    end
end
toc
delete(h);

end

