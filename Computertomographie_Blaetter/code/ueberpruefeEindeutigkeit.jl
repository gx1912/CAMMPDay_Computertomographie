function ueberpruefeEindeutigkeit(f1,f2,f3,f4,f5,f6,f7,f8,f9,B,m_neu)
mneu = m_neu';
f = [f1; f2; f3; f4; f5; f6; f7; f8; f9];
fhorzvert = ones(size(B,2),1);
mhorzvert = 3*ones(size(B,1),1);
mMatrix = B*f;
e1 = [1;0;0;0;0;0;0;0;0];
e3 = [0;0;1;0;0;0;0;0;0];
e7 = [0;0;0;0;0;0;1;0;0];
e9 = [0;0;0;0;0;0;0;0;1];

display0 = 1;
display1 = 1;
display2 = 1;
display3 = 1;
display4 = 1;
display5 = 1;

for Zeile = 1:size(B,1)
    if sum(B[Zeile,:]) > sqrt(2)*3 || sum(B[Zeile,:]) <= 1 #Strahlen kürzer als 1cm oder länger als 3* Wurzel(2)
        if display0 == 1
            println("Schaut euch erneut an durch welche Pixel eure Strahlen wie lange laufen und überprüft,")
            println("ob ihr die Längen den richtigen Matrixeinträgen zugeordent habt.")
            display0 = display0+1;
        end
    else
        counter = 1;
        Nulleintraege = 1;
        for Spalte = 1:size(B,2)
            if B[Zeile,Spalte] == 0 #für nur einen Eintrag, dann 1,3,7,9
                Nulleintraege = Nulleintraege+1;
            end
            if B[Zeile,Spalte] < 0 || B[Zeile,Spalte] > 0 #für max 5 Einträge pro Zeile
                counter = counter+1;
            end
        end
        if counter >= 7 #Mehr als 5 Einträge pro Zeile
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
                    if sum(B[Zeile,:]) > B[Zeile,:]*e1 || sum(B[Zeile,:]) < B[Zeile,:]*e1 || sum(B[Zeile,:]) > B[Zeile,:]*e3 || sum(B[Zeile,:]) < B[Zeile,:]*e3 || sum(B[Zeile,:]) > B[Zeile,:]*e7 || sum(B[Zeile,:]) < B[Zeile,:]*e7 || sum(B[Zeile,:]) > B[Zeile,:]*e9 || sum(B[Zeile,:]) < B[Zeile,:]*e9 && display4 == 1
                        println("Schaut euch erneut an durch welche Pixel eure Strahlen wie lange laufen und überprüft,")
                        println("ob ihr die Pixel korret nummeriert und die richtigen Werte in die Matrix eingetragen habt.")
                    end
                end
            end
        end           
    end
end
if display4 == 1 && display3 == 1 && display2 == 1 && display1 == 1 && display0 == 1 && round(mMatrix[1];digits=2) == round(mneu[1];digits=2) && round(mMatrix[2];digits=2) == round(mneu[2];digits=2) &&  round(mMatrix[3];digits=2) == round(mneu[3];digits=2) && round(mMatrix[4];digits=2) == round(mneu[4];digits=2) && round(mMatrix[5];digits=2) == round(mneu[5];digits=2) && round(mMatrix[6];digits=2) == round(mneu[6];digits=2) && round(mMatrix[7];digits=2) == round(mneu[7];digits=2) && round(mMatrix[8];digits=2) == round(mneu[8];digits=2) && round(mMatrix[9];digits=2) == round(mneu[9];digits=2)
    println("Eure Idee die Anzahl der Strahlen zu vergrößern ist korrekt! Leider ist diese Lösung noch immer nicht eindeutig. Es liegen noch nicht ausreichend viele Informationen vor, so dass weitere Strahlen hizugefügt werden müssen. Das heißt, dass so die Struktur des Objekts weiterhin nicht bestimmen kann. 
Das hinzufügen von immer mehr Strahlen soll automatisiert werden, weshalb wir uns im nächsten Schritt überlegen müssen, wie die Strahlen abhängig vom Startpunkt und einem Winkel beschrieben werden können. So kann im Anschluss geschaut werden, dass ausreichend viele Strahlen betrachtet werden, um die Struktur des Objekts eindeutig zu bestimmen.")
elseif display4 == 1 && display3 == 1 && display2 == 1 && display1 == 1 && display0 == 1 && mMatrix[1] == mneu[1]
    println("Überprüft eure Berechnung von m erneut. Beachtet, dass auch hier die Länge der Pixel berücksichtigt werden müssen.")
end

end