function ueberpruefeMatrixVektorb(A,m)

Akorrekt = [1 0 0 1 0 0 1 0 0;
            0 1 0 0 1 0 0 1 0;
            0 0 1 0 0 1 0 0 1;
            1 1 1 0 0 0 0 0 0;
            0 0 0 1 1 1 0 0 0;
            0 0 0 0 0 0 1 1 1;
            sqrt(2) 0 0 0 sqrt(2) 0 0 0 sqrt(2)];
 
mkorrekt = [13 8 3 6 7 11 3*sqrt(2)];

# homogene Lösungen berechnen
homogenkorrekt = nullspace(Akorrekt);

# inhomogene Lösung berechnen
inhomogenkorrekt = pinv(Akorrekt)*mkorrekt';

homogen = nullspace(A);
inhomogen = pinv(A)*m';

u1 = homogen[:,1];
u2 = homogen[:,2];
u3 = homogen[:,3];
p = inhomogen;

Vergleich = Akorrekt'*mkorrekt';
VergleichSuS = A'*m';

if round(norm(Vergleich);digits=2) == round(norm(VergleichSuS);digits=2)
    println("Eure Matrix und euer Vektor sind korrekt!")
    println("Die Lösung eures Gleichungssystems lautet wie folgt, wobei a,b und c beliebige relle Zahl ist.")
    q = round.(p;digits=2);
    v1 = round.(u1;digits=2);
    v2 = round.(u2;digits=2);
    v3 = round.(u3;digits=2);
    print("Für f1 lautet die Lösung: ", q[1], " + a * ", v1[1], " + b * ", v2[1], " + c * ", v3[1],"\n")
    print("Für f2 lautet die Lösung: ", q[2], " + a * ", v1[2], " + b * ", v2[2], " + c * ", v3[2],"\n")
    print("Für f3 lautet die Lösung: ", q[3], " + a * ", v1[3], " + b * ", v2[3], " + c * ", v3[3],"\n")
    print("Für f4 lautet die Lösung: ", q[4], " + a * ", v1[4], " + b * ", v2[4], " + c * ", v3[4],"\n")
    print("Für f5 lautet die Lösung: ", q[5], " + a * ", v1[5], " + b * ", v2[5], " + c * ", v3[5],"\n")
    print("Für f6 lautet die Lösung: ", q[6], " + a * ", v1[6], " + b * ", v2[6], " + c * ", v3[6],"\n")
    print("Für f7 lautet die Lösung: ", q[7], " + a * ", v1[7], " + b * ", v2[7], " + c * ", v3[7],"\n")
    print("Für f8 lautet die Lösung: ", q[8], " + a * ", v1[8], " + b * ", v2[8], " + c * ", v3[8],"\n")
    print("Für f9 lautet die Lösung: ", q[9], " + a * ", v1[9], " + b * ", v2[9], " + c * ", v3[9],"\n")
    #show(stdout,"text/plain",round.(p;digits=2))
    #show(stdout,"text/plain",round.(u1;digits=2))
    #show(stdout,"text/plain",round.(u2;digits=2))
    #show(stdout,"text/plain",round.(u3;digits=2))
    #println("p = $p")
    #println("u1 = $u1")
    #println("u2 = $u2")
    #println("u3 = $u3")
else
    println("Schaut euch noch einmal den Verlauf der Strahlen an und überdenkt eure Matrix.")
end

end