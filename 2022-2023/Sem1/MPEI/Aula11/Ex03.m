clear all;

[Set, Nu, users] = makeSets("u.data");
J = getDistances(Set, Nu);
getSimilarUsers(J, Nu, 0.7, users)