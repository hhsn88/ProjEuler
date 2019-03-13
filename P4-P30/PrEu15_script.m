clear all;
grid = zeros(20);
tic
for i = 1 : 3	
    for j = 1 : 20

        grid(i,j) = PrEu15(i,j);
        grid(j,i) = grid(i,j);
        
    end
end

for i = 4 : 20	
    for j = 1 : 3

        grid(i,j) = PrEu15(i,j);
        grid(j,i) = grid(i,j);
        
    end
end

for x=4:20
    for y=4:20
        
        grid(x,y) = grid(x,y-2)+grid(x-2,y)+grid(x-1,y-1)*2;
        grid(y,x) = grid(x,y);
        
    end
end
toc    

grid(20,20)