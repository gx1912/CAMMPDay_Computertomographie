function ueberpruefenaechsterPunkt(Parameter1,Punkt,blick1,blick2,b1,M,A3,b3,nx1,nx2,nx3)
    
a1 = b1-M[:,1]*Parameter1;
    
if norm(a1-transpose(Punkt)) <= 0.01
    println("Ihr habt den nächsten Punkt korrekt berechnet! Ihr könnt blick1 und blick2 so verändern, dass man sieht, dass der Punkt in der Ebene liegt.")
        
    U2,S2,V2 = svd(A3)
    u = U2[:,1];
    v = U2[:,2];
    s = -20*u-20*v;
    a = b3[1];
    b = b3[2];
    c = b3[3];
    d = Punkt[1];
    e = Punkt[2];
    f = Punkt[3];
    ## Berechnung Winkel für blick1
    #x2 = -nx1/nx2;
    #Vec1 = [1; x2; 0];    
    #Vec2 = [1; 0; 0];    
    #alpha = acosd(transpose(Vec1)*Vec2/(norm(Vec1)*norm(Vec2)));  
    #x3 = -nx1/nx3;
    #Vec3 = [1; 0; x3];    
    #Vec4 = [0; 0; 1];    
    #beta = acosd(transpose(Vec3)*Vec4/(norm(Vec3)*norm(Vec4)));  
        
    plt = surface([(s[1],s[2],s[3]),(30*u[1],30*u[2],30*u[3]),(30*v[1],30*v[2],30*v[3])],alpha=.1, fillalpha=.1)
    plot3d!([a],[b],[c],marker=2,xlim=(-14,14),ylim=(-14,14),zlim=(-14,14), camera = (blick1,blick2),cbar= :none, leg = false,xlabel = "x_1",ylabel = "x_2",zlabel = "x_3")
    plot3d!([d],[e],[f],marker=2)
    display(plt);
else
    println("Überprüft noch einmal, ob ihr die Parameter mit den richtigen Vektoren multipliziert habt.")
end
          
end
