clear all;

x = 2;
p = 3;
while (1)
   
    if (p > 2000000) 
        break;
    end
    
    pFlag = 0;
    
    for i = 3 : floor(sqrt(p))
                
        if (mod(p,i) == 0)
           % not a prime
           pFlag = 1;
           break;
        end
        
    end    
    
    if (pFlag == 0)
        x = x + p;
    end   
    
    p = p + 2;
    
    
end