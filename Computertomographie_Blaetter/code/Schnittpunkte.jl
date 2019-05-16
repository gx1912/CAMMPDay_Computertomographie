function Schnittpunkte(Dim,Winkel,X,Y,x0,y0,x1,y1,N,JJ,nx,ny,vx,vy,theta,Nullzeile)
SchnittVektorsort =  zeros(2*nx,JJ*N);
SchnittVektor = [];
HorzBody = zeros(nx+1,2);
VertBody = zeros(nx+1,2);
xS = x0:1:x1;
yS = y0:1:y1;
laengenmatrix=zeros(size(X,1),nx*ny);
Pixeln, Pixelx, Pixely = Pixelberechner(x0,x1,y0,y1,nx,ny);
 for i = 1:size(X,1) # für die Anzahl der parallelen Strahlen durchläuft Startvektoren
     counterhorz = 1;
     countervert = 1;
     VertBody = zeros(nx+1,2);
     HorzBody = zeros(nx+1,2);
     SchnittVektor = [];
     HorzSchnitt = zeros(nx+1,2);
     VertSchnitt = zeros(nx+1,2);
     Abstand = zeros(size(Pixelx,1),1);
     for k = 1:nx+1 
        s = (X[i]-xS[k])/vx;
        t = (Y[i]-yS[k])/vy;
        
        HorzSchnitt[k,1] = X[i]-s*vx; #nächster Schnittpunkt mit Senkrechten, x-Koordinate
        HorzSchnitt[k,2] = Y[i]-s*vy; #nächster Schnittpunkt mit Senkrechten, y-Koordinate
        VertSchnitt[k,1] = X[i]-t*vx; #nächster Schnittpunkt mit Horizontalen, x-Koordinate
        VertSchnitt[k,2] = Y[i]-t*vy; #nächster Schnittpunkt mit Horizontalen, y-Koordinate

        #Überprüfung, dass Schnittpunkte im Körper liegen
        if (round(HorzSchnitt[k,1];digits=5) >= x0) && (round(HorzSchnitt[k,1];digits=5) <= x1) && (round(HorzSchnitt[k,2];digits=5) >= y0) && (round(HorzSchnitt[k,2];digits=5) <= y1)
            HorzBody[counterhorz,1] = HorzSchnitt[k,1];
            HorzBody[counterhorz,2] = HorzSchnitt[k,2];
            counterhorz = counterhorz + 1;
        end
        eps=1E-7;
        if (round(VertSchnitt[k,1];digits=5) >= x0) && (round(VertSchnitt[k,1];digits=5) <= x1) && (round(VertSchnitt[k,2];digits=5) >= y0) && (round(VertSchnitt[k,2];digits=5) <= y1)
            VertBody[countervert,1] = VertSchnitt[k,1];
            VertBody[countervert,2] = VertSchnitt[k,2];
            countervert = countervert+1;
        end
     end 
     urHorzBody = HorzBody;
     urVertBody = VertBody;
     for r = 1:size(urVertBody,1);
         if HorzBody[size(urHorzBody,1)+1-r,1] == 0 && HorzBody[size(urHorzBody,1)+1-r,2] == 0
            if VertBody[size(urHorzBody,1)+1-r,2] == 0 && VertBody[size(urHorzBody,1)+1-r,1] == 0
                HorzBody1 = resize(HorzBody[:,1],size(urHorzBody,1)-r);
                HorzBody2 = resize(HorzBody[:,2],size(urHorzBody,1)-r);
                VertBody1 = resize(VertBody[:,1],size(urHorzBody,1)-r);
                VertBody2 = resize(VertBody[:,2],size(urHorzBody,1)-r);
                HorzBody = hcat(HorzBody1,HorzBody2);
                VertBody = hcat(VertBody1,VertBody2);
            else
                HorzBody1 = resize(HorzBody[:,1],size(urHorzBody,1)-r);
                HorzBody2 = resize(HorzBody[:,2],size(urHorzBody,1)-r);
                HorzBody = hcat(HorzBody1,HorzBody2);
            end
         else
            if VertBody[size(urHorzBody,1)+1-r,2] == 0 && VertBody[size(urHorzBody,1)+1-r,1] == 0
                VertBody1 = resize(VertBody[:,1],size(urHorzBody,1)-r);
                VertBody2 = resize(VertBody[:,2],size(urHorzBody,1)-r);
                VertBody = hcat(VertBody1,VertBody2);
            end
         end
     end
     if HorzBody == []
        SchnittVektor = VertBody;
     elseif VertBody == []
        SchnittVektor = HorzBody;
     else
         SchnittVektor = vcat(HorzBody, VertBody);
     end
                        
     if theta <= pi/2
         SchnittVektorsort = sortieren(SchnittVektor,1,0);
     elseif theta == pi
         SchnittVektorsort = sortieren(SchnittVektor,1,1);
     else
         SchnittVektorsort = sortieren(SchnittVektor, 2,0);
     end
     # Berechnung der Mitten zwischen zwei Schnittpunkten und Bestimmung
     # des nächsten Mittelpunkts eines Pixels
     distance = zeros(size(SchnittVektorsort,1)-1,1);
     Mittex= zeros(size(SchnittVektorsort,1)-1,1);
     Mittey = zeros(size(SchnittVektorsort,1)-1,1);
     for l = 1:size(SchnittVektorsort,1)-1
         distance[l] = sqrt((SchnittVektorsort[l,1]-SchnittVektorsort[l+1,1])^2+(SchnittVektorsort[l,2]-SchnittVektorsort[l+1,2])^2);
         Mittex[l,1] = SchnittVektorsort[l,1]+distance[l]/2*vx;
         Mittey[l,1] = SchnittVektorsort[l,2]+distance[l]/2*vy;
         for m = 1:size(Pixelx,1)
             Abstand[m,1] = sqrt((Pixelx[m,1]-Mittex[l,1])^2+(Pixely[m,1]-Mittey[l,1])^2);
         end
         Sortiert= sortieren(Abstand,1,0); # suche Minimum
         Minimum = Sortiert[1,1];
         Ort = finde(Abstand, Minimum);
         x = Int(Ort[1,1]);
         laengenmatrix[i,x] = distance[l]; 
     end
                   
     if size(SchnittVektorsort,1) == 0
        Nullzeile = Nullzeile+1;
     end
 end
return laengenmatrix,SchnittVektorsort,Nullzeile;
end