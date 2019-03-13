clear all;
t = 1;
for i = 999 : -1 : 100
for j = 999 : -1 : 100    
   
   x = i*j;
   tmp = x;
   k = 1;
   while (tmp > 0)
       
       tmp_arr(k) = mod(tmp, 10);
       tmp = floor(tmp / 10);
       k = k + 1;
       
   end
   flag = 1;
   for l = 1 : floor(length(tmp_arr)/2)
      
       if (tmp_arr(l) ~= tmp_arr(length(tmp_arr)-l+1))
           flag = 0;
           break;
       end
       
   end
   
   if (flag == 1)
       polindrom(t) = x;
       t = t + 1;
   end

   if (i < j)
       j = j - 2;
   else
       i = i - 1; 
   end
   
end
end

max(polindrom)