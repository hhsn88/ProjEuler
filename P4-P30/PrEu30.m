clear all;clc;

res = [];
i=11;
while(1)
    x = hInt2Array(i);
    s = sum(x.^5);
    if (s==i)
        res=[res s];
    end
    if (i > 999999)
        break;
    end
    i = i + 1
end
sum(res)