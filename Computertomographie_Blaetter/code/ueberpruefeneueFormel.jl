function ueberpruefeneueFormel(Formel_neu)
A=[1 2; 3 4];
f = [1 2];
m = [-1 -2];

if Formel_neu(f,A,m) == (A[1,1]*f[1]+A[1,2]*f[2]-m[1])^2+(A[2,1]*f[1]+A[2,2]*f[2]-m[2])^2
    println("Eure Umformungen waren korrekt!");
    println("Wir müssen einzeln nach f_1 und f_2 ableiten. Im Ergebnis steht die Ableitung nach f_1 in der ersten und nach f_2 in der zweiten Zeile.");
    println("Das Ziel ist es hierfür wieder eine Kurzschreibweise zu finden. Fasst dafür euer Ergbnis soweit wie möglich zusammen.");
    println("Berechnet dafür transpose(A)*A*f und transpose(A)*m. Schaut, ob euch das bekannt vorkommt.");
    println("transpose(A) nennt man die Transponierte von A.");
    println("Macht all diese Schritte auf einem Papier.");
elseif Formel_neu(f,A,m) == sqrt((A[1,1]*f[1]+A[1,2]*f[2]-m[1])^2+(A[2,1]*f[1]+A[2,2]*f[2]-m[2])^2)
    println("Eure Formel ist noch nicht ganz gerecht. Bedenkt, dass ihr das Quadrat des Abstands berechnet.");
else
    println("Eure Formel stimmt noch nicht. Stellt sicher, dass ihr keine Rechenfehler bei der Matrix-Vektor-Multiplikation gemacht habt.");
end


end