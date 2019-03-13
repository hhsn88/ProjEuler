clear all; clc;

a = repmat((2:100)', 1, 99);
b = repmat((2:100), 99, 1);
length(unique(a .^ b))
