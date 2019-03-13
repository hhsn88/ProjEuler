clear all; clc;

% n^2 + an + b . -999 <= a <= 999 , 1 <= b <= 999

% find candidate Bs (b must be prime)
Bs = [];
for i = 1 : 999
    if (hIsPrime(i))
        Bs = [Bs, i];
    end
end

max = 0;
maxA = 0;
maxB = 0;
for a = -999 : 999
    for b = 1 : length(Bs)
        k = 1;
        f = k^2 + a*k + Bs(b);
        while(hIsPrime(f))
            k = k + 1;
            f = k^2 + a*k + Bs(b);
        end
        if (k>max) 
            max = k;
            maxA = a
            maxB = Bs(b)
        end
    end
end
maxA*maxB