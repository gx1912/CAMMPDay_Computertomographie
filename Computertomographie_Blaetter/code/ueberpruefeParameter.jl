function ueberpruefeParameter(M,b,nx1,nx2,nx3,u,v,b3)

f = [2.35; 9.14; -0.31];
u1 = u[1];
u2 = u[2];
u3 = u[3];
#dritte Spalte der Matrix
v1 = v[1];
v2 = v[2];
v3 = v[3];

A = zeros(3,3);
#erste Spalte der Matrix
A[1,1] = -nx1;
A[2,1] = -nx2;
A[3,1] = -nx3;
#zweite Spalte der Matrix
A[1,2] = u1;
A[2,2] = u2;
A[3,2] = u3;
#dritte Spalte der Matrix
A[1,3] = v1;
A[2,3] = v2;
A[3,3] = v3;

SuS = norm(M*f);
LuL = norm(A*f);
    
if SuS-LuL <= 0.1 && norm(b)-norm(b3) <= 0.1
    println("Ihr habt das korrekte Gleichungssystem aufgestellt. Die Lösung eures Gleichungssystems lautet:")
    Lvec = M\b3;
    r = Lvec[1];
    s = Lvec[2];
    t = Lvec[3];
    print(round(r;digits=4),"\n");
    print(round(s;digits=4),"\n");
    print(round(t;digits=4));
elseif norm(b)-norm(b3) <= 0.1
    println("Überprüft erneut eure Matrix.")
    r = [];
    s = [];
    t = [];
elseif SuS-LuL <= 0.1
    println("Überprüft erneut euren Vektor b.")
    r = [];
    s = [];
    t = [];
elseif b[1]-b3[1] < 0.1 && b[2]-b3[2] < 0.1 && b[3]-b3[3] < 0.1
    println("Überprüft erneut euren Vektor b.")
    r = [];
    s = [];
    t = [];
elseif round(A[1,1];digits=2) == round(-M[1,1];digits=2) || round(A[1,1];digits=2) == round(-M[1,2];digits=2) || round(A[1,1];digits=2) == round(-M[3,1];digits=2)
    println("Überprüft noch einmal eure Umformungen. Ihr müsst alle Vektoren, die mit Parametern multipliziert werden auf die eine und den einzelnen auf die andere Seite stellen.")
    r = [];
    s = [];
    t = [];
else
    println("Überprüft erneut eure Eingabe und, ob ihr alle Umformungen korrekt gemacht habt.")
    r = [];
    s = [];
    t = [];
end
return r,s,t;
end
