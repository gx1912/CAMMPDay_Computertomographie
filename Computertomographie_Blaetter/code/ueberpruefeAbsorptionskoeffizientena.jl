function ueberpruefeAbsorptionskoeffizientena(Zeile1,Zeile2,Zeile3,Spalte1,Spalte2,Spalte3,Diagonale,f1,f2,f3,f4,f5,f6,f7,f8,f9)

    Zeile1 = 20-Zeile1;
    Zeile2 = 20-Zeile2;
    Zeile3 = 20-Zeile3;
    Spalte1 = 20-Spalte1;
    Spalte2 = 20-Spalte2;
    Spalte3 = 20-Spalte3;
    Diagonale = 20-Diagonale;

    if (Zeile1 == f1+f4+f7) && (Zeile2 == f2+f5+f8) && (Zeile3 == f3+f6+f9) && (Spalte1 == f1+f2+f3) && (Spalte2 == f4+f5+f6) && (Spalte3 == f7+f8+f9) && (round(Diagonale;digits =2) == round(f3*sqrt(2)+f5*sqrt(2)+f7*sqrt(2);digits=2))
        println("Ihr habt eine mögliche Verteilung der Absorptionskoeffizienten gefunden!")
    else
        println("Überprüft noch einmal, ob wirklich alle Zeilen- und Spaltensummen erfüllt sind.")
    end

end