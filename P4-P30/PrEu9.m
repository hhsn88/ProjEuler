clear all;

f = 0;
for i = 1 : 998
    for j = 1 : 998
        for k = 1 : 998
            
            if (i*i + j*j == k*k)
               if (i+j+k == 1000)
                  f = 1;
                  x = i*j*k;
                  break;
               end
            end
            
        end
        if (f==1)
            break;
        end
    end
    if (f==1)
            break;
    end
end