clear all;
tic
a = 999999;
cMax = 0;
m = 0;
while (a > 0)
    c=2;
    
    if (mod(a,2) == 0)
        next = a / 2;
    else
        next = 3*a + 1;
    end
    
    while (next > 1)

        if (mod(next,2) == 0)
            next = next / 2;
        else
            next = 3*next + 1;
        end

        c = c + 1;
    end
 
    if (cMax < c)
        m = a;
        cMax = c;
    end
    a = a - 1;
    
end
toc