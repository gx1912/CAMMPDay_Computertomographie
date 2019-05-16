function berechneallgemeineSchnittpunkte(PX1,PX2,theta,ParameterdarstellungX1,ParameterdarstellungX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,counter)
    
pl = plot(leg=false,xticks = -3.5:1:3.5,yticks = -3.5:1:3.5,ratio = :equal);    
    
SPX1 = [];
SPX2 = [];
alleSchnittpunkteX = [];
alleSchnittpunkteY = [];
t = a:0.001:b;

Xrows,Xcols = size(X1);
Yrows,Ycols = size(X2);
Strahl = 1;
x = 7.3916;
Z = 2;
S = 4;
k = 2;
r = 2.741;
eps = 1e-7; 


            if almostequal(VX1(k), X1[k])
                if almostequal(VX2(k,Z,S), tand(theta[S])*X1[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S])
                    if almostequal(HX1(k,Z,S), (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]))
                        if almostequal(HX2(k), X2[k])
                            if counter == 1
                                println("Ihr habt die Schnittpunkte mit den Pixelkanten korrekt berechnet!");
                            end
                            for S = 1:size(PX1,2)
                                for Z = 1:size(PX1,1)
                                    p = zeros(size(t,2),1);
                                    y = zeros(size(t,2),1);
                                    HorzSchnitt = zeros(size(X1,2),2);
                                    VertSchnitt = zeros(size(X1,2),2);
                                    Schnittpunktesortiert = [];
                                    counter1 = 1;
                                    if theta[S] == 90
                                    plot!([PX1[Z,S]; PX1[Z,S]],[a; b],linewidth=1.5,color="black",reuse=true);
                                    else
                                        for k = 1:size(t,2)
                                            if tand(theta[S])*t[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S] >= a && tand(theta[S])*t[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S] <= b
                                                y[counter1] = tand(theta[S])*t[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S];
                                                p[counter1] = t[k];
                                                counter1 = counter1+1;
                                            end
                                        end
                                    end
                                    plot!(p,y,linewidth=1.5,color="black",reuse=true);
                                    for k = 1:size(X1,2)
                                        if theta[S] == 90
                                            HorzSchnitt[k,1] = PX1[Z,S];
                                            HorzSchnitt[k,2] = X2[k];
                                        else
                                            if tand(theta[S])*X1[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S] >= a && tand(theta[S])*X1[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S] <= b
                                                VertSchnitt[k,1] = X1[k];
                                                VertSchnitt[k,2] = tand(theta[S])*X1[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S];  
                                            end
                                            if (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]) >= a && (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]) <= b
                                                HorzSchnitt[k,1] = (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]);
                                                HorzSchnitt[k,2] = X2[k];
                                            end
                                        end
                                    end
                                                                            
                                    Schnittpunkte = vcat(HorzSchnitt, VertSchnitt);
                                    Schnittpunkteneu1 = [];
                                    Schnittpunkteneu2 = [];
                                    Zeile = 1
                                    for q = 1:size(Schnittpunkte,1)
                                        if Schnittpunkte[q,1] != 0 && Schnittpunkte[q,2] != 0
                                            Schnittpunkteneu1 = resize(Schnittpunkteneu1,Zeile); 
                                            Schnittpunkteneu1[Zeile] = Schnittpunkte[q,1];
                                            Schnittpunkteneu2 = resize(Schnittpunkteneu2,Zeile);
                                            Schnittpunkteneu2[Zeile] = Schnittpunkte[q,2];
                                            Zeile = Zeile+1;
                                        end
                                    end
                                    Schnittpunkteecht = hcat(Schnittpunkteneu1, Schnittpunkteneu2);
                                    if theta[S] < 90
                                        Schnittpunktesortiert = sortieren(Schnittpunkteecht,1,0); 
                                    elseif theta[S] == 90
                                        Schnittpunktesortiert = sortieren(Schnittpunkteecht,2,0); 
                                    else
                                        Schnittpunktesortiert = sortieren(Schnittpunkteecht,1,1);
                                    end
                                    X1Teil = Schnittpunktesortiert[:,1];
                                    X2Teil = Schnittpunktesortiert[:,2];
                                    plot!(X1Teil,X2Teil,linewidth=1.5,color="black",markersize=18,reuse=true);
                                    scatter!(X1Teil,X2Teil,markersize=3,markercolor=:orange)
                                    X1Teil = resize(X1Teil,size(Schnittpunkte,1)); 
                                    X2Teil = resize(X2Teil,size(Schnittpunkte,1)); 
                                    Schnittvektorsortiert = hcat(X1Teil, X2Teil);
                                        #display(Schnittvektorsortiert)
                                    Schnittrows,Schnittcols = size(Schnittpunkte);
                                    diff = Ycols+Xcols-Schnittrows; #damit alle Anzahln von Schnittpunkten von der Länge der Zeilen übereinstimmen
                                    if diff > 0
                                        Nullen = zeros(diff,2);
                                        Schnittnull = vcat(Schnittpunktesortiert, Nullen);
                                        if Strahl == 1
                                            alleSchnittpunkteX = round.(Schnittnull[:1];digits = 4);
                                            alleSchnittpunkteY = round.(Schnittnull[:,2];digits = 4);
                                            Strahl = Strahl+1;
                                        else
                                            alleSchnittpunkteX = round.(hcat(alleSchnittpunkteX, Schnittnull[:,1]);digits = 4);
                                            alleSchnittpunkteY = round.(hcat(alleSchnittpunkteY, Schnittnull[:,2]);digits = 4);
                                        end
                                    else
                                        if Strahl == 1
                                            Schnittpunktesortiert1 = resize(Schnittpunktesortiert[:,1],size(Schnittpunkte,1));
                                            Schnittpunktesortiert2 = resize(Schnittpunktesortiert[:,2],size(Schnittpunkte,1));
                                            alleSchnittpunkteX = round.(Schnittpunktesortiert1;digits = 4);
                                            alleSchnittpunkteY = round.(Schnittpunktesortiert2;digits = 4);
                                            Strahl = Strahl+1;
                                        else
                                            SpalteX1 = Schnittpunktesortiert[:,1];
                                            SpalteX1 = resize(SpalteX1,size(Schnittpunkte,1));
                                            SpalteY2 = Schnittpunktesortiert[:,2];
                                            SpalteY2 = resize(SpalteY2,size(Schnittpunkte,1));
                                            alleSchnittpunkteX = round.(hcat(alleSchnittpunkteX, SpalteX1);digits=4);
                                            alleSchnittpunkteY = round.(hcat(alleSchnittpunkteY, SpalteY2);digits=4);
                                        end
                                        #display(alleSchnittpunkteX)
                                    end    
                                end
                            end
                                                
                            plot!([-1.5; 1.5],[0.5; 0.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([-1.5; 1.5],[-0.5; -0.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([-1.5; 1.5],[1.5; 1.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([-1.5; 1.5],[-1.5; -1.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([-1.5; -1.5],[-1.5; 1.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([1.5; 1.5],[-1.5; 1.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([0.5; 0.5],[-1.5; 1.5],linewidth=1.5,color="blue",reuse=true);
                            plot!([-0.5; -0.5],[-1.5; 1.5],linewidth=1.5,color="blue",reuse=true);
                            if counter == 1                    
                                plot!([-3.5; 3.5],[0.25; 0.25],linewidth=1.5,color="black",reuse=true);
                                plot!([-3.5; 3.5],[-0.75; -0.75],linewidth=1.5,color="black",reuse=true);
                                plot!([-3.5; 3.5],[1.25; 1.25],linewidth=1.5,color="black",reuse=true);
                            end
                            #axis equal
                            #grid on
                            #
                            #ax.XGrid = 'on';
                            #
                            #ay.XGrid = 'on';
                            rowsx = size(alleSchnittpunkteX,1);
                            for Spalte1 = 1:size(alleSchnittpunkteX,2)
                                doppelt = 1;
                                for Zeile1 = 1:rowsx-1
                                    if almostequal(alleSchnittpunkteX[Zeile1,Spalte1], alleSchnittpunkteX[Zeile1+1,Spalte1]) && almostequal(alleSchnittpunkteY[Zeile1,Spalte1], alleSchnittpunkteY[Zeile1+1,Spalte1]) && alleSchnittpunkteX[Zeile1+1,Spalte1] != 0 && alleSchnittpunkteY[Zeile1+1,Spalte1] != 0
                                        for hoch = 1:(size(alleSchnittpunkteX,1)-1-Zeile1)
                                            #if alleSchnittpunkteX[Zeile1+hoch,Spalte1] != 0 || alleSchnittpunkteY[Zeile1+hoch,Spalte1] != 0
                                                alleSchnittpunkteX[Zeile1+hoch,Spalte1] = alleSchnittpunkteX[Zeile1+hoch+1,Spalte1];
                                                alleSchnittpunkteY[Zeile1+hoch,Spalte1] = alleSchnittpunkteY[Zeile1+hoch+1,Spalte1];
                                                                        #
                                            #end
                                        end
                                        alleSchnittpunkteX[rowsx-doppelt+1,Spalte1] = 0;
                                        alleSchnittpunkteY[rowsx-doppelt+1,Spalte1] = 0;
                                        doppelt = doppelt+1;
                                    end
                                end
                                #if doppelt != 1
                                #    for l = rowsx-doppelt-1:rowsx
                                #        alleSchnittpunkteX[l,Spalte1] = 0;
                                #        alleSchnittpunkteY[l,Spalte1] = 0;
                                #    end
                                #end
                            end
                            
                            SPX1 = alleSchnittpunkteX[1:rowsx,:];
                            SPX2 = alleSchnittpunkteY[1:rowsx,:];

                        else
                            println("Überprüft erneut eure Eingabe für die X2 Koordinate der Schnittpunkte mit den horizontalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    else
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X1 Koordinate der Schnittpunkte mit den horizontalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingaben für die X1 und X2 Koordinaten der Schnittpunkte mit den horizontalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    end
                else
                    if almostequal(HX1(k,Z,S), (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]))
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X2 Koordinate der Schnittpunkte mit den vertikalem Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingabe für die X2 Koordinaten der Schnittpunkte mit den horizontalen und vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    else
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X1 Koordinate der Schnittpunkte mit den horizontalen und die X2 Koordinate der vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingaben für die X1 und X2 Koordinaten der Schnittpunkte mit den horizontalen und die X2 Koordinate der vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    end
                end
            else
                if almostequal(VX2(k,Z,S), tand(theta[S])*X1[k]+PX2[Z,S]-tand(theta[S])*PX1[Z,S])
                    if almostequal(HX1(k,Z,S), (X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]))
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X1 Koordinate der Schnittpunkte mit den vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingabe für die X2 Koordinate der Schnittpunkte mit den horizontalen und die X1 Koordinate für die vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    else
                        if almostequal(HX2(k),X2[k])
                            println("Überprüft erneut eure Eingabe für die X1 Koordinate der Schnittpunkte mit den horizontalen und vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingaben für die X1 und X2 Koordinaten der Schnittpunkte mit den horizontalen und die X1 Koordinate für die vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    end
                else
                    if almostequal(HX1(k,Z,S),(X2[k]-PX2[Z,S]+tand(theta[S])*PX1[Z,S])/tand(theta[S]))
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X2 Koordinate der Schnittpunkte mit den vertikalem und die X1 Koordinate für die vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("Überprüft erneut eure Eingabe für die X1 und X2 Koordinaten der Schnittpunkte mit den vertikalen und die X2 Koordinate für die horizontalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    else
                        if almostequal(HX2(k), X2[k])
                            println("Überprüft erneut eure Eingabe für die X1 Koordinate der Schnittpunkte mit den horizontalen und vertikalen Pixelkanten und der X2 Koordinate der vertikalen Pixelkanten.");
                            SPX1 = [];
                            SPX2 = [];
                        else
                            println("All eure Formeln sind leider unkorrekt.");
                            SPX1 = [];
                            SPX2 = [];
                        end
                    end
                end
            end
                                                                                             
return SPX1, SPX2,pl;

end
