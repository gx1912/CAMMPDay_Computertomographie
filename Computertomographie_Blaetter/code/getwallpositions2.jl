function getwallpositions2(i, j, paramsx0,paramsy0,paramsx1,paramsy1,paramsdx,paramsdy,paramsnx,paramsny)


northy = paramsy0+(i-1)*paramsdy;
southy = paramsy0+i*paramsdy;

westx = paramsx0+(j-1)*paramsdx;
eastx = paramsx0+j*paramsdx;

return northy, eastx, southy, westx;
    
end
