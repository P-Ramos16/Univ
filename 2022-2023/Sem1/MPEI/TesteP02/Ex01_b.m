a = [0.2 0 0.3 0.1 0.45];

T = [0      0   0      0       0      0
     a(1)   0   0      0       0      0
     0      0   0      a(4)    a(5)   0
     0      0   a(3)   0       1-a(5) 0
     1-a(1) 1   1-a(3) 0       0      0
     0      0   0       1-a(4) 0      1];

v0 = [1 0 0 0 0 0]';

pIter1 = T*v0;
pEstado5Iter1 = pIter1(5)

v1 = [0 0 0 0 1 0]';
pIter2 = (T^2)*v1;
pEstado4Iter2 = pIter2(4)

v2 = [0 0 0 1 0 0]';
pIter3 = (T^3)*v2;
pEstadoMETAIter3 = pIter3(6)

pCaminhMaisPequeno = pEstado5Iter1*pEstado4Iter1*pEstadoMETAIter1