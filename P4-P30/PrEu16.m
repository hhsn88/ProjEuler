clear all;

s = zeros(1,302);
s(1) = 1;
for i = 1 : 1000
    
    s = s .* 2;
    while(~isempty(s(s>=10)))
        s(find(s>=10)+1) = s(find(s>=10)+1) + floor(s(s>=10) / 10);
        s(s>=10) = mod(s(s>=10),10);
    end
    
end

sum(s);