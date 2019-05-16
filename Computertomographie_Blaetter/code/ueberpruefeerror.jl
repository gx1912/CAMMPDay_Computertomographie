function ueberpruefeerror(Fehler,PhantomVektor,RekonstruktionVektor)
    
tol = 1e-12;

if norm(Fehler) - norm(PhantomVektor-RekonstruktionVektor) < tol
    println("Beachtet, dass wir Vektoren betrachten. Dafür müsst ihr die Länge der Vektoren betrachten.")
    println("Zudem habt ihr den absolten Fehler berechnet. Berechnet den Fehler relativ zum originalen Wert.")
elseif Fehler - norm(PhantomVektor-RekonstruktionVektor) < tol
    println("Ihr habt den absolten Fehler berechnet. Berechnet den Fehler relativ zum originalen Wert.")
elseif Fehler - norm(PhantomVektor-RekonstruktionVektor)/norm(PhantomVektor) < tol
    println("Fast richtig. Lasst euch das Ergebnis in Prozent ausgeben.")
elseif Fehler - norm(PhantomVektor-RekonstruktionVektor)/norm(PhantomVektor)*100 < tol
    Fehler2 = round(Fehler;digits=4);
    println("Eure Formel für den relativen Fehler ist korrekt! Der Fehler beträgt: ", Fehler2)
else 
    println("Googlt noch einmal nach Fehlerarten, die ihr kennt und schaut in Workspace nach welche Variablen ihr habt, die euch hier weiterhelfen können.")
end
      # return Fehler2;             

end