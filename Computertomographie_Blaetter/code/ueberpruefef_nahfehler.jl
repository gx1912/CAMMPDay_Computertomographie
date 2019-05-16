function ueberpruefef_nahfehler(f_nahfehler,A,MesswerteMitFehler,p)
mr = MesswerteMitFehler;
    
if almostequal(f_nahfehler(MesswerteMitFehler), (transpose(A)*A+p*I)\(transpose(A)*MesswerteMitFehler))
    println("Eure Formel für das nächste Objekt am Original ist korrekt!");
else
    println("Eure Formel für f_nahfehler ist noch nicht korrekt. Überprüft erneut eure Umformungen und nehmt eine Hilfekarte zur Hilfe.")
end


end