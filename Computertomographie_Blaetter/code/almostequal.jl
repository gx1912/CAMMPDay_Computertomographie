function almostequal(A,B)

if norm(A-B) < 1e-10
    return true
else
    return false
end
    
end
