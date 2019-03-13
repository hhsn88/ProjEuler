function isPrime = hIsPrime(p)

    if (p <= 0)
        isPrime = 0;
        return;
    end
    if (p==1 || p==2 || p==3 || p==5 || p==7)
        isPrime = 1;
        return;
    end
    if (mod(p,2) == 0)
        isPrime = 0;
        return;
    end
    isPrime = 1;
    for i = 3 : 2 : floor(sqrt(p))
        if (mod(p,i)==0)
            isPrime = 0;
            return;
        end
    end
    
end