function erzeugeFehlerbehafteteDaten(m,prozent)
if prozent > 1 || prozent < 0
    println("Gebt die Prozentzahl als eine Dezimalzahl ein.")
else
    Messwerte = zeros(size(m,1),1);
    B = randn(size(m,1),1);
    max = maximum(B);
    C = abs.(B/max).*prozent;
            #print(C)
    Fehler(Zeile) = m[Zeile]*C[Zeile];
    for i = 1:size(m,1)
        Messwerte[i] = m[i]+Fehler(i);
    end
end
return Messwerte;
end