function ueberpruefeAbsorptionskoeffizienten2x2(Zeile1,Zeile2,Spalte1,Spalte2,f1,f2,f3,f4)

    Zeile1 = 20-Zeile1;
    Zeile2 = 20-Zeile2;
    Spalte1 = 20-Spalte1;
    Spalte2 = 20-Spalte2;

    if (Zeile1 == f1+f3) && (Zeile2 == f2+f4) && (Spalte1 == f1+f2) && (Spalte2 == f3+f4)
        println("Ihr habt eine mögliche Verteilung der Absorptionskoeffizienten gefunden!")
    else
        println("Überprüft noch einmal, ob wirklich alle Zeilen- und Spaltensummen erfüllt sind.")
    end

end