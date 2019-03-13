function d = PrEu21_d(n)

    if (n==1) d=1; return; end
    
    d = 0;
    for i = 1 : floor(sqrt(n))
        if (mod(n,i)==0)
            d = d + i + ((n/i ~= i)&&(i~=1))*n/i;
        end
    end

end
