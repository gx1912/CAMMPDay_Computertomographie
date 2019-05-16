function Dateneinlesen(Dimension)
    x10 = -1.5; # kleinst möglicher x-Wert
    x20 = -1.5; # kleinst möglicher y-Wert
    N = Dimension; # Anzahl der betrachteten Parallelen Strahlen
    JJ = Dimension+1; # Anzahl der betrachteten Winkelschritte
    nx1 = Dimension; # Anzahl der Spalten
    nx2 = Dimension; # Anzahl der Zeilen
    x11 = x10+nx1; # größt möglicher x-Wert
    x21 = x20+nx2; # größt möglicher y-Wert
    verschx1 = 0.25; # Verschiebung x damit Strahlen nicht auf Kante liegen
    verschx2 = 0.25; # Verschiebung y damit Strahlen nicht auf Kante liegen
    a = -3.5; # für spätere Aufgabe
    b = 3.5; # für spätere Aufgabe
    laengenmatrix=zeros(N*JJ,size(nx1*nx2,1));
    theta1 = 0.0000001; #Referenzwinkel
    counter = 1;
    return x10,x20,N,JJ,nx1,nx2,x11,x21,verschx1,verschx2,a,b,laengenmatrix,theta1,counter;
    
end