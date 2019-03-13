function S = addIntArrs(a1, a2)

    S = a1 + a2;
    idxs = find(S>=10);
    while (~isempty(idxs))
        tens = zeros(1,length(S));
        ones = zeros(1,length(S));
        tens(idxs+1) = (S(idxs)-mod(S(idxs),10))/10;
        ones(idxs)   = mod(S(idxs),10);
        S(idxs) = 0;
        S(idxs+1) = S(idxs+1) + tens(idxs+1);
        S(idxs)   = S(idxs)   + ones(idxs);
        idxs = find(S>=10);
    end 
    
end