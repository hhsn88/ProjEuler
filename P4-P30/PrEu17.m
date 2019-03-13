clear all;

% one two three four five six seven eight nine ten eleven twelve
% thirteen fourteen fifteen sixteen seventeen eighteen nineteen 
x([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19]) = [3 3 5 4 4 3 5 5 4 3 6 6 8 8 7 7 9 8 8];
% twenty thirty forty fifty sixty seventy eighty ninety
y([1 2 3 4 5 6 7 8]) = [6 6 5 5 5 7 6 6];

       % 1..9             10..19         20,30..,90   1..9 hundred        and     1000
s1 = sum(x(1:9))*90 + sum(x(10:19))*10 + sum(y)*100 + sum(x(1:9)+7)*100 + 3*99*9 + 11
