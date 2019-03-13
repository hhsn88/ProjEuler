clear all; clc;

% max = 0;
% minC = 10;
% for i = 7 : 7
%     
%     x=1/i
%     y=10/i
%     z=1000000/i
%     
% end

maxCycle = 0;
maxNum = 0;
for i = 126 : 999
    clear x ix rem r ir ctr xx isBreak
    x = zeros(1,10000);x(1) = 1;
    ix=4;ir=1;
    rem = 100;
    while (ix<length(x)-2)  
        isBreak = 0;
        rem = 10*rem + x(ix);
        if (rem>999)
            is4 = 1;
        else
            ctr = 0;            
            while (rem<i)
                if (ix+ctr > length(x))
                    isBreak = 1;
                    break;
                end
                rem = 10*rem + x(ix+ctr);
                ctr = ctr + 1;
                r(ir) = 0;
                ir = ir + 1;
            end
            if (isBreak == 1)
                break;
            end
            if (rem>999)
                is4 = 1;
            else
                is4 = 0;
            end
        end
        x(ix) = rem;
        r(ir) = floor(rem / i);
        x(ix) = x(ix) - r(ir)*i;
        rem = x(ix);
        xx = int2Array(x(ix));
        x(ix:ix+length(xx)-1) = xx;
        x(ix-3+~is4:ix-1) = zeros(1,length(ix-3+~is4:ix-1));
        ir = ir + 1;
        ix = ix + 3 + is4;
    end
    if (isBreak == 0)
        i
        cycle = findCycle(r)    
        if (cycle > maxCycle)
            maxCycle = cycle;
            maxNum = i;
        end
    end
end