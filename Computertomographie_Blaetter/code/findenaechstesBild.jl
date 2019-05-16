function findenaechstesBild(Aufloesung,prozent)

Phantom = echteCTDaten(Aufloesung);
nrows,ncols = size(Phantom);
f_nahBild = zeros(size(Phantom,1),size(Phantom,2));
PhantomVec = reshape(Phantom,(Int(nrows)*Int(ncols),1));

x0,y0,N,JJ,nx,ny,x1,y1,verschx,verschy,a,b,A,theta1,counter = Dateneinlesen(Aufloesung);
A2 = erstelleA(x0,x1,y0,y1,N,JJ,nx,ny,verschx,verschy);
Messwerte =  A2*PhantomVec;

MesswerteMitFehler = erzeugeFehlerbehafteteDaten(Messwerte,prozent);

f_nah = (transpose(A2)*A2)\(transpose(A2)*MesswerteMitFehler)
for i = 1:size(f_nah,1)
    if f_nah[i] < 0
        f_nah[i] = 0;
    elseif f_nah[i] > 1
        f_nah[i] = 1;
    end
end
ObjektNaiv = reshape(f_nah,(nrows,ncols));
    #print(ObjektNaiv)
f_nahBild = convert(Array{Gray{Normed{UInt8,8}},2},ObjektNaiv);


return PhantomVec,f_nah,Messwerte,MesswerteMitFehler,A2,f_nahBild;
end