clear all;clc;
tic
x = 1;
last = 1;
for i = 1 : 500
    for j = last+i*2 : 2*i : last+(2*i+1)*2+(2*i-1)*2        
        x = x + j;
        last = j;
    end    
end
toc
x        