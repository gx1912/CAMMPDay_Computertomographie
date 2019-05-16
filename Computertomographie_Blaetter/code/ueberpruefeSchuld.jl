function ueberpruefeSchuld(Schuld,f_nah,OriginalVektor)

if Schuld == f_nah
    println("Eure Antwort ist korrekt!");
elseif Schuld == f_nah-OriginalVektor
    println("Eure Antwort ist korrekt!");
else
    println("Schaut euch noch einmal den Unterschied zwischen den beiden Fehlerberechnungen an. Welcher Vektor hat sich verändert?");
end
end