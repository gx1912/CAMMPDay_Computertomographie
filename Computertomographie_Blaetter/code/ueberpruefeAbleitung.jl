function ueberpruefeAbleitung(Ableitung,A2,Messwerte)
Arows,Acols = size(A2);
f_nah = zeros(Acols,1).+1;
a = 
if round.(Ableitung(f_nah);digits=2) ==  round.(2*transpose(A2)*A2*f_nah-2*transpose(A2)*Messwerte;digits=2)
    println("Eure Ableitung ist korrekt!");
else
    println("Eure Ableitung stimmt noch nicht. Stellt sicher, dass ihr nirgends das Transponieren vergessen habt.");
end


end