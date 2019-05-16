function  echteCTDaten(Aufloesung)
#Daten1 = load("../Computertomographie_Bilder/Bild48log.jpg");
Daten1 = load("../Computertomographie_Bilder/Bild48log2.jpg");
Daten = Gray.(Daten1)
    #print(Daten2)
out = convert(Array{Float64,2}, Daten); #convert GrayMatrix into Float64, bei Vektor müsste die 2 durch eine 1ersetzt werden
Summe = zeros(Aufloesung,Aufloesung);
Durchschnitt = zeros(Aufloesung,Aufloesung);
Laenge = size(out,2)/Aufloesung;
SummeZeile = zeros(Int(Laenge),1);

if Aufloesung == 2 || Aufloesung == 4 || Aufloesung == 8 || Aufloesung == 16 || Aufloesung == 32 || Aufloesung == 64 || Aufloesung == 128 || Aufloesung == 256 || Aufloesung == 512  
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
     #imshow(Durchschnitt)#;truesize([200 200]);
else 
    print("Die Auflösung muss eine Zweierpotenz sein.");
end

zurueck = convert(Array{Gray{Normed{UInt8,8}},2},Durchschnitt)
return zurueck;

        
end