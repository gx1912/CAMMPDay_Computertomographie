function ueberpruefenormalenVektor(u,v,nx1,nx2,nx3,b3)
println("Eure Richtungsvektoren lauten:");
println("u = ",round(u[1];digits=4));
println("    ",round(u[2];digits=4));
println("    ",round(u[3];digits=4),"\n");
println("v = ",round(v[1];digits=4));
println("    ",round(v[2];digits=4));
println("    ",round(v[3];digits=4),"\n");

u1 = u[1];
u2 = u[2];
u3 = u[3];
v1 = v[1];
v2 = v[2];
v3 = v[3];
    
x1 = 1;
A = [u2 u3;
     v2 v3];
b = [-u1; -v1]; 
yz = A\b;
x2 = yz[1];
x3 = yz[2];
fac = nx1/x1;
    
# Berechnung des Punktes
    M = [nx1 u[1] v[1];
         nx2 u[2] v[2];
         nx3 u[3] v[3]];
    P = M\b3;

    
if isnan(nx1) && isnan(nx2) && isnan(nx3)
elseif (!isnan(nx1) || !isnan(nx2) || !isnan(nx3)) && (isnan(nx1) || isnan(nx2) || isnan(nx3))
    println("Ihr müsst erst alle NaNs ersetzen, bevor eure Lösung überprüft werden kann.")
elseif norm(fac - nx2/x2) < 0.01 && norm(fac - nx3/x3) < 0.01
    println("Ihr habt den Normalenvektor korrekt berechent! Euer Schnittpunkt P lautet:")
    println("P = ",round(P[1];digits=4));
    println("    ",round(P[2];digits=4));
    println("    ",round(P[3];digits=4),"\n");
else
    println("Überprüft erneut eure Rechnung und Eingabe.")                
end

end
