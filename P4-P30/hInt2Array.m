function arr = int2Array(n)

    arr = [];
    while(n > 0)
        arr = [floor(mod(n,10)), arr];
        n = floor(n/10);
    end
    
end