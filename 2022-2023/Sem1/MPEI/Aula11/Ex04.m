clear all;

[Set, Nu, users] = makeSets("u.data");
J = getDistances_MinHash(Set, Nu);
getSimilarUsers(J, Nu, 0.4, users)