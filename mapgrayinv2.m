function x = mapgrayinv2(y,n)
% function x = mapgrayinv2(y,n)
% 
% maps the grayvalues of y using n,
%  where n is n_in/n_out for n_out bins in 
%  the output image and n_in in the input image.

x=(((y)+0.5-n/2)/n);
