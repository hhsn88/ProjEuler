function p = PrEu15(x,y)

    if (x==0 || y==0)
        p = 1;
        return;
    end

    if (x==1 || y==1)
        p = max([x y])+1;
        return;
    end

    p = PrEu15(x-1,y) + PrEu15(x,y-1);

end

% Num of paths=...
% p2010+(PrEu15(10,1))*(PrEu15(19,10))+(PrEu15(10,2))*(PrEu15(18,10))+(PrEu15(10,3))*(PrEu15(17,10))+...
%       (PrEu15(10,4))*(PrEu15(16,10))+(PrEu15(10,5))*(PrEu15(15,10))+(PrEu15(10,6))*(PrEu15(14,10))+...
%       (PrEu15(10,7))*(PrEu15(13,10))+(PrEu15(10,8))*(PrEu15(12,10))+(PrEu15(10,9))*(PrEu15(11,10))+...
%       (PrEu15(10,10))*(PrEu15(10,10))+(PrEu15(10,11))*(PrEu15(9,10))+(PrEu15(10,12))*(PrEu15(8,10))+...
%       (PrEu15(10,13))*(PrEu15(7,10))+(PrEu15(10,14))*(PrEu15(6,10))+(PrEu15(10,15))*(PrEu15(5,10))+...
%       (PrEu15(10,16))*(PrEu15(4,10))+(PrEu15(10,17))*(PrEu15(3,10))+(PrEu15(10,18))*(PrEu15(2,10))+...
%       (PrEu15(10,19))*(PrEu15(1,10))+p2010;
%   
% Num of paths=...
%   for i = 1 : 19 
%     s(i) = PrEu15(i,10);
%   end
% x = 0;
% for i = 1 : 10
%     x = x + 2*s(i)*s(20-i);
% end
% x = x + s(10)^2 + 2*p2010;