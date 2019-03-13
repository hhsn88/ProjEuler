clear all; clc;

load('PrEu22_names.mat');

PrEu22_namesSorted = sort(PrEu22_names);

nums = zeros(size(PrEu22_namesSorted));

for i = 1 : length(PrEu22_namesSorted)
    c = 0;
    for j = 1 : length(PrEu22_namesSorted{i})
        c = c + PrEu22_namesSorted{i}(j) - 'A' + 1;
    end
    nums(i) = c;
end

sum(nums .* [1:length(nums)])