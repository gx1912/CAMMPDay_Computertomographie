function ueberpruefef_nah(f_nah,A2,Messwerte,Aufloesung,Schritt)

Phantom = echteCTDaten(Aufloesung);
nrows,ncols = size(Phantom);
f_nahBild = zeros(size(Phantom,1),size(Phantom,2));

if Schritt == 1.1
    if almostequal(f_nah,(transpose(A2)*A2)\(transpose(A2)*Messwerte))
        ObjektNaiv = reshape(f_nah,(nrows,ncols));
        println("Eure Formel für das nächste Objekt am Original ist korrekt!");
        f_nahBild = convert(Array{Gray{Normed{UInt8,8}},2},ObjektNaiv);
    else
        println("Eure Formel für f_nah ist noch nicht korrekt. Überprüft erneut eure Umformungen und nehmt eine Hilfekarte zur Hilfe.")
    end
else
    if almostequal(f_nah,(transpose(A2)*A2)\(transpose(A2)*Messwerte))
        ObjektNaiv = reshape(f_nah,(nrows,ncols));
        println("Eure Formel für f_nahfehler ist korrekt!");
        f_nahBild = convert(Array{Gray{Normed{UInt8,8}},2},ObjektNaiv);
    else
        println("Eure Formel für f_nahfehler ist nicht korrekt. Überprüft, ob ihr euch beim Kopieren vertan habt.")
    end
end

return f_nah, f_nahBild;
end