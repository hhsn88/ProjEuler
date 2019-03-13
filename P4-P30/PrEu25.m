clear all; clc;

f = zeros(1,1000);
pf = zeros(1,1000);
f(1) = 1; 
pf(1) = 1;
i = 2;
while(f(1000)==0)
    temp = f;
    f = addIntArrs(f, pf);
    pf = temp;  
    i = i + 1;
end
i