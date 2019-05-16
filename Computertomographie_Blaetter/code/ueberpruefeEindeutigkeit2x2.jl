function ueberpruefeEindeutigkeit2x2(f1,f2,f3,f4,B,m_neu)
mneu = m_neu';
f = [f1; f2; f3; f4];
fhorzvert = ones(size(B,2),1);
mhorzvert = 3*ones(size(B,1),1);
mMatrix = B*f;
e1 = [1;0;0;0];
e2 = [0;1;0;0];
e3 = [0;0;1;0];
e4 = [0;0;0;1];

display0 = 1;
display1 = 1;
display2 = 1;
display3 = 1;
display4 = 1;
display5 = 1;

for Zeile in 1:size(B,1)
    if sum(B[Zeile,:]) > sqrt(2)*2 || sum(B[Zeile,:]) <= 1 #Strahlen kürzer als 1cm oder länger als 3* Wurzel(2)
        if display0 == 1
            println("Schaut euch erneut an durch welche Pixel eure Strahlen wie lange laufen und überprüft,")
            println("ob ihr die Längen den richtigen Matrixeinträgen zugeordent habt.")
            display0 = display0+1;
        end
    else
        counter = 1;
        Nulleintraege = 1;
        for Spalte in 1:size(B,2)
            if B[Zeile,Spalte] == 0 #für nur einen Eintrag, dann 1,3,7,9
                Nulleintraege = Nulleintraege+1;
            end
            if B[Zeile,Spalte] > 0 || B[Zeile,Spalte] < 0 #für max 5 Einträge pro Zeile
                counter = counter+1;
            end
        end
        if counter >= 4 #Mehr als 5 Einträge pro Zeile
            if display1 == 1 && display0 == 1
                println("Schaut euch erneut an durch welche Pixel eure Strahlen wie lange laufen und überprüft,")
                println("ob ihr die Längen den richtigen Matrixeinträgen zugeordent habt.")
                display1 = display1+1;
            end
        else
            if B*fhorzvert == mhorzvert #keine neuen Strahlen verwendet
                if display2 == 1 && display1 == 1 && display0 == 1
                    println("Verwendet neue Strahlen und nicht noch einmal die Horizontalen oder Vertikalen, da so keine zusätlichen")
                    println("Informationen weiter gegeben werden.")
                    display2 = display2+1;
                end
            else
                if Nulleintraege-1 >= size(B,2)-1 #nur ein Eintrag falls 1,3,7,9
                    if sum(B[Zeile,:]) > B[Zeile,:]*e1 || sum(B[Zeile,:]) < B[Zeile,:]*e1 || sum(B[Zeile,:]) > B[Zeile,:]*e2 || sum(B[Zeile,:]) < B[Zeile,:]*e2 || sum(B[Zeile,:]) > B[Zeile,:]*e3 || sum(B[Zeile,:]) < B[Zeile,:]*e3 || sum(B[Zeile,:]) > B[Zeile,:]*e4 || sum(B[Zeile,:]) < B[Zeile,:]*e4 && display4 == 1
                        println("Schaut euch erneut an durch welche Pixel eure Strahlen wie lange laufen und überprüft,")
                        println("ob ihr die Pixel korret nummeriert und die richtigen Werte in die Matrix eingetragen habt.")
                        display4 = display4+1;
                    end
                end
            end
        end           
    end
end

Akorrekt = B;
 
mkorrekt = m_neu;

# homogene Lösungen berechnen
homogenkorrekt = nullspace(Akorrekt);

# inhomogene Lösung berechnen
inhomogenkorrekt = pinv(Akorrekt)*mkorrekt';

homogen = nullspace(B);
inhomogen = pinv(B)*m_neu';
 u1 = [0; 0; 0; 0];
p = inhomogen;

x = [f1 f2 f3 f4]*B[5,:];                
                
if display4 == 1 && display3 == 1 && display2 == 1 && display1 == 1 && display0 == 1 && mMatrix[1] == mneu[1] && mMatrix[2] == mneu[2] &&  mMatrix[3] == mneu[3] && mMatrix[4] == mneu[4] && almostequal(x[1,1], m_neu[5])
    println("Eure Idee die Anzahl der Strahlen zu vergrößern ist korrekt! Ihr erhaltet Folgendes:");
    q = round.(p;digits=2);
    print("Für f1 lautet die Lösung: ", q[1],"\n")
    print("Für f2 lautet die Lösung: ", q[2],"\n")
    print("Für f3 lautet die Lösung: ", q[3],"\n")
    print("Für f4 lautet die Lösung: ", q[4],"\n\n")
    #show(stdout,"text/plain",round.(p;digits=2))
    #show(stdout,"text/plain",round.(u1;digits=2))
    #println("p = $p")
    #println("u1 = $u1")
    #if B[5,:] == [0, sqrt(2), sqrt(2), 0]
    #    println("****Macht weiter mit Aufgabenblatt 1a.****")
    #else
    #    println("****Macht weiter mit Aufgabenblatt 1b.****")
    #end
    println("Für die nächste Aufgabe benötigt ihr dieses Bild:\n")
    Daten = load("../Computertomographie_Bilder/ObjektvieleStrahlen2.png");
    
elseif display4 == 1 && display3 == 1 && display2 == 1 && display1 == 1 && display0 == 1 && mMatrix[1] == mneu[1]
    println("Überprüft eure Berechnung von m erneut. Beachtet, dass auch hier die Länge der Pixel berücksichtigt werden müssen.")
    Daten = [];
end
return Daten;
end