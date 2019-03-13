clear all;

x = 6;
p = 15;
while (1)
   
    pFlag = 0;
    
    for i = 3 : floor(sqrt(p))
                
        if (mod(p,i) == 0)
           % not a prime
           pFlag = 1;
           break;
        end
        
    end
    
    if (pFlag == 0)
        x = x + 1;
    end
    
    if (x == 10001)
        break;
    end
    
    p = p + 2;
    
    
end