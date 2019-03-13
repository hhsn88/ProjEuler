clear all;
tic
divs = 0;
i = 1;
while (1)
    
    divs = 0;
    triNum = sum(1:i);
    
    % find num of divisors
    for j = 1 : floor(sqrt(triNum))-1
        if (mod(triNum,j) == 0)
            % j is a divisor
            divs = divs + 2;
        end
    end

    if (floor(sqrt(triNum)) == sqrt(triNum))
        divs = divs + 1;
    end
    if (divs > 500)
        break;
    end
    
    i = i + 1;
    
end
toc