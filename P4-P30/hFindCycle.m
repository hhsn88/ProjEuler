function  cycle = findCycle(arr)

    a = arr(end-15:end-6);
    for i = 1 : length(arr)-15
        if (arr(end-15-i:end-6-i) == a)
%             a
%             arr(end-15-i:end-6-i)
            break;
        end
    end
    cycle = i;
end