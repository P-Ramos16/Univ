clear all;

[Set, Nu, users] = makeSets("u.data");
J = getDistances(Set, Nu);
getSimilarUsers(J, Nu, 0.4, users)