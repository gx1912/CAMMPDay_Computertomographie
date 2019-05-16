function ueberpruefeMatrixVektora(A,m)

f = [2; 2; 2; 5; 1; 1; 6; 5; 0];
    
if norm(A*f-transpose(m)) <= 0.01
    # homogene Lösungen berechnen
    homogen = nullspace(A);
    
    # inhomogene Lösung berechnen
    inhomogen = pinv(A)*m';
        
    if size(homogen,2) > 0
        println("Euer Gleichungssystem stimmt zwar, allerdings betrachtet ihr noch nicht genug Strahlen.")
    else
        println("Ihr habt genug Strahlen verwendet. Die Lösung eures Gleichungssystems lautet:");
        print("f1 = ", round(inhomogen[1];digits = 2),"\n")
        print("f2 = ", round(inhomogen[2];digits = 2),"\n")
        print("f3 = ", round(inhomogen[3];digits = 2), "\n")
        print("f4 = ", round(inhomogen[4];digits = 2), "\n")
        print("f5 = ", round(inhomogen[5];digits = 2), "\n")
        print("f6 = ", round(inhomogen[6];digits = 2), "\n")
        print("f7 = ", round(inhomogen[7];digits = 2),"\n")
        print("f8 = ", round(inhomogen[8];digits = 2),"\n")
        print("f9 = ", round(inhomogen[9];digits = 2));
    end
else
    println("Schaut euch noch einmal den Verlauf der Strahlen an und überdenkt eure Matrix.")        
end

end