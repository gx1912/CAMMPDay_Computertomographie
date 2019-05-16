function genTikhonov(A,mr,p,Aufloesung)
lrows,lcols = size(A);
L = zeros(lcols,lcols);
for r = 1:lcols-1
    L[r,r] = -2;
    L[r,r+1] = 1;
    if r <= (Aufloesung^2-Aufloesung)
        L[r,r+Aufloesung] = 1;
    end
end
L[lcols,lcols] = -2;

ATA = transpose(A)*A;
LTL = transpose(L)*L;
GenTikVek = (ATA+p*LTL)\transpose(A)*mr;
    
return GenTikVek;
end