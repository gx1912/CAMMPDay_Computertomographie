function ueberpruefeZeile(Zeile)
if round.(Zeile;digits=2) == [0 0 0.13 0 0.13 1.29 0.13 1.29 0]
    println("Eure Bestimmung der Zeile ist korrekt!")
else
    println("Überprüft noch einmal eure Rechnung und die Bedeutung der einzelnen Matrixeinträge.")
end
end