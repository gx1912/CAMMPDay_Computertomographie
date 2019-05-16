function ueberpruefeMatrixVektor2x2(A,m)

Akorrekt = [1 0 1 0;
            0 1 0 1;
            1 1 0 0;
            0 0 1 1];
 
mkorrekt = [5 8  6 7];

# homogene Lösungen berechnen
homogenkorrekt = nullspace(Akorrekt);

# inhomogene Lösung berechnen
inhomogenkorrekt = pinv(Akorrekt)*mkorrekt';

homogen = nullspace(A);
inhomogen = pinv(A)*m';

u1 = homogen[:,1];
# u2 = homogen(:,2);
# u3 = homogen(:,3);
# u4 = homogen(:,4);
p = inhomogen;

Vergleich = Akorrekt'*mkorrekt';
VergleichSuS = A'*m';

if norm(Vergleich) == norm(VergleichSuS)
    println("Eure Matrix und euer Vektor sind korrekt!")
    println("Die Lösung eures Gleichungssystems lautet wie folgt, wobei r eine beliebige relle Zahl ist.")
    q = round.(p[:,1];digits=2);
    v1 = round.(u1[:,1];digits=2);
    print("Für f1 lautet die Lösung: ", q[1], " + r * ", v1[1],"\n")
    print("Für f2 lautet die Lösung: ", q[2], " + r * ", v1[2],"\n")
    print("Für f3 lautet die Lösung: ", q[3], " + r * ", v1[3],"\n")
    print("Für f4 lautet die Lösung: ", q[4], " + r * ", v1[4],"\n")
    #show(stdout,"text/plain",round.(q;digits=2))
    #show(stdout,"text/plain",round.(v1;digits=2))
        #println("p = $p")
    #println("u1 = $u1")
elseif norm(m) == norm([15 12 14 13])
    println("Formt euer Gleichungssystem um, so dass alle Variablen rechts und Zahlen links stehen. Stellt dann die Matrix-Vektorschreibweise auf.")
else
    println("Schaut euch noch einmal den Verlauf der Strahlen an und überdenkt eure Matrix.")
end              

end