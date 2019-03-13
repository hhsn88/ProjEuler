% 1.1.1900 was a Monday
% 4, 6, 9, 11 = 30 days
% 1, 3, 5, 7, 8, 10, 12 = 31 Days
clear all; clc;

ctr = 0;
firstDayInPrev = 2;
for j = 1901 : 2000
   
    FebDays = 28 + 1*PrEu19_isLeap(j);
    PrevFebDays = 28 + 1*PrEu19_isLeap(j-1);

    monthsDays = [31 FebDays 31 30 31 30 31 31 30 31 30 31];

    daysInPrevYear = 4*30 + 7*31 + PrevFebDays;
    
    firstDayInJ = mod(daysInPrevYear,7)+firstDayInPrev;
    firstDayInPrev = firstDayInJ
    if (firstDayInJ > 7)
        firstDayInJ = firstDayInJ - 7;
    end
    if (firstDayInPrev > 7)
        firstDayInPrev = firstDayInPrev - 7;
    end
    
    firsts = zeros(1,12);
    firsts(1) = firstDayInJ;

    for i = 2 : 12
        firsts(i) = mod(monthsDays(i-1),7)+firsts(i-1);
        if (firsts(i) > 7)
            firsts(i) = firsts(i) - 7;
        end
    end
    ctr = ctr + sum(firsts==1);

end
ctr