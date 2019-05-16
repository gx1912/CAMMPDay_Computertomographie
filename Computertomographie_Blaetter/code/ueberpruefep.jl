function ueberpruefep(A,fr,Aufloesung,p,f,m,mr)
Phantom = echteCTDaten(Aufloesung);
nrows,ncols = size(Phantom);

#f_nahfehler(p) = (transpose(A)*A+p*I)\(transpose(A)*mr);

    
if !isnan(p)
    f_nahfehler = genTikhonov(A,mr,p,Aufloesung);
    Fehler = norm(f-f_nahfehler)/norm(f)*100;
    println("Der Fehler beträgt: ", Fehler)
   # f_nahfehler = f_nahfehler(p);
    for i = 1:size(f_nahfehler,1)
        if f_nahfehler[i] < 0
            f_nahfehler[i] = 0;
        elseif f_nahfehler[i] > 1
            f_nahfehler[i] = 1;
        else
            f_nahfehler[i] = f_nahfehler[i];
        end
    end
    ObjektTikhonov = reshape(f_nahfehler,(nrows,ncols));
    f_nahBild = convert(Array{Gray{Normed{UInt8,8}},2},ObjektTikhonov);
else
    println("Ihr müsst einen Wert für p einsetzen.")
end
return f_nahBild;
end