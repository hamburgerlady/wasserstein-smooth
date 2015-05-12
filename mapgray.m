function y = mapgray(x,n)
% function y = mapgray(x,n)
% 
% maps the grayvalues of x using n,
% where n is n_out/n_in for n_out bins in 
% the output image and n_in in the input image.

y = n*x+(n/2)-0.5;

% 2 0:127 -> 0.5 2.5 ... 252.5 254.5 y = 2x+0.5
% 4 0:63 -> 1.5 5.5 ... 253.5        y = 4x+1.5
% 8 0:31 -> 3.5 ... 251.5            Y = 8x+3.5
% 16 0:15 -> 7.5 ... 247.5           y =16x+7.5
