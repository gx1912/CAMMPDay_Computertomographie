function  Bilderrekonstruktion(Auswahl,Aufloesung,prozent,p)

if Auswahl == "Bild1"
    Daten1 = load("figs/CTKrabbe.jpg");
elseif Auswahl == "Bild2"
    Daten1 = load("figs/CTEidechse.jpg")
elseif Auswahl == "Bild3"
    Daten1 = load("figs/CTFisch.jpg")
elseif Auswahl == "Bild4"
    Daten1 = load("figs/CTFledermaus.jpg")
elseif Auswahl == "Bild5"
    Daten1 = load("figs/CTChamaeleon.jpg")
elseif Auswahl == "Bild6"
    Daten1 = load("figs/CTSchildkroete.jpg")
elseif Auswahl == "Bild7"
    Daten1 = load("figs/CTSeepferdchen.jpg")
elseif Auswahl == "Bild8"
    Daten1 = load("figs/CTFrosch.jpg")
elseif Auswahl == "NaN" 
    print("Ihr müsst das NaN durch Bild1, ... oder Bild8 ersetzen.");
end

Daten = Gray.(Daten1)
out = convert(Array{Float64,2}, Daten); #convert GrayMatrix into Float64, bei Vektor müsste die 2 durch eine 1ersetzt werden
Summe = zeros(Aufloesung,Aufloesung);
Durchschnitt = zeros(Aufloesung,Aufloesung);
Laenge = size(out,2)/Aufloesung;
SummeZeile = zeros(Int(Laenge),1);

for i = 1:Aufloesung #geht die Zeilen durch
    for j = 1:Aufloesung #geht die Spalten durch
        a = Int((i-1)*Laenge+1);
        b = Int(i*Laenge);
        c = Int((j-1)*Laenge+1);
        d = Int(j*Laenge);
        Matrix = out[a:b,c:d];
        SummeZeile = sum(Matrix, dims=2); # Jede Zeile wird aufaddiert und in die entsprechende Zeile des SummeZeilevektors geschrieben
        Summe = sum(SummeZeile,dims=1)/(Laenge^2);# Einträge von SummeZeile werden aufaddiertund normiert
        Durchschnitt[i,j] = Summe[1,1]; 
    end
end        
        
nrows,ncols = size(Durchschnitt);  
#f_nahBild = zeros(size(Durchschnitt,1),size(Durchschnitt,2));
DurchschnittVec = reshape(Durchschnitt,(Int(nrows)*Int(ncols),1));

x0,y0,N,JJ,nx,ny,x1,y1,verschx,verschy,a,b,A,theta1,counter = Dateneinlesen(Aufloesung);
A2 = erstelleA(x0,x1,y0,y1,N,JJ,nx,ny,verschx,verschy);
Messwerte =  A2*DurchschnittVec;

MesswerteMitFehler = erzeugeFehlerbehafteteDaten(Messwerte,prozent);

#f_nah = genTikhonov(A2,MesswerteMitFehler,p,Aufloesung);
#for i = 1:size(f_nah,1)
#    if f_nah[i] < 0
#        f_nah[i] = 0;
#    elseif f_nah[i] > 1
#        f_nah[i] = 1;
#    end
#end
            
f_nahfehler(p) = genTikhonov(A2,MesswerteMitFehler,p,Aufloesung);

if !isnan(p)
    Fehler = norm(DurchschnittVec-f_nahfehler(p))/norm(DurchschnittVec)*100;
    println("Der Fehler beträgt: ", Fehler)
    f_nahfehler = f_nahfehler(p);
    for i = 1:size(f_nahfehler,1)
        if f_nahfehler[i] < 0
            f_nahfehler[i] = 0;
        elseif f_nahfehler[i] > 1
            f_nahfehler[i] = 1;
        end
    end
    ObjektTikhonov = reshape(f_nahfehler,(nrows,ncols));
    f_nahBild = convert(Array{Gray{Normed{UInt8,8}},2},ObjektTikhonov);
else
    println("Ihr müsst einen Wert für p einsetzen.")
end
return f_nahBild;     
        
end