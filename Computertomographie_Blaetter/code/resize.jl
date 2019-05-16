function resize(v,n)
   vNew = zeros(n);
    if n > size(v,1)
        for i = 1:size(v,1)
            vNew[i] = v[i];
        end
    elseif n < size(v,1)
        for i = 1:n
            vNew[i] = v[i];
        end
    elseif n == 0
        vNew = [];
    else
        vNew = v;
    end
    return vNew;
end