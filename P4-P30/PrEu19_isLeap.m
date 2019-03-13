function isLeap = PrEu19_isLeap(x)
    isLeap = (mod(x,4)==0) && (((mod(x,100)==0) && (mod(x,400)==0)) || (mod(x,100)~=0));  
end