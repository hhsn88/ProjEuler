clear all; clc;

Ds = zeros(1,10000);
for i = 1 : 10000
   Ds(i) = PrEu21_d(i);
end

ctr = 0;
for i = 2 : 10000
    if (Ds(i) <= 10000)
        if ((Ds(Ds(i)) == i) && (Ds(i) ~= i))
            ctr = ctr + i;
            i
        end
    end
end
ctr