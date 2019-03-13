function M = PrEu18_func(p,i)
    global ctr; ctr = ctr+1;
    i
    size(p)
    if (size(p,1) == 0)
        M = 0;
        return;
    end
    if (size(p,1) == 1)
        M = p(1,1);
        return;
    end
    if (size(p,1) == 2)
        if (p(2,1) > p(2,2)) 
            M = p(2,1) + p(1,1);
            return;
        else
            M = p(2,2) + p(1,1);
            return;
        end
    end
    
    m1 = PrEu18_func(p(3:end,1:end-2),i+1) + p(1,1) + p(2,1);
    m2 = PrEu18_func(p(3:end,2:end-1),i+1) + p(1,1) + max([p(2,1),p(2,2)]); 
    m3 = PrEu18_func(p(3:end,3:end),i+1)   + p(1,1) + p(2,2);    

    M = max([m1,m2,m3]);
%%%%%%%%%%%%%%%%%%

% 
%     X = size(p,1) - 1;
% 
%     for i = 1 : size(p,2)-1 % for each num in penultimate row       
%         if (p(X+1,i) > p(X+1,i+1))
%             m(i) = PrEu18_func(p(1:end-1,1:end-1)) + p(X+1,i)
%         else
%             m(i) = PrEu18_func(p(1:end-1,1:end-1)) + p(X+1,i+1)        
%         end
%     end
% 
%     M = max(m)
    
end

function M = xxx(p)

end